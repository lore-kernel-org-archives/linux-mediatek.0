From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v11]: clk: Add common clock support for Mediatek MT8135
 and MT8173
Date: Tue, 7 Apr 2015 13:47:58 +0200
Message-ID: <CABuKBeJ256HBLP+3WB+acNbMonGknQJgWBnGjEx1VWecWc-Y5g@mail.gmail.com>
References: <1427825817-26773-1-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427825817-26773-1-git-send-email-s.hauer@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, YH Chen <yh.chen@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Henry Chen <henryc.chen@mediatek.com>, linux-mediatek@lists.infradead.org, =Sascha Hauer <kernel@pengutronix.de>, Yingjoe Chen <Yingjoe.Chen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Sascha,


2015-03-31 20:16 GMT+02:00 Sascha Hauer <s.hauer@pengutronix.de>:
>
> The following changes since commit 9eccca0843205f87c00404b663188b88eb248051:
>
>   Linux 4.0-rc3 (2015-03-08 16:09:09 -0700)
>
> are available in the git repository at:
>
>   git://git.pengutronix.de/git/imx/linux-2.6.git tags/v4.0-clk-mediatek-v11
>
> for you to fetch changes up to ae9129219143cfdefe8b3a463deb8c5cb8955525:
>
>   dt-bindings: ARM: Mediatek: Document devicetree bindings for clock/reset controllers (2015-03-31 20:08:46 +0200)
>
> ----------------------------------------------------------------
> This patchset contains the initial common clock support for Mediatek SoCs.
> Mediatek SoC's clock architecture comprises of various PLLs, dividers, muxes
> and clock gates.

I tried the patch set on my mt8135 eval board. I used the dts bindings
from a former version of this set [1], but it does not boot the board
(based on v4.0-rc7).
Do you have any hint, what is happening, or are the bindings wrong?

Best regards,
Matthias

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2015-February/322813.html
