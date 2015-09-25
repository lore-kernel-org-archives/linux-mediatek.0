From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mediatek: Consistently use the BIT() macro
Date: Fri, 25 Sep 2015 09:41:55 -0700
Message-ID: <CACRpkdYwDXK521OoPJB-xZE3rARMSa-VKLOESZooSnUEqWubLg@mail.gmail.com>
References: <1440804302-6903-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1440804302-6903-1-git-send-email-javier@osg.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Axel Lin <axel.lin@ingics.com>, Rob Herring <robh@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Maoguang Meng <maoguang.meng@mediatek.com>, linux-mediatek@lists.infradead.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Colin Ian King <colin.king@canonical.com>, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

On Fri, Aug 28, 2015 at 4:25 PM, Javier Martinez Canillas
<javier@osg.samsung.com> wrote:

> The mediatek pinctrl driver uses the BIT() macro instead of open
> coding 1 << n in all but one place. Replace this occurrence with
> the BIT() macro for consistency.
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

Patch applied with Matthias' Ack.

Yours,
Linus Walleij
