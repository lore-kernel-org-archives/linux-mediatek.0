Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0846FC64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 08:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmydDNQvVBfk0YL7jC5pqSSqcr/CrJs+rYgJ2D7eKkc=; b=fImLH/6o5tRPsUjNn3M16wg2f0
	bhse9t1e7FWQErX9e8Oxj3fMg8bKauYTw/S0D/ygrFx981QIMkXAxAWgGWy77d54pHWmyp486Q+Y2
	bJZpfqieH4Cf6VYJ9dv+k8QuN4SApITJofZ2PRp85UPgEAXmHh1brQnS4hS+8nEntMuKlPTgoYgaV
	Lz2e0s+cpq7bzWOP+IgafoAOGia51vDsHNqQbIToPbCGQl54yUGgY0aFyehyWQicy3TkTvGV0H3/z
	o3hreCfX8OCGDmcRju6lUo8/4nRIew3KuyHkHvv5G/n+A+7mUoxxG+r+15h1zpBNv2KG5ugU3M/1U
	sfAtHZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZIn-008wMs-Vb; Mon, 27 Feb 2023 08:56:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZHt-008vxR-Jw; Mon, 27 Feb 2023 08:55:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0A1E56602E18;
	Mon, 27 Feb 2023 08:55:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677488112;
	bh=H4Y37IHedSMtTKAGyACOhAzOH9b9Vk6MTU1pZBUEF6s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KZzGuC3JQNOIrfctRYcd3uylsYeIHE+9sP7Cs8OJWxHPZilk/zqyqWm6Lg5YyZSGG
	 7ma4+7A72UxQsSJ2eclVJubf3PyK7nGnSvOax6a/evzWv6/hBOXxuEQIfIULeKG6Yq
	 Ph0CoxiwaLdq1EfwU4K17yxpcDG/HlZMhJrTGTcoy8tn2VzsSk2yyyA7hWpVHoStgZ
	 mvTUQtoUaqb46pei6GuSa1W+d/GXwB/a6/9nx7a/KxtxfMWepznxBDYmsFtYEspR/K
	 7dfLykraZMdopL4yROiIwk0Jg5kmo4w5TYb+pmmbydJjJV1z2ON02sUW4FMPgqrPTa
	 /Zwafm1ibu1Ug==
Message-ID: <50c54ebf-ca12-6761-8f81-60d1c6a3bd4f@collabora.com>
Date: Mon, 27 Feb 2023 09:55:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] ASoC: mt6358: Remove undefined HPx Mux enumeration
 values
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230224-asoc-mt6358-quick-fixes-v1-0-747d9186be4b@kernel.org>
 <20230224-asoc-mt6358-quick-fixes-v1-3-747d9186be4b@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230224-asoc-mt6358-quick-fixes-v1-3-747d9186be4b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_005513_838215_D177DDDC 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

Il 26/02/23 13:47, Mark Brown ha scritto:
> The HPx Mux enumerations define values 5, 6 and 7 but describe them as
> "undefined" and map them to the value 0 on writing. Given the descriptions
> and behaviour it seems that these values are invalid and should not be
> present in the register, the current behaviour is detected as problematic
> by mixer-test:
> 
> # # HPL Mux.0 expected 5 but read 0, is_volatile 0
> # # HPL Mux.0 expected 6 but read 0, is_volatile 0
> # # HPL Mux.0 expected 7 but read 0, is_volatile 0
> 
> Remove the values from the enumeration, this will prevent userspace setting
> them.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



