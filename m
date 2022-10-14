Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2192CC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 03:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ZSRu1BKoFGBPwJxlPjZlBplZCmEr25chXpohl79YHY=; b=vcCs+DzHZ/RdnOYBfq8rrNZaYv
	0O6iTEuxbG3UvsfCu1bOOk8Jb7CD+HcUPH4VTnNOGA0j+LP41lQw6kmZTWP9DIymomz/ocaDVIWlh
	GVAU2n5TKZqZkPPtxQp+DhZpar7Xbrn5d9n1lI+8jr0RLFaDgH34O85quTvDHuYfREsutfZ+fDmzt
	j60mfCiopcO/HGQb+eSlj+w4EvESS8NVM/tE3qB8ACilfuDnzKfDYbK6EWj0kUaakXQu1zVRwjE+/
	XVvY7UbfcoW3MpQ1XdnwVgdrLkNNSQJmA/MPj4zmu7fE4116cyPUaFdsBAhQF5aGfQkj/rGAC6mFL
	+jclDnjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojBT6-00DXUJ-Pm; Fri, 14 Oct 2022 03:34:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojBT4-00DXTp-PA; Fri, 14 Oct 2022 03:34:40 +0000
X-UUID: fe1640c6e91348cb98797154bef7fd34-20221013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=3ZSRu1BKoFGBPwJxlPjZlBplZCmEr25chXpohl79YHY=;
	b=QKzz681/xETVcUO6INd0YbeG/2dgCaBBvT7OwcY2DhXHi7GzbQS8l521cc6C47AvJ4g97hqyVEER/ZuXpmZ+//R9KD0WJirj7cuE3WTUiQX6iwJ4dfQs0lAc+U3nZT8pKlmd5oJ3BatqSSyqRueVfmHgtXZP3Lt9lkrsIdFEHAA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:f30bfc78-d89a-4c62-8c1e-331d3ede668f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:4fb07701-cdeb-479d-93af-53f947adce9d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: fe1640c6e91348cb98797154bef7fd34-20221013
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 442125499; Thu, 13 Oct 2022 20:34:32 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 14 Oct 2022 10:43:56 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 14 Oct 2022 10:43:55 +0800
Message-ID: <3b7fc7414f282ca044c24dae280f9bc9533a5b7b.camel@mediatek.com>
Subject: Re: [PATCH 6/8] arm64: dts: mt2712-evb: Fix usb vbus regulators
 unit names
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<matthias.bgg@gmail.com>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<sam.shih@mediatek.com>, <hanks.chen@mediatek.com>, <weiyi.lu@mediatek.com>,
	<zhiyong.tao@mediatek.com>, <andrew-sh.cheng@mediatek.com>,
	<viresh.kumar@linaro.org>, <fparent@baylibre.com>, <mars.cheng@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 14 Oct 2022 10:43:55 +0800
In-Reply-To: <20221013152212.416661-7-angelogioacchino.delregno@collabora.com>
References: <20221013152212.416661-1-angelogioacchino.delregno@collabora.com>
	 <20221013152212.416661-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_203438_854936_BC22CD2B 
X-CRM114-Status: GOOD (  14.25  )
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

On Thu, 2022-10-13 at 17:22 +0200, AngeloGioacchino Del Regno wrote:
> Update the names to regulator-usb-p{0-3}-vbus to fix
> unit_address_vs_reg
> warnings for those.
> 
> Fixes: 1724f4cc5133 ("arm64: dts: Add USB3 related nodes for MT2712")
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt2712-evb.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> index 638908773706..d31a194124c9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> @@ -50,7 +50,7 @@ extcon_usb1: extcon_iddig1 {
>  		id-gpio = <&pio 14 GPIO_ACTIVE_HIGH>;
>  	};
>  
> -	usb_p0_vbus: regulator@2 {
> +	usb_p0_vbus: regulator-usb-p0-vbus {
Can we modify dt-binding of fixed regulator instead of changing the
node name,
since all nodes using fixed regulator may need be changed.

>  		compatible = "regulator-fixed";
>  		regulator-name = "p0_vbus";
>  		regulator-min-microvolt = <5000000>;
> @@ -59,7 +59,7 @@ usb_p0_vbus: regulator@2 {
>  		enable-active-high;
>  	};
>  
> -	usb_p1_vbus: regulator@3 {
> +	usb_p1_vbus: regulator-usb-p1-vbus {
>  		compatible = "regulator-fixed";
>  		regulator-name = "p1_vbus";
>  		regulator-min-microvolt = <5000000>;
> @@ -68,7 +68,7 @@ usb_p1_vbus: regulator@3 {
>  		enable-active-high;
>  	};
>  
> -	usb_p2_vbus: regulator@4 {
> +	usb_p2_vbus: regulator-usb-p2-vbus {
>  		compatible = "regulator-fixed";
>  		regulator-name = "p2_vbus";
>  		regulator-min-microvolt = <5000000>;
> @@ -77,7 +77,7 @@ usb_p2_vbus: regulator@4 {
>  		enable-active-high;
>  	};
>  
> -	usb_p3_vbus: regulator@5 {
> +	usb_p3_vbus: regulator-usb-p3-vbus {
>  		compatible = "regulator-fixed";
>  		regulator-name = "p3_vbus";
>  		regulator-min-microvolt = <5000000>;


