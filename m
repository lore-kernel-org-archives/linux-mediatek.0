Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC53CF34C4
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 03:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I5K+nSN5T2E6nZK8faQwTndLJFZXOZd9+jaIpIgcUmI=; b=SxrsTHy7ndUSYXDZDWY/aiwQl5
	fDeYJUeY0MMIuSNgAUkDQ0AR6i7I+O8sbfSIprBWWGDhGEn6j/S+7MBsVOGq+YNQ1E/XbOZ9yKVbR
	iFLrBJaQ0g1aOdm2Cwhuz5Ivs/yNuxQW5Q2x+je9GsY6sU1UyQzDigOwYrePzzgB8OjEn2kFLgGmg
	W4lWvG5PmZPwVV/eQS8DuuwuQhGdDk02L0PMttrhF4xgNmwsp1mhfAlqGY3UmWkEzOugs2a0JUydv
	4LbahXD8vrVxggUrqZhvoPBxAdnraVYMbTk/HYrQGHKM64gaMP5SFiICKQJe8cPYckmtJkl2Mnfnb
	gUmI+Zxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swYcZ-0000000AuqM-097K;
	Fri, 04 Oct 2024 03:04:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swYa4-0000000AuVQ-2NY1;
	Fri, 04 Oct 2024 03:02:14 +0000
X-UUID: 089e49ae81fd11efb3adad29d29602c1-20241003
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=I5K+nSN5T2E6nZK8faQwTndLJFZXOZd9+jaIpIgcUmI=;
	b=JtxXIg4se85SUpMfFG/MS9btK5uNS+KI/iGLan25sATf+ad+KRzf2qwAXFPyD9ODpPXXKi42xEaxnu1po6btao0EZB3kw4bIX2Eu/HjMaGtKwVBP03hsxE/k5z1FVoaSFOU+MvKJLZ2+YQOWhbbSLyfeIEVPhFmrHYEGENBGId8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:57b07a2e-443c-4b43-89f7-15857c59c8e5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:4c38ba40-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 089e49ae81fd11efb3adad29d29602c1-20241003
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 336587949; Thu, 03 Oct 2024 20:02:04 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 4 Oct 2024 11:01:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 4 Oct 2024 11:01:59 +0800
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
Subject: [PATCH v2 1/2] dt-bindings: mfd: mediatek: mt6397: add adc, codec and regulators for mt6359
Date: Fri, 4 Oct 2024 11:01:47 +0800
Message-ID: <20241004030148.13366-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.650800-8.000000
X-TMASE-MatchedRID: 4TOfFruLyYi6lIBLPjRk6RWCVBr+Ay98wQ0CCpqVHSz98u70/pR9GipO
	gudjiL0DF8NKa4AxCmBzNWqZAVqAAh9J5bZqJbIJvHKClHGjjr0W40XiUkbrG9zOQo7mTgA+cCE
	8iA5iVa0ZoBsQWiqLArpjAjMHHtZlHxPMjOKY7A8LbigRnpKlKWxlRJiH43972G1cTkcL58gA5L
	rtblF1DqM775K4TBnPkhIGp65r72JaobKNZg9nXg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.650800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3EB65091C26E2076BB07561CB10BB184BCAB13156FBE39F3D07547B13E47422F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_200212_807971_990A620E 
X-CRM114-Status: GOOD (  10.15  )
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
"mediatek,mt6397.yaml", the sub-device node of "MT6359 PMIC AUXADC",
"MT6359 Audio Codec"  and "MT6359 PMIC Regulators" should also be
contained in this DT Schema as well.

This patch includes:
 - add 'adc' property and $ref for 'mediatek,mt6359-auxadc'.
 - add 'mt6359-regulator' to the compatibles of regulators.
 - add 'mt6359-codec' to the compatibles of audio-codec.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml          | 8 ++++++++
 1 file changed, 8 insertions(+)

Changes for v2:
 - Rebase on top of the DT schema conversion patch V8 (should be final version)
   without adc, audio-codec, and regulator.
   [1] https://lore.kernel.org/all/20241001104145.24054-3-macpaul.lin@mediatek.com/
 - Add 'mt6359-codec' to the compatibles of 'audio-codec' property.
   Please help to review it again.

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 95e9566fc535..35c4bc199b4e 100644
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
     description:
@@ -106,6 +113,7 @@ properties:
         oneOf:
           - enum:
               - mediatek,mt6358-sound
+              - mediatek,mt6359-codec
               - mediatek,mt6397-codec
           - items:
               - enum:
-- 
2.45.2


