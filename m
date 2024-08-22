Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAC7C531DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 06:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6VhPMtectai4hGqbUSp0dB+6VO3NOuS573R5ytgFYI=; b=qzAWxi39vSeWiDgZIZ8HWbAZL1
	juRQO2XZ1knyhKukoDcbiWfO4g6RUKQ1aP5h6LwoOfFSVQmhS+K44DgBqSwCv1/U18UbUMoIqQ6r+
	oIKbG4K9voRPjm9MSBFR+fOl8hP7yuuxQISPijz4xDUXIupVDzrnS+gWUTStvtYF065cdrh41aior
	PX4YfqsAIhIqZbcW8faVt6QXdVkrK2+16aOzHooCTHfHCEbhbsMXpekXIqVhwqCGvTEvGC6WrYLvt
	JuoW250+AbELWQb3CGyR2opVA02JpWrwraBZKPGNYy0Au40Q4FiamDwbEJYmMFl8rAUd1zl5p9RxL
	aFCyNeyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh1bo-0000000BgLZ-3S50;
	Thu, 22 Aug 2024 06:47:49 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh1b7-0000000Bg33-1kgn
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Aug 2024 06:47:06 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-714263cb074so432355b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Aug 2024 23:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724309224; x=1724914024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6VhPMtectai4hGqbUSp0dB+6VO3NOuS573R5ytgFYI=;
        b=ezs967LQPE0b+LSBxLHW1MapL/2NKu7UyrXGgKZgH7Ctg5Xxngs8WTre1tCUlTxDx7
         To83pWNVycvDXE/r/diMVpDvovMOZUlPszk18FZM4gXviKGqzVtKuKhMnxm9vExJqql9
         MhUofemDM0IY7jSkst62LSOgwvLz7uPYcU+KI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724309224; x=1724914024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6VhPMtectai4hGqbUSp0dB+6VO3NOuS573R5ytgFYI=;
        b=qvxSGsVwhE8W0tpcKP0EdzXmkE7gJcGZe/TNczf7pVJZgsOO7nGQxccWeW7mdxfVhY
         j7c/gBKX2Wx4zbWfbf+tfaUtS8r2NdrEoJO7MdcHIAVU88rv1ox3h+oMGE0xGUcvPcyE
         0Dq3hKw4fqYeQt2q4rH9OPfpgHkyGGWcAuwaHAfTFXDNGW01NDkZ1IP8lRGMFOQZGMgV
         vl1fAGbyJVqqUfs+3qePeT9hBO/+AiwR+xpOYlaeZD4Xt7ZMpst3f50NGzazpGNnXg+c
         8U66qZmJ/os0r73zHbdJfLTQKdybH4m13Ldcd8UAp2Fn3KAqlTFmJa/4kyb4DPXU1l2v
         B7CA==
X-Forwarded-Encrypted: i=1; AJvYcCVMUAMUR5+fcVY6AhcaiL4RYinK1S7n6aR0bjBbM2uqLYaMa6tgV7+HpmIloTRZL/SwHUYO/8Z+n4DiotAzKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUDyemV5r5+nYkv00Sd0pSv2JATV1HJUpKfEFV+0AwvjPmQcCv
	uAoSYIxACXtjhN8139WBlky6zUxTQkMu6p3ktMxuxBk7sr8i5MWsdJMXZZwAPQ==
X-Google-Smtp-Source: AGHT+IFOTThZc7Acbudhp76jsdVEtyD08nopL5PxkAb/g8HYG8h8pM7szn8X6lzKGkKTXkFY44I14Q==
X-Received: by 2002:a05:6a20:6f8a:b0:1c6:a656:84c9 with SMTP id adf61e73a8af0-1caeb1d6a60mr1116121637.16.1724309224283;
        Wed, 21 Aug 2024 23:47:04 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com. [34.143.174.185])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2d6136fc523sm856946a91.9.2024.08.21.23.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 23:47:04 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rohit Agarwal <rohiagar@chromium.org>
Subject: [PATCH v3 1/3] dt-bindings: display: mediatek: dpi: Add power domains
Date: Thu, 22 Aug 2024 06:46:48 +0000
Message-ID: <20240822064650.1473930-2-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240822064650.1473930-1-rohiagar@chromium.org>
References: <20240822064650.1473930-1-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_234705_481101_7E311CD4 
X-CRM114-Status: UNSURE (   8.65  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add power domain binding to the mediatek DPI controller
for MT8186.
Also, add power domain binding for other SoCs like
MT6795 and MT8173 that already had power domain property.

Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
---
 .../bindings/display/mediatek/mediatek,dpi.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 5ca7679d5427..3a82aec9021c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -62,6 +62,9 @@ properties:
       - const: default
       - const: sleep
 
+  power-domains:
+    maxItems: 1
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description:
@@ -76,6 +79,20 @@ required:
   - clock-names
   - port
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - mediatek,mt6795-dpi
+                - mediatek,mt8173-dpi
+                - mediatek,mt8186-dpi
+    then:
+      properties:
+        power-domains: false
+
 additionalProperties: false
 
 examples:
-- 
2.46.0.295.g3b9ea8a38a-goog


