Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07835C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 02:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JaIR81W7uRC3RHrO6DoWqaK6YpTRAbe3E0L77VhfzRA=; b=X9UpJrTpGQv60rGa0iX5ve8+pY
	R7+ymTSs6+Y5oNP4c+VbSRxQI+NkQxDONt9vFBlcF5WJemKAIx0/dTLhQW3mdT2xK3X8GItued+VN
	g5Oe9OhesONjaV4sCLqCvqZz4Yh/VObjZnSF55eMJeTPzcapCADMTBrcdcfnjYFyJ2INxRrV+ks1l
	idbZVnf00M4D2z6GM4aqxRBR2jvdK44P3mn3+exZUo5kmF9umUxfBhXcxeMGnVdl+MJNcBAFtsony
	h8uXWFPVuiuWwdyKtPNLlLXmoFDmkRhv0EgzWN+cFRlgbUFmLnsA5PijY2l0gBhxboLRUciNMPW/U
	OmCYWWSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olL2J-009Peq-Ty; Thu, 20 Oct 2022 02:11:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olL27-009Pd9-DQ; Thu, 20 Oct 2022 02:11:45 +0000
X-UUID: 287f226a756e44188eede36229eaf6f2-20221019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=JaIR81W7uRC3RHrO6DoWqaK6YpTRAbe3E0L77VhfzRA=;
	b=GY5OXJHiGC3wCbJ/uUXv0sru4cUlpNZz0lQ8EctPjyqqOoph1SPRm1UOgXl/j2tWQCH2oopP02XnVFaJWmm8LvsjhrvglZiFSD3H5wWtNDqhSS2Tg3wTrEJEj6OA79RBjUtE2tF6tk9eHWZ4m2ZSBlGM4WefNpG+u6+k+SP3JFg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:b7a79465-7c3b-444d-9787-9aad423f508c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:19755ba4-ebb2-41a8-a87c-97702aaf2e20,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 287f226a756e44188eede36229eaf6f2-20221019
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 115166411; Wed, 19 Oct 2022 19:11:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 20 Oct 2022 10:10:56 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 20 Oct 2022 10:10:55 +0800
Message-ID: <ccb830693f467b59d829c7929ea3b47b2d4c029f.camel@mediatek.com>
Subject: Re: [PATCH v1 2/3] arm64: dts: mt8195: Add pcie and pcie phy nodes
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 20 Oct 2022 10:10:55 +0800
In-Reply-To: <c30fbc60-bcdf-71f5-0db7-bd9bb27ddd37@collabora.com>
References: <20221017070858.13902-1-tinghan.shen@mediatek.com>
	 <20221017070858.13902-3-tinghan.shen@mediatek.com>
	 <c30fbc60-bcdf-71f5-0db7-bd9bb27ddd37@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_191143_484336_8A906593 
X-CRM114-Status: GOOD (  19.03  )
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

Hi Angelo,

Thanks for your review.

On Wed, 2022-10-19 at 10:55 +0200, AngeloGioacchino Del Regno wrote:
> Il 17/10/22 09:08, Tinghan Shen ha scritto:
> > Add pcie and pcie phy nodes for mt8195.
> > 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 143
> > +++++++++++++++++++++++
> >   1 file changed, 143 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index d03f0c2b8233..903e92d6156f 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -1182,6 +1182,104 @@
> >   			status = "disabled";
> >   		};
> >   
> > +		pcie0: pcie@112f0000 {
> > +			compatible = "mediatek,mt8195-pcie",
> > +				     "mediatek,mt8192-pcie";
> 
> ..snip..
> 
> > +
> > +			phys = <&pciephy>;
> > +			phy-names = "pcie-phy";
> > +
> > +			power-domains = <&spm
> > MT8195_POWER_DOMAIN_PCIE_MAC_P0>;
> 
> You're missing the resets:
> 
> 			resets = <&infracfg_ao
> MT8195_INFRA_RST2_PCIE_P0_SWRST>;
> 			reset-names = "mac";
> 
> > +
> > +			#interrupt-cells = <1>;
> > +			interrupt-map-mask = <0 0 0 7>;
> 
> ..snip..
> 
> > +		};
> > +
> > +		pcie1: pcie@112f8000 {
> > +			compatible = "mediatek,mt8195-pcie",
> > +				     "mediatek,mt8192-pcie";
> 
> ..snip..
> 
> > +			power-domains = <&spm
> > MT8195_POWER_DOMAIN_PCIE_MAC_P1>;
> 
> Here too:
> 			resets = <&infracfg_ao
> MT8195_INFRA_RST2_USBSIF_P1_SWRST>,

Reset the combo-phy in PCIe driver will cause side effect on USB2 port,
so this reset cannot be added.

We will fix others in the next version.

Thanks.
> 				 <&infracfg_ao
> MT8195_INFRA_RST2_PCIE_P1_SWRST>;
> 			reset-names = "phy", "mac";
> 
> > +
> > +			#interrupt-cells = <1>;
> 
> ..snip..
> 
> > @@ -1241,6 +1339,34 @@
> >   				reg = <0x189 0x2>;
> >   				bits = <7 5>;
> >   			};
> > +			pciephy_rx_ln1: pciephy-rx-ln1@190 {
> > +				reg = <0x190 0x1>;
> > +				bits = <0 4>;
> > +			};
> > +			pciephy_tx_ln1_nmos: pciephy-tx-ln1-nmos@190 {
> 
> Please run dtbs_check and try to build the kernel before pushing
> commits upstream.
> This will give you a not-so-nice warning and that shall not happen.
> 
> You can solve it by naming these nodes like:
> pciephy-rx-ln1@190,1
> pciephy-tx-ln1-nmos@190,2
> 
> ...etc
> 
> Regards,
> Angelo
> 
> 


