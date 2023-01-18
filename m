Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6C7C32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 12:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I54J3yc1GcsPcr0a4x9AZpqhD5tUyptUpQABi0GXBeI=; b=ur74F51qWO2f6na2c5Y9J6SWNL
	opfl9+SoQTcCubPLc9mez+jYHE3B0gA95IoBm1TK2YPlSVDVrX5yYT3I4FFpe8CadhfyjzMnFcd98
	Ve0vtbbfiMIfmpJ4OvSZ8zJeewn6AO7/GAwYeHeleBLkzOGrx1nABAJUv63r02RcOuckwfk9R5k0A
	IcBPO6L0ZxzJdQxAPAb63ITKPhKNdT/OcyrcehmNcOQXrBrZO2GcvyaF4cNLxJbIRYJCFG2Ut5iGe
	slBPEFxP8Z3VK2ufYqcDv4AKcm8nyPOPGvnDS9xgjkFeLJaIqQyxF7cgxV8TAGMPB9jHubMq9gnj0
	AQe9k1Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7o5-000vYq-Uz; Wed, 18 Jan 2023 12:44:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7kU-000try-DW; Wed, 18 Jan 2023 12:41:11 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4F2DD6602E0D;
	Wed, 18 Jan 2023 12:41:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674045661;
	bh=F+XxzJUm4lsANVRjnsUxehsaKD3z+0zIZyj5AjqBkbs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fd9yJP0xkniKPzH6TUTh4OcVu13uWVY9wouz0NucXaWzXVz8VWlwZH3i/YS8sDOIQ
	 lR3fiWQqlY80q4gyH8vRSfZ6Zc4PEoO7N6IMIqe9xZzAxtRA2NoTu+jryaVqeDvWuY
	 3Av+dyT3JeTJtOG/i5zoS3up4KAdCj49+PAq+VdBwpwq4an9u41ImBN1TmKrfIwAt0
	 m4poVR9+6okdK0Ar4KnqfuXAvtvoD5d+9zOtCnQvtKizcKiurT2wyUD6PhlipvttSR
	 k0s4ylIDVTsG5p+zYh6N7Oz7BgOaHmNFaZorzYYfiyh9aPQigkij2DFWNMKPau3lt1
	 SdTQP/X3CqZpg==
Message-ID: <38fd6436-7315-6342-f9d1-afafac0e677b@collabora.com>
Date: Wed, 18 Jan 2023 13:40:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/9] arm64: dts: mediatek: mt8186: Add SPMI node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 dri-devel@lists.freedesktop.org
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
 <20230118091829.755-4-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230118091829.755-4-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_044102_656113_978868FE 
X-CRM114-Status: GOOD (  14.42  )
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

Il 18/01/23 10:18, Allen-KH Cheng ha scritto:
> Add SPMI node for MT8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index 3d88480913eb..a8ff984f1192 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -605,6 +605,25 @@
>   			clock-names = "spi", "wrap";
>   		};
>   
> +		spmi: spmi@10015000 {
> +			compatible = "mediatek,mt8186-spmi",
> +				     "mediatek,mt8195-spmi";

fits one line.

> +			reg = <0 0x10015000 0 0x000e00>,
> +			      <0 0x1001B000 0 0x000100>;

ditto

Regards,
Angelo

