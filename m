Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9B3C54E60
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 11:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Aj4TmgV90GeZVaq/sl6IwBng1YrBs09X9cLTlGML2w=; b=0Pap+U3fw7PoJhhz2LPES/FM9U
	kXk9KKMJd4EYlxZo2IzuLs0R4apapsv5q5jWF+R/fVZqhrrJ6xZh8Cn5adPG2jRgYbwxpMVAEwgFW
	HoKAcXvcvdOAjz862cymmSoTkL9W+iZzccKyIUM0FIUvGLN3+KYyJQi5RJNkBtmC00w+OVeh2J94X
	MM8CjCMcshvzi6voqLKI0cVbFt8rJ2W/BJ3qY9tGPl4/JZTb0O+40ytHBZiutlB10l05V/VRU3Cy/
	OAY+63pR8zWtrkx3qX3wSaH/YrzuAnEeK518C0AMUm47xTOG+ud3ICzkMeSaKYsTLN2VZ4o55SGp+
	Uh34aQsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmXuZ-0000000CW8V-3c3R;
	Tue, 19 Mar 2024 11:45:43 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmXuU-0000000CW6d-1Gos
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Mar 2024 11:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710848736;
	bh=SIo2d1ljVYB5EMmdSQcrmw9C1nugoNVXDIRv6Tk/p3s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qk9MpCnKMMB7IwU4BQ0fW+qn96/bc1NLexm35yovBUEN3LyEZEnvErwVu/uM5syqQ
	 cHwBiHPvrWYfDyqqHg/JW6cX3UJLcDa34FiiFbcbsNHZGw5MlkZpd/w7zatRDeVm6x
	 nZWQBzljQ3BSn6x1aMLWxWf1GkorwYyRAsJ45CADoNncaobz4rKabiWOQQpja4tXRE
	 9z+B85KTssxywHVTXaWK+tNXDFjJXycjM32U4/va4jny6sckcmA+jy69mKw4vAHj8H
	 iCbXM3sCD+/kdA/kvJVP0VsotfkylH9cSFRSXmVWJpKvwaW78G16oCgDrw7j++cnpp
	 d7qtmXHCbGpsA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0E785378203E;
	Tue, 19 Mar 2024 11:45:36 +0000 (UTC)
Message-ID: <9d79cd4b-b26c-46ea-9173-2df88f4abaa2@collabora.com>
Date: Tue, 19 Mar 2024 12:45:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/13] dt-bindings: thermal: mediatek: Add LVTS thermal
 controller definition for MT8186
Content-Language: en-US
To: Nicolas Pitre <nico@fluxnic.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>
References: <20240318212428.3843952-1-nico@fluxnic.net>
 <20240318212428.3843952-6-nico@fluxnic.net>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240318212428.3843952-6-nico@fluxnic.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_044539_090460_F4144E6C 
X-CRM114-Status: GOOD (  12.81  )
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

Il 18/03/24 22:22, Nicolas Pitre ha scritto:
> From: Nicolas Pitre <npitre@baylibre.com>
> 
> Add LVTS thermal controller definition for MT8186.
> 
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> ---
>   .../bindings/thermal/mediatek,lvts-thermal.yaml        |  2 ++
>   include/dt-bindings/thermal/mediatek,lvts-thermal.h    | 10 ++++++++++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> index e6665af52e..4173bae530 100644
> --- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> @@ -19,6 +19,7 @@ properties:
>     compatible:
>       enum:
>         - mediatek,mt7988-lvts-ap
> +      - mediatek,mt8186-lvts
>         - mediatek,mt8192-lvts-ap
>         - mediatek,mt8192-lvts-mcu
>         - mediatek,mt8195-lvts-ap
> @@ -75,6 +76,7 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - mediatek,mt8186-lvts
>                 - mediatek,mt8195-lvts-ap
>                 - mediatek,mt8195-lvts-mcu
>       then:
> diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> index 997e2f5512..3197ca6087 100644
> --- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> +++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> @@ -16,6 +16,16 @@
>   #define MT7988_ETHWARP_0	6
>   #define MT7988_ETHWARP_1	7
>   
> +#define MT8186_TS1_0		0

TSx_y makes no sense: the LVTS sensors are SoC internal and will never change
what they actually measure.

This comment was repeated on literally all of the definitions that you can
currently see in this file - and I'm repeating that again: please follow what
was already done for all SoCs in this binding and use a meaningful name.

#define SOC_{LVTS_INSTANCE(ap/mcu)}_SENSINGPOINT	0
.....							n+1

Regards,
Angelo

> +#define MT8186_TS1_1		1
> +#define MT8186_TS1_2		2
> +#define MT8186_TS1_3		3
> +#define MT8186_TS2_0		4
> +#define MT8186_TS2_1		5
> +#define MT8186_TS3_0		6
> +#define MT8186_TS3_1		7
> +#define MT8186_TS3_2		8
> +
>   #define MT8195_MCU_BIG_CPU0     0
>   #define MT8195_MCU_BIG_CPU1     1
>   #define MT8195_MCU_BIG_CPU2     2


