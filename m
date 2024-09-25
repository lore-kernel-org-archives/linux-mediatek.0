Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D84CCF9E8
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 17:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QoTT/6NBpLK4C3nKaQBc7mw+Qc83kZKYIzQinskh5z4=; b=uT6V1cAphc3SoaPOgfCINY3oD4
	OtwqJNDOIpetpu/XjGlBh0LU2f+b04NQGS2pKv2Tr3fy/jv3HMk47olu2IqCWd5WY6BgWxWvsNmpL
	GgQCpgd1FUd1Q2FgFROdXmIegQT5o6HRWw+BlOlpRkyo/23AX0ykGIoFA39Bll9UsurjTp2OhOz1D
	wQNK/SbOIKgp+Wjk6yBPiorYv58toCef7pLhJvW9Hu+RJQaKxK3lpS/lxqCDN84zp4si+w9RROHN9
	oFc8KCUyFOH+WYbAk1L3Jw3+PBzYKc6+1K+XdUGmorT9GD1XOvWfRkAQ3zthX3kd4tnCLgo6cHpbX
	AJ5C0cIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stVa1-000000069rR-1kVi;
	Wed, 25 Sep 2024 17:13:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stVYp-000000069XE-1bE3;
	Wed, 25 Sep 2024 17:12:20 +0000
X-UUID: 4f7b02887b6111efba0aef63c0775dbf-20240925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=QoTT/6NBpLK4C3nKaQBc7mw+Qc83kZKYIzQinskh5z4=;
	b=E3YYUJP3qFE9CEzvkSi92QwQmgSvurO67cJMihMVaMXQhNG6Bu0BB0IjHL5eOAD+aoSbC6YEOER/of2D6ymuRTWRJ1GW/7LaKl6g3dCjiWBQ5DGwOU1imvfwFUTPSYwR4pudx4p3FaJPVGFuel+P6XDYteG/eL9VVm07iZE4WPU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:aec97752-dbbf-46a2-b1f2-1b2731aed4c6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:a478c2d0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4f7b02887b6111efba0aef63c0775dbf-20240925
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1980930512; Wed, 25 Sep 2024 10:12:14 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 26 Sep 2024 01:12:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 26 Sep 2024 01:12:08 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
Subject: [PATCH 1/2] dt-bindings: mfd: mediatek: mt6397: add adc and regulators for mt6359
Date: Thu, 26 Sep 2024 01:11:55 +0800
Message-ID: <20240925171156.9115-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.079200-8.000000
X-TMASE-MatchedRID: SsmlBu/h5g26lIBLPjRk6RWCVBr+Ay98wQ0CCpqVHSz98u70/pR9Gpas
	fA8Y/RCFDGo03EdVgDKjp64yUKGpZGaAyMVnPatL6/xAZojbl7cP4vBWNr0zgZsoi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNSjkRB+q9uV+Jsb3yTJxofTGAeY87hnlSO/NyqpYUkJBsqIjn1nHtvvMuU
	MG5xRFzczHQD4nSrHNeHsfn6gZqBMJzWjfPdXPzo7NPt9DnHpk82Gj2QC3yG0smXVK/H8eHzG7s
	r7xobSAsPEFD+rZA81DDKa3G4nrLQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.079200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B3DCA1ED930D0C66E8405AD4634D85CB39EA432A4B1306D31E1ACE828E230CF82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_101219_449564_96E45DB5 
X-CRM114-Status: UNSURE (   9.49  )
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

Since MT6359 PMIC has been added as one of the compatibles of
"mediatek,mt6397.yaml", the sub-device node of "MT6359 PMIC AUXADC" and
"MT6359 PMIC Regulators" should also be contained in this DT Schema as
well.

This patch includes:
 - add 'adc' property and $ref for 'mediatek,mt6359-auxadc'.
 - add 'mt6359-regulator' to the compatibles of regulators.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 953358bc997a..40cabaf60d0d 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -17,6 +17,7 @@ description: |
   MT6397/MT6323 is a multifunction device with the following sub modules:
   - Regulators
   - RTC
+  - ADC
   - Audio codec
   - GPIO
   - Clock
@@ -86,6 +87,7 @@ properties:
           - enum:
               - mediatek,mt6323-regulator
               - mediatek,mt6358-regulator
+              - mediatek,mt6359-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
@@ -95,6 +97,11 @@ properties:
     required:
       - compatible
 
+  adc:
+    type: object
+    $ref: /schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
+    unevaluatedProperties: false
+
   audio-codec:
     type: object
     additionalProperties: false
-- 
2.45.2


