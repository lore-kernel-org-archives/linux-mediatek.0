Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E447CF9C5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 08:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/0GDEnxmqZBId4JK/HEW874vFr7HBwNsDpGANkxgr0=; b=B5/2Z8R4XsCHnmNiCAbTbKJIip
	4T7gcrc/sBfeeX/VuB5BHToP3foWKV8Ndc0/5kS/+/RxGiCc83LhfNT/YrMslB9llb67gHv9I1nqQ
	v8JY97yUD4u8evsk75TAidETwYnrn4aKDgfxrqO/ivfjMqIkgPvDeEqGMj1Bh+ZOBcM9J3rR0xmgI
	y8DJgvn7MC3SGpVsFkbeMJNUAgGrQLgBADNwivwpjJ0HU1jPqJYeg7n0nsW2+kVoBbs0baZlV2c8K
	d3lC484Qy3hSc0UVAu0V5zscfcMtPc4/jHmXfA0MeoNaGYwGJc+ISIHke2bNTOLIAHDnh43ATRpTP
	XT6hRFnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sseZ2-0000000GgfA-0t6R;
	Mon, 23 Sep 2024 08:37:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sseXs-0000000GgTK-3qP2;
	Mon, 23 Sep 2024 08:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727080545;
	bh=e4cC60E4kblxFg6svxGrB/DLOt/LdtfLXEBt+zfPq6o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d7ao3V7mR+5JAWYxPQVcVv2U5EBc7eBEh/CHW5gAfTscBY5DkJd2LtNLU7krxGtwf
	 Ar+5BgjAc05fixS48pzsFiL0l4PSFVeji3z/8/b3z5NgfveeGEiaAcHnZ1cQZB36kV
	 PevWGSG/be1uaMS3S6rIj1+H3bY14+D8GIl0co3yIO5mTU68e7fyF/fBnVLfJwgBsD
	 bmcF/pACl6dNYEhZE9SLVb+lJWe76pgIzlGxStouVxWOtZDM348tG0S1/EO6d7lyg7
	 Q+QpITPTTwbv5ugMx18Clob3e9GkyjCl0GHNcDusdVOORFk/EnRohAuTR+/GwZ49LT
	 KyEaoR2xMTRxw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 338A817E105F;
	Mon, 23 Sep 2024 10:35:45 +0200 (CEST)
Message-ID: <b05d0543-b4f4-463d-a56a-28f7fa99a3f0@collabora.com>
Date: Mon, 23 Sep 2024 10:35:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: mediatek: mt8186: add FHCTL node
To: Max Weng <max_weng@compal.corp-partner.google.com>,
 linux-kernel@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240923081340.860715-1-max_weng@compal.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240923081340.860715-1-max_weng@compal.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_013549_164888_587773CC 
X-CRM114-Status: GOOD (  11.87  )
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

Il 23/09/24 10:13, Max Weng ha scritto:
> From: max_weng <max_weng@compal.corp-partner.google.com>
> 
> add fhctl device node.

Please clarify the commit description, like so:

Add FHCTL device node for Frequency Hopping and Spread Spectrum
clocking function.

After which,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


> 
> Signed-off-by: max_weng <max_weng@compal.corp-partner.google.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index 148c332018b0..d3c3c2a40adc 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -29,6 +29,13 @@ aliases {
>   		rdma1 = &rdma1;
>   	};
>   
> +	fhctl: fhctl@1000ce00 {
> +		compatible = "mediatek,mt8186-fhctl";
> +		clocks = <&apmixedsys CLK_APMIXED_TVDPLL>;
> +		reg = <0 0x1000ce00 0 0x200>;
> +		status = "disabled";
> +	};
> +
>   	cci: cci {
>   		compatible = "mediatek,mt8186-cci";
>   		clocks = <&mcusys CLK_MCU_ARMPLL_BUS_SEL>,


