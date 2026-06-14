Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B6ECD98D6
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 07:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6JKdGL8Xe2lq+/BiQDSaNE1rM0cDe8Om7VyrIfgze4=; b=BPuyWwQUeY7kL19CYan5LLJQvJ
	07sbqp7lO3S1QcP2qoPvxo7uOxIi4pOTlJpl/hM9xDCNMawgrph9B8Dg1tJ5wIOHm1MmWdf02o9os
	fhQk2CdJ21qfH2FiT6qiTK9l5GjjGMQxhtcG8DpgE6/GujEu0RsigwrqvsY3CbF8ynormYe/ZcGuE
	K3KN0sQbTfLCfDObIYqDyFOs8FLSKIp852EXpi/brd7FcXQkVZpHs6QW+FcQbTQ/InFEEr2YNd6E1
	5d1Lao45+Yc9NF9kGdWKCQsm8FS60mCrLd49W92MPblCmgTNKT/B8e0nnl2sfcJFv2OAM4eDcE+jp
	OXZz1VIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYf2w-0000000Cnc7-3pOg;
	Sun, 14 Jun 2026 07:14:18 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYf2u-0000000Cnbj-2sQ9
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 07:14:17 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-45eee266c6cso1984861f8f.1
        for <linux-mediatek@lists.infradead.org>; Sun, 14 Jun 2026 00:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781421254; x=1782026054; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t6JKdGL8Xe2lq+/BiQDSaNE1rM0cDe8Om7VyrIfgze4=;
        b=H8wMAusp3bEbJjljCfPcd0k/SMTxr25nagVUfEixS4cIIt3WFpgvvqRS98MRsOPVfX
         4miR66WL3U54Ivpf+6b1x6Ktf49HepASEdouoOEn9QOp+w3XkL6lphNqTASXwKTABKI8
         d0EVKV9ntt53U0KhGDsyyJLXjh1XuvC42QG33BqgTsFHCpwlsdt4K+/DITqvUWBG6wmB
         +mnRs0+m9t7XCxVyKQaqOUyFKCE7z5WiA6dcg8jco5WKeFoBaXnyPkMQFyNcMj6OUDfJ
         E87vdqzCBUoZbBOaAhbhkKXpf/27Cu2dxpj+ECp7ahUiBM1LwdQZJ2CGA8AtTLMEV58A
         1OgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781421254; x=1782026054;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t6JKdGL8Xe2lq+/BiQDSaNE1rM0cDe8Om7VyrIfgze4=;
        b=hZ6wqjUzt2qxoEeLSDPjq8jdFU4QWaW2S478Eow0yajYoBXfGLgnlEiaOPhunRXPiq
         RCZyg5/Pz11YpAhS+ZUfh+BMVuyHHlpT3Am9/pBdJypodJmfANnjRVYuKEmYcT9U7RxA
         ZR+/oCUsWy823TRCGGtC7Fs3qED7BCOYCLcxM/yT2dzvaKaimsPOEjkHJ/eZssprEKxI
         bDvtX8Oqf0DY85+33JlSN8ZswUaUg+w8ZuxvpGw+a4dxjRWT2kO5nBuN3Hu6wBJSWHnb
         BT4u8xSMDRnd7kwbb4YsOaciKgaUxgBd0LNoOxdfqnDkrVnXVvUcQbdrNdSVCMwriavZ
         OF0w==
X-Forwarded-Encrypted: i=1; AFNElJ9w3CjfgN1v2rK1LMSRHAyEszHsb0BZtzU+A/BgrtBst5ioaxLmapgo2EoJ2jfNxvxo20gOq5HMMYNQSCkTug==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZoP5WO+x5yJDgLn2lBiv9rDNSnEnM4izvd9WBpcYJets7p0r+
	alVNHlYegj4sPSFwhLvqDyGOLctN035SSpVIl/xaV5BrRyMeYfDKEnZ0
X-Gm-Gg: Acq92OFJy5lBUfB+rlj/Q/mJ1R0D76mwrNegii8eZxAWs90WcJp95atIkW+et/7gy24
	5vAmJ1m4AS0WVAZTlRVJaAYCrndL7B8isemxlfK0Tb8lDRJGPqYudlbeJmRSYi2i41CZYWPYd+R
	vMhBa8xmY0yUacx9m3Ugg68czO+W6/reeexc8uAFyh/lH8fRYn+WYV/4KNUYyZPLHJSYbdjO3yo
	jPiptuUL01f46D+e1gHjyvJcDDbF6eL3m6pI8qK+e/mlW8XefTCmgdcuedtj+N3tQAPucgKcevn
	aTORQLuO4kn5xBh3c84C4F8v7hPCHiXIPSpIRwcryTQIi1dbD9to/w93qLGb98bjGXyO3H1fIAX
	+cZrIthBm2UBiZ5LYq1AmPZPdFsbh818Uy/jPEGuhtxr77GIoZHNz5RTF9Dvmh5HlE6zhzL2caV
	0Gqaj4GG+4uGuwwHqMMxkxH8iYSHmMnGO0/mZutJylRrqCb1ey9zqOFjJoe1TqYjkX
X-Received: by 2002:a05:6000:420e:b0:43c:f66e:f24 with SMTP id ffacd0b85a97d-4607ebf8195mr6941469f8f.35.1781421254134;
        Sun, 14 Jun 2026 00:14:14 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2d933esm20866652f8f.33.2026.06.14.00.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 00:14:13 -0700 (PDT)
Message-ID: <6a2e54c5.56f33bf0.2d579f.295c@mx.google.com>
X-Google-Original-Message-ID: <ai5UwygS775FPbdx@Ansuel-XPS.>
Date: Sun, 14 Jun 2026 09:14:11 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Wayen.Yan" <win847@gmail.com>
Cc: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] thermal/drivers/airoha: Fix low trip clamp using wrong
 variable
References: <6a2df296.6b2684af.263065.8200@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a2df296.6b2684af.263065.8200@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_001416_796118_4F8EBFD3 
X-CRM114-Status: GOOD (  19.80  )
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

On Sun, Jun 14, 2026 at 08:14:11AM +0800, Wayen.Yan wrote:
> In airoha_thermal_set_trips(), the low trip validation incorrectly
> clamps 'high' instead of 'low':
> 
>   low = clamp_t(int, high, RAW_TO_TEMP(priv, 0), ...);
> 
> This causes TEMPOFFSETL to receive the clamped high-temperature value
> instead of the requested low-temperature value, making the low-temperature
> alert threshold identical to the high-temperature threshold. As a result,
> low-temperature interrupts can never fire independently.
> 
> Fix by replacing 'high' with 'low' in the clamp expression, matching
> the symmetric pattern used for the high trip on line 264.
> 
> Fixes: 42de37f40e1b ("thermal/drivers: Add support for Airoha EN7581 thermal sensor")
> Signed-off-by: Wayen <win847@gmail.com>
> ---
>  drivers/thermal/airoha_thermal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_thermal.c
> index b9fd6bfc88..439aa011b7 100644
> --- a/drivers/thermal/airoha_thermal.c
> +++ b/drivers/thermal/airoha_thermal.c
> @@ -273,7 +273,7 @@ static int airoha_thermal_set_trips(struct thermal_zone_device *tz, int low,
>  
>  	if (low != -INT_MAX) {
>  		/* Validate low and clamp it to a supported value */
> -		low = clamp_t(int, high, RAW_TO_TEMP(priv, 0),
> +		low = clamp_t(int, low, RAW_TO_TEMP(priv, 0),
>  			      RAW_TO_TEMP(priv, FIELD_MAX(EN7581_DOUT_TADC_MASK)));
>  
>  		/* We offset the low temp of 1°C to trigger correct event */
> -- 
> 2.51.0
> 
> 

Hi I already submitted the same patch in the AN7583 series. Can you review
that patch so maybe we can try to push fix for this?

-- 
	Ansuel

