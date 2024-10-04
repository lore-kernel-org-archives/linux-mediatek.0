Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B87FCFA741
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 03:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VvjdcvSMzu1NzlXSVqjDNCOu/6ZcirnM6M+SY+eZT3c=; b=TykjzADqq/Sqhr4VO3MOFpvKFx
	HfqeShmjLQOyF+lvNknjfcpE7fBI6LI/Nc9gr0tC8riKy/InJooVk9emB4gq3LzEd15jj6NaeIzPy
	FKK6IeO7v3Altg1E66nSDKXrAz9chXrYUjB93OZINrSdxgmbsDEkzJ+NHy//AFV7KiN+s+hX6rgVs
	3bjnnEwys9FXVlzALTuTnO5P3OIT0XvwUpyVtfuZx6uvqS0arTMcYr4TN5kJxycOW2ooanYFZhdiO
	KbF/A/UEyKs784/4waKmbs1Dz8o2KK21aVK2t76jsACixW622ByJrPQ5KA2EHETKVZgBWgsIjcgkL
	CPFqlgHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swYlm-0000000AvqN-0Ktw;
	Fri, 04 Oct 2024 03:14:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swYkV-0000000Avj7-1ijV;
	Fri, 04 Oct 2024 03:13:00 +0000
X-UUID: 8aa0134681fe11efb3adad29d29602c1-20241003
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VvjdcvSMzu1NzlXSVqjDNCOu/6ZcirnM6M+SY+eZT3c=;
	b=C7MJCK6sLGK1cppmofpZcCefOwiPKEJC9Lw/wkBaL/DGoKaWA4crR2F3kVLmDzNsBanPFsNOOVKMKAse3qWIl/Ltq2F1O0xLQMQTgo9rh+MjhEmT4GFhGNPMnvo6OLVCuJMEKFtO4h+a/29bRdEVDPat3IDSXOmYDRtxcyxhSfQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:6cc76307-cbb1-4658-958a-39da676c6ab3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:5469ba40-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8aa0134681fe11efb3adad29d29602c1-20241003
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 443596673; Thu, 03 Oct 2024 20:12:51 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 4 Oct 2024 11:12:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 4 Oct 2024 11:12:47 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "jason-jh . lin"
	<jason-jh.lin@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v4] dt-bindings: display: mediatek: split: add subschema property constraints
Date: Fri, 4 Oct 2024 11:12:45 +0800
Message-ID: <20241004031245.27514-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.848600-8.000000
X-TMASE-MatchedRID: ppgmZow9zj872d2F4DOSZIzb2GR6Ttd3MZm0+sEE9mtb6PBUqmq+Utdh
	dhqLxa0jj6kCfX0Edc5fvtuIsaf1Zbf0EuHoGRzu/IBH0OAL+EeusS9CiBzL8VSkag5D7Fg8O0i
	2vQl58jgZoBsQWiqLArpjAjMHHtZlHxPMjOKY7A8LbigRnpKlKZvjAepGmdoOaew8IIiXgAvvAG
	R1wjdU/A80WibzltluWeLosublKiwBfIYXHLfYyidcSTc3nswYRatHJpnW/fwOfN/N+ZGstJSM0
	+ojvAiRSZrfNhP3sgUBh9AgBSEFrJm+YJspVvj2xkvrHlT8euJ0YHKn7N1oOA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.848600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F999A5621F1EC90E4B23B8EC631DC0308D8698A43EF295547A1B5EAC66FD31752000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_201259_478663_FD7E9605 
X-CRM114-Status: GOOD (  10.06  )
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

The display node in mt8195.dtsi was triggering a CHECK_DTBS error due
to an excessively long 'clocks' property:
  display@14f06000: clocks: [[31, 14], [31, 43], [31, 44]] is too long

To resolve this issue, the constraints for 'clocks' and
other properties within the subschema will be reinforced.

Fixes: 739058a9c5c3 ("dt-bindings: display: mediatek: split: add compatible for MT8195")
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

--
This is based on [v2] dt-bindings: display: mediatek: split: add clocks count constraint for MT8195

Changes since v3:
  - Correct the compatible name for the mt8173 split in the subschema.

Changes since v2:
  - Revise the commit message.
  - Enhance the descriptions of 'clocks'.
  - Strengthen the conditions within the subschema.

Changes since v1:
  - Adding functional descriptions and quantity restrictions.
---
 .../display/mediatek/mediatek,split.yaml      | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
index e4affc854f3d..87f8477a7be8 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
@@ -57,6 +57,9 @@ properties:
   clocks:
     items:
       - description: SPLIT Clock
+      - description: Used for interfacing with the HDMI RX signal source.
+      - description: Paired with receiving HDMI RX metadata.
+    minItems: 1
 
 required:
   - compatible
@@ -72,9 +75,30 @@ allOf:
             const: mediatek,mt8195-mdp3-split
 
     then:
+      properties:
+        clocks:
+          maxItems: 3
+
+        power-domains:
+          maxItems: 1
+
       required:
         - mediatek,gce-client-reg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8173-disp-split
+
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+        power-domains:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.34.1


