Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61FADC388F7
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 17:43:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9C8721D6C
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 17:43:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rMK9CR3O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zWcQSDXl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9C8721D6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vqbkjpiWwtKxsP4ibyBcXhugGAPfXFt0F5tfE0G0txU=; b=rMK9CR3O9xIur/CrT2/uyiL1w
	6eNx9FgasLDwyUeA/A0RwJigcdO0f4vTK8Yat03jG++R5KNvLw7nRuN+PMqfk8YebP9j6jKwPfb64
	3104H+/XH5QW3Vf202Ab2tyck+NOSFZkhN9eNWM2VxmDwAavli096cxKk1owKvAmN9qKihR48TAmS
	XoCclNEJwO/c1igcESTeQH0/BbHfD+KARdshHLV39HCpr4VeiqZfIZsfKA3hn4Epa/ILcOyystmSf
	eLajrpMj/OTJFyTAqsNwtfUlu3NeWuSmxawWUKkLhznb05ZbsPZM98ckUrh+YhWiBD1up1j3Zaa+E
	JcyzxgeYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUvfO-0006Yg-Jd; Tue, 20 Oct 2020 17:43:22 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUvf3-0006Q4-Sq
 for linux-mediatek@lists.infradead.org; Tue, 20 Oct 2020 17:43:04 +0000
Received: by mail-wm1-x341.google.com with SMTP id d3so2927007wma.4
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Oct 2020 10:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g4H4mc6v2t0oOJX5XSAB3K/LcyD6Rk2g297NTsU0GuU=;
 b=zWcQSDXlGP/96zUAfH5qPzycQ/AK5pvGi5nwVMEHX2j4ynLCXSTLE9qp2r/ZgqpVUR
 HA4D1J8T985dXMnBot5cPB28dimAo8DbYhVpKNYcT1r16Dp5UCWtXkC7BhzEAmk6lA2g
 LpHwQfBiC//6+oOIGn6NZOgytNPgkOhkrdzAhDd/Ff3HFLkWlrnIZt4BF44SrQs54cRx
 StyTw8GWO+LWjQ83yf9x00GL0dvfB3wxR/joYpUni8MOUFzJyYVcAffIhlF8gMBjZJun
 aWGPqjxjC2VoTAS83J6nVKBM90FEti2y28QHrYBcXLGmR3o0dUCskFCU3YFDFYZAOM2K
 +J9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g4H4mc6v2t0oOJX5XSAB3K/LcyD6Rk2g297NTsU0GuU=;
 b=MO/PivX4SSvEVwOJGcOXvOLM0QZ6mSuKdPhaPWdw8+39o5wSVkFyusho1YdCptTEfs
 6nBo8NjOAQVuRtEo6+Lr1GKA0fzb+SuebdUQctb6oUu+KMfOwgUHm7v1NVof6a4fzYfA
 DqGp1bVnk0hfwwGm9gnssI5j69sp3MSqqeoqv30hn0SMJdpmP2A3jBbBHxhnZoEPLn74
 riSNQ1AnCDZF+EMyjIC107FyElExu+fF3JVPTJONcDXjcL4T6M7YepCjEgxAwhX0auTK
 3PoCllHJDx3+oR1d12kXS3DO2myKkg885234cqwURU7qX7HFsekmMQ2B84JFxaOFL4Dk
 Ub9w==
X-Gm-Message-State: AOAM53303tTRcvgyr9NjuLvaWk7d5O8COvNXGMXxntb4nbMpjemkSYuR
 OVrlN9zjrASqbuO/uiRY1Vnw+Bk4Fqubyw==
X-Google-Smtp-Source: ABdhPJzkT8+U0NpjdVHnhaATbgwrjwpAwrtedA64YWHG7Oi+SvHzjUWaApwcG7WmvLCZ+XbT8s7K3g==
X-Received: by 2002:a7b:cd85:: with SMTP id y5mr4068624wmj.168.1603215780592; 
 Tue, 20 Oct 2020 10:43:00 -0700 (PDT)
Received: from localhost.localdomain (199.170.185.81.rev.sfr.net.
 [81.185.170.199])
 by smtp.gmail.com with ESMTPSA id v123sm3297756wme.7.2020.10.20.10.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 10:43:00 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] dt-bindings: display: mediatek: dsi: add documentation
 for MT8167 SoC
Date: Tue, 20 Oct 2020 19:42:47 +0200
Message-Id: <20201020174253.3757771-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020174253.3757771-1-fparent@baylibre.com>
References: <20201020174253.3757771-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_134301_957337_A089E7AF 
X-CRM114-Status: GOOD (  12.01  )
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

Add binding documentation for the MT8167 SoC. The SoC needs
an additional clock compared to the already supported SoC: mipi26m.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsi.txt  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
index f06f24d405a5..10ae6be7225e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
@@ -7,12 +7,13 @@ channel output.
 
 Required properties:
 - compatible: "mediatek,<chip>-dsi"
-- the supported chips are mt2701, mt7623, mt8173 and mt8183.
+- the supported chips are mt2701, mt7623, mt8167, mt8173 and mt8183.
 - reg: Physical base address and length of the controller's registers
 - interrupts: The interrupt signal from the function block.
 - clocks: device clocks
   See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
-- clock-names: must contain "engine", "digital", and "hs"
+- clock-names: must contain "engine", "digital", "hs"
+  Can optionnally also contain "mipi26m"
 - phys: phandle link to the MIPI D-PHY controller.
 - phy-names: must contain "dphy"
 - port: Output port node with endpoint definitions as described in
@@ -26,7 +27,7 @@ The MIPI TX configuration module controls the MIPI D-PHY.
 
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
