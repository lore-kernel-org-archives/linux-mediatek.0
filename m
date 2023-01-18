Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC718C38159
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 09:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6F8ZBfA0j0HVSsAwpNWuoJ5XuqDmmUT1gNWbpuIfks=; b=C8a/3S7EBHGLropBVHxXLWxpLw
	cLh5KLsFvAdFHOYHPSTTnNIk4Uk0eeNcssh3LPvaaoVgVQBFVMt1hv8Nmu0fm8godJ30iumwwghnf
	YYH5yAO//fmjp3wTbrudXv5ylmRc5ZcTpKxvo9f8W0LYTy/4OmpczktXzQv2TfFQedJAtXrUeMT8D
	cZrm/y8gRPvt5LDQB5dAt16sejSo8Uo10MD1tdf1TZE1qNZuFUMborzYnaVPE2JU9taUhxVT2gSec
	kKUwYUWx+llUEF2gPamaVoIwI/cfg3FIwB+YOzsbyfjyjOS/D7f/nlNvNDnI7bu99lrQE+3DVRhoD
	TXZ17J0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI4c9-0003qm-3y; Wed, 18 Jan 2023 09:20:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI4bD-0003Mi-31; Wed, 18 Jan 2023 09:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=k6F8ZBfA0j0HVSsAwpNWuoJ5XuqDmmUT1gNWbpuIfks=; b=Wo9VXGUK4/Oqeqb8wzqmyXyFRb
	B+LfP9cQcTtNXDzJFhd4EKBAwoOkurr4IZYmaK+MFRp/+xY48s/EYWDUvfr+HkhzeHXF9qJcEJP3G
	AETSwZI+vAGlmEgw0LtHR1b2PZ/FxNF2WOZOzTL8xXEq87CvbhJ77LDpLqkUoZptO7n84rvh5wbO1
	e4EvcYpoTgkgPVjSosXrW4WjCCHH3aXXstsboi+cOGUTI2vA1kWLhdiQeeWUgVub/qUvA6u3Rb8MJ
	k6NhGtfElj8cfUSinHr51h3wI6UG/HpKdHsT8nS64mcbnK1JwsUQkBXuu8+OSIqxoz+E8VU0933Kg
	bhtI80/Q==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pI4az-006DWF-1p;
	Wed, 18 Jan 2023 09:19:03 +0000
X-UUID: 27c098ba971111edbbe3f76fe852e059-20230118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=k6F8ZBfA0j0HVSsAwpNWuoJ5XuqDmmUT1gNWbpuIfks=;
	b=l57v/tbiiFo/q7jfYzsoeipvjG4IKw+TjJSOKICHVFzD9FpSl2qb/NLvu5JdNIcVcdSQCqOeqBvaDiwlnleINkkYGPOI1fQrtoTVvor+gxcT4ozLUoi8dt+QFTFJ6xiujHZIoFRsQi4AAL23dk+a0B+OScaqHEFFiZqG6F5ogqE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:a56ce88d-1007-41dd-97df-37e9c9e0f434,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:3ca2d6b,CLOUDID:621e2af6-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 27c098ba971111edbbe3f76fe852e059-20230118
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1109926147; Wed, 18 Jan 2023 02:19:05 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 17:18:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 17:18:31 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 2/9] dt-bindings: spmi: spmi-mtk-pmif: Document mediatek,mt8195-spmi as fallback of mediatek,mt8186-spmi
Date: Wed, 18 Jan 2023 17:18:22 +0800
Message-ID: <20230118091829.755-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_091902_126540_748DF8F6 
X-CRM114-Status: GOOD (  11.26  )
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

The mt8186-spmi is used as compatible with mt8195-spmi on the MT8186,
document this situation.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml   | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
index abcbbe13723f..e4f465abcfe9 100644
--- a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
+++ b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
@@ -18,9 +18,14 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt6873-spmi
-      - mediatek,mt8195-spmi
+    oneOf:
+      - enum:
+          - mediatek,mt6873-spmi
+          - mediatek,mt8195-spmi
+      - items:
+          - enum:
+              - mediatek,mt8186-spmi
+          - const: mediatek,mt8195-spmi
 
   reg:
     maxItems: 2
-- 
2.18.0


