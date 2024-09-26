Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D689CCCFA13
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 09:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oDwqBP/L4CE+h/CDtWEObghX8nmjAsNYgbP9dPpytJU=; b=t9b0uRcmmfzvBLWyXg05p2aU9H
	hGq827NZI7zZACNkijNqSLBTId1aGHqigQUkrQwGxZusJIv/Zt2SvJDoq8nTKjGfDFm7O2ZUDB0a8
	ye6yjG0WKCSSqdlMoK4PGODkS9HFF0WsDFHhFoFUKdqTgI1rvrBX7LkDJj6jfLPrjEk6W5Y2Oi4W/
	KKliaDPyO5ticVeFj6HW3sdLCL8DYKnsJo9LtRk4ZvOSXoCyAkNl+mnbY12ikL814R9smalNoGlJr
	Zuk7PV+DtAaZ7r4CTXfgPoqoqPof/CE2tCbWaL+7wlP7vpHEvfwqQmXQH4rIYSMZ/4VpXnX+ED8U1
	rX6/t9uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stkpt-00000007tEV-30Nx;
	Thu, 26 Sep 2024 09:30:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stkkh-00000007s9O-1q8u;
	Thu, 26 Sep 2024 09:25:37 +0000
X-UUID: 4589e6da7be911efba0aef63c0775dbf-20240926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=oDwqBP/L4CE+h/CDtWEObghX8nmjAsNYgbP9dPpytJU=;
	b=kMhrKqKLdTVlGwuleoHOS0QJRYCktENW5sGa34aXYMGb7XWZi5NTI8KztDvC+etmocncDD83NlyYBdFz4/jOjaWKQkHjbe7UdxSRR2ji8ztO1mrOZx98wJOUMdR31r31uKfIy4IoY4csNI2Ozfz+ppugXnSSzHhWEj8qfR9HC4Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:ba143be2-e5c6-4030-84f9-b259f039173d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:92504a18-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 4589e6da7be911efba0aef63c0775dbf-20240926
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2065979526; Thu, 26 Sep 2024 02:25:29 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 26 Sep 2024 17:25:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 26 Sep 2024 17:25:24 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Eason Yen
	<eason.yen@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, Shane Chien
	<shane.chien@mediatek.com>, Hui Liu <hui.liu@mediatek.com>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-sound@vger.kernel.org>,
	Alexandre Mergnat <amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
Subject: [PATCH 1/3] ASoC: dt-bindings: mt6359: Update generic node name and dmic-mode
Date: Thu, 26 Sep 2024 17:25:17 +0800
Message-ID: <20240926092519.6556-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.525800-8.000000
X-TMASE-MatchedRID: bYL80fNZ5aZe0FYiuVD/cJdc7I2df+msGNMTWh+TA9tAFIabNAVEubwA
	mz0iQUL1swZGVwllZ3CO9NvhBeIuxCY0eULsNBXlcoieJFjVCFzKd5XQ/OcgS/gnJH5vm2+gnZO
	YcbQKzjzflJfhMyjEFWr2nwalHag8YnWYuJfXlIYve6W+IORwrWYDcO9PwyjmEd+K6O5Nt5125K
	XQ4QIGJhZDMUjKccymXmMyO3+ywbXHCChNBbZThQPZZctd3P4B8GRhP/nTHNa/7bplhbPCQuUs3
	x8L0Q/uYZL13BCaQFUI3Ie7XTN+kVxxDx5qbkR9FEUknJ/kEl7dB/CxWTRRu4as+d5/8j56yT91
	C87+F9Z1bjXdW+XMSBLyknfk+nKTzRTOip29IDDDa0xNKDTHvg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.525800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2C162E3ADAF287C4937519A1F5698887A909C9087B47FC7C751877881794C8752000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_022535_524094_8E7B746B 
X-CRM114-Status: GOOD (  14.66  )
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

Some fix and updates in the following items:
1. examples:
   Update generic node name to 'audio-codec' to comply with the
   coming change in 'mt6359.dtsi'. This change is necessary to fix the
   dtbs_check error:
   pmic: 'mt6359codec' does not match any of the regexes: 'pinctrl-[0-9]+'

2. mediatek,dmic-mode:
   After inspecting the .dts and .dtsi files using 'mt6359-codec', it was
   discovered that the definitions of 'two wires' and 'one wire' are
   inverted compared to the DT schema.
   For example, the following boards using MT6359 PMIC:
    - mt8192-asurada.dtsi
    - mt8195-cherry.dtsi
   These boards use the same definitions of 'dmic-mode' as other boards
   using MT6358 PMIC. The meaning of '0' or '1' has been noted as comments
   in the device trees.

   Upon examining the code in [1] and [2], it was confirmed that the
   definitions of 'dmic-mode' are consistent between "MT6359 PMIC" and
   "MT6358 PMIC". Therefore, the DT Schema should be correct as is.

References:
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/codecs/mt6358.c#n1875
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/codecs/mt6359.c#L1515

Fixes: 539237d1c609 ("dt-bindings: mediatek: mt6359: add codec document")
Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 Documentation/devicetree/bindings/sound/mt6359.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt6359.yaml b/Documentation/devicetree/bindings/sound/mt6359.yaml
index 23d411fc4200..128698630c86 100644
--- a/Documentation/devicetree/bindings/sound/mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mt6359.yaml
@@ -23,8 +23,8 @@ properties:
       Indicates how many data pins are used to transmit two channels of PDM
       signal. 0 means two wires, 1 means one wire. Default value is 0.
     enum:
-      - 0 # one wire
-      - 1 # two wires
+      - 0 # two wires
+      - 1 # one wire
 
   mediatek,mic-type-0:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -53,9 +53,9 @@ additionalProperties: false
 
 examples:
   - |
-    mt6359codec: mt6359codec {
-      mediatek,dmic-mode = <0>;
-      mediatek,mic-type-0 = <2>;
+    mt6359codec: audio-codec {
+        mediatek,dmic-mode = <0>;
+        mediatek,mic-type-0 = <2>;
     };
 
 ...
-- 
2.45.2


