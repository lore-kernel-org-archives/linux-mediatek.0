Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB55C64ED8
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 09:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mM3qE7iman/aZHkTz4yXyIgmGQ6KpqRc5s3bpA06B0=; b=HB3y8w4J9YEMY+ou0bO2Gb/g5y
	KyXYrJK8OA8rQgpNLywsl7JgZbqm7qTR3FT2NFrRneJMB9sVfaW+jhRftoy76YYeufeOGUCJz8QRJ
	NK0sjqQUUMZdVZ6vmdN66zp3MsrhA6ODn1VhpEao60pcKVQ9Cw8Gs51N8ljvKhKumNUnKCYAQ22NV
	ujWfKU3lJpU0pcPgGw+qR2Xyno1FcIgcMsG4W9boARxOrG4dOwgb9dzxTxwWz/hGX6a9jyK3/QLh+
	jf9N9FKyZk6NBIOFmNcAfcN6GP+XGQYYEAl1E7G9QRPr6osLSh8m6Bw57rxDE+MQwEJJ0xFoAf4K7
	etJL0hYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZsw-0092uO-UF; Mon, 27 Feb 2023 09:33:31 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZsl-0092ry-Nj; Mon, 27 Feb 2023 09:33:21 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B652F6602216;
	Mon, 27 Feb 2023 09:33:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677490398;
	bh=Mn5+1GgbIcs3gF0vqo4gwK7PU4+vkjmffmOubBKLC94=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bT4q2jbHljX0TDVeC31IiMe8mnWd0j6aWGmcXxSQ7XZGogkNc8jg6h0KZ4GzGi4a/
	 BbAm73kSZAjjQ23bkJpYY/JvtL9I0dw5LLGjAC7RsddM+YXP2fzCgqKM4WC+J00jFb
	 iwGejyiK4C256l0YArmFdm1lmzn8iLuPF57tIZZT4Pi7F1LpAEJStO4vVBDfIDo+nD
	 V7sBkf2Ro5TAgkY4UjA8izMaITw8EWfpmTzY1PQ2F28WexKstQops2MD2TZPHq5GVK
	 tnF04Ute0eLEBNN8JH4IcEOdE2LhtWJK+xXPzCaUmLYqKW117WomsAYKsgA3zXIf0x
	 K9KH0w8KtzQGA==
Message-ID: <45a8757b-68b0-a79f-7ea3-426825493140@collabora.com>
Date: Mon, 27 Feb 2023 10:33:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] soc: mediatek: scpsys: Add support for MT6735
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230225101629.264206-1-y.oudjana@protonmail.com>
 <20230225101629.264206-4-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230225101629.264206-4-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_013319_934573_CA542F3D 
X-CRM114-Status: GOOD (  12.66  )
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

Il 25/02/23 11:16, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add support for SCPSYS power domains of MT6735. All non-CPU power domains
> are added except for MD2 (C2K modem), which is left out due to issues
> with powering it on.
> 

This is a legacy driver and I'm convinced that we should do something to
actually *drop it forever*.

Please add support for power domains in mtk-pm-domains.c instead: if you need
a nice example about differences between the two, look at MT8173's implementation,
as that is present in both scpsys and mtk-pm-domains.

Summarizing, your MT6735 support will be about:
  - Adding soc/mediatek/mt6735-pm-domains.h
  - Adding support in mtk-pm-domains:

static const struct of_device_id scpsys_of_match[] = {
	........
	{
		.compatible = "mediatek,mt6735-power-controller",
		.data = &mt6735_scpsys_data,
	},
	.........
};

Cheers,
Angelo

> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---


