Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E19C27C4F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 13:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QP3cE/W6cm2clIXJA+ouII3hBPDh5XuriKKorDkcLrM=; b=2x/BktpQN9zMc8xkOBVad5JeUY
	7lFc3QH/jsnjOOoCnNGa4OYiwzKoIp+3nHC6JLRhdYDsrQupTC6n4ZgC+T9YtzGqYHBY4bhi3/XGX
	twt+tt/Cfb2F/vOzbScHKCpK3veIFPUT7SPp0UI8U+r0st1N51DJWlhc4uTj8f8hw91bvjUNqODhr
	fsWYof6toWRgo35HDRT/ewg1IIOX4eSbnM/cLD0B5pGBkjl8QIYnU1rTDPr7XMV2RJcw0QQO0XcQ8
	09GxrjGsiWLoXD0lprQlaOLXLJEQvvzxTTie9PHbAbiHlkF/rawpBa798urrgPkMEi9FEkaeogXyl
	mpSEJGXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHkxf-0000000Gr0M-3x5f;
	Thu, 13 Jun 2024 13:57:55 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHkxb-0000000GqzC-3Md2;
	Thu, 13 Jun 2024 13:57:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718287069;
	bh=B9iVUMQ7iBXze38SIjww4yo0dWA0ImTuZmCEx2SUH78=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=clhcumvEQ0/iPFIHMumilHTeupRda3bSPQoO+EK+KvqQFqFcvN56KlAR+nRGIn9gI
	 2gIHi1sp/et2YyoI0MqHtdDj5xP9lVvrruVhoZwzmMRvyutGXUYe/b4sZdw1NL5gmw
	 oY/v7KA9DFu2I7vftH4E2+BUsvtz8pXrmbteLat8Aa/qKGOBl2UFjbTcRycyJaK1RS
	 V7ZAkRkiEUl/tw68f641kOAvCXE9u3XHjcL6FMIIT1h9pWs2pEGT+PwmZSUUl56VwF
	 6wqPs/w3WpjxQEPxaXMGU6r5G1qp1+OrR3xE/8dN2LSj0MI6J3amlSVO/zmeGAVnsX
	 GGCAF9wSWRVYQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EE6B337820CD;
	Thu, 13 Jun 2024 13:57:48 +0000 (UTC)
Message-ID: <25c8432c-7e2c-4d32-bf5a-225aeaaa809a@collabora.com>
Date: Thu, 13 Jun 2024 15:57:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: ARM: airoha: add entry to cover Airoha SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
References: <20240613133840.6949-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240613133840.6949-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_065752_000662_15CE6C31 
X-CRM114-Status: GOOD (  12.36  )
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

Il 13/06/24 15:38, Krzysztof Kozlowski ha scritto:
> Airoha SoC is not covered by any maintainer entry so relevant patches
> can be missed.  It seems Mediatek SoC maintainers were covering some
> parts of Airoha and Airoha itself is subsidiary of Mediatek, so assign
> the Airoha maintenance to Matthias and AngeloGioacchino.
> 
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


> ---
>   MAINTAINERS | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fb32a2fe3a79..e7fd595b8f5e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1924,6 +1924,15 @@ F:	include/dt-bindings/reset/actions,*
>   F:	include/linux/soc/actions/
>   N:	owl
>   
> +ARM/AIROHA SOC SUPPORT
> +M:	Matthias Brugger <matthias.bgg@gmail.com>
> +M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
> +S:	Odd Fixes
> +F:	arch/arm/boot/dts/airoha/
> +F:	arch/arm64/boot/dts/airoha/
> +
>   ARM/Allwinner SoC Clock Support
>   M:	Emilio López <emilio@elopez.com.ar>
>   S:	Maintained


