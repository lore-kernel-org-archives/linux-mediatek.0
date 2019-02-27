From: Mars Cheng <mars.cheng@mediatek.com>
Subject: Re: [PATCH v4 3/3] clk: mediatek: Mark bus and DRAM related clocks
 as critical
Date: Wed, 27 Feb 2019 18:36:31 +0800
Message-ID: <1551263791.9274.1.camel@mtkswgap22>
References: <20190214163242.26259-1-matthias.bgg@kernel.org>
         <155120371334.260864.14503820089028591730@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <155120371334.260864.14503820089028591730@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: kevin-cw.chen@mediatek.com, matthias.bgg@kernel.org, mturquette@baylibre.com, sean.wang@mediatek.com, linux-kernel@vger.kernel.org, jasu@njomotys.info, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi Stephen

On Tue, 2019-02-26 at 09:55 -0800, Stephen Boyd wrote:
> Quoting matthias.bgg@kernel.org (2019-02-14 08:32:42)
> > From: Jasper Mattsson <jasu@njomotys.info>
> > 
> > Currently, DRAM-related clocks are not marked with CLK_IS_CRITICAL
> > for MT6797. This causes memory corruption when the system is
> > booted without clk_ignore_unused.
> > This patch marks MUX ddrphycfg_sel as well as gates infra_dramc_f26m
> > and infra_dramc_b_f26m as CLK_IS_CRITICAL.
> > 
> > Signed-off-by: Jasper Mattsson <jasu@njomotys.info>
> > Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> > ---
> 
> Applied to clk-next
> 
> Would be nice to get someone from mediatek to ack it, but I can't wait
> forever.

Acked-by:Mars Cheng <mars.cheng@mediatek.com>

Thanks a lot.
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
