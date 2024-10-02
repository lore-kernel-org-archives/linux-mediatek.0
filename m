Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BE3CF31B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 12:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Ni+WI8epTIdbJVSUpHgDqL3C5owd4TU9qiJVvDIbbE=; b=TYZz1RtRpKpnDOXA7w9R/jesjQ
	WQTE6NcwcLagn/7wgJ74LKe+ItTSabqgkZ7zl+N+lJAvLvPd7pzFNwWUL5ju1Jhub6PQmrdmQqy0B
	uQY8C/YZHNV57FAtzBne2sf00LBZ7MXOqYUi8XbZED/ka/mfd7gMLinSE36cdEdwyh1+Hq/8sdWfF
	6AH5UseOuh0qMdHr2QZsYHbKCeNBpkrsJccJ/oOFubOQzKs2Bz0voZyuP7boIgZmyb8nRVVcTsjLk
	ndniKfrCmr9KttcZGJ5WkojVafFc2fig40hVxLBxSUy5C0BajRmd095w+1uoZDErCnSDEpDPvDNVd
	jRSMqd0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svylj-00000005y9n-0jO7;
	Wed, 02 Oct 2024 12:47:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svygr-00000005wXL-1r8W;
	Wed, 02 Oct 2024 12:42:50 +0000
X-UUID: d1acc38680bb11efb3adad29d29602c1-20241002
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=0Ni+WI8epTIdbJVSUpHgDqL3C5owd4TU9qiJVvDIbbE=;
	b=T+s41gYVMlSDbJTTBzBDbUir/UGuDMhp++4DcNw6/1meYqL/ItQgJWyMHeJXnNCiE56M3bKsDkoIp2AMuejvbx4fQG11xlj6LxhQRTBkXpC1sAVFIpoOdqHQpu/8G0sGeqVVkAwbIAbpYAK0nVYMnpV8Dc7x4oDMz83KwvvbbE4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:47dadc8b-017a-40bb-9d18-e990b77a57c7,IP:0,U
	RL:0,TC:0,Content:1,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:1
X-CID-META: VersionHash:6dc6a47,CLOUDID:b2322c88-3a5d-4d9e-b012-e875acfb157d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d1acc38680bb11efb3adad29d29602c1-20241002
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1551228513; Wed, 02 Oct 2024 05:42:43 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 2 Oct 2024 20:42:40 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 2 Oct 2024 20:42:40 +0800
Message-ID: <7faeac1b-0b7a-a820-16a5-330b82d12e01@mediatek.com>
Date: Wed, 2 Oct 2024 20:42:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/9] arm64: dts: mediatek: mt8188: Add PCIe nodes
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <jianguo.zhang@mediatek.com>,
	<jian.yang@mediatek.com>, <jieyy.yang@mediatek.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>
References: <20241002114614.847553-1-fshao@chromium.org>
 <20241002114614.847553-3-fshao@chromium.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20241002114614.847553-3-fshao@chromium.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_054249_528280_5B1832C6 
X-CRM114-Status: GOOD (  16.16  )
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



On 10/2/24 19:41, Fei Shao wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> 
> Add PCIe node and the associated PHY node.
> Individual board device tree should enable the nodes as needed.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi | 62 ++++++++++++++++++++++++
>   1 file changed, 62 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> index 10195a4e4e9d..9431f3c5c228 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -1763,6 +1763,53 @@ xhci0: usb@112b0000 {
>   			status = "disabled";
>   		};
>   
> +		pcie: pcie@112f0000 {
> +			compatible = "mediatek,mt8188-pcie", "mediatek,mt8192-pcie";
> +			reg = <0 0x112f0000 0 0x2000>;
> +			reg-names = "pcie-mac";

It seems the property 'linux,pci-domain = <0>;' is missing?

[snip]

> +			};
> +		};
> +
>   		nor_flash: spi@1132c000 {
>   			compatible = "mediatek,mt8188-nor", "mediatek,mt8186-nor";
>   			reg = <0 0x1132c000 0 0x1000>;
> @@ -1775,6 +1822,21 @@ nor_flash: spi@1132c000 {
>   			status = "disabled";
>   		};
>   
> +		pciephy: t-phy@11c20700 {
> +			compatible = "mediatek,mt8188-tphy", "mediatek,generic-tphy-v3";
> +			ranges = <0 0 0x11c20700 0x700>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			status = "disabled";
> +

The power-domains property is missing.
It should be 'power-domains = <&spm MT8188_POWER_DOMAIN_PEXTP_PHY_TOP>;'

> +			pcieport: pcie-phy@0 {
> +				reg = <0 0x700>;
> +				clocks = <&topckgen CLK_TOP_CFGREG_F_PCIE_PHY_REF>;
> +				clock-names = "ref";
> +				#phy-cells = <1>;
> +			};
> +		};
> +
>   		i2c1: i2c@11e00000 {
>   			compatible = "mediatek,mt8188-i2c";
>   			reg = <0 0x11e00000 0 0x1000>,

Thanks!
Best regards,
Macpaul Lin

