Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBDFCA0FE0
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 11:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UyRBBoZvs5yZx9ee1wQlM3Yzcbs7XG0PM0g15NAHr6k=; b=HGCCYkKPVksce6TYoQUacZfsko
	KAyo+tXQbWsaEkQvUyHD0JO9O3yys6a9FyEpLPCc91nAo7tuaT/tS5o6SoEd9bUYnBpR2EQn+Ha+0
	wNzmiLzw0OrNs0IIVdNxkxrddwA3Tj9mdvxHLtScq7OzktNeK4G5zk50DkOgqhvZ1u5hKs+gd25P7
	FC3Tukwu4kBIiPgV+ytr5IyPbVzM9ryXJ/ByYAgF6fVnOAq2C+6EWRIVsWz6MpIlERDP1U80reqO6
	383H8gyiKnRBCTdvICYqhc8yGcCAGjdVmMge5aK9Ccv123KXmNnyXnx6p/pgQxN3JiKdTp5bkMvfi
	z8NKNdnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjzYy-0000000600v-3RHF;
	Fri, 30 Aug 2024 11:13:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjzUb-00000005yYM-2xg7;
	Fri, 30 Aug 2024 11:08:41 +0000
X-UUID: 32934d0c66c011efb3adad29d29602c1-20240830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UyRBBoZvs5yZx9ee1wQlM3Yzcbs7XG0PM0g15NAHr6k=;
	b=VQ6zC21BjAHL2ADw07ofbgtSxGKewqdmdJsymRcFTecF+MG6/xDL6GwSUbNyqwaP+wzsttgr6XEm6PedgGD0QpIAS1pw9a1CZUviLYRT9RqID4IZlehrTlKhWzPqX/tHWfgiEUgqYRDplGOjJlRrmpSVd22wLE3TeB8t3gj9Fkg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:c4d2a14e-262c-4323-9bf7-1219f252ef6f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:3f356fcf-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 32934d0c66c011efb3adad29d29602c1-20240830
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1064796112; Fri, 30 Aug 2024 04:08:34 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 30 Aug 2024 19:08:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 30 Aug 2024 19:08:28 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-leds@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Sebastian Reichel <sre@kernel.org>, Pavel Machek
	<pavel@ucw.cz>, Sean Wang <sean.wang@mediatek.com>, Lee Jones
	<lee@kernel.org>, Alexandre Mergnat <amergnat@baylibre.com>, Flora Fu
	<flora.fu@mediatek.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, "Sen
 Chu" <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2 5/7] dt-bindings: leds: mt6323: merge to MFD mediatek,mt6397 DT schema
Date: Fri, 30 Aug 2024 19:07:30 +0800
Message-ID: <20240830110732.30080-5-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240830110732.30080-1-macpaul.lin@mediatek.com>
References: <20240830110732.30080-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.873000-8.000000
X-TMASE-MatchedRID: pZGT1+TJBEa1DfGM6db7X7Gj3LN0+Ey9I9yVcHNDU7bo1+KnG60kJ0d0
	Rzx07LDVAE+AZVTHj3U5b8Cn2AtzZF0U3RPW+iLPhK8o4aoss8rljSRvSGpq3Fmmz7LVVfOpQ0U
	kLoLY8eZQnoa+pHlSjSRYcCcgpfWXvop7Aj3Fk4EMH4SsGvRsAx83WxJo1IH1bJknz+3f3aXET4
	xkmX4BvK2hFZjS5hc6FXEpsEnvAUxDeuA2fujoFQe06kQGFaIWfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtc20lvB2foahAByKL5N6oM/dme64tMkQaUW4CUJyXHz2zYHV6i90eh1Zca9RSYo/b
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.873000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BAD89263B4BD01370AC4A7538461DFC4BBBB5232013248BBBC92DB454517322F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_040837_810939_AAF8BA0C 
X-CRM114-Status: GOOD (  14.17  )
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

Convert leds-mt6323.txt to be compatible with DT schema.
Since this is a simple LED device node, merge it into parent
mediatek,mt6397.yaml. Subsequently, remove leds-mt6323.txt with a
separate patch.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../devicetree/bindings/leds/leds-mt6323.txt  | 63 -------------------
 1 file changed, 63 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-mt6323.txt

Changes for v1 and v2:
 - This is the first version of converting leds-mt6323.
   This is because converting leds-mt6323 together
   with mfd/mediatek,mt6397.yaml, so we've create a patch set
   instead of submitting single patch for each subdevice.
 - This patch has been made base on linux-next/master git repo.

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6323.txt b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
deleted file mode 100644
index 052dccb8..0000000
--- a/Documentation/devicetree/bindings/leds/leds-mt6323.txt
+++ /dev/null
@@ -1,63 +0,0 @@
-Device Tree Bindings for LED support on MT6323 PMIC
-
-MT6323 LED controller is subfunction provided by MT6323 PMIC, so the LED
-controllers are defined as the subnode of the function node provided by MT6323
-PMIC controller that is being defined as one kind of Muti-Function Device (MFD)
-using shared bus called PMIC wrapper for each subfunction to access remote
-MT6323 PMIC hardware.
-
-For MT6323 MFD bindings see:
-Documentation/devicetree/bindings/mfd/mt6397.txt
-For MediaTek PMIC wrapper bindings see:
-Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
-
-Required properties:
-- compatible : Must be one of
-  - "mediatek,mt6323-led"
-  - "mediatek,mt6331-led"
-  - "mediatek,mt6332-led"
-- address-cells : Must be 1
-- size-cells : Must be 0
-
-Each led is represented as a child node of the mediatek,mt6323-led that
-describes the initial behavior for each LED physically and currently only four
-LED child nodes can be supported.
-
-Required properties for the LED child node:
-- reg : LED channel number (0..3)
-
-Optional properties for the LED child node:
-- label : See Documentation/devicetree/bindings/leds/common.txt
-- linux,default-trigger : See Documentation/devicetree/bindings/leds/common.txt
-- default-state: See Documentation/devicetree/bindings/leds/common.txt
-
-Example:
-
-	mt6323: pmic {
-		compatible = "mediatek,mt6323";
-
-		...
-
-		mt6323led: leds {
-			compatible = "mediatek,mt6323-led";
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			led@0 {
-				reg = <0>;
-				label = "LED0";
-				linux,default-trigger = "timer";
-				default-state = "on";
-			};
-			led@1 {
-				reg = <1>;
-				label = "LED1";
-				default-state = "off";
-			};
-			led@2 {
-				reg = <2>;
-				label = "LED2";
-				default-state = "on";
-			};
-		};
-	};
-- 
2.45.2


