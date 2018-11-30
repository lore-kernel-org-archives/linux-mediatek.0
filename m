From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 2/3] clk: mediatek: Add flags to mtk_gate
Date: Thu, 29 Nov 2018 22:50:12 -0800
Message-ID: <154356061291.88331.179492557229227536@swboyd.mtv.corp.google.com>
References: <20181116180901.17737-1-matthias.bgg@kernel.org>
 <20181116180901.17737-3-matthias.bgg@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116180901.17737-3-matthias.bgg@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthias.bgg@gmail.com, matthias.bgg@kernel.org, mturquette@baylibre.com
Cc: jasu@njomotys.info, sean.wang@kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Quoting matthias.bgg@kernel.org (2018-11-16 10:09:00)
> From: Jasper Mattsson <jasu@njomotys.info>
> =

> This is required to mark gates as CLK_IS_CRITICAL.
> =

> Fixes: 96596aa06628 ("clk: mediatek: add clk support for MT6797")
> Signed-off-by: Jasper Mattsson <jasu@njomotys.info>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---

These other two look ok to me. I'll apply them to the clk tree and wait
to merge to clk-next in case someone from Mediatek wants to review these
changes.
