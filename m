Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B95C352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 09:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crufHaBJqDwuFiPQOlCXJvq1DOxDaZbIVtDdwONvRV4=; b=WKwPPpAVPKPq5tdG6/f0p892Rl
	+FZCOJ4e+kJdOhpApGXCo11ClstCkskvz9fnCxt8G1Do/83OLPuxTefLTDVJDuwJAKH5XYC98FWOG
	fz9PxF2CbLwM/APT+76qHr3Ry+JLzaCxhNoc8DfXs3GoHnpO5/9tFoabI2XDVSOdoOgbbdlrctB4/
	CaZowMdQbun/Xl2w1trQ+i30Tb9pNOpkBT8qMK76T43RbBXQbtG4RdT+2mHjl63VVynthLfQbq/55
	mjm25AB8tunEqcfwb6dkZrNV7qxmrNWCQHcyK1H3+A1gn+tKsCLv+JzmxO3t56s3iQn5EuUqFh2O2
	cBdcQ3Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2r61-00GbrB-84; Wed, 07 Dec 2022 09:52:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2r41-00GZfu-Cy; Wed, 07 Dec 2022 09:50:11 +0000
X-UUID: 3cbfb57fbd50416fabeeaae6d9c31d36-20221207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=crufHaBJqDwuFiPQOlCXJvq1DOxDaZbIVtDdwONvRV4=;
	b=Dpra1l8pJFu9XIRFTn2JlLHC2MpfMb1yDkDRRjN25YnWWlVlLJ0Be2bQpn7/K5ewjmV2Jfz/8vk/mH/900hxdhu/ss515DqzpoKq58Gs7fL7fdroP69y8b8rl9+fM6n6f8Wk4r1nYLAXBK5vY3jljSSxOGI1kuFpaMAUwvy1tss=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:c0778df1-c87e-4a39-bf79-e3278981428b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.14,REQID:c0778df1-c87e-4a39-bf79-e3278981428b,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:dcaaed0,CLOUDID:f0cde7d1-652d-43fd-a13a-a5dd3c69a43d,B
	ulkID:221207174948G2K3OWOX,BulkQuantity:2,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 3cbfb57fbd50416fabeeaae6d9c31d36-20221207
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 884513873; Wed, 07 Dec 2022 02:50:01 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 7 Dec 2022 17:49:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 7 Dec 2022 17:49:23 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v4 1/8] dt-bindings: arm: mediatek: mmsys: Add support for MT8195 VPPSYS
Date: Wed, 7 Dec 2022 17:49:14 +0800
Message-ID: <20221207094921.15450-2-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221207094921.15450-1-moudy.ho@mediatek.com>
References: <20221207094921.15450-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_015005_518386_601C37D6 
X-CRM114-Status: GOOD (  11.71  )
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

For MT8195, VPPSYS0 and VPPSYS1 are 2 display pipes with
hardware differences in power domains, clocks and subsystem counts,
which should be determined by compatible names.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml     | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 0711f1834fbd..493aa9e8d484 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -48,7 +48,10 @@ properties:
           - const: syscon
 
       - items:
-          - const: mediatek,mt8195-vdosys0
+          - enum:
+              - mediatek,mt8195-vdosys0
+              - mediatek,mt8195-vppsys0
+              - mediatek,mt8195-vppsys1
           - const: mediatek,mt8195-mmsys
           - const: syscon
 
-- 
2.18.0


