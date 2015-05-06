From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v12] clk: Add common clock support for Mediatek MT8135
 and MT8173
Date: Tue, 5 May 2015 22:54:10 -0700
Message-ID: <20150506055410.GC10871@codeaurora.org>
References: <1429778143-2074-1-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1429778143-2074-1-git-send-email-s.hauer@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Mike Turquette <mturquette@linaro.org>, YH Chen <yh.chen@mediatek.com>, linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>, linux-mediatek@lists.infradead.org, kernel@pengutronix.de, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <Yingjoe.Chen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 04/23, Sascha Hauer wrote:
> The following changes since commit 39a8804455fb23f09157341d3ba7db6d7ae6ee76:
> 
>   Linux 4.0 (2015-04-12 15:12:50 -0700)
> 
> are available in the git repository at:
> 
>   git://git.pengutronix.de/git/sha/linux-2.6.git tags/v4.0-clk-mediatek-v12
> 
> for you to fetch changes up to e0ebeaa8a3f4a762cb9c2780170445aad15915d1:
> 
>   dt-bindings: ARM: Mediatek: Document devicetree bindings for clock/reset controllers (2015-04-23 10:22:34 +0200)
> 
> ----------------------------------------------------------------
> This patchset contains the initial common clock support for Mediatek SoCs.
> Mediatek SoC's clock architecture comprises of various PLLs, dividers, muxes
> and clock gates.

Applied to clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
