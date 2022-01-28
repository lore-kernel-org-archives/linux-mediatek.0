Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0100C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 04:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XPAigQqGdIBpXv94jopRUIR0CXoHUAe1H8Yxgh8Qi/w=; b=P92Y+oDoikxME4
	aXLbmzsye20PViPv6j1HZ2wei58IQZOcKMPkHC6bIESaOxT7sbFKF6BezowEcYSexVpeXyJ8PbYOk
	6SA0tzR+4ZwIhlH6zRDZnG9B+91MtVaQlywU4B8639DdgD7vjplfSADhv0GwbeoTwXYRRmCqL7FRd
	ChsVdxP0jyPPhU0PEnXdf06qjp4jKJcRDCGHK1pQGi0lPqbfcK/n98OKxewXBsXtg/e41w1d4PZPk
	BmRAq8d45tPuKynRa6SFGf8CQEWP5nTY9Q1Tt/mIqHPhbiRiPfPV7aunGZ+XADB5qr6xWRD3SwOpx
	cs6/2BdL536RWD6op+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDIXh-000HPp-KY; Fri, 28 Jan 2022 04:07:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDIWg-000H0V-Cw; Fri, 28 Jan 2022 04:06:20 +0000
X-UUID: 3a84401d9ffb4ac78a82f6de6de5b694-20220127
X-UUID: 3a84401d9ffb4ac78a82f6de6de5b694-20220127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 164451210; Thu, 27 Jan 2022 21:04:47 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Jan 2022 19:54:46 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 28 Jan 2022 11:54:44 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Jan 2022 11:54:43 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>, Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang
 <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,
 1/7] dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for lat
 soc
Date: Fri, 28 Jan 2022 11:54:34 +0800
Message-ID: <20220128035440.24533-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128035440.24533-1-yunfei.dong@mediatek.com>
References: <20220128035440.24533-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_200618_552504_EE06B079 
X-CRM114-Status: GOOD (  10.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Adds decoder dt-bindings for compatible "mediatek,mtk-vcodec-lat-soc".

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/mediatek,vcodec-subdev-decoder.yaml | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index 6415c9f29130..a3c892338ac0 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -189,6 +189,55 @@ patternProperties:
 
     additionalProperties: false
 
+  '^vcodec-lat-soc@[0-9a-f]+$':
+    type: object
+
+    properties:
+      compatible:
+        const: mediatek,mtk-vcodec-lat-soc
+
+      reg:
+        maxItems: 1
+
+      iommus:
+        minItems: 1
+        maxItems: 32
+        description: |
+          List of the hardware port in respective IOMMU block for current Socs.
+          Refer to bindings/iommu/mediatek,iommu.yaml.
+
+      clocks:
+        maxItems: 5
+
+      clock-names:
+        items:
+          - const: sel
+          - const: soc-vdec
+          - const: soc-lat
+          - const: vdec
+          - const: top
+
+      assigned-clocks:
+        maxItems: 1
+
+      assigned-clock-parents:
+        maxItems: 1
+
+      power-domains:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+      - iommus
+      - clocks
+      - clock-names
+      - assigned-clocks
+      - assigned-clock-parents
+      - power-domains
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
