Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EF1C77B7F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jun 2025 11:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmKtYLO9DDYaj9Me5RnB2od40m2nfSC9/3iVyLRTgPc=; b=U2twejQ1lCvoMqI5NWsVVmJ03Z
	YQZzJaTeIPKZpVqDlXyTUZAoJSuwJQ9TkdhxdwqwJ9MIyfMU4HUHDTlH/mEZmgPwQqWQ0f6vcmS3D
	/hElsyQ/PgF6z0RhcMuGiNm9L1BtAb0AfgIB/vgbFXZplEpCZ1Io8hvTDuuiSd3XN/pPJiMBAtTwX
	4OFW0Uf8/yNkRqKi7vR+9p+wFQy7c20vYX1e3lFaFVJPaT/HbuoBSyhof8fKnOED5G3hvcXl5wggm
	GwYco9rcjaoaZlHC6oXZRqEjp0P1QVwCxi/Q/mh2kTPUyOvTFwjmq8C/ovyDnxi7zb2++ToUEJtMi
	vWB5PunA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1gn-00000005Q2T-0rwt;
	Tue, 24 Jun 2025 11:19:45 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU14R-00000005Ki3-38Ek;
	Tue, 24 Jun 2025 10:40:09 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750761604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PmKtYLO9DDYaj9Me5RnB2od40m2nfSC9/3iVyLRTgPc=;
	b=v1IFWcFrbObYtAZ/RT0Kppv2+R1ysQJUiAOhyBDBdBD7GRafKVhWIJlEp4M1/MAbW7r3Ca
	o8ExT+FJNwE1MLi5ZHj7mixRk7DPF7y0JESsK+b/BXPx0H36L3GknAlPGKQ80sDZSd8kX8
	c7tk3xzYOhkh9+PB8l0sOAqBJbObspXXOYombtNTWorYQc/dnlFuIdXCWjoZNydWHsEEfw
	BxAB1cxurgSdDrVSKVwi91WSkw72/7/zhYIxKx2zfbMR8WyyBWVel7X/khQj5qlBzANr+W
	waHxljQ3WDmwbOBvDQ6fj/PD/LbBRXtKBrQTzgU9iEnxcn0NlO2wYO/ak4OZtw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750761604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PmKtYLO9DDYaj9Me5RnB2od40m2nfSC9/3iVyLRTgPc=;
	b=3q5D0uT4oSfP2VhfCp/l4dQktoBuSpc64H38sBuCNB8bE8D63GfRugryCyLDa3R+2guT87
	o5CUyJOaQUdlplCw==
To: Pan Chuang <panchuang@vivo.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui
 <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Markus Mayer <mmayer@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 zhanghongchen <zhanghongchen@loongson.cn>, Yinbo Zhu
 <zhuyinbo@loongson.cn>, Amit Kucheria <amitk@kernel.org>, Thara Gopinath
 <thara.gopinath@gmail.com>, Niklas =?utf-8?Q?S=C3=B6derlund?=
 <niklas.soderlund@ragnatech.se>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Heiko
 Stuebner <heiko@sntech.de>, Bartlomiej Zolnierkiewicz
 <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Vasily Khoruzhick
 <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Greg KH
 <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>,
 =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 Conor Dooley
 <conor.dooley@microchip.com>, Julien Panis <jpanis@baylibre.com>, Arnd
 Bergmann <arnd@arndb.de>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,
 Colin Ian King <colin.i.king@gmail.com>, Raphael Gallais-Pou
 <rgallaispou@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, "Jiri Slaby (SUSE)"
 <jirislaby@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Costa Shulyupin
 <costa.shul@redhat.com>, Yury Norov <yury.norov@gmail.com>, Cheng-Yang
 Chou <yphbchou0911@gmail.com>, Caleb Sander Mateos
 <csander@purestorage.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: Yangtao Li <frank.li@vivo.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Jonathan Cameron
 <Jonathan.Cameron@Huawei.com>, Pan Chuang <panchuang@vivo.com>
Subject: Re: [PATCH v6 01/24] genirq/devres: Add
 devm_request_threaded_irq_probe() and devm_request_irq_probe()
In-Reply-To: <20250623123054.472216-2-panchuang@vivo.com>
References: <20250623123054.472216-1-panchuang@vivo.com>
 <20250623123054.472216-2-panchuang@vivo.com>
Date: Tue, 24 Jun 2025 10:13:10 +0200
Message-ID: <87h605o8vd.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_034007_944426_F589B578 
X-CRM114-Status: GOOD (  29.31  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jun 23 2025 at 20:30, Pan Chuang wrote:
> +/**
> + * devm_request_threaded_irq_probe - request irq for a managed device with error msg (recommended in probe)
> + * @dev:	Device to request interrupt for
> + * @irq:	Interrupt line to allocate
> + * @handler:	Function to be called when the IRQ occurs
> + * @thread_fn:	Function to be called in a threaded interrupt context. NULL
> + *		for devices which handle everything in @handler
> + * @irqflags:	Interrupt type flags
> + * @devname:	An ascii name for the claiming device, dev_name(dev) if NULL
> + * @dev_id:	A cookie passed back to the handler function
> + * @info:	Optional additional error log
> + *
> + * This is a variant of the devm_request_threaded_irq function.
> + * It will print an error message by default when the request fails,
> + * and the consumer can add a special error msg.
> + *
> + * Except for the extra @info argument, this function takes the
> + * same arguments and performs the same function as
> + * devm_request_threaded_irq(). IRQs requested with this function will be
> + * automatically freed on driver detach.

I really have to ask why you need the extra info argument. It's not
providing any really value.

What's important when the interrupt request fails?

    1) The device, which is identifiable by @devname and/or dev_name(@dev)

    2) The interrupt number

    3) The error code

If you want to be more expressive then you can also print out the
handler function symbols, which makes it even more useful to map back
into the affected driver.

As you cited correctly I said back then:

  "So there is certainly an argument to be made that this particular
   function should print a well formatted and informative error
   message."

This particular function is: devm_request_threaded_irq().

IOW, I did not ask you should go an create a new one, right?

The extra @info argument is just proliferating the nonsensical
information which driver developers put into the output. I just looked
through a couple of your thermal patches (hint, I had to chase them
manually because you failed to thread them properly). While most of them
provide NULL, the two adding 'alarm' are really not providing any useful
information.

The point is, that the information is aimed at developers and not to be
helpful for Joe User to identify/fix a problem. If the driver
developer/maintainer is not able to track back the information (name,
number, error code) to the driver in question, then the added "foo" info
is not going to make him any smarter.

If that happens, then being able to map it back to the driver is only 1%
of the problem analysis, simply because you need to decode the
underlying problem (DT, vector exhaustion, memory exhaustion ....) to be
able to address it.

So just make devm_request.*irq() emit a uniform and informative message
on fail and you can go and remove all the homebrewn useless error prints
from the drivers.

It does not matter at all if there are duplicated error messages for a
release or two until all drivers have been cleaned up. This is not the
common case and only rarely triggered. So what?

> +int devm_request_threaded_irq_probe(struct device *dev, unsigned int irq,
> +				    irq_handler_t handler, irq_handler_t thread_fn,
> +				    unsigned long irqflags, const char *devname,
> +				    void *dev_id, const char *info)
> +{
> +	int rc;
> +
> +	rc = devm_request_threaded_irq(dev, irq, handler, NULL, irqflags, devname, dev_id);

This is just wrong as you fail to hand in thread_fn.

Q: How was this code ever tested?
A: Not at all.

> Could you please consider merging the entire series into your branch? 

You're seriously asking that for something which is so obviously broken?

> +	if (rc) {
> +		return dev_err_probe(dev, rc, "Failed to request %sinterrupt %u %s %s\n",
> +				     thread_fn ? "threaded " : "", irq, devname ? : dev_name(dev),
> +				     info ? : "");

This is wrong too because devm_request_threaded_irq() allows you to hand
in both a hard interrupt and a threaded handler and either one of them
can be NULL.

So what you want to add in devm_request_threaded_irq() is something like
this:

	if (rc < 0) {
		return dev_err_probe(dev, rc, "request_irq(%u) %pS %pS %s\n",
                        	     handler, thread_fn, devname ? : "");
        }

dev_err_probe() already prefixes the caller string with 'error ', so
there is no need for a lenghty 'failed to request ....' novel.

Thanks,

        tglx

