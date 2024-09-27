Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430EACEBF76
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 05:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FZu0ZPTLpZWjX8yCbYqdxdHinvG8NnXZbGPHD2DiMCg=; b=L45rw802qTlVsF7Z2rIKPn3Hw3
	fa3TEk133TIadyoKAbV0cIWLgXO3vAikiVAcGDTophqfACgUT91KAzfnqgoSbGcT3JVhkZuqSW5/a
	erAHEUGTNucyC+Kj9il/teFGOcvuwD/FUOqqHXVnB8qpy6mOwQl4ZQrWrWYf9kpZ6E7HUE3FgNpew
	bb/Jxv1xLdGi0glxCeolH0WQiptMC5izaQjXZy7ociZSOXy24hBWpnynu+PneicEYIyawVLa1tLkg
	OVcOF2x0v4gFMQc0HXM/1RvBZNRsAZ71k+vq4BsLdKBcq4beO1BnsTBHSjRzDMe4sr/ngRuRBn25W
	ZVrFuhrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su3uJ-0000000A71z-0gW3;
	Fri, 27 Sep 2024 05:52:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su3tO-0000000A6q9-0QMv;
	Fri, 27 Sep 2024 05:51:52 +0000
X-UUID: 951181e47c9411efba0aef63c0775dbf-20240926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=FZu0ZPTLpZWjX8yCbYqdxdHinvG8NnXZbGPHD2DiMCg=;
	b=F13NfxBvUXOLvVc5TZ35BA+kQkDddvFPEHO72FuhfZ2r9qUkxtJAcdXAkXAy+pE38r+deuVs6ak0F0Jg8WYCcvWCgb0466JXBdz+BD0t8gx1jZ4SB+XmzYPwmm1MwDKoDE39xa4o+vSVaADO7waKey0vWQHqF5r5OhLPw1gYEaY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:25da3b8d-c1dc-410c-9c0d-3f8d0bc94998,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:77725618-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 951181e47c9411efba0aef63c0775dbf-20240926
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1259129289; Thu, 26 Sep 2024 22:51:46 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 27 Sep 2024 13:51:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 27 Sep 2024 13:51:43 +0800
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
	<linux-arm-kernel@lists.infradead.org>, Moudy Ho
	<moudy.ho@mediatek.corp-partner.google.com>, Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v2] dt-bindings: display: mediatek: split: add clocks count constraint for MT8195
Date: Fri, 27 Sep 2024 13:51:40 +0800
Message-ID: <20240927055140.19688-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_225150_410850_75965F16 
X-CRM114-Status: GOOD (  10.91  )
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

From: Moudy Ho <moudy.ho@mediatek.corp-partner.google.com>

The display node in mt8195.dtsi was triggering a CHECK_DTBS error due
to an excessively long 'clocks' property:
  display@14f06000: clocks: [[31, 14], [31, 43], [31, 44]] is too long

To resolve this issue, apply the limit by setting 'maxItems: 3' in MT8195
additional condition.

Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
--
The purpose of this patch is to separate the corrections for
MediaTek SPLIT CHECK_DTBS error from the original mailing list
mentioned below:
https://lore.kernel.org/all/20240924103156.13119-2-macpaul.lin@mediatek.com/

Changes since v1:
  - Adding functional descriptions and quantity restrictions.
---
 .../bindings/display/mediatek/mediatek,split.yaml           | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
index e4affc854f3d..bce1b8b866ce 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
@@ -57,6 +57,9 @@ properties:
   clocks:
     items:
       - description: SPLIT Clock
+      - description: HDMI RX Clock
+      - description: HDMI Metadata Clock
+    minItems: 1
 
 required:
   - compatible
@@ -72,6 +75,9 @@ allOf:
             const: mediatek,mt8195-mdp3-split
 
     then:
+      properties:
+        clocks:
+          maxItems: 3
       required:
         - mediatek,gce-client-reg
 
-- 
2.34.1


