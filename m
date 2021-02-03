Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF48AC433E9
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 08:38:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6300064F76
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 08:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6300064F76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D+aKIVwbhCJ5kPtE7TcZBj6WcCVzgW68ZaC2EI+afNs=; b=xWExTVXYCuVC0pL7+/30vWG2T
	TonL6c+Io0MFi7l/r1AlMTzC+iX1egHNTsDY/f7s9ll7i5A9DkHxYCIeZhIgEcSeTwUz7DTEHQKG6
	Fr7BNxSLivR6rSpOsQsqewGLqegC+GX5yefmJP/EnpkrisQrwcqtj4CBVyswQ/jTTWxsRHiC5M2d0
	gEazte5SB0WSCd9WFjYIdzdnwA9Vu0kOBXdufWTNuB9ht6tXGclSgnyIC0erfbtk3h0lg9Vkho3Cg
	WriP5aIdwDpe5ARKzkxPO6qA8U1pS/A/i7w1cWPJxI+oXzEzoViv3ZNVBNUPkjGVIkTRX7SjkEdS+
	98ZHFsZ6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7DgJ-0006QN-MC; Wed, 03 Feb 2021 08:38:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Dg7-0006Ka-Vo; Wed, 03 Feb 2021 08:38:25 +0000
X-UUID: 0853b367d1a146999845b2c20870a919-20210203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=l3vrcrLqPS1mUwNobGtVzn+5YDq5zYtVjVVRTho1mFo=; 
 b=DfihK7qmKYXM9YWqhRYWePTArJFQaNV5juYcv0sMPwJqhh9sQORcvnpvVFW6ST7BvdD137nKmGB0sGjyPMMVHB6pj0BjVIEIPjbD1LQGnhXzMdb/ueK65R+cxDiypjG7C3u4aej0whx7Dtjzk/KMlNIiBbZLwVVRIMPS8F14G+E=;
X-UUID: 0853b367d1a146999845b2c20870a919-20210203
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 103097588; Wed, 03 Feb 2021 00:38:17 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 00:38:05 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 16:38:03 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Feb 2021 16:38:03 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>,
 "Andrew-CT Chen" <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Fritz Koenig <frkoenig@chromium.org>, Tzung-Bi Shih
 <tzungbi@chromium.org>
Subject: [PATCH 3/5] dt-bindings: media: mtk-vcodec: Add binding for MT8192
 VENC
Date: Wed, 3 Feb 2021 16:37:50 +0800
Message-ID: <20210203083752.12586-4-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210203083752.12586-1-irui.wang@mediatek.com>
References: <20210203083752.12586-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_033824_241062_4D2ACC99 
X-CRM114-Status: GOOD (  11.75  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Maoguang Meng <maoguang.meng@mediatek.com>,
 srv_heupstream@mediatek.com, Irui
 Wang <irui.wang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Updates binding document for mt8192 encoder driver.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../bindings/media/mediatek-vcodec.txt        | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index e4644f8caee9..c7fac557006f 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -9,6 +9,7 @@ Required properties:
   "mediatek,mt8173-vcodec-avc-enc" for mt8173 avc encoder.
   "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
   "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
+  "mediatek,mt8192-vcodec-enc" for MT8192 encoder.
 - reg : Physical base address of the video codec registers and length of
   memory mapped region.
 - interrupts : interrupt number to the cpu.
@@ -128,3 +129,28 @@ vcodec_enc_lt: vcodec@19002000 {
     assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
     assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
   };
+
+vcodec_enc: vcodec@0x17020000 {
+    compatible = "mediatek,mt8192-vcodec-enc";
+    reg = <0 0x17020000 0 0x2000>;
+    iommus = <&iommu0 M4U_PORT_L7_VENC_RCPU>,
+             <&iommu0 M4U_PORT_L7_VENC_REC>,
+             <&iommu0 M4U_PORT_L7_VENC_BSDMA>,
+             <&iommu0 M4U_PORT_L7_VENC_SV_COMV>,
+             <&iommu0 M4U_PORT_L7_VENC_RD_COMV>,
+             <&iommu0 M4U_PORT_L7_VENC_CUR_LUMA>,
+             <&iommu0 M4U_PORT_L7_VENC_CUR_CHROMA>,
+             <&iommu0 M4U_PORT_L7_VENC_REF_LUMA>,
+             <&iommu0 M4U_PORT_L7_VENC_REF_CHROMA>,
+             <&iommu0 M4U_PORT_L7_VENC_SUB_R_LUMA>,
+             <&iommu0 M4U_PORT_L7_VENC_SUB_W_LUMA>;
+    interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH 0>;
+    dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+    mediatek,scp = <&scp>;
+    power-domains = <&scpsys MT8192_POWER_DOMAIN_VENC>;
+    clocks = <&vencsys CLK_VENC_SET1_VENC>;
+    clock-names = "venc-set1";
+    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
+    assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
+};
+
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
