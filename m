Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892E8C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 09:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dcFlvlufGOA8tk+dETtpgVigIfpCB/xTqnbSS3WlgGc=; b=SEexs2f6vgk47zTwenarHv8ktC
	6s+g6bLa2mykDAX5HoY0FscGTYDvOGN4YI/ZtTmFjbdiEFgzRSrqyZ8w9NM7HkCspiYT+N1OQBoQi
	3Cs8BgRExJkaYSpVEHzjsN1Uo+QefnthyMc9WL9DFlmD1635yrAw9nbK7JbaCeZgyOkA68Lp4mG5S
	3ai4htmSiB7DErsfklgTkePSCFB4iESVbY4wPYbc3pxU8QC8MwElqGHae6jzpZq6NK3v0FPtvo9Ez
	WmW4bijiJNglb3VYAKetLDztMDrvk0q/NND0v2TpC90WGZpdCzytxQ6Ai9ERYFuB/tjWwpgLi29SL
	gmGIwl7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKb4b-007SeE-1g;
	Tue, 02 Jan 2024 09:28:33 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKb4Y-007SdW-33;
	Tue, 02 Jan 2024 09:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704187707;
	bh=gn5FpuH9CD4cUJLZXPICGs3i6tDEmWT7HtO3PfLeCgc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nPgXO884a+Eq0z4hmL++VX1/Z7gHK4mqbGOWWtBUKM14g7nEmlHwqdEit8GZIZ2Rv
	 pNv6IFOdRH3iCg8Q4lzHUlpfv3V4DBbtr3+BMJe+3voFUhXIq2+yDMXGPDu4YjSqPN
	 aj9ExNclKXsReyrqbE0W7FZ8K1JpLFHySrbLrS/MRWrtQ5hZxParUbjbokUjIUUlEp
	 TnAJ1M3gSGiodthnO2d1QWOo3HyIN3RygaD8fPeCedPokPUCX/dJIOcxHr3AmP/Z1Y
	 Lr3OLY22zZmPhDT2w2dgocdYqvNnv+nEOswkadZJJrjnTxQUzuyPo3tvY23D1GwsUb
	 otaPuoKMDxvfQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D7B8037813DB;
	Tue,  2 Jan 2024 09:28:26 +0000 (UTC)
Message-ID: <39d7a40b-3618-4746-9229-c9dbe1e19d2e@collabora.com>
Date: Tue, 2 Jan 2024 10:28:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8186: Add jpgenc node
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>, bin.liu@mediatek.com,
 matthias.bgg@gmail.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Max Staudt <mstaudt@chromium.org>,
 Ricardo Ribalda <ribalda@chromium.org>
References: <20231227130812.148914-1-eugen.hristev@collabora.com>
 <20231227130812.148914-2-eugen.hristev@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231227130812.148914-2-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_012831_137573_E37A59F4 
X-CRM114-Status: GOOD (  12.26  )
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

Il 27/12/23 14:08, Eugen Hristev ha scritto:
> From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> 
> Add JPEG encoder node.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Max Staudt <mstaudt@chromium.org>
> Tested-by: Max Staudt <mstaudt@chromium.org>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> [eugen.hristev@collabora.com: minor cleanup]
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index e451b6c8cd9e..ef1b269f9184 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -2054,6 +2054,19 @@ venc: video-encoder@17020000 {
>   			mediatek,scp = <&scp>;
>   		};
>   
> +		jpgenc: jpgenc@17030000 {

Can we please call this jpeg-encoder@17030000 instead?

> +			compatible = "mediatek,mt8186-jpgenc", "mediatek,mtk-jpgenc";
> +			reg = <0 0x17030000 0 0x10000>;
> +			interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vencsys CLK_VENC_CKE2_JPGENC>;
> +			clock-names = "jpgenc";

clock-names ...
iommus ....
power-domains ...

Cheers,
Angelo



