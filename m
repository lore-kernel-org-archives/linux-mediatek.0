Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BDAC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 12:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DuqUEu95MUZftUn9+6OUkui+wnc+/pi0cgdDbm5K86w=; b=ARt5grYAd+Rze7
	FC+n8rozG6up6N2Vx6WpRtCXhMUmmeTFlM27U5YEVrmVCcjnTjTsw4UhJYMQW26PE8t+6GR6rMfh4
	TrTpwqRUIpmj2K0iS10bV917mCYXZD9d/+60lX5EG6ZzIf/W8MLoY+wxvzNnrGo1La5wocpv7mtOY
	Ptx1w22DsRSrBEufEbhCmNUjLofieKT25PVm9kZ7kZUw2s9cjYUIXGrC1+ipieH0iNbHsic6HdtQM
	loDL7ds+UWxYBdew+66ld9LTSSY2ZMDEbrhi4F4pbt64CGEi+C3QnCAKPZbNKmlPZTrYy+Dl0U6Sx
	eVQkAvpt1A/Relv5Jhxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ7DK-009zjD-FD; Fri, 04 Mar 2022 12:39:18 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ7D8-009zgT-9l; Fri, 04 Mar 2022 12:39:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646397546; x=1677933546;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QJ5044QybdgyBcGGWpEQ66a2p8/cp1NF4P4f5axlo9k=;
 b=IOnez+9SwNKMA32FiVMVXQtue4uZlEn8hhrkvDpRi7W2Ff/a9zPi8LlU
 Y+F3zJkJv1UjxRMIsuGWq6gB2HT4jGF0yZlSrkHdcnUofAoETTz/YGp91
 YfK4sC6btc85ige2VdHXWsOraKOKXs6FkB/40XbhMGyegtL21mh2VH7q0
 ntkkikTUkngZ1aTPY2O8BLZDbw6/t1gwmDLZ1v2OoO8s/DWE68OlZu9i/
 CM2va5A3r867zha3XpYzpadoI1vO9PhVT9SSdKvjYnChUX+2JeW4n0dTq
 bu08gpbKO82ynTiFW4rhA5x6jlix7EK14lzALGhm3zlP7a8sXdyb5W1IQ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="253898954"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="253898954"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 04:39:04 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="576869293"
Received: from smile.fi.intel.com ([10.237.72.59])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 04:39:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nQ7CI-00BDcA-IQ; Fri, 04 Mar 2022 14:38:14 +0200
Date: Fri, 4 Mar 2022 14:38:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fengping Yu <fengping.yu@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 2/3] Input: mt6779-keypad - Add MediaTek keypad driver
Message-ID: <YiIINpi4zbJq/AZE@smile.fi.intel.com>
References: <20220303154302.252041-1-mkorpershoek@baylibre.com>
 <20220303154302.252041-3-mkorpershoek@baylibre.com>
 <300114e2-6794-db3c-a51c-3f900b6476f9@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <300114e2-6794-db3c-a51c-3f900b6476f9@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_043906_436065_6272F2A9 
X-CRM114-Status: GOOD (  20.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 04, 2022 at 11:31:38AM +0100, AngeloGioacchino Del Regno wrote:
> Il 03/03/22 16:43, Mattijs Korpershoek ha scritto:
> > From: "fengping.yu" <fengping.yu@mediatek.com>
> > 
> > This patch adds matrix keypad support for Mediatek SoCs.

> > +struct mt6779_keypad {
> > +	struct regmap *regmap;
> > +	struct input_dev *input_dev;
> > +	struct clk *clk;

> > +	void __iomem *base;

Not sure why you need this here.

> > +	u32 n_rows;
> > +	u32 n_cols;
> > +	DECLARE_BITMAP(keymap_state, MTK_KPD_NUM_BITS);
> > +};
> > +
> > +static const struct regmap_config mt6779_keypad_regmap_cfg = {
> > +	.reg_bits = 32,
> > +	.val_bits = 32,
> > +	.reg_stride = sizeof(u32),
> > +	.max_register = 36,
> 
> Are you sure that you can't use .fast_io = true?
> 
> Another version for the same question:
> Are you sure that you need to lock with a mutex here, and not with a spinlock?
> 
> Since you're performing reads over a MMIO, I think that there's a very good
> chance that you can use fast_io.
> 
> > +};

...

> Please use dev_err_probe() to simplify error handling in probe functions: you've
> done a great job with adding a devm action for the error cases, avoiding gotos to
> get out cleanly.. it would be a pity to not finish this to perfection.
> 
> I'll give you two examples for this, so that you'll be all set.
> 
> 	if (IS_ERR(keypad->regmap))
> 		return dev_err_probe(&pdev->dev, PTR_ERR(keypad->regmap),
> 				     "regmap init failed\n");
> 
> P.S.: No need for %pe here, as dev_err_probe prints the error number for you!

Maintainer of the input subsystem is strongly against dev_err_probe() API. See
other files there. Ditto for other cases you mentioned below.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
