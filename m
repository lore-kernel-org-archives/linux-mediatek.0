From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH] rtc: Fix module autoload for OF platform drivers
Date: Mon, 31 Aug 2015 22:15:23 +0200
Message-ID: <20150831201523.GB3409@piout.net>
References: <1440676322-19870-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1440676322-19870-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Luis de Bethencourt <luis.bg@samsung.com>, Gregory Clement <gregory.clement@free-electrons.com>, Alessandro Zummo <a.zummo@towertech.it>, Support Opensource <support.opensource@diasemi.com>, Linus Walleij <linus.walleij@linaro.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, linux-mediatek@lists.infradead.org, Eddie Huang <eddie.huang@mediatek.com>, Tony Prisk <linux@prisktech.co.nz>, rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 27/08/2015 at 13:52:02 +0200, Javier Martinez Canillas wrote :
> These platform drivers have a OF device ID table but the OF module
> alias information is not created so module autoloading won't work.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
>  drivers/rtc/rtc-armada38x.c | 1 +
>  drivers/rtc/rtc-coh901331.c | 1 +
>  drivers/rtc/rtc-da9063.c    | 1 +
>  drivers/rtc/rtc-moxart.c    | 1 +
>  drivers/rtc/rtc-mpc5121.c   | 1 +
>  drivers/rtc/rtc-mt6397.c    | 1 +
>  drivers/rtc/rtc-mv.c        | 1 +
>  drivers/rtc/rtc-vt8500.c    | 1 +
>  8 files changed, 8 insertions(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
