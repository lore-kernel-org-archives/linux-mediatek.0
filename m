Return-Path: <SRS0=h1kY=43=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E8FC10F27
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 14:27:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03A11227BF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 14:27:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MFfcIKBd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03A11227BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fu9nTtnAx+SN3S2vtWOfHuk/Xotl73bds+PbY36cTBg=; b=MFfcIKBdqVjKzI
	Lozp8GWMMI+Xnm5BlVFMvtpOMo2UY04D++JKEU59c2DaPdJLBCkQ3nRmg0U+URMNg4/m5bUVzsTav
	UxE5bEyna825shqGlqSO5UEi0EqPjmhjFx9qn1snfg572+UN6uAGLuUFLSfoVwrCtSLKy8we/ndTI
	HkXYdWkcd7EpnqLpKemhasaUGf0R1ITQtpW3+V8fgpcF+FEXYh3qqAaARBLh9+5uBYBu9pzwF5JTt
	tckeoVfzBiS1/GStBBqd2cqFKn7NSWqNL7sM43PAEowWCQG80j1LoxCwBNxeIN9TmqD4giHx1S0Zb
	ZuL4d72HfubaLPzGt8YQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBfqh-0002uC-0F; Tue, 10 Mar 2020 14:27:11 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBfqa-0002nw-9K; Tue, 10 Mar 2020 14:27:05 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 07:26:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,537,1574150400"; d="scan'208";a="276970470"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga002.fm.intel.com with ESMTP; 10 Mar 2020 07:26:51 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jBfqO-008U0r-T9; Tue, 10 Mar 2020 16:26:52 +0200
Date: Tue, 10 Mar 2020 16:26:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [v1 2/3] media: ov8856: Add devicetree support
Message-ID: <20200310142652.GK1922688@smile.fi.intel.com>
References: <20200310134603.30260-1-robert.foss@linaro.org>
 <20200310134603.30260-3-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310134603.30260-3-robert.foss@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_072704_338770_ABE08FC5 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, ben.kao@intel.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Jonathan.Cameron@huawei.com, matthias.bgg@gmail.com, mchehab@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 10, 2020 at 02:46:02PM +0100, Robert Foss wrote:
> Add devicetree match table, and enable ov8856_probe()
> to initialize power, clocks and reset pins.

...

> +#define OV8856_NUM_SUPPLIES ARRAY_SIZE(ov8856_supply_names)

Use ARRAY_SIZE() directly.

Have you seen Sakari's comments?
Sakari, do I have d=E9j=E0 vu or you indeed commented this driver?

...

> +	gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_LOW);

> +	gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_HIGH);

Yes, seems this one is inverted.

...

> +{
> +	gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_LOW);
> +	regulator_bulk_disable(OV8856_NUM_SUPPLIES, ov8856->supplies);
> +	clk_disable_unprepare(ov8856->xvclk);
> +}
> +
> +

One blank line is enough.

...

> +	ov8856->xvclk =3D devm_clk_get(&client->dev, "xvclk");
> +	if (IS_ERR(ov8856->xvclk)) {
> +		dev_err(&client->dev, "failed to get xvclk\n");
> +		return -EINVAL;
> +	}

Previously it worked without clock provider, now you make a dependency.

This won't work.


-- =

With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
