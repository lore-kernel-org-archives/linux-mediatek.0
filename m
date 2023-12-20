Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE56C46CD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 11:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0M/HDLy+AEKqsUMR4qrHOy1rCDL2hcAdZ7mFhsjS28=; b=40HhgOON6eavt1GmP5NDmERRrs
	6Ss+L+EUTwwIsAwtoRYRH1XMbso0KXliXbq6zdh3kJFuN4Sn8SexUu1ZwON7yGoZAzjXicRugrXUh
	b4VeqP8jPMzMwi0i5mVtu/Y07pLvemuxvNfJC+PLfELc2xn4pFSKKoc7tY3QyAITCv4CqPc0f4jov
	64bgm2IKwv1wahTVcc5zm0YCjy348jUqeHmsVkXwaJxZ4hUGryeA6OuGVK8/U9J2+osUIwqGHdACZ
	oL0otKyIKjwm0XOeT6ZEph5Dd+KWrpQRG+yfrQKwTyRVl4i27CG6d12Z6snsOf/RV53NHdJR/WQIi
	6RvQFLQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFuLY-00H0tH-09;
	Wed, 20 Dec 2023 11:02:40 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFuLU-00H0rC-1t;
	Wed, 20 Dec 2023 11:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703070155;
	bh=EGB6IunSYKe5necECFgzR0TUvJSKdb7pFA99X6tZ+O8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ODu4dDxBiEpJ7o3medRtHagTfn2WjgaI9rYdqVP0Pc0DNtcC0d0UMlVxHWQaHYv4F
	 quBhj4n9zoANOkcCBv3EaDZ2G5sEVqhr6jdKy1W0ztHSq7aJdd92N6kjzs5LWP9kjv
	 F/Dioy2NMq9MfoipYpGFLyZLSZv+amtX9xDtQz3cr0rKW6Q39/ez5Ty5DdP9cYkXhM
	 gBzs0C442XCm+RDiI7KK4t2Voph+1M5Bc5N0BhV/hif/W/aE7PNCqNbR8dTaks+1yd
	 wdYR1FeostmeZd1D6KRDQmpX5qRl2bugim4nJbpdb0UmfxOoeUFL5Y+Gc4xEZZn/YQ
	 EzFRrwuzLLaXQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A55A43781FC9;
	Wed, 20 Dec 2023 11:02:34 +0000 (UTC)
Message-ID: <81c4789d-e7b3-46c4-876c-954e8db9a7e2@collabora.com>
Date: Wed, 20 Dec 2023 12:02:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: Add node for chip info driver
Content-Language: en-US
To: William-tw Lin <william-tw.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231220103901.22180-1-william-tw.lin@mediatek.com>
 <20231220103901.22180-2-william-tw.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231220103901.22180-2-william-tw.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_030236_752127_A3A5C913 
X-CRM114-Status: GOOD (  15.17  )
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

Il 20/12/23 11:38, William-tw Lin ha scritto:
> Add dts node for socinfo retrieval for the following projects:
> MT8173, MT8183, MT8186, MT8192, MT8195
> 

arm64: dts: mediatek: Add socinfo efuses to MT8173/83/96/92/95 SoCs

Add efuse nodes for socinfo retrieval for MT8173, MT8183, MT8186,
MT8192 and MT8195.



...because you're not adding a chipinfo node, but efuse nodes :-)


> Signed-off-by: William-tw Lin <william-tw.lin@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 9 +++++++++
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 9 +++++++++
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 4 ++++
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 8 ++++++++
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 3 +++
>   5 files changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index c47d7d900f28..06916e60679a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -590,6 +590,15 @@
>   			reg = <0 0x10206000 0 0x1000>;
>   			#address-cells = <1>;
>   			#size-cells = <1>;
> +
> +			socinfo_data1: socinfo-data1@40 {

Also, you don't need the phandles as those nodes will never be modified from
board specific devicetree, nor assigned to any devicetree node.

This means that you can go with just

			socinfo-data1@40 {
				reg ...
			}

same for data2 and for all SoCs.

Apart from that, looks good to me.

Cheers,
Angelo

