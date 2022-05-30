Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6937C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 20:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SWfFDRzeLg/bYYjqZNWjdELOy8hArhtI8QiCWk6AyQo=; b=lzLXNpbj2kCr6k
	K9cP3PYiHBdmMMoQQ/BD9t5/u7rgpuZO3Mh0uUyZt6CIzdygFn291ychfmxVYXrGadWynY+EgIur/
	K3h2lxKKwa59vMD/H5bz2e7v41v7rq4HDgNpiMbwxQI5phRSDpcKGiLSFEuOcxNIVy2Xg0WgulheK
	dxvmIUbU49EEBHjW+AZM1iOSfhDg9m6jWXi6kIwJkoZGN8L3ieOBduB0MWh1ZcmGDjFO/2WTZ3jLn
	8AvCv0iYzP7pWyOHGIiqcYhvCgoXnYaC8B408qn9f9K+JjWJelIGdkZZ54Ohp//NTQs3XT7xNF8JR
	JpTJWgUSgPt7dLGPorvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvln7-0089Bk-Nh; Mon, 30 May 2022 20:15:05 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvln3-00899r-Ol
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 20:15:04 +0000
Received: by mail-wr1-x42e.google.com with SMTP id x17so6950659wrg.6
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 13:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v1KekYBsM60PWOUWQkx+YAzcNsdLIbx5495ax2Uk44I=;
        b=CqyGXFlBzgROVHYp7ecYqfw78XKSS+1L6CsO2OmUQm1gW9QrLMVzAign7WkMfXoBme
         A8lr2oORL6b6NHYKjjkGlHMWy7WFnjRrmqtAWvs/Q9zTHfZTXuiqF3FDL3d9wiX/in6V
         1y+cx25AaHHtQ/O9bqYMNx4kDPTzWFDu+rFFWtZ+VbALHzs8N3WQ9XJKKYwr7qvthQfp
         skZkKYkVdVHMoEGPFjwk/62HwsA0GrOQw6QBBXa3+BnVTT+YrZOyX75AW/4ZXbrAZ+Px
         05flweFs9wJmVhJcMbp4jwVZB++k4TYn8pbr+gMqfBnuWNl1Ka8iCQB8UiZ18JHZw7Q2
         r9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v1KekYBsM60PWOUWQkx+YAzcNsdLIbx5495ax2Uk44I=;
        b=YTCO46pcnqtq0N8Zfk5ivoZMgvQZ56x/SK5vSet04gO3YQs44NCR+3v3kR/IeQfdPc
         vRgSTD3ZXegjCrXuacbRTFMkvK5emRQYx6VffZuzRbCNXL1drp25DiijUxJ7opu68lz/
         M/RkLCyjG7dSU0YcVbuOlvcoq0DWLqTfw86q+ipwH5mM/sSZXJB1QlH9vvH8JclKO919
         XX+HGTXODGD1bKu3w3LKwRodBheOggVbUOAAqeZVLDZqcO4O9DS7YXIgvlvkq9dSQmpP
         Ecs0ZL8fKXyxxUvnlZo6iVG9Czo7kTwV03Q4aGvwFksBNOM8x3IFSBoSJfSm6BlQC1hP
         CDpQ==
X-Gm-Message-State: AOAM531O2YRxnR4V9bC72PvcfvKAg5C2ieqzrlTWTQiyICjsZvAMcNwd
	urQqgRAZWvDd/NG9aogHsvdF/w==
X-Google-Smtp-Source: ABdhPJywyGKnqq1V2paxWnR8T4gDyaRPZAbgv7ZM88KcD65BYAgOubg2wGcIuvlSdR++OtUlPvntWw==
X-Received: by 2002:a5d:5281:0:b0:20c:d5be:331c with SMTP id c1-20020a5d5281000000b0020cd5be331cmr46490408wrv.9.1653941699537;
        Mon, 30 May 2022 13:14:59 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id t1-20020adfe101000000b0020d110bc39esm9770401wrz.64.2022.05.30.13.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 13:14:58 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: matthias.bgg@gmail.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org
Cc: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@linux.ie,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 1/7] dt-bindings: display: mediatek: dpi: add power-domains property
Date: Mon, 30 May 2022 22:14:30 +0200
Message-Id: <20220530201436.902505-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_131502_109975_38399478 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

DPI is part of the display / multimedia block in MediaTek SoCs, and
always have a power-domain (at least in the upstream device-trees).
Add the power-domains property to the binding documentation.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 77ee1b923991..caf4c88708f4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -57,6 +57,9 @@ properties:
       Output port node. This port should be connected to the input port of an
       attached HDMI or LVDS encoder chip.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -64,6 +67,7 @@ required:
   - clocks
   - clock-names
   - port
+  - power-domains
 
 additionalProperties: false
 
@@ -71,11 +75,13 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8183-power.h>
 
     dpi0: dpi@1401d000 {
         compatible = "mediatek,mt8173-dpi";
         reg = <0x1401d000 0x1000>;
         interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
         clocks = <&mmsys CLK_MM_DPI_PIXEL>,
              <&mmsys CLK_MM_DPI_ENGINE>,
              <&apmixedsys CLK_APMIXED_TVDPLL>;
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
