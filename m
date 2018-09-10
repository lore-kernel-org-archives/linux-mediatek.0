From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] rtc: pl031: switch to devm_rtc_allocate_device/rtc_register_device
Date: Mon, 10 Sep 2018 08:44:42 +0200
Message-ID: <CACRpkdaVH7_eVGC+CRQqsA1Y1+oMkkVhVPJmpiE=k90qa23SQQ@mail.gmail.com>
References: <20180909203848.3470-1-alexandre.belloni@bootlin.com> <20180909203848.3470-3-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180909203848.3470-3-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Sun, Sep 9, 2018 at 10:38 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:

> Switch to devm_rtc_allocate_device to simplify the erro and driver removal
> paths.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
