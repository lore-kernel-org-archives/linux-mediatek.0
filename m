Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E14C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 08:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jSAv9CMs8DqmK0Hzb2QMbfEFL7IRBNeS6UEPQQwX/zQ=; b=TItGfgpKyDs8UZ
	uayPzkwrhMWmTck1v1SLe7VDc74gfbEEhyr4AzCiBoE8AoxFdlgFBNwKuXzhfr/0q5F8/uBObw4/I
	OUOFiyPcGS8/wJ5LYQGZ3GtZNQ3msQVFyY01EXrJCwV61rfbT+sCOohUyfEnNdl66Be2mBngYUMFX
	43MkzAg3xOPfmrmXOqOgNVg6e3cjf/IZax9M/9r12ZuKC1+4Up0R/uR84DeryZxnktlS6qreNABv3
	CgGh7ZqvykkFO+f4a6//O8y4Y3TJoo28KUlbt7QYJrwdsn/BTiW9fxuwubBLGZ2vRHtxF3Cxld87Z
	Du4MCEAxH7z7kgjGIWWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTfse-004OlL-SE; Mon, 14 Mar 2022 08:16:40 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfcq-004HYB-TI
 for linux-mediatek@lists.infradead.org; Mon, 14 Mar 2022 08:00:22 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 l1-20020a05600c4f0100b00389645443d2so9082120wmq.2
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Mar 2022 01:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Cfv85awAmoyZzNe4XhXxrHLPFirYqlR4GxEuXMqMPG0=;
 b=DpH1bJNPog08D3meVY94qXN/ZTbqAbz22x6qEBi18AI0VYBHw6WBAPeMRRQHnLK3ar
 6HYGEv/sONT9p/YzmzdZ6x0n5bTSIzEpRrq8evBqUfUerZXm9mDecwejCayDb70xdG7A
 si5mAoEzOlZ9dvqP5coB2biSOtdVjibaVqwRORZpNfXQ1Guq+mQvlEsWdnkKdQ0KiIRS
 Cw8OHPaLOI7KY6AZESsF9Pl7sTyfKGx+6PnvoM0AbaY+3rToip30Sp2dwCH4yZO/XLXZ
 n3baygYKvIa3OTUtAteiF+YGnrI3kDcuOZyiUdN+6MMRuuF0d/Ik0M4DmI6pU7V3rkmD
 HSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Cfv85awAmoyZzNe4XhXxrHLPFirYqlR4GxEuXMqMPG0=;
 b=5Nr/8MOrFvrC+6reqVH7/c8O42U4pVSWO/jm3yAPoF6/VXVe5wPzsT5zJKaHwtetKJ
 5alXFFOhF9Aph4/6+f2D4Xf5+ujTWyuFwEYeM9Gi/JdXk7Pi5i0zMJVGbI9URV/zPcvl
 b8S+sZUgojQ7rjmE4Q4I0tiq2j1Fyd9uYtCILXv+bAqlIdL+bND+YXhgxhQKDMZtl5+P
 PEE1p3GFw6dkB2t6Ykz0idzPv47vGnT0ksPkSJo3OJqW6myvKnSyhE/dYHxKwkrIht9V
 nAspeFi3E9E9INShax8auNmo6RLZ9VqOYu4MFtyOD0UH294tEdZelQe6rrTbw/d6b5G3
 kReA==
X-Gm-Message-State: AOAM530htu6RcnofO5h+OFvMMSopSP2A0W3e4f8GIn0QnCtaplDmL3b6
 yKEMxalf7i9Vlt7ZgxkOUgWKZg==
X-Google-Smtp-Source: ABdhPJzbOI0b73c/qadaAd7iEJGOVJ5hLgp/CgtYvpQSgMgQpjxw37Y+EMVduvNyqB6rfHgzaz11tw==
X-Received: by 2002:a05:600c:4a12:b0:389:9c7d:5917 with SMTP id
 c18-20020a05600c4a1200b003899c7d5917mr16243062wmp.0.1647244819585; 
 Mon, 14 Mar 2022 01:00:19 -0700 (PDT)
Received: from localhost ([2a01:cb19:826e:8e00:bcd3:63d9:c9dc:840d])
 by smtp.gmail.com with ESMTPSA id
 10-20020adf808a000000b001edd413a952sm12568861wrl.95.2022.03.14.01.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 01:00:19 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Marco Felsch
 <m.felsch@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Fengping Yu <fengping.yu@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, Fabien Parent
 <fparent@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 2/3] Input: mt6779-keypad - Add MediaTek keypad driver
In-Reply-To: <YiIINpi4zbJq/AZE@smile.fi.intel.com>
References: <20220303154302.252041-1-mkorpershoek@baylibre.com>
 <20220303154302.252041-3-mkorpershoek@baylibre.com>
 <300114e2-6794-db3c-a51c-3f900b6476f9@collabora.com>
 <YiIINpi4zbJq/AZE@smile.fi.intel.com>
Date: Mon, 14 Mar 2022 09:00:18 +0100
Message-ID: <87ee35rmjx.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_010021_017131_AF56BA9D 
X-CRM114-Status: GOOD (  20.42  )
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

On ven., mars 04, 2022 at 14:38, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Fri, Mar 04, 2022 at 11:31:38AM +0100, AngeloGioacchino Del Regno wrote:
>> Il 03/03/22 16:43, Mattijs Korpershoek ha scritto:
>> > From: "fengping.yu" <fengping.yu@mediatek.com>
>> > 
>> > This patch adds matrix keypad support for Mediatek SoCs.
>
>> > +struct mt6779_keypad {
>> > +	struct regmap *regmap;
>> > +	struct input_dev *input_dev;
>> > +	struct clk *clk;
>
>> > +	void __iomem *base;
>
> Not sure why you need this here.
You are right. There is no point of keeping this __iomem region as part
of the structure, since it's only used in the probe() function to create
the regmap.

Will send an improvement part of a later series.

>
>> > +	u32 n_rows;
>> > +	u32 n_cols;
>> > +	DECLARE_BITMAP(keymap_state, MTK_KPD_NUM_BITS);
>> > +};
>> > +
>> > +static const struct regmap_config mt6779_keypad_regmap_cfg = {
>> > +	.reg_bits = 32,
>> > +	.val_bits = 32,
>> > +	.reg_stride = sizeof(u32),
>> > +	.max_register = 36,
>> 
>> Are you sure that you can't use .fast_io = true?
>> 
>> Another version for the same question:
>> Are you sure that you need to lock with a mutex here, and not with a spinlock?
>> 
>> Since you're performing reads over a MMIO, I think that there's a very good
>> chance that you can use fast_io.
>> 
>> > +};
>
> ...
>
>> Please use dev_err_probe() to simplify error handling in probe functions: you've
>> done a great job with adding a devm action for the error cases, avoiding gotos to
>> get out cleanly.. it would be a pity to not finish this to perfection.
>> 
>> I'll give you two examples for this, so that you'll be all set.
>> 
>> 	if (IS_ERR(keypad->regmap))
>> 		return dev_err_probe(&pdev->dev, PTR_ERR(keypad->regmap),
>> 				     "regmap init failed\n");
>> 
>> P.S.: No need for %pe here, as dev_err_probe prints the error number for you!
>
> Maintainer of the input subsystem is strongly against dev_err_probe() API. See
> other files there. Ditto for other cases you mentioned below.
>
> -- 
> With Best Regards,
> Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
