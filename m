From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2] pwm-backlight: fix the panel power sequence
Date: Fri, 16 Oct 2015 11:36:59 +0200
Message-ID: <1444988219.3541.3.camel@pengutronix.de>
References: <1444987060-48202-1-git-send-email-yh.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pwm-owner@vger.kernel.org>
In-Reply-To: <1444987060-48202-1-git-send-email-yh.huang@mediatek.com>
Sender: linux-pwm-owner@vger.kernel.org
To: YH Huang <yh.huang@mediatek.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, yingjoe.chen@mediatek.com, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Am Freitag, den 16.10.2015, 17:17 +0800 schrieb YH Huang:
> In order to match the panel power sequence, disable the enable_gpio
> in the probe function. Also, reorder the code in the power_on and
> power_off function to match the timing.

Could you also have a look at the "pwm-backlight: Avoid backlight
flicker when probed from DT" patch?
I think in case of a panel left enabled by the bootloader, your patch
will disable the backlight for a short time.

best regards
Philipp
