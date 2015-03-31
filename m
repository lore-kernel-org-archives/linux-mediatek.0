From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 3/6] clk: mediatek: Add reset controller support
Date: Tue, 31 Mar 2015 10:00:24 +0200
Message-ID: <1427788824.2969.2.camel@pengutronix.de>
References: <1427737245-4064-1-git-send-email-s.hauer@pengutronix.de>
	 <1427737245-4064-4-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427737245-4064-4-git-send-email-s.hauer@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, YH Chen <yh.chen@mediatek.com>, linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>, linux-mediatek@lists.infradead.org, kernel@pengutronix.de, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <Yingjoe.Chen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Am Montag, den 30.03.2015, 19:40 +0200 schrieb Sascha Hauer:
> The pericfg and infracfg units also provide reset lines to several
> other SoC internal units. This adds a function which can be called
> from the pericfg and infracfg initialization functions which will
> register the reset controller using reset_controller_register. The
> reset controller will provide support for resetting the units
> connected to the pericfg and infracfg controller. The units resetted
> by this controller can use the standard reset device tree binding
> to gain access to the reset lines.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
