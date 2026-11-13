Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C47606A333
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 19:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SRi5oLUI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JRtauu45
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IeG8GW29CPTq2V+5DOuKsl8l1CpVGznlbRHng5hlVeQ=; b=SRi5oLUIAPM2fH
	8QCajrlW69CO8Lhz8a2NlMZ355fsc9Vyj4byi6dzPQX8YaH2AXlNbKvivDMF0SGaAtYCnGMCI7pmE
	1qqsByBLVT1MPpaa8O6HOGfhcFamK6Ui0X/Q4Z+ZwnkgUKnmhbEoQVAv66Cm7OmkBQpZ5JSlWQhjA
	cf1K7QWV3X8R/tdefnpdu4vUPg+tjuxc2sD1v42Vi6lkybn/K/rZj23ojdvWHJmKo0N83lNTB3v/Y
	kNe6c7wDuRSm76ZEAwUEoMXKrvOrXwzxM1dC5w4Mn7g7ylYoty+RKZ/QtOd3cZUzP1HBqLu9quisf
	Tzru+eYAEyFb7ln/OeFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxFF-0000000EHUy-205M;
	Fri, 13 Nov 2026 19:47:33 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxEz-0000000EHRc-45pD
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 19:47:19 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-36dbde64409so2086670eec.0
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 11:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794599237; x=1795204037; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IeG8GW29CPTq2V+5DOuKsl8l1CpVGznlbRHng5hlVeQ=;
        b=JRtauu45qPeVQO8sxGEI3ZxIfWV+SnuMj1jwL1uwRkzOLebu/rbCtOVG1bSWWyYGnA
         g7RJPSa9c22Dp2MUOF7jcQ1/u+iPwY/wPaSiPvao/+qfNFd2xSU9JqVSLWIqpj8NY1qt
         f8gU9hnvAt+V/tJM/H75CTGCxWFVuov80LMu5++k8S/lqRtexJt4zr28vl4serpUklqv
         ffsQ8nluLfhRcARmi0roF1z451LdtDd9kJxDgnT0NiNTJuIAjy2o8MYtu4i5MXRZ5XC/
         GVRRztaKvfuNiP6446Fm1MnH8iANLGoKE18rYavUEqyI94yEVzD65eW3tWGvaXM0B8CJ
         uWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599237; x=1795204037;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeG8GW29CPTq2V+5DOuKsl8l1CpVGznlbRHng5hlVeQ=;
        b=h5xXL5uaxadn28vwyl1PE9rzu3ETNHIPgap/0Rp+N4eI0Hi5Y28zZI7J8OYdIJK6JV
         kJSJDGcs/M2uBtp6mOPT8k9Q9OZ4CeKurH02NBfP71jTkdxVcYZMi4nGEJpMc7HzQjfC
         3ZDcl9i96+o7dPCV6pe/ZSGLFKa3A09GQsQFxwYNJoRMgAXHP7BPAoWakzzkZ7m9h9/i
         Tzr9gUO2TgNatr6oiKtO48m2w7FZf2gMet+xwQv+pUqW0vYMmp+xVzGmXNAviWQYYyD/
         fHtbKRP/i4Iq9Zu9fbhpBYGID4thU86kk7Cy1Ha3gTHDhmBYQ6O8J2o4wnExxcyP6dVH
         sYdw==
X-Forwarded-Encrypted: i=1; AL+hErGw+JvqRS768mlhXKp6PviI8bFf2WQP0zZgesPLe8ZddHUlWrubO3BOara/ESCmjbIZJS7w+Xw6hxo/NXzq4A==@lists.infradead.org
X-Gm-Message-State: APuU4Z8OcoSE6ZHVM4qxeIdG1YuRBOqxkqEO9VIoahjrGPTMAwQIwdJJ
	LePKP0b/xq/ltu/+7jeHygpDOntqVBQp5Q2uuZdZBDMThnRpeLNIrZA0
X-Gm-Gg: AYBFou37MVRnH0u2uQ3wduESciYI5mVueV1y5gbMsAkdnB3UOTaYfUC+URZ0TKnvfjm
	xvs4DzVZ3rWt+G/OZMkWE/ywXo+srNvpjpANqWd1DPP9Tt84tdZ86Ss6c1cSprBXicaAozYYA/L
	dOlZ920K1cPTehqtbrG5VfQNU3t/+SBeBqeA8Uu7vo4Vbm6F7Kx4U/zyoDVTRauPuwlqIYoSFYq
	h/XMaF3lrLuG58NQSET9Dg1Ukp6iBwTOrIExh5ELqTmYIqPPVtWYmF/xp6iyiAv0qEikFQ1LGWH
	uuW34dWQ4mF9OrWR4aTfpYf9RJmR8AKQyk9G9iifG3Gf9vW31cnuvBuMH/quLST6uGx1tiTcO2o
	KkROG7UCAJoNXVSqT621RJT1zIrn1d/6xxzwK23bKCisiCfd1Zp4EmKvoyNOOEI5vGWxR76N1iC
	YWAvq/fJzi1jjt3pMlocvZ2FcmP/SLJASjsSkBp8phjTBZW47ssDhk0u1+w6ivWWHpvu64gjMfJ
	RfEIDQaVZk0W8e2WyQvu8RYCM8DRGMhMDGYbHpSQfd6tREaqKJAeI9dXHyVvKRXE6jzN918atAV
	ATo3ZKxzf8s+CO89fL+Wghd0kcVWZMG9fpYZNWyCXD3Pz5QMBWttc76Ki9+uneZRhQ==
X-Received: by 2002:a05:693c:83cb:20b0:375:388:a6d5 with SMTP id 5a478bee46e88-379675fc8fbmr2832268eec.32.1794599236582;
        Fri, 13 Nov 2026 11:47:16 -0800 (PST)
Received: from [192.168.35.9] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm10172682eec.14.2026.11.13.11.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:47:16 -0800 (PST)
Message-ID: <953597c5-80f6-4ee7-b8db-ec7264d99e40@gmail.com>
Date: Sat, 14 Nov 2026 04:47:09 +0900
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] devfreq: Use %pe to print error pointers
 symbolically
To: Sumeet Pawnikar <sumeet4linux@gmail.com>, rafael@kernel.org,
 krzk@kernel.org, amit.kachhap@gmail.com, daniel.lezcano@kernel.org,
 thara.gopinath@gmail.com, talel@amazon.com, hayashi.kunihiko@socionext.com,
 mhiramat@kernel.org, mmayer@broadcom.com, viresh.kumar@linaro.org,
 sumitg@nvidia.com, peter.griffin@linaro.org, myungjoo.ham@samsung.com,
 kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net,
 marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org,
 wens@kernel.org, t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-samsung-soc@vger.kernel.org,
 kernel@pengutronix.de, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
 <20260912191156.185448-3-sumeet4linux@gmail.com>
Content-Language: ko
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260912191156.185448-3-sumeet4linux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_114718_038885_14757E93 
X-CRM114-Status: GOOD (  14.76  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 9/13/2026 4:11 AM, Sumeet Pawnikar wrote:
> Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
> to dev_err(). The %pe format specifier prints a symbolic error name (e.g.
> -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it falls back
> gracefully and prints the raw integer value. This makes messages more
> readable without any functional change.
> 
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---
>  drivers/devfreq/imx-bus.c    | 4 ++--
>  drivers/devfreq/imx8m-ddrc.c | 3 +--
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/devfreq/imx-bus.c b/drivers/devfreq/imx-bus.c
> index 49798f542d68..dba76d8b9e5a 100644
> --- a/drivers/devfreq/imx-bus.c
> +++ b/drivers/devfreq/imx-bus.c
> @@ -75,8 +75,8 @@ static int imx_bus_init_icc(struct device *dev)
>  	priv->icc_pdev = platform_device_register_data(
>  			dev, icc_driver_name, -1, NULL, 0);
>  	if (IS_ERR(priv->icc_pdev)) {
> -		dev_err(dev, "failed to register icc provider %s: %ld\n",
> -				icc_driver_name, PTR_ERR(priv->icc_pdev));
> +		dev_err(dev, "failed to register icc provider %s: %pe\n",
> +				icc_driver_name, priv->icc_pdev);
>  		return PTR_ERR(priv->icc_pdev);
>  	}
>  
> diff --git a/drivers/devfreq/imx8m-ddrc.c b/drivers/devfreq/imx8m-ddrc.c
> index 52beeb5b7d65..28d7c595fa17 100644
> --- a/drivers/devfreq/imx8m-ddrc.c
> +++ b/drivers/devfreq/imx8m-ddrc.c
> @@ -340,8 +340,7 @@ static int imx8m_ddrc_check_opps(struct device *dev)
>  	for (i = 0, freq = 0; i < opp_count; ++i, ++freq) {
>  		opp = dev_pm_opp_find_freq_ceil(dev, &freq);
>  		if (IS_ERR(opp)) {
> -			dev_err(dev, "Failed enumerating OPPs: %ld\n",
> -				PTR_ERR(opp));
> +			dev_err(dev, "Failed enumerating OPPs: %pe\n", opp);
>  			return PTR_ERR(opp);
>  		}
>  		dev_pm_opp_put(opp);

Hi,

Applied it.

Thanks


