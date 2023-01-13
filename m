Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03CAC54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 05:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xMKQs0iaxWchhcj+xlpojqq6qDjBdKU+MZPCQE4PFNE=; b=LOQZ3ULCrGGVIt0ybIfQp9WYsC
	ITu7CMgRG84OR0JTMofoBwcbUZpVGg4o93+IoFix27+GvdAMmX35ASXYNnFWmSbg1vDzFD/ApReJx
	Gx2qBPGUoWaRrgLFfiU8p1524/utpzW3/kvywK+V0391sPwzlwKC2FqoZmCpuKO/g+ynZIMfgZk4H
	gtgW0g8pd0GBNWqlHMeoU4z4PR6+TCMqmZ4NNgyPy33HNVtF+gYNQ2pPPZwetMvRFW2ExVzXxbBRP
	tmab06N6rHdc8hY/zfDfRlHegRw6BqfAw+8lPvrYnA4qIyUlaBZVN3pqyvtJZxjNrrjfrGie5IH9T
	aIBGfN4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGD08-000cNc-6V; Fri, 13 Jan 2023 05:53:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGD04-000cLe-JD; Fri, 13 Jan 2023 05:53:14 +0000
X-UUID: 8e927edc930611edbbe3f76fe852e059-20230112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xMKQs0iaxWchhcj+xlpojqq6qDjBdKU+MZPCQE4PFNE=;
	b=jHInxI1cAkzFKQdi34a/9O9aJqJeeUWr6Kuzxdv7+WWdWqCw6z37z+EX8ZA5fNXxeKL/QwB8P0r/vU9Hb0AVR8vBODE9YhdQT/3o7DX0tD5BkXsMCdRioduaUtLw7XNpjS58vCnwyNN0VDsGxe/Geiw9BV4mSOkJbPzPkUCPKvI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:eaaae4b3-0db9-46c7-b494-6dad412c2ff4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:72a7258c-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 8e927edc930611edbbe3f76fe852e059-20230112
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1723153855; Thu, 12 Jan 2023 22:53:08 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 13 Jan 2023 13:43:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 13:43:05 +0800
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
Subject: [PATCH v5 01/10] dt-bindings: arm: mediatek: migrate MT8195 vppsys0/1 to mtk-mmsys driver
Date: Fri, 13 Jan 2023 13:42:55 +0800
Message-ID: <20230113054304.21841-2-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230113054304.21841-1-moudy.ho@mediatek.com>
References: <20230113054304.21841-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_215312_661166_D2A3E9CB 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

MT8195 vppsys0/1 should be probed from mtk-mmsys driver to
populate device by platform_device_register_data then start
its own clock driver.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../arm/mediatek/mediatek,mt8195-clock.yaml      | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
index 17fcbb45d121..d62d60181147 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
@@ -28,11 +28,9 @@ properties:
           - mediatek,mt8195-imp_iic_wrap_s
           - mediatek,mt8195-imp_iic_wrap_w
           - mediatek,mt8195-mfgcfg
-          - mediatek,mt8195-vppsys0
           - mediatek,mt8195-wpesys
           - mediatek,mt8195-wpesys_vpp0
           - mediatek,mt8195-wpesys_vpp1
-          - mediatek,mt8195-vppsys1
           - mediatek,mt8195-imgsys
           - mediatek,mt8195-imgsys1_dip_top
           - mediatek,mt8195-imgsys1_dip_nr
@@ -92,13 +90,6 @@ examples:
         #clock-cells = <1>;
     };
 
-  - |
-    vppsys0: clock-controller@14000000 {
-        compatible = "mediatek,mt8195-vppsys0";
-        reg = <0x14000000 0x1000>;
-        #clock-cells = <1>;
-    };
-
   - |
     wpesys: clock-controller@14e00000 {
         compatible = "mediatek,mt8195-wpesys";
@@ -120,13 +111,6 @@ examples:
         #clock-cells = <1>;
     };
 
-  - |
-    vppsys1: clock-controller@14f00000 {
-        compatible = "mediatek,mt8195-vppsys1";
-        reg = <0x14f00000 0x1000>;
-        #clock-cells = <1>;
-    };
-
   - |
     imgsys: clock-controller@15000000 {
         compatible = "mediatek,mt8195-imgsys";
-- 
2.18.0


