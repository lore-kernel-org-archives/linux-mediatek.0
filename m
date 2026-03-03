Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E85AEDEBEB
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2026 20:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrVCaQvW0iEI3otUrXDkdYdjfZQ36uxHWa4/LArwCVM=; b=b9QtEkwYJX4iEVB1BXhxmRrNvs
	spATW33Wk2MpHFUxqQ35hTqywSaidBYdL7KFf4drEjzO9ozQF1HTNRaf936ZgKSP1ZXPh5/+u8qxr
	WL3/jURcrTvV0rA44rZxFrrJhtevBrBAwhU9AoiYY3Oz9eBEbB0xAXKS9ym97M+kDsOXRwglraVDY
	1z9udXfhKFz6hId1bOgx1rvtimYlff4wdr/XKw6OWO5A4qQf3BnFj7I3wsjx1DRMh3M9+EhC4i9yX
	AQOzgTJmvIa/B7inzQP8aj6M1n/tPgBtyEiX5hURjjl0MbZjpzULfp+ajllkzveK80YOQ9/qPNjJa
	8EYGJYbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVul-0000000Frp4-1dGA;
	Tue, 03 Mar 2026 20:00:19 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVui-0000000FrlI-1WSe
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Mar 2026 20:00:17 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso53926195e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Mar 2026 12:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772568014; x=1773172814; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LrVCaQvW0iEI3otUrXDkdYdjfZQ36uxHWa4/LArwCVM=;
        b=MBJ3V9gjx9TbrQtzdbCS5Jc43FmzQS6HT6EzIA1H5PYi7wOQsBc+np8zzhW3Oj3ily
         mvYXWQvhdtV1vNaF/sboc126mVgGItKa4+gzFkaEGn1v60BQwp96PBZ2X2PsJH2yHGMW
         SXLzOEl6iq133PjIaJBtZZoDW9pBDuxrnkAGIKdRnOoEC3aaswKCjP+UjPOmQxzbnxfc
         ee3UmJXKaCyUnSnoiCffbo+Jm5Po+M+o/QvDvMyJIW2QrmhG1NBpysfo7cLPjUrs3aYg
         wg/GeZPmA1dY5UvdFS2CY+mxMymvlO91HTV1X+7tpZS/V0w2QQ0KpsF4owy5aB8DTfvf
         +Q9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772568014; x=1773172814;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrVCaQvW0iEI3otUrXDkdYdjfZQ36uxHWa4/LArwCVM=;
        b=wVlyhcJWfQwsf6adrTxHgUR8xwa2g2www8X8beOolOyhZSDgUg7cbgQiutA0yf9Wy1
         l6AE+KHwghKGgGeHAmZXQq47N5X++e/cExwGvAuqpi/aJ7/t6yu+ERtd0YxE4QRAzf+5
         iuxTluFd2/4e/Ro+fiDb1ONR5xarCTXfPRHFZYGy9JCbhiPwDNfCPPxGe0glHLgxKd81
         CdUUcceKdcV3sO+GLf8qpsVuxMgZquPFW4uPNfn1D5JS+Oleh/9qUprNd6nw/zdKxGNN
         /DNoCwIGv7CEne4bSplGWeMgS/TcFzmX2q4am7vOFXivtxiqcHa2TIQXt4qyxIzdfHH1
         jZUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYsm9oWtAFoQMCgNFMdmzqqfYp1Tw2wW/FfaDvlt1pz2zrVnjOMSHJIsSk8iYHp51N3zKZ69PdplBKseZ9Ig==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1mmZ8Yh06b92+6uvU0PjtLQMHY1ZkQYqs8gaO2FABeBfAJeo0
	Co0wYDxUGM+5+LNAitkOQid7mAMjgrBsT/XYPkF3MrNA0HbuFjP6uLic
X-Gm-Gg: ATEYQzzNIQ7m64H1FeBMSiiOd4cViNxLrdI3+gx6qBzR7JXifpukBWtr9Z/f9z80ui9
	ZzA5UVcOlpuL7Hz/Pifg9GcRSgQYwcIS5tZiVQVtlf3UPxPYUFZ9UJtqAsu+PQFzPAcIU4AJCA6
	Oul26k7mX9BCNfD/mmnwJG+CaUm1Uxqu1s9amTnYuWJA6X1auM+2o+CIY+IbhTA7HsTGG2/w6WR
	iljdgOhXESz9zMQXn7OAkKTui6tph26A8gqSktC9Esax+OKJgFQYNE506H2F4Xs7j//tLPLwVa1
	Lh9RShOafBUohokA5afKBTZeIyCpQeuF1Y+NNwPy0Y6RHYyrx4mc9qQk6vLOamLNCwDHPGY/c39
	aOZqIT+u/h/IvMRiiaSBj6Bn1tg4vMFf5iCoOj0bWXOVeKOAEPbzN/Ek9iR4SRHOihOCOs0krf6
	CgpAZ40kfTXkZUMlaM3Qbkzag4x/PAlGoD3w8S6gx83OOT8tYyCQJRrg==
X-Received: by 2002:a05:600c:3b22:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-483c9bff7b0mr280384695e9.22.1772568013945;
        Tue, 03 Mar 2026 12:00:13 -0800 (PST)
Received: from Ansuel-XPS. (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485133a91b1sm21667245e9.12.2026.03.03.12.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 12:00:13 -0800 (PST)
Message-ID: <69a73dcd.7b0a0220.1ac46b.9bfc@mx.google.com>
X-Google-Original-Message-ID: <aac9yrt6MhSXBSbO@Ansuel-XPS.>
Date: Tue, 3 Mar 2026 21:00:10 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	lorenzo@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: airoha: en7581: add crypto offload
 support
References: <20260303193923.85242-1-olek2@wp.pl>
 <20260303193923.85242-2-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303193923.85242-2-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_120016_441129_97AC6E46 
X-CRM114-Status: GOOD (  15.50  )
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

On Tue, Mar 03, 2026 at 08:39:18PM +0100, Aleksander Jan Bajkowski wrote:
> Add support for the built-in cryptographic accelerator. This accelerator
> supports 3DES, AES (128/192/256 bit), ARC4, MD5, SHA1, SHA224, and SHA256.
> It also supports full IPSEC, SRTP and TLS offload.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  arch/arm64/boot/dts/airoha/en7581.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
> index ff6908a76e8e..4931b704235a 100644
> --- a/arch/arm64/boot/dts/airoha/en7581.dtsi
> +++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
> @@ -300,6 +300,18 @@ rng@1faa1000 {
>  			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		crypto@1e004000 {
> +			compatible = "airoha,en7581-eip93",
> +				"inside-secure,safexcel-eip93ies";
> +			reg = <0x0 0x1fb70000 0x0 0x1000>;
> +
> +			clocks = <&scuclk EN7523_CLK_CRYPTO>;
> +
> +			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			resets = <&scuclk EN7581_CRYPTO_RST>;

I guess you can drop the extra new line between clocks interrupts and resets.

Does the driver supports these property tho? For example the clock is just
enabled or tweaked to a specific frequency? Same question for resets.

> +		};
> +
>  		system-controller@1fbf0200 {
>  			compatible = "airoha,en7581-gpio-sysctl", "syscon",
>  				     "simple-mfd";
> -- 
> 2.47.3
> 

-- 
	Ansuel

