From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2 2/3] clocksource: mtk_timer: fix pr_warn() messages
 in mtk_timer_init
Date: Sun, 18 Oct 2015 17:23:24 -0700
Message-ID: <1445214204.31899.36.camel@perches.com>
References: <1445213365-24530-1-git-send-email-alexey.klimov@linaro.org>
	 <1445213365-24530-2-git-send-email-alexey.klimov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445213365-24530-2-git-send-email-alexey.klimov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: daniel.lezcano@linaro.org, matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com, tglx@linutronix.de, klimov.linux@gmail.com
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2015-10-19 at 03:09 +0300, Alexey Klimov wrote:
> 1) Change pr_warn()s to pr_err()s. These messages are actually
> errors and not warnings.
> 2) Add missing \n.
> 3) Error message for kzalloc() failure is removed per suggestion
> by Joe Perches. There is generic stack_dump() for allocation issues.

Some of the braces around single statements
could also be removed.

> diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
> index ca5ea9e..ac92ca2 100644

> @@ -184,7 +184,6 @@ static void __init mtk_timer_init(struct device_node *node)
>  
>  	evt = kzalloc(sizeof(*evt), GFP_KERNEL);
>  	if (!evt) {
> -		pr_warn("Can't allocate mtk clock event driver struct");
>  		return;
>  	}

could be written:

 	evt = kzalloc(sizeof(*evt), GFP_KERNEL);
	if (!evt)
		return;

etc...
