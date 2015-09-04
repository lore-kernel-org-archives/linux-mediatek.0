From: Joe Perches <joe@perches.com>
Subject: Re: [RFC PATCH 2/3] clocksource: mtk_timer: change pr_warn()s to
 pr_err()s in mtk_timer_init
Date: Thu, 03 Sep 2015 20:40:06 -0700
Message-ID: <1441338006.9666.38.camel@perches.com>
References: <1441336900-15095-1-git-send-email-alexey.klimov@linaro.org>
	 <1441336900-15095-2-git-send-email-alexey.klimov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441336900-15095-2-git-send-email-alexey.klimov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: daniel.lezcano@linaro.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, yingjoe.chen@mediatek.com, tglx@linutronix.de, linux-kernel@vger.kernel.org, klimov.linux@gmail.com
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2015-09-04 at 06:21 +0300, Alexey Klimov wrote:
> These messages are actually errors and not warnings.
> Use pr_err() macro for them and add missing \n.
[]
> diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
[]
> @@ -184,7 +184,7 @@ static void __init mtk_timer_init(struct device_node *node)
>  
>  	evt = kzalloc(sizeof(*evt), GFP_KERNEL);
>  	if (!evt) {
> -		pr_warn("Can't allocate mtk clock event driver struct");
> +		pr_err("Can't allocate mtk clock event driver struct\n");
>  		return;
>  	}

Might as well remove this one as there's
a generic stack_dump() on alloc failures.
