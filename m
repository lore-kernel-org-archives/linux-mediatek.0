Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64321C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 03:41:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B42760EFF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 03:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B42760EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hkJlg7OF1lMSAEoD9e9KjdX6lU1+3qbE+a+rugij7Dw=; b=CZQqwXrh1aEdK2
	DoB9d1/paUOwYM0HFV6ID9iqGDHraQsoDb/nIsbipxlzMstIX/9n+7RMsOH0BqQbgV//Wcx9ggoQD
	v71id0h6xgRpGNXdzkeCidOSRpMG7YDil5c7PC+ZSB8j4F4JUZmjoFSfhSyI7qJAJk1XN/1glvCLs
	yhFpdSGOcJxRx4mXkzgEJ29EYZLf+RTI4I7b7D6tAQJNJynWptBw2E3VJIsqsflmXmjEkuXu5JJYV
	cVZHhpfJvfRQ3hA91Q8URHkwbpkw236BoykuNIc8iPnlSfrtf7+5LziB8gfs/gYBtTHRJy5qKmv1C
	rYlOCeMFC5pAAqzZr6XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTc4v-00D0fi-8z; Fri, 24 Sep 2021 03:40:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTc3w-00D0Lu-Bq; Fri, 24 Sep 2021 03:39:50 +0000
X-UUID: 9f8ac829a83c497abdd3d754c406f8f0-20210923
X-UUID: 9f8ac829a83c497abdd3d754c406f8f0-20210923
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 833900495; Thu, 23 Sep 2021 20:39:47 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Sep 2021 20:39:39 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 24 Sep 2021 11:39:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 24 Sep 2021 11:39:38 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
 <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH v7 1/6] dt-bindings: remoteproc: mediatek: Add binding for
 mt8195 scp
Date: Fri, 24 Sep 2021 11:39:30 +0800
Message-ID: <20210924033935.2127-2-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210924033935.2127-1-tinghan.shen@mediatek.com>
References: <20210924033935.2127-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_203948_430439_B0FD7064 
X-CRM114-Status: GOOD (  12.35  )
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

Add mt8195 compatible to binding document. The description of required
properties are also modified to reflect the hardware change between
mt8183 and mt8195. The mt8195 doesn't have to control the scp clock on
kernel side.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
index 3f5f78764b60..d64466eefbe3 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
@@ -5,13 +5,15 @@ This binding provides support for ARM Cortex M4 Co-processor found on some
 Mediatek SoCs.
 
 Required properties:
-- compatible		Should be "mediatek,mt8183-scp"
+- compatible		Should be one of:
+				"mediatek,mt8183-scp"
+				"mediatek,mt8195-scp"
 - reg			Should contain the address ranges for memory regions:
 			SRAM, CFG, and L1TCM.
 - reg-names		Contains the corresponding names for the memory regions:
 			"sram", "cfg", and "l1tcm".
-- clocks		Clock for co-processor (See: ../clock/clock-bindings.txt)
-- clock-names		Contains the corresponding name for the clock. This
+- clocks		Required by mt8183. Clock for co-processor (See: ../clock/clock-bindings.txt)
+- clock-names		Required by mt8183. Contains the corresponding name for the clock. This
 			should be named "main".
 
 Subnodes
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
