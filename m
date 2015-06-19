From: Joachim Eastwood <manabian@gmail.com>
Subject: Re: [PATCH v4 1/3] clk: Add regmap support
Date: Fri, 19 Jun 2015 18:01:27 +0200
Message-ID: <CAGhQ9Vx3qxvawiUYtEjr7z=o6mS3TirCzRd9-UZ0FP=equWEaQ@mail.gmail.com>
References: <1434464615-9080-1-git-send-email-matthias.bgg@gmail.com>
	<1434464615-9080-2-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434464615-9080-2-git-send-email-matthias.bgg@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: mturquette@gmail.com, Stephen Boyd <sboyd@codeaurora.org>, henryc.chen@mediatek.com, s.hauer@pengutronix.de, jamesjj.liao@mediatek.com, Philipp Zabel <p.zabel@pengutronix.de>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, linux-clk@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi Matthias,

On 16 June 2015 at 16:23, Matthias Brugger <matthias.bgg@gmail.com> wrote:
> Some devices like SoCs from Mediatek need to use the clock
> through a regmap interface.
> This patch adds regmap support for the simple multiplexer clock,
> the divider clock and the clock gate code.
>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

I think it looks fine now and I have no further comments, so:
Acked-by: Joachim Eastwood <manabian@gmail.com>

Hope this can go in for 4.3.


regards,
Joachim Eastwood
