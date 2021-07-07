Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE6BC07E9C
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 04:14:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A8E561375
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 04:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A8E561375
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZaBIfoFkOo7qtA5sLbsNJ0ua3g8j0UCX6fQQu/gADfE=; b=2lFkUBVHH3vYPo
	jTU1kgoZmtLWw0t+wy8CQOHIN7vrwwEsL7VjIoKZAzzNfihfnuFsyLF1NWkiuFO3+zXVcprRQAv68
	TIaWjwMoWhsLR4aBE46dLaqPocm9BOEM/np6+x/9s28tiFoxmiyr7qV8faJ2gCGVyVuwEG1/lcpw3
	F4rduQghc3V4GQj2xFalda6GMXrZPpwfHTNVtmhJ/qz4ovhOIQE4/HrLX7DKsIKyfHd0l+5B3HgtS
	5C4cP0o7272Jf+hDp1JMQUsUyo40QUpbP74UFpLxfxKrIZnjL3ufloCQtMD8c9aRUDwpMlKVLop0S
	71XzjB3h2SnA2WgpoT+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0ywX-00DJ5K-98; Wed, 07 Jul 2021 04:13:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0yvv-00DIt4-8h; Wed, 07 Jul 2021 04:13:13 +0000
X-UUID: cabcbfbe854f434bba3ce2148bf5fa5d-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=MBsEIWKU63aOv0ogWoQg1sclOhVcD/vJMSjghqAZ+hY=; 
 b=oLT3COJLvETkpffshAQr3YjfLz48eZyM/m67gvQqEFFtYKHbIHRJhSjVidPTCbPKUiZ24dRH7OJjEC7G25YsWSoe62Fc4PXALlZRbnWiyyBi1lLl3/ai7OtJFQqad3K/LG1rmtovwHhDlZDidirHYWDVqJHHDZ4zS9Oqgi+YN4U=;
X-UUID: cabcbfbe854f434bba3ce2148bf5fa5d-20210706
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1722006458; Tue, 06 Jul 2021 21:12:59 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 21:12:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 12:12:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 7 Jul 2021 12:12:56 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v1 01/17] dt-bindings: mediatek: add definition for mt8195
 display
Date: Wed, 7 Jul 2021 12:12:33 +0800
Message-ID: <20210707041249.29816-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_211311_371832_1E71FE00 
X-CRM114-Status: GOOD (  13.74  )
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

Add definition for mt8195 display and add DSC module description.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 .../bindings/display/mediatek/mediatek,disp.txt     | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index fbb59c9ddda6..a5859e7883d5 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -37,6 +37,7 @@ Required properties (all function blocks):
 	"mediatek,<chip>-disp-aal"   		- adaptive ambient light controller
 	"mediatek,<chip>-disp-gamma" 		- gamma correction
 	"mediatek,<chip>-disp-merge" 		- merge streams from two RDMA sources
+	"mediatek,<chip>-disp-dsc"		- compressing / decompressing image display streams
 	"mediatek,<chip>-disp-postmask" 	- control round corner for display frame
 	"mediatek,<chip>-disp-split" 		- split stream to two encoders
 	"mediatek,<chip>-disp-ufoe"  		- data compression engine
@@ -44,7 +45,7 @@ Required properties (all function blocks):
 	"mediatek,<chip>-dpi"        		- DPI controller, see mediatek,dpi.txt
 	"mediatek,<chip>-disp-mutex" 		- display mutex
 	"mediatek,<chip>-disp-od"    		- overdrive
-  the supported chips are mt2701, mt7623, mt2712, mt8167, mt8173, mt8183 and mt8192.
+  the supported chips are mt2701, mt7623, mt2712, mt8167, mt8173, mt8183, mt8192 and mt8195.
 - reg: Physical base address and length of the function block register space
 - interrupts: The interrupt signal from the function block (required, except for
   merge and split function blocks).
@@ -60,7 +61,7 @@ Required properties (DMA function blocks):
 	"mediatek,<chip>-disp-ovl"
 	"mediatek,<chip>-disp-rdma"
 	"mediatek,<chip>-disp-wdma"
-  the supported chips are mt2701, mt8167 and mt8173.
+  the supported chips are mt2701, mt8167, mt8173 and mt8195.
 - larb: Should contain a phandle pointing to the local arbiter device as defined
   in Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
 - iommus: Should point to the respective IOMMU block with master port as
@@ -195,6 +196,14 @@ ufoe@1401a000 {
 	clocks = <&mmsys CLK_MM_DISP_UFOE>;
 };
 
+dsc0@1c009000 {
+	compatible = "mediatek,mt8195-disp-dsc";
+	reg = <0 0x1c009000 0 0x1000>;
+	interrupts = <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH>;
+	power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+	clocks = <&mmsys CLK_VDO0_DSC_WRAP0>;
+};
+
 dsi0: dsi@1401b000 {
 	/* See mediatek,dsi.txt for details */
 };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
