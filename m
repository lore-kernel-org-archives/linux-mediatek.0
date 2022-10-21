Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2C3C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 06:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExRKeO+TK0hJ0ZPupJS/yMOY5pv1f1TbfMj7UR2BrL0=; b=P9WLnpl7rwsHFvSmQCLTDUs/ka
	OpFSTuoscpwDRlpizLSqPXSBn85FyknH0WsWzMw2vMnfpjcQw6sAzXrYzKwKk4Oom8YaoGcRnptmF
	f3Y+Nv1V3u4rVkRd4OkmKM8mWorpDks2UCaF/LJsndF8LFn5cKlmyP1oLooYmGR/F63dEE+w5X60k
	JyTS9JqedwniZp4NS/bkcBj7yL6iqkSCULkbZv/SFG26ewSs0MdDKRPLQLsapfBpPGaM4tpAXX2JD
	1cztiqNj8mSm4TzqwI168ei/7M2Ir87wNI3jc/Ik89zZza3iMzBBLHSrYr7rM7tZfngIq6OAKPdhc
	qp0qNE5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ollT6-005ezI-E2; Fri, 21 Oct 2022 06:25:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ollT3-005eyK-PT; Fri, 21 Oct 2022 06:25:19 +0000
X-UUID: deb7232b63c4409ebd4d119c57e7f3a3-20221020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ExRKeO+TK0hJ0ZPupJS/yMOY5pv1f1TbfMj7UR2BrL0=;
	b=YdprMySo6ZdI9cBJd5yH06FPis4ElBPvUVWhJ3uDVFnoU6NMnKq3I/LQhwgPUZlFlizqH6vDB27ytg5X3fOdtl7VSWDCWLUgf3L2WSYnh5CRaR+RPY6rbTYO4OohndrGcqY1/BtDS8WoMWcyxh4T81uSWKIuLVKKh8gBgnA2Jf8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:38420234-ec5d-45a4-9194-9f6f92dfef0d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:56f43ae4-e572-4957-be22-d8f73f3158f9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: deb7232b63c4409ebd4d119c57e7f3a3-20221020
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 44267481; Thu, 20 Oct 2022 23:25:08 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 21 Oct 2022 14:14:59 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 21 Oct 2022 14:14:58 +0800
Message-ID: <a24326d0a454082ab532025ae52462757d4d6bab.camel@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: phy: mediatek: tphy: add compatible
 for tphy-v4
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Daniel Golle <daniel@makrotopia.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	"Vinod Koul" <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Date: Fri, 21 Oct 2022 14:14:58 +0800
In-Reply-To: <07c5d962515c4f675f076bb91d69eaf651b187c6.1666193782.git.daniel@makrotopia.org>
References: <df51b63add2830d91b527db64fba6ffdb7765f5d.1666193782.git.daniel@makrotopia.org>
	 <07c5d962515c4f675f076bb91d69eaf651b187c6.1666193782.git.daniel@makrotopia.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_232517_868564_035C5607 
X-CRM114-Status: GOOD (  17.29  )
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

On Wed, 2022-10-19 at 16:38 +0100, Daniel Golle wrote:
> V4 can be found in MT7986 and MT7981 SoCs, it supports PCIe with two
> lanes.
NAK.

mt7981/mt7986 shall use "mediatek,generic-tphy-v2" instead.

Thanks a lot

> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> index 5613cc5106e32f..851e3dda7b638b 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> @@ -89,6 +89,11 @@ properties:
>                - mediatek,mt8188-tphy
>                - mediatek,mt8195-tphy
>            - const: mediatek,generic-tphy-v3
> +      - items:
> +          - enum:
> +              - mediatek,mt7981-tphy
> +              - mediatek,mt7986-tphy
> +          - const: mediatek,generic-tphy-v4
>        - const: mediatek,mt2701-u3phy
>          deprecated: true
>        - const: mediatek,mt2712-u3phy
> @@ -99,7 +104,7 @@ properties:
>      description:
>        Register shared by multiple ports, exclude port's private
> register.
>        It is needed for T-PHY V1, such as mt2701 and mt8173, but not
> for
> -      T-PHY V2/V3, such as mt2712.
> +      T-PHY V2/V3/V4, such as mt2712.
>      maxItems: 1
>  
>    "#address-cells":


