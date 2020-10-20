Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAC0C388F2
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 17:43:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E69022223C
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 17:43:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z9W6VLqC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wdF9uoO+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E69022223C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+RbJll7LmfP0z1GMfBoQi3kmCm9qBSv38VA9ZTMPqVU=; b=Z9W6VLqCpXDbFsxp5WqnAAaSI
	N0gj5W7hO4Low21QsKSlojuMlRZA1JSBamJTTRp58y2ZjfzSwwUCabIxqF57TbRhODkm2d/g374SW
	8/D8zJOAhK9Oz3yLv/hP71Id8oKr5xieIdIcs1OfDXYhuRHKbDCvi8FpYTeKZ8Y7eEI5ZvzBkvCs6
	QS3j90HoDN0VTaP6AVE/NK+1b75XBU3XeVgzJJrfx7FAHg2B18WE2Fz+0T62VcYAfpYRk9DYOrscX
	LYYArU4R02q/0hvIvMz/hcFhy85Yfy8UeQux4hdeJk70qFTqcxAeeFD9Hjl1TH1Sj0Ed0k1SyK5UK
	XfWnNoE5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUvfP-0006Z2-C0; Tue, 20 Oct 2020 17:43:23 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUvf3-0006PR-HJ
 for linux-mediatek@lists.infradead.org; Tue, 20 Oct 2020 17:43:04 +0000
Received: by mail-wm1-x344.google.com with SMTP id e2so2937609wme.1
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Oct 2020 10:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WPldaAln0wKV7enamBXwVRl5MAfLsITQC/GnZaAj1po=;
 b=wdF9uoO+Ykbhxvbj/BpimI1WuFHEdYHMfvhomEaYkckQkI4DtzI3Dr/dLEZjcQeH61
 TRk+GZZuWg4DrKcU9BlaJP59g048zt5611B7itGSWHXYrjTwCTfLXo9cWlKuekgY5nqD
 F/Y9Srju0qajoPep+dnWtRxj+TIIc/6v7TTjeHY/qCzDyfC0wXVB24XYjeDA9guBd2T2
 NoFzhVNKNZ8Cr1sBnaulV99aq8LB6POuSCaCZQPmoKyRyDzowb6anbSOS3ac6FCrS5gz
 tj42kqp7bAFF+RTciFBlHkcSGW3kblhffsApqgY4Udc4K5gJ3Y8YgApx54/WsQYGhUZ1
 4SOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WPldaAln0wKV7enamBXwVRl5MAfLsITQC/GnZaAj1po=;
 b=afzrF6XSuHdrhy0rEtnXZocmhJQtdNjLmrcRHfFNSaRUVLks38t8T9uzOQkriaTA0R
 4QM3pHqwssmQDWLIzGFKKV5J2f/TFMT1DnjiVN+1NDVXjExNafMD5+t9Y/FC8D+kCeF2
 JrVcIBEZdXiuqGlMjcMKh71Ek54TBOcEEpOleWqzDllbEjDo3p02iOaU4ioRQMFBCdcn
 4DZuQkwAaVeRNFp91Upcw8IR0mqCP+Pya1GPrAi4Il385z7EUZxAgrl5rfVMyoS8hSM8
 jb1efFbBUuTUwUylBKTl9o5EHFPZXHp6kvMWh8arOacx/eYuHDVjbN/VK+QyPqghKzzg
 w8Nw==
X-Gm-Message-State: AOAM531chGhFyHb5HpV6sRVKUH6jZ+0RangkgE9RiEsrj+0sdAQ6Uehj
 lsv8WUUTMSUC4UBm4tSdzX+l4dm5rYJzBw==
X-Google-Smtp-Source: ABdhPJzc5f87ZwIDIbbgCVZgs9r3XrFUb0sfEhjseIGs62RR8xgLtEjhevlVDme05La0zhRYaSYRAA==
X-Received: by 2002:a1c:4c03:: with SMTP id z3mr3983936wmf.24.1603215779042;
 Tue, 20 Oct 2020 10:42:59 -0700 (PDT)
Received: from localhost.localdomain (199.170.185.81.rev.sfr.net.
 [81.185.170.199])
 by smtp.gmail.com with ESMTPSA id v123sm3297756wme.7.2020.10.20.10.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 10:42:58 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/8] dt-bindings: display: mediatek: disp: add documentation
 for MT8167 SoC
Date: Tue, 20 Oct 2020 19:42:46 +0200
Message-Id: <20201020174253.3757771-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020174253.3757771-1-fparent@baylibre.com>
References: <20201020174253.3757771-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_134301_595248_9CCDBA64 
X-CRM114-Status: GOOD (  13.34  )
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
Cc: chunkuang.hu@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding documentation for the MT8167 SoC

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,disp.txt    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index 121220745d46..33977e15bebd 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -43,7 +43,7 @@ Required properties (all function blocks):
 	"mediatek,<chip>-dpi"        		- DPI controller, see mediatek,dpi.txt
 	"mediatek,<chip>-disp-mutex" 		- display mutex
 	"mediatek,<chip>-disp-od"    		- overdrive
-  the supported chips are mt2701, mt7623, mt2712 and mt8173.
+  the supported chips are mt2701, mt7623, mt2712, mt8167 and mt8173.
 - reg: Physical base address and length of the function block register space
 - interrupts: The interrupt signal from the function block (required, except for
   merge and split function blocks).
@@ -59,7 +59,7 @@ Required properties (DMA function blocks):
 	"mediatek,<chip>-disp-ovl"
 	"mediatek,<chip>-disp-rdma"
 	"mediatek,<chip>-disp-wdma"
-  the supported chips are mt2701 and mt8173.
+  the supported chips are mt2701, mt8167 and mt8173.
 - larb: Should contain a phandle pointing to the local arbiter device as defined
   in Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
 - iommus: Should point to the respective IOMMU block with master port as
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
