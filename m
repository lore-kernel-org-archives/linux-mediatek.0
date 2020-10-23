Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F3FC4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 13:32:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8630F20795
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 13:32:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dpnvMjaL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="K/0t+tb4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8630F20795
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5s9dSJUROMjwImcEDWwORZwxiGLklFdnIHy75Kljc9k=; b=dpnvMjaLhuNHXRk/6RZ5ORf+S
	yvGlt0vDO0eUj2jjHIHQtYu2mlYQV7A+SoHE9wJxUP4Iz299UpZYuwHqV9CuANng4GLNLQ5OLaskl
	mpzcRXl/yhSR1BJ5aXy/q9MtEKX+4vRN8fzEPRhXQFnYB1K73NYpyarzmfkhfMMDXoD2S6A4AgYzh
	d2PFqVi97WOzpWFC348JHX1l3N6DZdGoPH6PlKZh4+bIzKPcUhDNQuEZK8zK/AjjNYkwOaNcNIIQ1
	amdrXkyQSRLSEFk9mpEaTbG7h12UZ2cIvYySs8aALqhUv+lAx19Uxt2fvVErCur3IDYuBFCEfMoCT
	zTs3XAUNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVxBN-0003zh-OQ; Fri, 23 Oct 2020 13:32:37 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVxAU-0003f7-Rr
 for linux-mediatek@lists.infradead.org; Fri, 23 Oct 2020 13:31:47 +0000
Received: by mail-wm1-x343.google.com with SMTP id a72so1477107wme.5
 for <linux-mediatek@lists.infradead.org>; Fri, 23 Oct 2020 06:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CEIQEN0FiX78PtyGPLU6UM8Z2jaXBw6a+LxRvgLs6c0=;
 b=K/0t+tb4Wog9jbcWVMxLS+5RCOWuTowML4Yhf8SUgfVAQaKXXPIJ1KwIOrJlUwYqxb
 WkSynxXMb8x8hbXWJPNxxI+6ehjbVApy+BPpsR93Obz46GgBgtwfhv6QddDGUo59xfcV
 8VPKf0A3hqGTfidaD6+sxboQ9qfaJ/oMmf2v2M9t+UqEBj/bSDGOKPjwE6z5x/Yco93j
 aUeKJPNYvRmSAoiEq1oGdmlNsKT2jIpvF2gT66z3ngcpr8RcX5xalNI7MfQr/uXdK99X
 n9Uknh0ci0hhlNrFwq+EKxnFwmuoz9X8X3u2tySUbYKkVjdqeDwnadO8P2d9vZC7ab9Y
 wGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CEIQEN0FiX78PtyGPLU6UM8Z2jaXBw6a+LxRvgLs6c0=;
 b=temRItVwoKB9iWzHB7u9V5JZcjmIA0a4kqqDUQXdtcw1/8xj5MXYNXPOaPj76Iv0lE
 r7tDHCs7RhmZ8IgUwk3AFJOp/QCnFZUDDLGJPsVhyMlHM0LPpH7K4b4E38+x3ouY9ku1
 JY7jOULabtwHi4Hzcs90KWSUC2geS2afuPCw3b9T+/JW9EXBSfiYcm3DCVd96Aq9IpMS
 aY/fq0nLwCMiZTnNqW70r8cd869KbIh4MpdvMoHCQBFY22o5zFpZUbsBldpSrAIjZ6Bw
 r97kT/oXac37ckbpzq4UHEynOlhfrVwVLzmv5dAKHhXImb/jNLL4sjpW/iOrZ2kykzuZ
 K4+Q==
X-Gm-Message-State: AOAM533m9IJyX6L9GCCVipeCtK5Mf9GQ1pyZT4tuWVjkN7iiQ5Y4K6oA
 fazZCMel/px/8ov9dLbGrwx4im8QAgu90g==
X-Google-Smtp-Source: ABdhPJyfkaJrUDUwQgeF3HxVQWlJt1iTJtu5s+b5Rq1uR/Z8v+wI/Knb1pA8CmTrO1TaadRdqa+kOg==
X-Received: by 2002:a1c:5401:: with SMTP id i1mr2316512wmb.124.1603459898104; 
 Fri, 23 Oct 2020 06:31:38 -0700 (PDT)
Received: from localhost.localdomain (211.160.185.81.rev.sfr.net.
 [81.185.160.211])
 by smtp.gmail.com with ESMTPSA id f6sm3146107wru.50.2020.10.23.06.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 06:31:37 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/5] dt-bindings: display: mediatek: dsi: add documentation
 for MT8167 SoC
Date: Fri, 23 Oct 2020 15:31:27 +0200
Message-Id: <20201023133130.194140-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023133130.194140-1-fparent@baylibre.com>
References: <20201023133130.194140-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_093142_974528_8F0A5D82 
X-CRM114-Status: GOOD (  13.50  )
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

Add binding documentation for the MT8167 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

Changelog:

V2: removed part that added a new clock

 .../devicetree/bindings/display/mediatek/mediatek,dsi.txt     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
index f06f24d405a5..6a10de812158 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
@@ -7,7 +7,7 @@ channel output.
 
 Required properties:
 - compatible: "mediatek,<chip>-dsi"
-- the supported chips are mt2701, mt7623, mt8173 and mt8183.
+- the supported chips are mt2701, mt7623, mt8167, mt8173 and mt8183.
 - reg: Physical base address and length of the controller's registers
 - interrupts: The interrupt signal from the function block.
 - clocks: device clocks
@@ -26,7 +26,7 @@ The MIPI TX configuration module controls the MIPI D-PHY.
 
 Required properties:
 - compatible: "mediatek,<chip>-mipi-tx"
-- the supported chips are mt2701, 7623, mt8173 and mt8183.
+- the supported chips are mt2701, 7623, mt8167, mt8173 and mt8183.
 - reg: Physical base address and length of the controller's registers
 - clocks: PLL reference clock
 - clock-output-names: name of the output clock line to the DSI encoder
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
