function out = runModel(I, g, w_0, e, b3_hat)

    assignin("base", "I", I);
    assignin("base", "g", g);
    assignin("base", "w_0", w_0);
    assignin("base", "e", e);
    assignin("base", "b3_hat", b3_hat);

    simIn = Simulink.SimulationInput("sat_model");
    out = sim(simIn);
end