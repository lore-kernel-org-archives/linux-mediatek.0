From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: mediatek: correct the clocks for MT2701 HDMI PHY module
Date: Mon, 16 Apr 2018 09:34:55 -0700
Message-ID: <152389649546.51482.15378110712126175925@swboyd.mtv.corp.google.com>
References: <f3248cc94349000b2587d9c6102d56323acba9e0.1523844642.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f3248cc94349000b2587d9c6102d56323acba9e0.1523844642.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>, chunhui dai <chunhui.dai@mediatek.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Quoting Ryder Lee (2018-04-15 19:31:58)
> The hdmitx_dig_cts clock signal is not a child of clk26m,
> and the actual output of the PLL block is derived from
> the tvdpll via a configurable PLL post-divider.
> 
> It is used as the PLL reference input to the HDMI PHY module.
> 
> Signed-off-by: Chunhui Dai <chunhui.dai@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

Any sort of Fixes: tag here?
