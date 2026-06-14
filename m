Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8FDCD98D2
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 07:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nSQ+yfDg6eGkA3F5El5qmydZTplBrIuCCSHAiRy4+I=; b=4EQGxFNxpE4+QqU1abogbFvLX9
	NrSnhnRGhwBsKKHWCapcEQerlzP/vzeRA4q/6jaTQiVrezJVquaodiT/9Qtt9KBv+qsZEFy8iNDB6
	JHUZiuHrjfDwUOHJDfgqgoCWYzSCPabyWmbIGCs+Hk4CKXQ0z+Zsmz/D1/0iN5ScRQTghW1EmG3sb
	J/AsZPhZJlLrmMamkCGNzUFueqqztmLIGx1/3b2aYHpMWE6YwfVGlEFSi66WPlWnBLNzGhqajs7fv
	OZxEtE5kx0QLUCF2nmxTXTHQeuhclvOLVA+YgxH1KM/HuOJvroUnhlDw6lUExJc6kSoXYWTvl/kOK
	aFK1fgqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYf3N-0000000CneE-022l;
	Sun, 14 Jun 2026 07:14:45 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYf3K-0000000Cndt-2RzH
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 07:14:43 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-45fd45e596cso1216257f8f.1
        for <linux-mediatek@lists.infradead.org>; Sun, 14 Jun 2026 00:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781421281; x=1782026081; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9nSQ+yfDg6eGkA3F5El5qmydZTplBrIuCCSHAiRy4+I=;
        b=nnHcj/kkFik+1bZf5vLasBppizwXwwpiQsYnY37px+WhrayBW4WNWDsd9ninugWX4m
         Fplzhik9EiY3UIVCFS03BzlORRexKReANOzkoBaCA5K5GEebNycl/b0cbMPVJ+I3Sw57
         LBU+EV6nX9WiPCKTykHOJeTrUddH6Q+b1ZXWpNUENPvK0Z6E38KJRUHleSV5mXf/nYDl
         ekG7cakE1jpkhZ9R+oFrVv6E1K6g/h/S/tUGowAEiZJm8//19ltPDgx8js2Bp/wBiZWa
         aATQXLljo873oopNpErAu5F5ul0XLR9jB4OC6ytCQNvxF3tkIVd7FYIIXJMBiwXg5Spx
         i2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781421281; x=1782026081;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nSQ+yfDg6eGkA3F5El5qmydZTplBrIuCCSHAiRy4+I=;
        b=e6mY2EC4WPPQeStu4H4ZBaDcZEVL1mbb1WBVEwrty46Mxqfy0vsFH6RtIKypKAqyGC
         MXY0Su7F2zhTwimcmSRJeB/qBOnje8aae+KmT+qTt7L1zJXWgROk05+sKMvaAb2B5Mw5
         dHIYUG9mypPa6JfBVYsVKSmcqwI6aDEkvR725QN835qZl0POWrIZrS/I0O/QG7DNeA2a
         cgb5HAXMbCrVNeteSdojalnvaFDajySiNSz0XHnFDgDCN8OzQ6rXKDvZxAvb2DmaJp4b
         CVxDv/peaF5fn/MxLRT8jbS/ZLd2DCXGkhjEFEqzIJxKH/zdyScpf9voBA8NwXx1tVYA
         r9IA==
X-Forwarded-Encrypted: i=1; AFNElJ/aIuw+P4YsjRdMYvjcm6ZbOrTXSmJ7dZfBm6zYEJ5xdcPw6sz94jJQHZj6ZtkBlmkvxnxVmd0Pfq5mW0hYjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgkpLiMXzd2+LmzXfCSKpyWiejxw6NMwcU9F3xL2Nr2PieLFju
	BTUMJRbVrPxXjdG2c4W+/TVZ+Qpi8YW0LFZfalxQ+H9ZCHyHax67oj6K
X-Gm-Gg: Acq92OE4jnrIRrRTIN7ezGfut1pD+UElES2Z4I7cdGX9hXYPRwrUepo0qzFHk7L+yT5
	yvHYNl8KjsGAAjiae194jDPetfIMDOD0aWkbnVAo24mxtT4RoSPKi0+e+5Wl92RT11/f5D+M3lD
	oCQ+qTYpXpCspwbgFR8xtkouHth+q021URtW6Ct5x30Z2FUVHaTx6QlJZz9p6ZVn5XnQHxrco7S
	ZKxlw4OoqAqFrEsuAzunqrOh9BWQNhnLj7o/BfrljOsv51Y8G8/NbAxHHwIE1fTEkC+Fj+oDolh
	vLYjV3cNFmHc4wz0IA9Qh61zbC83PgEm8n1vUi2WjWQFVNI0iXvwSYEmSZKS+1LW5kPHUzIInEP
	3GzjpFxDLsH85V+F//tC2Ew3H0IY5tDJ2yKSmmg3XQl4b+5ASx8uvjGmgiiIapGVZO5IUhli2eg
	XP64hLp4HGtHQNbkxq2MrUV5MzhM/fFb1jqVmd/KsGbaTp8yotUwY4zw==
X-Received: by 2002:adf:e003:0:20b0:45e:f672:40fb with SMTP id ffacd0b85a97d-4606db97637mr8781427f8f.22.1781421280445;
        Sun, 14 Jun 2026 00:14:40 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2e592csm23787783f8f.36.2026.06.14.00.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 00:14:40 -0700 (PDT)
Message-ID: <6a2e54e0.892a62f1.395abf.7552@mx.google.com>
X-Google-Original-Message-ID: <ai5U3pZYrRQ6eBBr@Ansuel-XPS.>
Date: Sun, 14 Jun 2026 09:14:38 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Wayen.Yan" <win847@gmail.com>
Cc: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] thermal/drivers/airoha: Fix FIELD_PREP using wrong mask
 for sensor interval
References: <6a2df293.6b2684af.263065.81b4@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a2df293.6b2684af.263065.81b4@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_001442_644194_B62C609C 
X-CRM114-Status: GOOD (  21.14  )
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

On Sun, Jun 14, 2026 at 08:14:28AM +0800, Wayen.Yan wrote:
> In airoha_thermal_setup_monitor(), the TEMPMONCTL2 register is
> programmed with:
> 
>   writel(FIELD_PREP(EN7581_FILT_INTERVAL, 1) |
>          FIELD_PREP(EN7581_FILT_INTERVAL, 379), ...)
> 
> Both FIELD_PREP calls target FILT_INTERVAL (GENMASK(25,16)), so the
> second one overwrites the first. The sensor interval field
> SEN_INTERVAL (GENMASK(9,0)) is never written and remains zero.
> 
> The comment above states: "filt interval is 1 * 52.715us, sen interval
> is 379 * 52.715us", confirming the second value should go into
> SEN_INTERVAL. This matches the Mediatek auxadc_thermal.c reference
> implementation which correctly writes FILTER_INTERVAL and
> SENSOR_INTERVAL to their respective non-overlapping bit fields.
> 
> Actual effect: FILT=379 (should be 1), SEN=0 (should be 379).
> The filter interval runs 379x too long and the sensor sampling
> interval is uninitialized, causing incorrect thermal monitoring timing.
> 
> Fix by replacing the second FIELD_PREP's mask from FILT_INTERVAL to
> SEN_INTERVAL.
> 
> Fixes: 42de37f40e1b ("thermal/drivers: Add support for Airoha EN7581 thermal sensor")
> Signed-off-by: Wayen <win847@gmail.com>
> ---
>  drivers/thermal/airoha_thermal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_thermal.c
> index b9fd6bfc88..e8a33234e0 100644
> --- a/drivers/thermal/airoha_thermal.c
> +++ b/drivers/thermal/airoha_thermal.c
> @@ -403,7 +403,7 @@ static void airoha_thermal_setup_monitor(struct airoha_thermal_priv *priv)
>  	 * sen interval is 379 * 52.715us = 19.97ms
>  	 */
>  	writel(FIELD_PREP(EN7581_FILT_INTERVAL, 1) |
> -	       FIELD_PREP(EN7581_FILT_INTERVAL, 379),
> +	       FIELD_PREP(EN7581_SEN_INTERVAL, 379),
>  	       priv->base + EN7581_TEMPMONCTL2);
>  
>  	/* AHB poll is set to 146 * 68.64 = 10.02us */
> -- 
> 2.51.0
> 
>

Hi I already submitted the same patch in the AN7583 series. Can you review
that patch so we can try to push this fix? 

-- 
	Ansuel

