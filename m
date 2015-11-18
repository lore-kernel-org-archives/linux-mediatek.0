From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mediatek: Add get_direction support.
Date: Wed, 18 Nov 2015 14:54:48 +0100
Message-ID: <CACRpkdYbY7vDNRdMF_goUkwNHnoDAF9RMmAt-+sPqA1=8Hxouw@mail.gmail.com>
References: <1447798633-24586-1-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1447798633-24586-1-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Axel Lin <axel.lin@ingics.com>, Maoguang Meng <maoguang.meng@mediatek.com>, Colin Ian King <colin.king@canonical.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, biao.huang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Tue, Nov 17, 2015 at 11:17 PM, Hongzhou Yang
<hongzhou.yang@mediatek.com> wrote:

> Since Linux gpio framework return 0 for output, 1 for input.
> But HW use 0 stands for input, and 1 stands for output.
> So use negative to correct it.
>
> And gpio_chip.get is used to get input value, no need to get
> output value, so removing it.
>
> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>

Patch applied for fixes.

Yours,
Linus Walleij
