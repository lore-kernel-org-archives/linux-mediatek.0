From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 3/3] clk: mediatek: Mark bus and DRAM related clocks as
 critical
Date: Thu, 29 Nov 2018 22:48:51 -0800
Message-ID: <154356053181.88331.12262289931983027816@swboyd.mtv.corp.google.com>
References: <20181116180901.17737-1-matthias.bgg@kernel.org>
 <20181116180901.17737-4-matthias.bgg@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116180901.17737-4-matthias.bgg@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthias.bgg@gmail.com, matthias.bgg@kernel.org, mturquette@baylibre.com
Cc: jasu@njomotys.info, sean.wang@kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Quoting matthias.bgg@kernel.org (2018-11-16 10:09:01)
> From: Jasper Mattsson <jasu@njomotys.info>
> =

> This marks MUXes axi_sel and ddrphycfg_sel as well as gates
> infra_dramc_f26m and infra_dramc_b_f26m as with CLK_IS_CRITICAL.
> =

> Fixes: 96596aa06628 ("clk: mediatek: add clk support for MT6797")
> Signed-off-by: Jasper Mattsson <jasu@njomotys.info>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---

Can you add comments in the commit text and in the code about why the
CLK_IS_CRITICAL flag is added to these clks? It makes it easier to
figure out why the flag is there months from now when we all forget
