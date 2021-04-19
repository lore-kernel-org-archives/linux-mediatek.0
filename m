Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B07C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 05:03:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75ECB6113C
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 05:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75ECB6113C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atmark-techno.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Tbv3dO0SU5ZbI89Xm8sq64a9JK4AYEkJLZje9vucafk=; b=UBmLLKKSR7fOv4gQvOzWMe9Ko
	MPYFOUU8YtqjQS/kFl/RFCswIkwr0TAQHdBqcyPdBhGSI2IjlIaALC3sG1EYfp+n0hHQziMltTW0U
	cvN5311MAh18SjD8bc09SFmOZfn2kfbTgCozGZrK6XRIHURlvt4r2jBdS5zrpBtZvacNvMiZx8EaP
	usKseWNtN0RV1NPrSU5dvQLacTT+h5vEYv9tUHS7SFJRL/bpXFrYSg/S1S2ahj5TNlDc/xjG31bab
	K89QBRsROqd2eg6z1spMy68bAuTgs3WfN9OWxOH4WaBABmoEtCLd3GEPebyCT9kRVM6jVBdVhNK2C
	C06Piv5EQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYM4B-0097Rf-2A; Mon, 19 Apr 2021 05:03:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYM45-0097Qj-VQ
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 05:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=bLr973ENjFZQNNz5/z+BmoCFuTDVovYaAYguOO0YOc4=; b=FqCUaH/m4o36EybObw8kYfxjc3
 jM8bp7G1PfxE3kdBhTXbhnbTcUUY3ZeohBhZf/hE6bILLoB+A4Lyk2cTPdPbR18wJtxm01rRpL4d0
 QrKLjig1TqarAcBJwKm22Xlf7obXxgVgXFa0sx2HonPUr+GWSHWu9eVnMsh2HdFJnXg5QbeYWTb3A
 2OJhJpMuTns2elyGngOnkEmVhSmj6tVP8u8PGzhCq3e7nDX4zyEc0HsQIgV9jaav/XfwNEGBURHln
 2UukyNl7wS6OKLxWQpXVvdGP9luQnMgy7W6BnVTQNHm3O9t1Z0mTBI36tqz0FTTNphxJruM4UCqnO
 /rhRPZjw==;
Received: from gw.atmark-techno.com ([13.115.124.170])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lYM40-00B029-F3
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 05:03:16 +0000
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by gw.atmark-techno.com (Postfix) with ESMTPS id AD121804AF
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Apr 2021 14:03:11 +0900 (JST)
Received: by mail-qv1-f69.google.com with SMTP id
 w20-20020a0562140b34b029019c9674180fso8569907qvj.0
 for <linux-mediatek@lists.infradead.org>; Sun, 18 Apr 2021 22:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bLr973ENjFZQNNz5/z+BmoCFuTDVovYaAYguOO0YOc4=;
 b=kb6OPUs4gHy9F5umBV94cq9Myh5ypFNo9XTBAvd0O6MUB2yObNDZWEXAu0WLyBmwfr
 mr5PvCEtmCY2Sj504bijH76yxCXD/7qLiFK5sb7tMJcNKepgw5CBg/t/Q3TL+XY8ydDq
 PzhgMup6RcL8/X718hwkbber7HCVNluhfUEf6xpRjaTOKKU2aaxueynLJvj81gVasn0e
 QgGUIePNSHLHwdIMw5vX75xWjErLP31uGRrTmN+FeqtJPOKyfW45VA3Ul81xxvc4aJ36
 cK8X43VxC8YTfpVi0G1x72ii7SZwvJJNqYOPxPN8ZAGjTOzFBYLmvx2ASOdXvWahK5lY
 abMA==
X-Gm-Message-State: AOAM533eS8WnNbCws5eJH2ehEYdAithxftemjYgw28fEx+jSRvZrovhe
 qQ75bUPzgq+ZHb/W44E7e+Vp9Pbk/KGmSVxAAlCwYmi58ZmmtBUtysPYLRcg5dRu041kSLAqXVr
 WIhgBhZ+jgp8700KKFIOxf7ubkXaPw21Uj6o2
X-Received: by 2002:a17:902:d645:b029:e8:ec90:d097 with SMTP id
 y5-20020a170902d645b02900e8ec90d097mr21074831plh.47.1618808579511; 
 Sun, 18 Apr 2021 22:02:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyI1MeNQhpXnytM5xmVsw3ZCkrTxMPyrxhKroAVtmGUaPe01xpWL31HOX4hl1pxmvtORo+KDQ==
X-Received: by 2002:a17:902:d645:b029:e8:ec90:d097 with SMTP id
 y5-20020a170902d645b02900e8ec90d097mr21074765plh.47.1618808579243; 
 Sun, 18 Apr 2021 22:02:59 -0700 (PDT)
Received: from pc-0115 (103.131.189.35.bc.googleusercontent.com.
 [35.189.131.103])
 by smtp.gmail.com with ESMTPSA id ga21sm2553351pjb.5.2021.04.18.22.02.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Apr 2021 22:02:58 -0700 (PDT)
Received: from martinet by pc-0115 with local (Exim 4.94)
 (envelope-from <martinet@pc-0115>)
 id 1lYM3l-0016Ra-6N; Mon, 19 Apr 2021 14:02:57 +0900
Date: Mon, 19 Apr 2021 14:02:47 +0900
From: Dominique MARTINET <dominique.martinet@atmark-techno.com>
To: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, horia.geanta@nxp.com,
 aymen.sghaier@nxp.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, tony@atomide.com, geert+renesas@glider.be,
 mturquette@baylibre.com, sboyd@kernel.org, vkoul@kernel.org,
 peter.ujfalusi@gmail.com, a.hajda@samsung.com,
 narmstrong@baylibre.com, robert.foss@linaro.org, airlied@linux.ie,
 daniel@ffwll.ch, khilman@baylibre.com, tomba@kernel.org,
 jyri.sarha@iki.fi, joro@8bytes.org, will@kernel.org,
 mchehab@kernel.org, ulf.hansson@linaro.org, adrian.hunter@intel.com,
 kishon@ti.com, kuba@kernel.org, linus.walleij@linaro.org,
 Roy.Pledge@nxp.com, leoyang.li@nxp.com, ssantosh@kernel.org,
 matthias.bgg@gmail.com, edubezval@gmail.com, j-keerthy@ti.com,
 balbi@kernel.org, linux@prisktech.co.nz, stern@rowland.harvard.edu,
 wim@linux-watchdog.org, linux@roeck-us.net,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, linux-media@vger.kernel.org,
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-staging@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [RFC v1 PATCH 3/3] driver: update all the code that use
 soc_device_match
Message-ID: <YH0O907dfGY9jQRZ@atmark-techno.com>
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-4-alice.guo@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419042722.27554-4-alice.guo@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_220312_629579_3A11DBF9 
X-CRM114-Status: GOOD (  28.99  )
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

Alice Guo (OSS) wrote on Mon, Apr 19, 2021 at 12:27:22PM +0800:
> From: Alice Guo <alice.guo@nxp.com>
> 
> Update all the code that use soc_device_match

A single patch might be difficult to accept for all components, a each
maintainer will probably want to have a say on their subsystem?

I would suggest to split these for a non-RFC version; a this will really
need to be case-by-case handling.

> because add support for soc_device_match returning -EPROBE_DEFER.

(English does not parse here for me)

I've only commented a couple of places in the code itself, but this
doesn't seem to add much support for errors, just sweep the problem
under the rug.

> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
> 
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> index 5fae60f8c135..00c59aa217c1 100644
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -2909,7 +2909,7 @@ static int sysc_init_soc(struct sysc *ddata)
>  	}
>  
>  	match = soc_device_match(sysc_soc_feat_match);
> -	if (!match)
> +	if (!match || IS_ERR(match))
>  		return 0;

This function handles errors, I would recommend returning the error as
is if soc_device_match returned one so the probe can be retried later.

>  
>  	if (match->data)
> diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> index c32d2c678046..90a18336a4c3 100644
> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -439,6 +439,7 @@ static const unsigned int r8a7795es2_mod_nullify[] __initconst = {
>  
>  static int __init r8a7795_cpg_mssr_init(struct device *dev)
>  {
> +	const struct soc_device_attribute *match;
>  	const struct rcar_gen3_cpg_pll_config *cpg_pll_config;
>  	u32 cpg_mode;
>  	int error;
> @@ -453,7 +454,8 @@ static int __init r8a7795_cpg_mssr_init(struct device *dev)
>  		return -EINVAL;
>  	}
>  
> -	if (soc_device_match(r8a7795es1)) {
> +	match = soc_device_match(r8a7795es1);
> +	if (!IS_ERR(match) && match) {

Same, return the error.
Assuming an error means no match will just lead to hard to debug
problems because the driver potentially assumed the wrong device when
it's just not ready yet.

>  		cpg_core_nullify_range(r8a7795_core_clks,
>  				       ARRAY_SIZE(r8a7795_core_clks),
>  				       R8A7795_CLK_S0D2, R8A7795_CLK_S0D12);
> [...]
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index eaaec0a55cc6..13a06b613379 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -757,17 +757,20 @@ static const char * const devices_allowlist[] = {
>  
>  static bool ipmmu_device_is_allowed(struct device *dev)
>  {
> +	const struct soc_device_attribute *match1, *match2;
>  	unsigned int i;
>  
>  	/*
>  	 * R-Car Gen3 and RZ/G2 use the allow list to opt-in devices.
>  	 * For Other SoCs, this returns true anyway.
>  	 */
> -	if (!soc_device_match(soc_needs_opt_in))
> +	match1 = soc_device_match(soc_needs_opt_in);
> +	if (!IS_ERR(match1) && !match1)

I'm not sure what you intended to do, but !match1 already means there is
no error so the original code is identical.

In this case ipmmu_device_is_allowed does not allow errors so this is
one of the "difficult" drivers that require slightly more thinking.
It is only called in ipmmu_of_xlate which does return errors properly,
so in this case the most straightforward approach would be to make
ipmmu_device_is_allowed return an int and forward errors as well.



...
This is going to need quite some more work to be acceptable, in my
opinion, but I think it should be possible.

Thanks,
-- 
Dominique

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
