Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90A9CF9C6B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 08:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2WxSvbcWzJgLOqN2eXg2hlqPp9V0yj7cO3R5FjeUP8w=; b=AxdKuwl1ikVgjQDIJSdyA/6PxD
	56DgyoxN/a1XS+veWSTsRpr0xQdC+8bjKDVd4GTxlHDm2z30XrR2vfrHLn8IKZ/qIE6EsTeHAvR59
	pxq2bgSTIG3moMmdamTsAsgAl3azlJEX0vjAdrFns6hrfb4bvy6r0rnNHlxt9TzYWYHIIF3uQ/G2q
	cXIaq31VzS1Yq5D+rfspERhFwyXGM9hlCQq4tqzFuQDhL4rPOqbyVI2YjlHEFw3+vB19nMDKBTj95
	PnMXcqefATQzxcyAJl2NfJFEsXPHTFN4k3a8o5qkd7P6AvjBQe4T3D/mKjsHdXcdJzjiJ9zudSVQS
	krQRYyXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st1Cs-00000001ehN-2wpQ;
	Tue, 24 Sep 2024 08:47:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st1BW-00000001eJO-0Uns;
	Tue, 24 Sep 2024 08:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727167571;
	bh=nGDzu/0Mn1eGGrYd8jEPlVx2PsirGUvhYIZqwNI7mtQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JvmBVifEXHe67RfNDQ1bcVV3X4iffDdzY05u9F0Nqzx2nCf5GUhMMwKWDKSt5PGL3
	 83yxSam5NrEmI880ihsFhfyaO4PeYw9+D1I9ly3e/QW80JCGjoJ6O7v6U8PrJ6/M0L
	 t2Y0bMe8tOG7BKJkgwHBodHdom511MkZBwP7j++jqH+8dL2Y742suaeKGkzaSDnJDl
	 j8ge0NB+219O42x/pzpM2lvssF8HUFaWJExfTdR+quY5QBzexxR3plJ+kb7lfXtgl9
	 wpfoaoVklTteV1VdChgiWfRcNo2D4lSJJl81ZdU3mzBSd2qmca8q7z2ZYWtOT3fort
	 TyHcVFC5cShpA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BBCAE17E1068;
	Tue, 24 Sep 2024 10:46:10 +0200 (CEST)
Message-ID: <69fcaf74-ddf5-4bd8-8f0b-3d1a1793c0f7@collabora.com>
Date: Tue, 24 Sep 2024 10:46:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8186: add FHCTL node
To: Max Weng <max_weng@compal.corp-partner.google.com>,
 linux-kernel@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240923144728.870285-1-max_weng@compal.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240923144728.870285-1-max_weng@compal.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_014614_448571_54790603 
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

Il 23/09/24 16:47, Max Weng ha scritto:
> From: max_weng <max_weng@compal.corp-partner.google.com>
> 
> add FHCTL device node for Frequency Hopping and Spread Spectrum clock function.
> 
> Change-Id: I7f9f2991978df7d5d3a6a8bc78f6f443f2f0460d

Please remove the useless Change-Id tag, this means nothing upstream, after which,
on V3:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Signed-off-by: Max Weng <max_weng@compal.corp-partner.google.com>
> ---
>   Change frome v1 to v2
>   * Modify the commit description
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


