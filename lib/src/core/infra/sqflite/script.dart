final criarBanco = [
  '''
    CREATE TABLE aluno (
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL
    )
  ''',
  '''
    CREATE TABLE professor (
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL
    )
  ''',
  '''CREATE TABLE diario (
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        conteudo TEXT NOT NULL,
        observacoes TEXT NOT NULL,
        data TEXT NOT NULL,
        professor_id INTEGER NOT NULL,
        FOREIGN KEY(professor_id) REFERENCES professor(id)
      )
  ''',
  '''CREATE TABLE alunoDiario (
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        conceito TEXT NOT NULL,
        frequencia TEXT NOT NULL,
        feedback TEXT NOT NULL,
        aluno_id INTEGER NOT NULL,
        diario_id INTEGER NOT NULL,
        FOREIGN KEY(aluno_id) REFERENCES aluno(id),
        FOREIGN KEY(diario_id) REFERENCES diario(id)
    )
  ''',
  '''INSERT INTO professor (nome) VALUES ('Helio')'''
];

//Banco finalizado
