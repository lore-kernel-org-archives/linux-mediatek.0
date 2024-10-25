Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC2FD0C5FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Oct 2024 10:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KxrytHmxkB3KbKiG8V4DcHZ1mCc5pLP/FlD1m68qCP4=; b=IXCVvYgFIaOSpD
	xj9EJTYDHrBOwgnSE0+uFpBaptMufuxsdlywRm0eGsfPBgcs1N5En30o2uTzs/+J+uKq3CK76buMt
	SRRqYXpPgvwJrwJsUreUQP08S45WMvus0WXy0l2Uu0nMMCHNU9MkoxoRBY1mO4yTiO48emNs6/t1/
	AlZufLhOQmpVOS8eBQwcwuniqEZzOL5QCEqxRqhgFuMve8bSIObnKvloBxg8MJ+RQ8kVs1nzZbLoz
	ACJ07W89fqlVhDwpqYt270Z1Neh3B6XKpjaQRdjUu9kmc6COEayaEOYxnX1HThtwde6CtKEJB34nB
	l5bikDJTvGU4o6XCVxrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Hy1-00000003QZR-0HAL;
	Fri, 25 Oct 2024 10:54:53 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Hmy-00000003O8P-46b1
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Oct 2024 10:43:31 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2e2cc47f1d7so1260712a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Oct 2024 03:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729853004; x=1730457804; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KxrytHmxkB3KbKiG8V4DcHZ1mCc5pLP/FlD1m68qCP4=;
        b=dCem0tfQNdo7k7VS4bPvlYc/mcOzVqjcBTa98yz5BLhRCxD6KgteZ/jf0e7tC1IYRh
         bkQOBFdN/OzOuSOxi+5h4SGziQNKGHdfTWySkP++RByuoGu2TNVkWUvonREu+lKjzipd
         X+Sn6N8PmKOA61jyvZdpD/bJDf0G1flfXTIEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729853004; x=1730457804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxrytHmxkB3KbKiG8V4DcHZ1mCc5pLP/FlD1m68qCP4=;
        b=eOPnwb6vL/mc+cgVA25D25vBAiQRVkccX4RzANPbRUsCILI1ievkMQXU8V7aCLqjAi
         CrFaQP7DybLIOC5sG4/l67WHX6TVN8T4okxvtwI59icXk2EQ3FTv4A6x7+6SzxRnnphF
         SlUz2tdw1Rt2uPfVCA6rXCPH0lKjxjxXTYb3Dcbs/WpXcC/HGyOCz8q+FsfDIRM99XFj
         xI9wz+yxg87i+ERMdL6xHEntdSxQUzJdDtvBfmp6qWEgqQ+HJ2z+TDbFwj9YQ3GhTdSH
         psYX3CN99e1jtwRWdscrG65gWp0PjdzuPVFNsB8sLzFxNmhwcmb/LpJDbm0C5g9u/LCj
         eFAA==
X-Forwarded-Encrypted: i=1; AJvYcCV6q0EGyO43qmaElktFHc0SeOCS8DyHvIv2VfC4eQKODWDu403Dq2vLPjqiOE12HEhHNdiB6AmH8NpfG7uZCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbiEuTMArNWiipv6wiOtUyLQx/x+yDGsD9k0mQhx5ar9QryHSx
	Z9wVdVe2j41Y+D7Mt8XLg5oDEoxlKOhB97maG5t3bTz3HL3x/+HwBd77n7KDWA==
X-Google-Smtp-Source: AGHT+IEc8DWXdGFrPxI2fzHPjMeSAyvo7Jul73y4KLbJM19gxhJsddXsu1xMH6CPalfcWwhWNeu3pg==
X-Received: by 2002:a17:90a:4bc6:b0:2e1:8a41:aaba with SMTP id 98e67ed59e1d1-2e77e88ddfemr7745822a91.19.1729853003888;
        Fri, 25 Oct 2024 03:43:23 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:ebe1:dd63:343d:8a4c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e36a26aasm1093307a91.27.2024.10.25.03.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:43:23 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] dt-bindings: display: mediatek: dp: Add #sound-dai-cells property
Date: Fri, 25 Oct 2024 18:42:45 +0800
Message-ID: <20241025104310.1210946-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_034329_356804_87512AE7 
X-CRM114-Status: UNSURE (   7.94  )
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
Cc: Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jitao shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MediaTek DP hardware supports audio, and the "#sound-dai-cells"
property is required to describe DAI links and audio routing.

Add "#sound-dai-cells" property to the binding and filter out non-DP
compatibles, as MediaTek eDP doesn't support audio.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 .../bindings/display/mediatek/mediatek,dp.yaml   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
index 2aef1eb32e11..c05c2b409780 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -42,6 +42,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  "#sound-dai-cells":
+    const: 0
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     properties:
@@ -87,6 +90,19 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - mediatek,mt8188-dp-tx
+                - mediatek,mt8195-dp-tx
+    then:
+      properties:
+        "#sound-dai-cells": false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.47.0.163.g1226f6d8fa-goog


