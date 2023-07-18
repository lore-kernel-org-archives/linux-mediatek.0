Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E168FC001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 08:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXlokmYwnD/69+730Hpn/XlSN9qtd/DBiv2nez/ul5g=; b=LaoMdN0SWBzMXPCwtc+reNL+Am
	cNjxiACWq57mUuBXWwYKMOqsybPlw+X1L5jLRSa0Uuu4SRpH3rHTPQkzWwGjzCSyaa/l2Jc4bolOj
	y6GYdy6G29CBap5ED/03nLUvRGiW3B2TwH2x23ak+r+whTRwr2RQqpi19VStAUyvpVQDGzUchqRzS
	KmxX4LYQ/sawJr2mpy2kXM9/NKwY+DYCDnPmmIDEE+8PtJPeisZvlWDK3aowZoZml39dJKKup7DNj
	FRnlk/wfEdZ3yn9ygjz9E4quZrLwRqxTVS/0GyI5Mk64NWzpKSHQWoN/TF5hHSv4HsYWTz6A1iWOu
	AOW51yhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2cy-006NkE-2w;
	Wed, 19 Jul 2023 08:33:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2cw-006NiX-1q;
	Wed, 19 Jul 2023 08:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HXlokmYwnD/69+730Hpn/XlSN9qtd/DBiv2nez/ul5g=; b=HjZDq2GIeAiMNDDoNB77KwGWdR
	LaEUYvXlFah5mva9yZNIP2YMQBWCrlZJS0zKRIwpFBrkDmPKliyc1mZ0IiLv5eq8pc1nz4qQEa3zB
	Eu3fzOJPSQVLswjenJ0/qssTjJUhkOZFE6sOUI7RNc7LAsP2K6uUM1d9oeUi48PI65LYf39tjYkk5
	RjcxakMQ6E4Y1sI825vIJ3h/Ozx9/9aCcVwMBR4Oz2eec1GSyS2TvHcQqvd9I54t8n6wZ0o9PyW+I
	PZOLjK7lnBYdLe4AGUjrIWgiqcvSJoTWky1rP7RU4g3E/3iWFomDQVBLOgEvURgpmNvltdfT7QRNr
	8YdjwB/Q==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLhQz-00BO7A-1j;
	Tue, 18 Jul 2023 09:56:03 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4R4vQf6KT9z6J6rL;
	Tue, 18 Jul 2023 17:53:14 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 18 Jul
 2023 10:55:44 +0100
Date: Tue, 18 Jul 2023 10:55:43 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij
	<linus.walleij@linaro.org>, Balsam CHIHI <bchihi@baylibre.com>, "Claudiu
 Beznea" <claudiu.beznea@microchip.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Reding <thierry.reding@gmail.com>, Paul Cercueil
	<paul@crapouillou.net>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-pm@vger.kernel.org>, Andy Shevchenko
	<andy@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Len Brown <len.brown@intel.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>,
	Sean Wang <sean.wang@kernel.org>, "Jonathan Hunter" <jonathanh@nvidia.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>, Pavel Machek
	<pavel@ucw.cz>, "Matthias Brugger" <matthias.bgg@gmail.com>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 01/10] pm: Introduce DEFINE_NOIRQ_DEV_PM_OPS() helper
Message-ID: <20230718105543.00006395@Huawei.com>
In-Reply-To: <20230717172821.62827-2-andriy.shevchenko@linux.intel.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	<20230717172821.62827-2-andriy.shevchenko@linux.intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_105602_002202_B0DFB044 
X-CRM114-Status: GOOD (  13.99  )
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

On Mon, 17 Jul 2023 20:28:12 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> _DEFINE_DEV_PM_OPS() helps to define PM operations for the system sleep
> and/or runtime PM cases. Some of the existing users want to have _noirq()
> variants to be set. For that purpose introduce a new helper which sets
> up _noirq() callbacks to be set and struct dev_pm_ops be provided.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Seems reasonable to me given it is fairly common

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  include/linux/pm.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/linux/pm.h b/include/linux/pm.h
> index badad7d11f4f..0f19af8d5493 100644
> --- a/include/linux/pm.h
> +++ b/include/linux/pm.h
> @@ -448,6 +448,15 @@ const struct dev_pm_ops __maybe_unused name = { \
>  	SET_RUNTIME_PM_OPS(suspend_fn, resume_fn, idle_fn) \
>  }
>  
> +/*
> + * Use this if you want to have the suspend and resume callbacks be called
> + * with disabled IRQs.
> + */
> +#define DEFINE_NOIRQ_DEV_PM_OPS(name, suspend_fn, resume_fn) \
> +const struct dev_pm_ops name = { \
> +	NOIRQ_SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
> +}
> +
>  #define pm_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM), (_ptr))
>  #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
>  


