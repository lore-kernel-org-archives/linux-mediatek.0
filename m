Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B58EE7717F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2024 17:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjgqYJxr37dpN3U+eIPz/npkCcvBeMOngfUWkg7iyec=; b=5Cn+w6tMhNaTkF
	js7FYdJApH47CeOo/3MABdpnXFX9mf873PBKrlIPI/eWnbkgUBfKCr93I9J4SImKPOWa30nxFFNz4
	3Ky2qiAL85L6ud7SPTyFnmIYnV1lNJ26YMxXfsSzwNagN/rKt9HAhtQZ7xH8f6h7+4OKaHn2B/L8u
	fW9tUlVleESgLRFkaeq/ET0eGyxdjva2bmuCIzL0gzS+Xs11/Rtu2muUOAVEszA2bSMQxb4F0Xhmw
	LF6nKbfirHXBgcnMKcwDvVZE8CPZbMyGBoga+bg5mUVrFBvZEGDJUJNw1YV75m0slyT+Xvc2GTO/h
	vcA4U7slJdCPgVkbgd/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmfc-000000016sc-47qx;
	Thu, 12 Dec 2024 17:08:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlh5-00000000swc-2667;
	Thu, 12 Dec 2024 16:05:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734019537;
	bh=J1scdp67Yf0dN731s+TeIiFUh/val29sz3XZEjfTzxU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TLW5LTOpDIKHws5iJ9xFtxE1SpY4vug6sm8YNGS9UMeD/RRqKXzTAAtKX20365AJh
	 kILazhLvIPfBGbHfUhkqqWlYRkMyX87RVJY6maxF5yVxSg0qzxMMnqywXWBqdGdtMM
	 L1wKaWDqLDWhCzJ9zS7wvrLU48dloqzWKKFjqumNdiNkF1nvBEAK4BjAoWtvXB2HuY
	 SZFeZAfjqFp8elCWJTxyvNMYMd89BIcZRkkrYwl3mSC6m1xXhK3QhA2nMHECjSTJev
	 TFgFupVDtvA6s9cAe6sZ0iFiJ3oo0P3EaGbrhYcgCqrzramOKQHrjReMSuwLpg09Ah
	 Cqt0DYXeNJ9AA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C079417E37A4;
	Thu, 12 Dec 2024 17:05:36 +0100 (CET)
Message-ID: <6710abd1-128d-48ff-84a1-880053fd9e84@collabora.com>
Date: Thu, 12 Dec 2024 17:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dts: arm64: mediatek: mt8188: Update OVL compatible
 from MT8183 to MT8195
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20241212153344.27408-1-jason-jh.lin@mediatek.com>
 <20241212153344.27408-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241212153344.27408-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_080539_727621_6FAFF9D0 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 12/12/24 16:33, Jason-JH.Lin ha scritto:
> The OVL hardware capabilities have changed starting from MT8195,
> making the MT8183 compatible no longer applicable.
> Therefore, it is necessary to update the OVL compatible from MT8183 to
> MT8195.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Jason, just so you know - I have patches here adding DSC and merge components of
VDO0, other than all MDP3 components.

Those are almost ready to send, I only need to finish some testing before ;-)

For this one, anyway:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


> ---
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> index faccc7f16259..23ec3ff6cad9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -2488,7 +2488,7 @@ jpeg_decoder: jpeg-decoder@1a040000 {
>   		};
>   
>   		ovl0: ovl@1c000000 {
> -			compatible = "mediatek,mt8188-disp-ovl", "mediatek,mt8183-disp-ovl";
> +			compatible = "mediatek,mt8188-disp-ovl", "mediatek,mt8195-disp-ovl";
>   			reg = <0 0x1c000000 0 0x1000>;
>   			clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
>   			interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;



