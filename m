Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23636C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 10:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0Ez5CO8feEkornp6QsB0akR30tYyS30jCTuChE+g3k=; b=XIQlVQz2IDySCDEMblayHPXqTO
	fdPbi0dx2xBs0vw09+F/niVCnClTVhrKSxqn5D1l8G7BTDQ0jECwyq4YWftZyOU0R14mPsuRbKyHx
	dyDNalzoEdQBCVF4Zjw+If16m6Hn2mi/lLFGnhjCR55JnoAbLxTVR/wM4kH50iPFRsYrGjpW3FMdb
	yC4GpAzmWknElrvlyYvJ4O0nShmANnD/Mc5jNQxUyCfxxoiQ/Qz1Df9fmn6Jqv8cWY8dBioXf4db9
	zR6wrkCHL0djRGpIP7T8Or5lLdKKuBxaApirVxe7woj5jNRUXxg4AOb+kTN+eiLJDMH5O+hrfulqd
	AWwWT2MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot4ny-0052he-Mx; Thu, 10 Nov 2022 10:29:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot4nw-0052cQ-5Z; Thu, 10 Nov 2022 10:29:06 +0000
X-UUID: 3cb61353eff149459c1c354510308bb3-20221110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=L0Ez5CO8feEkornp6QsB0akR30tYyS30jCTuChE+g3k=;
	b=bFNGnxslF6N5+Ac9kn+KoR8ionot5zHy82/3vY9e00BuS1ORUi6OYzlbMJnzyxmzHNymtkxInFrM1USnKdoTSa/DbwwPU2OvSfbxhvO+f/w3XRLhFvqxQkc4UGviuOPPgw64Rp7LW+JnpVnApJ0kOqcKJfbc3CblparohhY85T0=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:48c768fe-7d4a-436f-ba04-07be9e4b18f8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.12,REQID:48c768fe-7d4a-436f-ba04-07be9e4b18f8,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:62cd327,CLOUDID:c3692e5d-100c-4555-952b-a62c895efded,B
	ulkID:221110182854NKO7H6LP,BulkQuantity:0,Recheck:0,SF:38|28|16|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3cb61353eff149459c1c354510308bb3-20221110
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 811316512; Thu, 10 Nov 2022 03:28:52 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 10 Nov 2022 18:28:49 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 10 Nov 2022 18:28:43 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Rob Herring <robh@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
	<tiffany.lin@mediatek.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Daniel Vetter
	<daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,2/3] media: dt-bindings: media: mediatek: vcodec: Adding racing control register base
Date: Thu, 10 Nov 2022 18:28:33 +0800
Message-ID: <20221110102834.8946-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110102834.8946-1-yunfei.dong@mediatek.com>
References: <20221110102834.8946-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_022904_240597_13B6BE6B 
X-CRM114-Status: GOOD (  10.65  )
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

Need to add racing control register base in device node for mt8195 support
inner racing mode. Removing 'maxItems' and adding 'minItems'.

Adding description for each reg.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
compared with v1:
- add description for 'VDEC_SYS'
- add description for 'VDEC_RACING_CTRL'
- add description for 'VDEC_MISC'
- change maxItems -> minItems according to AngeloGioacchino's suggestion
- Fix dt_binding_check fail
---
 .../bindings/media/mediatek,vcodec-subdev-decoder.yaml    | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index 794012853834..9af58db294d3 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -61,7 +61,10 @@ properties:
       - mediatek,mt8195-vcodec-dec
 
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: VDEC_SYS register space
+      - description: VDEC_RACING_CTRL register space
 
   iommus:
     minItems: 1
@@ -115,6 +118,7 @@ patternProperties:
 
       reg:
         maxItems: 1
+        description: VDEC_MISC register space
 
       iommus:
         minItems: 1
@@ -154,6 +158,7 @@ patternProperties:
 
       reg:
         maxItems: 1
+        description: VDEC_MISC register space
 
       interrupts:
         maxItems: 1
@@ -195,6 +200,7 @@ patternProperties:
 
       reg:
         maxItems: 1
+        description: VDEC_MISC register space
 
       interrupts:
         maxItems: 1
-- 
2.18.0


