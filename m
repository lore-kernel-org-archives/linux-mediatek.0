Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175FCC2D0CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 May 2025 03:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJeEK1wvqh/5GI00xPvic9jYaOrLKQqzETwEkdBkLnc=; b=icKXApTvbafA6RtOScxrOrzQaj
	QzZj27AvdxRWe2AOAFPxDvbTwbQD6SaIwNtro4a+1ucuN8HJyiesS6zJMX8Dfq7O29xTJqnd8lF6Z
	CUwB2vn+U/HnfVx5eWJyzjF5ifJ3s/oCbbD1zk71G/SACFRntCziX4fuEtc7nCf7ouokuNw3SxJhd
	+Wn9vhL2+6AcILdTK8FKxR/wjez3VlZQdEqQOw+vPidu7pza1rP23+xZGvyNLe1nLQcdBfcDOOFZ/
	yfeD4hzW6m7pU/EjXYVjM+ptJ9Y9CaUC1L8CvYqmjSSLMaobr1kuaRTqamUrH/nDbsyM9RlbCk2mP
	6FWDuRyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlqa-00000002OaQ-4Bep;
	Fri, 16 May 2025 03:34:57 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlqY-00000002OZw-006o
	for linux-mediatek@lists.infradead.org;
	Fri, 16 May 2025 03:34:55 +0000
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8B7A5114008D;
	Thu, 15 May 2025 23:34:50 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-02.internal (MEProxy); Thu, 15 May 2025 23:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1747366490; x=1747452890; bh=UJeEK1wvqh
	/5GI00xPvic9jYaOrLKQqzETwEkdBkLnc=; b=j1D7dmA8hg6lqoiNW2oOOC/yC0
	8vfeNbN3v49/wxRf4Wwq81RkjC35MYInZLAQtjf+k+skl9E4RvxZNmf38EPeSAzt
	FWl5Ovs/IwxdhGJGhoxbVoOXfI9KwEBLhaxtuzt35zGwwo0wo06JX4Ef8xS6rZbH
	yK1caIYECfdtnorluugIWKptzmjbQyy6u2xJeYdR9I9OBBije/QMrIXtlxJ/oGet
	GAxwMHfyMBg23HK71E1hgmL36YaaozU7yyxxSR4UGcqiqjVTvdtfmxqn8EyP2VpG
	TtfYrKrmyqKMM0eTJospu/OyUdU9JG+YCmNhRIFilcyXTVg5D4NL0oMYTw5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747366490; x=1747452890; bh=UJeEK1wvqh/5GI00xPvic9jYaOrLKQqzETw
	EkdBkLnc=; b=teBKw9rOOrrNhFbnP9rtfNg/ByOhuCYVpUlGaXaGEK+Y1JL5gAX
	0I4j9RF97b4FI4pNRQJEAyUKdlIQ7pu+zvsn/olvEqiV9zFEFkjm/lsSGgaizsY+
	/0wXG/uSsOAXhuI325NwGIgIinCQcIKTQJAVk3CBeq8F8eGx2uYOlYUgaPLEbRVi
	8yLvqdIykQZVJeLDF430QTh39nr2XMVl6omkjd2VKYrfUapDTM1umNNOs5d+6b/w
	PefG1hHZunUzyF/xL3AbcvwzBrVm2qfmY6ZJiC5YIoS/yfUaq9mvkkI1clwb9uHl
	qYZWOq17iajbzapCqM29PfVPXgewR69rS9w==
X-ME-Sender: <xms:WrImaFPjCDkW8qFoiOkrqPdE5HcaxWHC84wXKtudxUPa-lWg2qM_2Q>
    <xme:WrImaH94fxeJ_RWI2pEyzkxC0f9uS0a4WfrTk8rFV8u-o6WJHGP3tk-McKn_Jk07G
    ZgH8F7K3WQn6hrS7Bo>
X-ME-Received: <xmr:WrImaETA_LVU7T7rUf9pOEEj-zJ5ZHjCHbfLK6eJixVKoiJLQuWcHx7ZHgnR2dRQB8xQZo4pLi52Hg2Y7_h_N0Wyv8vuTk3MQdI2LVGSzMJZlhPvNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudduieekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddv
    necuhfhrohhmpefpihgtohhlrghsucfrihhtrhgvuceonhhitghosehflhhugihnihgtrd
    hnvghtqeenucggtffrrghtthgvrhhnpefgvedvhfefueejgefggfefhfelffeiieduvdeh
    ffduheduffekkefhgeffhfefveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehnihgtohesfhhluhignhhitgdrnhgvthdpnhgspghrtghpthht
    ohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnghgvlhhoghhiohgrtg
    gthhhinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthho
    pehmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopegurghnih
    gvlhdrlhgviigtrghnoheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidq
    mhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqphhmsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:WrImaBth7gzI70AYoD_kg_AR5VhkDXip424OG81z2UDZNzwUHR_UMA>
    <xmx:WrImaNde5dfj5-mWfX-_yFASh6pYBb16UdFOZfVZorGOpCu2WobIVQ>
    <xmx:WrImaN0n-WCyr0DfJxm5KDqewjGKZKZTiG0AM9GOJzj4ZvyzpnhS5w>
    <xmx:WrImaJ8YQPwW5XzdSchSKjmeAR3wq6Hn7SVs5uGJ3FbLT2PaFaSdjg>
    <xmx:WrImaOJJPZIzbdB1eB58nzYo6Mu6nqViGzcb2alOBQgxrfz7285dXEBN>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 May 2025 23:34:49 -0400 (EDT)
Received: from xanadu (xanadu.lan [192.168.1.120])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 5F1B811A5628;
	Thu, 15 May 2025 23:34:49 -0400 (EDT)
Date: Thu, 15 May 2025 23:34:49 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
    Matthias Brugger <matthias.bgg@gmail.com>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>
cc: linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dts: arm64: mediatek: thermal adjustments for MT8186,
 MT8188 and MT8195
In-Reply-To: <prp38558-r53s-756p-o6n8-795o7q87sssr@onlyvoer.pbz>
Message-ID: <590n1r09-s4pp-0nnq-1oo6-20sos6os63op@syhkavp.arg>
References: <prp38558-r53s-756p-o6n8-795o7q87sssr@onlyvoer.pbz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_203454_583113_022ED2C6 
X-CRM114-Status: GOOD (  11.96  )
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

Gentle ping.

On Fri, 18 Apr 2025, Nicolas Pitre wrote:

> Adjust temperature threshold values. Provide the "switch on" thermal 
> trip point to be used by the power allocator governor.
> 
> All numbers were provided by Mediatek.
> 
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index b91f88ffae..bfea811491 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -2229,22 +2229,23 @@ cpu-little0-thermal {
>  			polling-delay = <1000>;
>  			polling-delay-passive = <150>;
>  			thermal-sensors = <&lvts MT8186_LITTLE_CPU0>;
> +			sustainable-power = <1500>;
>  
>  			trips {
> -				cpu_little0_alert0: trip-alert0 {
> -					temperature = <85000>;
> +				cpu_little0_pa_switch_on: trip_pa_switch_on {
> +					temperature = <58000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
> -				cpu_little0_alert1: trip-alert1 {
> -					temperature = <95000>;
> +				cpu_little0_alert0: trip-alert {
> +					temperature = <82000>;
>  					hysteresis = <2000>;
> -					type = "hot";
> +					type = "passive";
>  				};
>  
>  				cpu_little0_crit: trip-crit {
> -					temperature = <100000>;
> +					temperature = <103000>;
>  					hysteresis = <0>;
>  					type = "critical";
>  				};
> @@ -2267,22 +2268,23 @@ cpu-little1-thermal {
>  			polling-delay = <1000>;
>  			polling-delay-passive = <150>;
>  			thermal-sensors = <&lvts MT8186_LITTLE_CPU1>;
> +			sustainable-power = <1500>;
>  
>  			trips {
> -				cpu_little1_alert0: trip-alert0 {
> -					temperature = <85000>;
> +				cpu_little1_pa_switch_on: trip_pa_switch_on {
> +					temperature = <58000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
> -				cpu_little1_alert1: trip-alert1 {
> -					temperature = <95000>;
> +				cpu_little1_alert0: trip-alert {
> +					temperature = <82000>;
>  					hysteresis = <2000>;
> -					type = "hot";
> +					type = "passive";
>  				};
>  
>  				cpu_little1_crit: trip-crit {
> -					temperature = <100000>;
> +					temperature = <103000>;
>  					hysteresis = <0>;
>  					type = "critical";
>  				};
> @@ -2305,22 +2307,23 @@ cpu-little2-thermal {
>  			polling-delay = <1000>;
>  			polling-delay-passive = <150>;
>  			thermal-sensors = <&lvts MT8186_LITTLE_CPU2>;
> +			sustainable-power = <1500>;
>  
>  			trips {
> -				cpu_little2_alert0: trip-alert0 {
> -					temperature = <85000>;
> +				cpu_little2_pa_switch_on: trip_pa_switch_on {
> +					temperature = <58000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
> -				cpu_little2_alert1: trip-alert1 {
> -					temperature = <95000>;
> +				cpu_little2_alert0: trip-alert {
> +					temperature = <82000>;
>  					hysteresis = <2000>;
> -					type = "hot";
> +					type = "passive";
>  				};
>  
>  				cpu_little2_crit: trip-crit {
> -					temperature = <100000>;
> +					temperature = <103000>;
>  					hysteresis = <0>;
>  					type = "critical";
>  				};
> @@ -2454,22 +2457,23 @@ cpu-big0-thermal {
>  			polling-delay = <1000>;
>  			polling-delay-passive = <100>;
>  			thermal-sensors = <&lvts MT8186_BIG_CPU0>;
> +			sustainable-power = <1500>;
>  
>  			trips {
> -				cpu_big0_alert0: trip-alert0 {
> -					temperature = <85000>;
> +				cpu_big0_pa_switch_on: trip_pa_switch_on {
> +					temperature = <58000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
> -				cpu_big0_alert1: trip-alert1 {
> -					temperature = <95000>;
> +				cpu_big0_alert0: trip-alert {
> +					temperature = <82000>;
>  					hysteresis = <2000>;
> -					type = "hot";
> +					type = "passive";
>  				};
>  
>  				cpu_big0_crit: trip-crit {
> -					temperature = <100000>;
> +					temperature = <103000>;
>  					hysteresis = <0>;
>  					type = "critical";
>  				};
> @@ -2488,22 +2492,23 @@ cpu-big1-thermal {
>  			polling-delay = <1000>;
>  			polling-delay-passive = <100>;
>  			thermal-sensors = <&lvts MT8186_BIG_CPU1>;
> +			sustainable-power = <1500>;
>  
>  			trips {
> -				cpu_big1_alert0: trip-alert0 {
> -					temperature = <85000>;
> +				cpu_big1_pa_switch_on: trip_pa_switch_on {
> +					temperature = <58000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
> -				cpu_big1_alert1: trip-alert1 {
> -					temperature = <95000>;
> +				cpu_big1_alert0: trip-alert {
> +					temperature = <82000>;
>  					hysteresis = <2000>;
> -					type = "hot";
> +					type = "passive";
>  				};
>  
>  				cpu_big1_crit: trip-crit {
> -					temperature = <100000>;
> +					temperature = <103000>;
>  					hysteresis = <0>;
>  					type = "critical";
>  				};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> index 69a8423d38..c2ac47c77c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -472,22 +472,23 @@ cpu-little0-thermal {
>  			polling-delay = <1000>;
>  			polling-delay-passive = <150>;
>  			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU0>;
> +			sustainable-power = <1500>;
>  
>  			trips {
> -				cpu_little0_alert0: trip-alert0 {
> -					temperature = <85000>;
> +				cpu_little0_pa_switch_on: trip-pa-switch_on {
> +					temperature = <68000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
> -				cpu_little0_alert1: trip-alert1 {
> -					temperature = <95000>;
> +				cpu_little0_alert0: trip-alert {
> +					temperature = <85000>;
>  					hysteresis = <2000>;
> -					type = "hot";
> +					type = "passive";
>  				};
>  
>  				cpu_little0_crit: trip-crit {
> -					temperature = <100000>;
> +					temperature = <115000>;
>  					hysteresis = <0>;
>  					type = "critical";
>  				};
> @@ -510,22 +511,23 @@ cpu-little1-thermal {
>  			polling-delay = <1000>;
>  			polling-delay-passive = <150>;
>  			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU1>;
> +			sustainable-power = <1500>;
>  
>  			trips {
> -				cpu_little1_alert0: trip-alert0 {
> -					temperature = <85000>;
> +				cpu_little1_pa_switch_on: trip-pa-switch_on {
> +					temperature = <68000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
> -				cpu_little1_alert1: trip-alert1 {
> -					temperature = <95000>;
> +				cpu_little1_alert0: trip-alert {
> +					temperature = <85000>;
>  					hysteresis = <2000>;
> -					type = "hot";
> +					type = "passive";
>  				};
>  
>  				cpu_little1_crit: trip-crit {
> -					temperature = <100000>;
> +					temperature = <115000>;
>  					hysteresis = <0>;
>  					type = "critical";
>  				};
> @@ -548,22 +550,23 @@ cpu-little2-thermal {
>  			polling-delay = <1000>;
>  			polling-delay-passive = <150>;
>  			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU2>;
> +			sustainable-power = <1500>;
>  
>  			trips {
> -				cpu_little2_alert0: trip-alert0 {
> -					temperature = <85000>;
> +				cpu_little2_pa_switch_on: trip-pa-switch_on {
> +					temperature = <68000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
> -				cpu_little2_alert1: trip-alert1 {
> -					temperature = <95000>;
> +				cpu_little2_alert0: trip-alert {
> +					temperature = <85000>;
>  					hysteresis = <2000>;
> -					type = "hot";
> +					type = "passive";
>  				};
>  
>  				cpu_little2_crit: trip-crit {
> -					temperature = <100000>;
> +					temperature = <115000>;
>  					hysteresis = <0>;
>  					type = "critical";
>  				};
> @@ -586,22 +589,23 @@ cpu-little3-thermal {
>  			polling-delay = <1000>;
>  			polling-delay-passive = <150>;
>  			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU3>;
> +			sustainable-power = <1500>;
>  
>  			trips {
> -				cpu_little3_alert0: trip-alert0 {
> -					temperature = <85000>;
> +				cpu_little3_pa_switch_on: trip-pa-switch_on {
> +					temperature = <68000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
> -				cpu_little3_alert1: trip-alert1 {
> -					temperature = <95000>;
> +				cpu_little3_alert0: trip-alert {
> +					temperature = <85000>;
>  					hysteresis = <2000>;
> -					type = "hot";
> +					type = "passive";
>  				};
>  
>  				cpu_little3_crit: trip-crit {
> -					temperature = <100000>;
> +					temperature = <115000>;
>  					hysteresis = <0>;
>  					type = "critical";
>  				};
> @@ -624,22 +628,23 @@ cpu-big0-thermal {
>  			polling-delay = <1000>;
>  			polling-delay-passive = <100>;
>  			thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU0>;
> +			sustainable-power = <1500>;
>  
>  			trips {
> -				cpu_big0_alert0: trip-alert0 {
> -					temperature = <85000>;
> +				cpu_big0_pa_switch_on: trip-pa-switch_on {
> +					temperature = <68000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
> -				cpu_big0_alert1: trip-alert1 {
> -					temperature = <95000>;
> +				cpu_big0_alert0: trip-alert {
> +					temperature = <85000>;
>  					hysteresis = <2000>;
> -					type = "hot";
> +					type = "passive";
>  				};
>  
>  				cpu_big0_crit: trip-crit {
> -					temperature = <100000>;
> +					temperature = <115000>;
>  					hysteresis = <0>;
>  					type = "critical";
>  				};
> @@ -658,22 +663,23 @@ cpu-big1-thermal {
>  			polling-delay = <1000>;
>  			polling-delay-passive = <100>;
>  			thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU1>;
> +			sustainable-power = <1500>;
>  
>  			trips {
> -				cpu_big1_alert0: trip-alert0 {
> -					temperature = <85000>;
> +				cpu_big1_pa_switch_on: trip-pa-switch_on {
> +					temperature = <68000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
> -				cpu_big1_alert1: trip-alert1 {
> -					temperature = <95000>;
> +				cpu_big1_alert0: trip-alert {
> +					temperature = <85000>;
>  					hysteresis = <2000>;
> -					type = "hot";
> +					type = "passive";
>  				};
>  
>  				cpu_big1_crit: trip-crit {
> -					temperature = <100000>;
> +					temperature = <115000>;
>  					hysteresis = <0>;
>  					type = "critical";
>  				};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 4f2dc0a755..06631760c2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -3729,16 +3729,23 @@ cpu0-thermal {
>  			polling-delay = <1000>;
>  			polling-delay-passive = <250>;
>  			thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU0>;
> +			sustainable-power = <1500>;
>  
>  			trips {
> +				cpu0_pa_switch_on: trip_pa_switch_on {
> +						temperature = <68000>;
> +						hysteresis = <2000>;
> +						type = "passive";
> +				};
> +
>  				cpu0_alert: trip-alert {
> -					temperature = <85000>;
> +					temperature = <90000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
>  				cpu0_crit: trip-crit {
> -					temperature = <100000>;
> +					temperature = <115000>;
>  					hysteresis = <2000>;
>  					type = "critical";
>  				};
> @@ -3759,16 +3766,23 @@ cpu1-thermal {
>  			polling-delay = <1000>;
>  			polling-delay-passive = <250>;
>  			thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU1>;
> +			sustainable-power = <1500>;
>  
>  			trips {
> +				cpu1_pa_switch_on: trip_pa_switch_on {
> +						temperature = <68000>;
> +						hysteresis = <2000>;
> +						type = "passive";
> +				};
> +
>  				cpu1_alert: trip-alert {
> -					temperature = <85000>;
> +					temperature = <90000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
>  				cpu1_crit: trip-crit {
> -					temperature = <100000>;
> +					temperature = <115000>;
>  					hysteresis = <2000>;
>  					type = "critical";
>  				};
> @@ -3789,16 +3803,23 @@ cpu2-thermal {
>  			polling-delay = <1000>;
>  			polling-delay-passive = <250>;
>  			thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU2>;
> +			sustainable-power = <1500>;
>  
>  			trips {
> +				cpu2_pa_switch_on: trip_pa_switch_on {
> +						temperature = <68000>;
> +						hysteresis = <2000>;
> +						type = "passive";
> +				};
> +
>  				cpu2_alert: trip-alert {
> -					temperature = <85000>;
> +					temperature = <90000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
>  				cpu2_crit: trip-crit {
> -					temperature = <100000>;
> +					temperature = <115000>;
>  					hysteresis = <2000>;
>  					type = "critical";
>  				};
> @@ -3819,16 +3840,23 @@ cpu3-thermal {
>  			polling-delay = <1000>;
>  			polling-delay-passive = <250>;
>  			thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU3>;
> +			sustainable-power = <1500>;
>  
>  			trips {
> +				cpu3_pa_switch_on: trip_pa_switch_on {
> +						temperature = <68000>;
> +						hysteresis = <2000>;
> +						type = "passive";
> +				};
> +
>  				cpu3_alert: trip-alert {
> -					temperature = <85000>;
> +					temperature = <90000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
>  				cpu3_crit: trip-crit {
> -					temperature = <100000>;
> +					temperature = <115000>;
>  					hysteresis = <2000>;
>  					type = "critical";
>  				};
> @@ -3849,16 +3877,23 @@ cpu4-thermal {
>  			polling-delay = <1000>;
>  			polling-delay-passive = <250>;
>  			thermal-sensors = <&lvts_mcu MT8195_MCU_BIG_CPU0>;
> +			sustainable-power = <1500>;
>  
>  			trips {
> +				cpu4_pa_switch_on: trip_pa_switch_on {
> +						temperature = <68000>;
> +						hysteresis = <2000>;
> +						type = "passive";
> +				};
> +
>  				cpu4_alert: trip-alert {
> -					temperature = <85000>;
> +					temperature = <90000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
>  				cpu4_crit: trip-crit {
> -					temperature = <100000>;
> +					temperature = <115000>;
>  					hysteresis = <2000>;
>  					type = "critical";
>  				};
> @@ -3879,16 +3914,23 @@ cpu5-thermal {
>  			polling-delay = <1000>;
>  			polling-delay-passive = <250>;
>  			thermal-sensors = <&lvts_mcu MT8195_MCU_BIG_CPU1>;
> +			sustainable-power = <1500>;
>  
>  			trips {
> +				cpu5_pa_switch_on: trip_pa_switch_on {
> +						temperature = <68000>;
> +						hysteresis = <2000>;
> +						type = "passive";
> +				};
> +
>  				cpu5_alert: trip-alert {
> -					temperature = <85000>;
> +					temperature = <90000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
>  				cpu5_crit: trip-crit {
> -					temperature = <100000>;
> +					temperature = <115000>;
>  					hysteresis = <2000>;
>  					type = "critical";
>  				};
> @@ -3909,16 +3951,23 @@ cpu6-thermal {
>  			polling-delay = <1000>;
>  			polling-delay-passive = <250>;
>  			thermal-sensors = <&lvts_mcu MT8195_MCU_BIG_CPU2>;
> +			sustainable-power = <1500>;
>  
>  			trips {
> +				cpu6_pa_switch_on: trip_pa_switch_on {
> +						temperature = <68000>;
> +						hysteresis = <2000>;
> +						type = "passive";
> +				};
> +
>  				cpu6_alert: trip-alert {
> -					temperature = <85000>;
> +					temperature = <90000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
>  				cpu6_crit: trip-crit {
> -					temperature = <100000>;
> +					temperature = <115000>;
>  					hysteresis = <2000>;
>  					type = "critical";
>  				};
> @@ -3939,16 +3988,23 @@ cpu7-thermal {
>  			polling-delay = <1000>;
>  			polling-delay-passive = <250>;
>  			thermal-sensors = <&lvts_mcu MT8195_MCU_BIG_CPU3>;
> +			sustainable-power = <1500>;
>  
>  			trips {
> +				cpu7_pa_switch_on: trip_pa_switch_on {
> +						temperature = <68000>;
> +						hysteresis = <2000>;
> +						type = "passive";
> +				};
> +
>  				cpu7_alert: trip-alert {
> -					temperature = <85000>;
> +					temperature = <90000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
>  				cpu7_crit: trip-crit {
> -					temperature = <100000>;
> +					temperature = <115000>;
>  					hysteresis = <2000>;
>  					type = "critical";
>  				};
> 

