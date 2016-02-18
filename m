From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch] pinctrl: mediatek: signedness bug in mtk_pmx_gpio_request_enable()
Date: Fri, 19 Feb 2016 00:27:54 +0100
Message-ID: <CACRpkdYtESieSy0mwp+2f98sxoJygW+Mm+XxCA0Df_UR6qbcug@mail.gmail.com>
References: <20160216200658.GA9223@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160216200658.GA9223@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Biao Huang <biao.huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Axel Lin <axel.lin@ingics.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Maoguang Meng <maoguang.meng@mediatek.com>, Jonas Gorski <jogo@openwrt.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, kernel-janitors@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, Feb 16, 2016 at 9:06 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> "muxval" stores a value from 0-255 or a negative error code.  It has to
> be signed for the error handling to work.
>
> Fixes: 59ee9c96dd5d ('pinctrl: mediatek: Add gpio_request_enable support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I already applied something like this.

Yours,
Linus Walleij
