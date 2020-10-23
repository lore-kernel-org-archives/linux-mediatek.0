Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1781C4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 13:32:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30D7E208E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 13:32:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A6A86iss";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GS5fOfQI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30D7E208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ISQoJVyyEgyOJGsWig6Et4A5jLbFo+54A3VconVYIAI=; b=A6A86iss5Jll6SNdM02uzXuwR
	NW36fIQw1vc2dmtBPdDVl3eKh1YPWNY81+jZMPbiItjLVBmCOjhspcRk9Xw80Kl4Ep+mR+MiFy0o1
	oZt6gxJuKaVJxXL/Pocn6BIcpRX45rMoV/V6ftiZc3DEtLS205SONVSuEqmkOrCcVXRnlfqhfBNVC
	3Rv61+upkeGtyRLxnKrFT1qxTyzcBKMJFF6szGM5ZVgW82BNdH7EQx6+oE6HqQT0sNdHX1YJCctIp
	MeAoNx6vfz52H/HVNWLQWwChTrO6QXs4pMq2ty/cGok1dkwMB8kg3c5dgc3xek69gLwMLy3xuOFvE
	fZkwRKE7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVxAn-0003n0-Oy; Fri, 23 Oct 2020 13:32:01 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVxAP-0003bx-Dk
 for linux-mediatek@lists.infradead.org; Fri, 23 Oct 2020 13:31:39 +0000
Received: by mail-wr1-x444.google.com with SMTP id n18so1847473wrs.5
 for <linux-mediatek@lists.infradead.org>; Fri, 23 Oct 2020 06:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZZZhZb2rEz5fHuVG55QJOamqxxRM5CUTX2itYU5vANI=;
 b=GS5fOfQIIw3GAMYSybwFZT5Uml1Gn5gqpzXW88Ram1s3RNRCBylCYem2I1Wg7k5rL0
 EXZ8Npi3dbjRFjfNP3pY5jMVq2AVTQMvmFmz4rQn0+cWxvIgA7HI62U+yAX19Gzoz1xi
 EVIvDLb0VwGihRMVDBYY2DvsDkFRbmi0oqqFNuHl83mxxz94pi6TOu82iJIKSJA+Nb8C
 16s7BFs1f/gOM3djshd+VuHkUmMe2vffHtBmY+e8+73QJ2tnVsDgvl/8LawF+g7nxiC+
 5PW872nYyg7HAzjeGNHgwzWZlaNaAmi8xWu46qcK3GB90sluZ5kwmfaJqEkgtdN2lzvO
 0Dbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZZZhZb2rEz5fHuVG55QJOamqxxRM5CUTX2itYU5vANI=;
 b=Gdo759jyH0AtsOp3oEuWUAT9Uit4Sl9PvG4UL/kT+2NZDgJIlZ+XN9Ee5G1RM/burF
 NsVXjyt7OQ0HJFBSAPBpUBNvP0YnbBTGB2GkYMP/E7LBB51QK9rgUwr3vRiHoPm+k+aC
 2td8IE5llf+pP/WXZf58KNNZF/rmpGYfgcidp1GVrOQdI/kQHEDnUL6wN21siF5VqQFQ
 OCWJ7vR2H36ED5AaYGludNh7J5t/WFlwjFNb8Y1BMPZx9C6PlMz09r83zlcfQe/zTh1D
 SWu/WEi/D8vNnvLi+0srGyCBm6l0pvNimYecOV0wCavTGsOmxoH+avBNwxDPwecNw1Y3
 Xn3A==
X-Gm-Message-State: AOAM532bqm0VIrcSGKzJrev7ld+AD/Cvssj9/6sPWuYS1TnU5/lDRLhD
 kau4EttIEWR1NQh0j9Clu5mQpGfJ12XSGQ==
X-Google-Smtp-Source: ABdhPJzqrOGaTf+kRDwUvFhLf41amL9nkhiLntJO+SJUCOhPk4RcEpRuGLBe5yMpJi6sbEOlMwjURA==
X-Received: by 2002:a5d:448b:: with SMTP id j11mr2574289wrq.129.1603459896327; 
 Fri, 23 Oct 2020 06:31:36 -0700 (PDT)
Received: from localhost.localdomain (211.160.185.81.rev.sfr.net.
 [81.185.160.211])
 by smtp.gmail.com with ESMTPSA id f6sm3146107wru.50.2020.10.23.06.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 06:31:35 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/5] dt-bindings: display: mediatek: disp: add
 documentation for MT8167 SoC
Date: Fri, 23 Oct 2020 15:31:26 +0200
Message-Id: <20201023133130.194140-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023133130.194140-1-fparent@baylibre.com>
References: <20201023133130.194140-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_093137_483167_791B81D5 
X-CRM114-Status: GOOD (  12.66  )
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
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---

Changelog:

V2: No change

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
