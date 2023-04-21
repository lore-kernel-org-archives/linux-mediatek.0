Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A0BC77B78
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 10:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/XAwCB7RYfwLn3KM/ff3HebXoCyXF6+AnRXC40z1tg=; b=udApo1rIYQd+vrib5r4Jg1nbGL
	9/0xJtajHaApJMLQF3GEO3ufvjQugTvPYvcSSirAUQMTOwLo7Rnk361/71Irjy4W4K6lICVNzOMF0
	IGbTzRRwCPpqWeOC+A6n3sJjCutylj0YawkUkW+qf73erwBdcrIxF3x3p+KMDXh1z9mNUFnm7VV7h
	DTVQ8wFnxSvO3a8bQb7VMqEgxmZvvonbaHLl+fS82ZN4cMNCrArpWfVjFVJnwAmi6KpLrytnaz6S1
	Y3ufFv2UOxsCal35ApE8i+nNX1ozxrNRYy+dS/AEjBjFg+lIPk3DRZmmNnTXbyRNbA8LGlHzDm0mj
	kTx5O7qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppnim-00AREt-2N;
	Fri, 21 Apr 2023 10:10:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppnij-00ARBN-0N;
	Fri, 21 Apr 2023 10:10:26 +0000
X-UUID: b5506ac0e02c11edb7d8d11f642b8e78-20230421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4/XAwCB7RYfwLn3KM/ff3HebXoCyXF6+AnRXC40z1tg=;
	b=Io6IzqT8Un7Rb19L5hnnMNPWw7mxCuc3L1wnz8ZQ/doqrnyVXtXDMj4BmmbfzGuZQUjR5xYooh3mM1/qg+sAI0zGqiDJg/M9o8WxeTek5JgsE6mK6PRCousUCIZJ4zFJOSVSJw1IvLxVuSGQEmSVLykRWANbUza31WQlRHu5ZBk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:fbf47281-dd88-49ea-8621-abaca36c9a71,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.22,REQID:fbf47281-dd88-49ea-8621-abaca36c9a71,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:120426c,CLOUDID:d14ed284-cd9c-45f5-8134-710979e3df0e,B
	ulkID:230421180922NEPCYNDK,BulkQuantity:2,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: b5506ac0e02c11edb7d8d11f642b8e78-20230421
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1758199612; Fri, 21 Apr 2023 03:10:14 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 21 Apr 2023 18:09:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 21 Apr 2023 18:09:08 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 7/7] ASoC: dt-bindings: mediatek,mt8188-afe: add audio properties
Date: Fri, 21 Apr 2023 18:09:05 +0800
Message-ID: <20230421100905.28045-8-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230421100905.28045-1-trevor.wu@mediatek.com>
References: <20230421100905.28045-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_031025_174908_B0D1CFAF 
X-CRM114-Status: GOOD (  10.22  )
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

Assign top_a1sys_hp clock to 26M, and add apll1_d4 to clocks for switching
the parent of top_a1sys_hp dynamically
On the other hand, "mediatek,infracfg" is included for bus protection.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../bindings/sound/mediatek,mt8188-afe.yaml      | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
index 82ccb32f08f2..812e0702ca36 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
@@ -29,6 +29,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek topckgen controller
 
+  mediatek,infracfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the mediatek infracfg controller
+
   power-domains:
     maxItems: 1
 
@@ -52,6 +56,7 @@ properties:
       - description: mux for i2si1_mck
       - description: mux for i2si2_mck
       - description: audio 26m clock
+      - description: audio pll1 divide 4
 
   clock-names:
     items:
@@ -73,6 +78,7 @@ properties:
       - const: i2si1_m_sel
       - const: i2si2_m_sel
       - const: adsp_audio_26m
+      - const: apll1_d4
 
   mediatek,etdm-in1-cowork-source:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -147,6 +153,8 @@ required:
   - power-domains
   - clocks
   - clock-names
+  - assigned-clocks
+  - assigned-clock-parents
 
 additionalProperties: false
 
@@ -184,7 +192,8 @@ examples:
                  <&topckgen 78>, //CLK_TOP_I2SO2
                  <&topckgen 79>, //CLK_TOP_I2SI1
                  <&topckgen 80>, //CLK_TOP_I2SI2
-                 <&adsp_audio26m 0>; //CLK_AUDIODSP_AUDIO26M
+                 <&adsp_audio26m 0>, //CLK_AUDIODSP_AUDIO26M
+                 <&topckgen 136>; //CLK_TOP_APLL1_D4
         clock-names = "clk26m",
                       "apll1",
                       "apll2",
@@ -202,7 +211,10 @@ examples:
                       "i2so2_m_sel",
                       "i2si1_m_sel",
                       "i2si2_m_sel",
-                      "adsp_audio_26m";
+                      "adsp_audio_26m",
+                      "apll1_d4";
+        assigned-clocks = <&topckgen 83>; //CLK_TOP_A1SYS_HP
+        assigned-clock-parents =  <&clk26m>;
     };
 
 ...
-- 
2.18.0


