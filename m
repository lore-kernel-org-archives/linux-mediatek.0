Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44BDC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 07:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jx+9FQ9pVAzpmeUBEDy+ewK0F0bmclelNRbxoHM9CgA=; b=MDyZgQEVuSLVP7Xir1a5qEtxkw
	ZXuneYal5I3j9rg1H/ESlqtud+0uv1PZIgEKLgshc7zfalBd74yXx3t44MpIdRDkshY1SlbdoPQR3
	ALNPcUNyjbj4Rq0/YSX31isMC7FUu05DxDd00rZQ1baz+Yp4Rby5IuxGMSPHNd7Y3l8N4cN2YoBtb
	Nhn0jmkNIFz5nn/tOtRapgbQK9ittRKTXlRTwjKk5FTrPlp6FDczIMC7AlnANMsDKTed+E1L4Lrqc
	AjfnGdaix8ykhyADn/D0x1yoi41odV5SE3/1X4PoPjLFVcgvHq5nrD9ddi1p47ZSNBhXcuE3ikhaY
	Vh2lgKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi9Jc-003WYS-Te; Tue, 11 Oct 2022 07:04:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi9JZ-003WWc-RW; Tue, 11 Oct 2022 07:04:35 +0000
X-UUID: 995e5f83e0f54bec96d1e1101e89d39a-20221011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jx+9FQ9pVAzpmeUBEDy+ewK0F0bmclelNRbxoHM9CgA=;
	b=mUpbgQR+E2I41V4GG0bRYHqKW7Io271tBw+9rvZL6EJON6cXfIjiespGJu8+mKEk11JugPExV/3vRzxzs02eeNmG/ppFGWN0QQcxLLM3aTTXcfXmoRMWfjOaTsH9KgYaZ4ROZJjURMWsIYF/odTnW09RMb1aiJlDVG3hOrVZHvQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:926560e2-a5e3-40e2-9633-b72a20cf2b1e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:603287e1-2948-402a-a6e4-b5d31fe11eb7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 995e5f83e0f54bec96d1e1101e89d39a-20221011
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 920989749; Tue, 11 Oct 2022 00:04:05 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 11 Oct 2022 15:03:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 11 Oct 2022 15:03:57 +0800
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
Subject: [PATCH v2 1/7] dt-bindings: arm: mediatek: mmsys: Add support for MT8195 VPPSYS
Date: Tue, 11 Oct 2022 15:03:50 +0800
Message-ID: <20221011070356.682-2-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221011070356.682-1-moudy.ho@mediatek.com>
References: <20221011070356.682-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_000433_911158_E0EBCB5A 
X-CRM114-Status: GOOD (  10.52  )
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


