Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C79C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 20:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hYHWDKGfnZ7xcMjxQ1pQANLRDlqM/4pOWfjE8aFtXB4=; b=KPiFnoBMcrtaks
	sLOQIikGvzASJ1RUc1VeNVL/ktKIsqzfECXFZ2RGtmmyBnRkFVWYCM3qrqj7T31xgsUO0eyaneUgJ
	kbyu4eFoAqNsqp+LjsITWvM8aIC+kaZ2FyKLpxyTsA6MNgTaCHVvw62U+PYFubgY7G0aXVsqjtPl6
	lvCSdsMvKe5/KNci1JfP5kLw52W94La6sjSiqI62vTfU+oru9Pjybd73rojQ8jkuK64t4PW5QvvMx
	PR6GwxuXSQOZfqA2ohNARXJg0B0jKsxcW0QcHssv9q+X6jcvQGRHQB9bdllhFR+GaXZk9rZGHKVs7
	RBwKZGeRgbCXaF3byGmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvmDg-008Ex8-B0; Mon, 30 May 2022 20:42:32 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvmDc-008Euk-TB
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 20:42:30 +0000
Received: by mail-wr1-x431.google.com with SMTP id p10so16057939wrg.12
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 13:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TBMGHe/9NOqZ3Kh+JOrF68tVZuQ1XNvw/gFRCoIpoLM=;
        b=P6EJUlIkaQX/GAxBBZworgItiQjIuaWiqEBkZRvFN4ucg3iAj0Ml0k3grIAjx3OFjp
         w0lfN8SApSeQqK7P5hjZgGNmUbXDq7blnl9L2Y0Sb0qiEwoZ34cWoMTKgdHLmyb+40lS
         2MCr9PjlXd4z3eJjh42Qqawvch3nzt0TNlSwjOngUQ5aQUSvkjtF6JedOdKxn1kRaznk
         4ulkTbMtYqwZ99h0SkMY+94ea0xdzNyMWgq66vKOsoeYlgy0o8MRoGClQJ9cBUDzOoQj
         GEDrc2psEt7zDqLpKLZ0iMkR55oAFlF4CJd0ZDcGDPNaiYRzjjyqXNQZ4K3HoWxIOyaz
         nF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TBMGHe/9NOqZ3Kh+JOrF68tVZuQ1XNvw/gFRCoIpoLM=;
        b=J61y+/ciVtP9hFVNE+04ftenSgeWxN+T9oKLyV6+6IDiwcHU0ikeGTdwUDJ5iFREcA
         WmtZCODiu9nDZ9T67YOLfbNAkZjKHzT0V/bIzFbi4SK7B6xxgBrzmbT/R20m+0ZqFlOV
         2a+OluQoRh8deVl3gc1AIV6sNcDqtfTgpGjQkb2yc2P7ziTggil5uVZYCkqFHzs+KZ6F
         vbCBA3xnsm66K+BFSwmDADS+QidqvgEJzFAqZvbgQ2zT+WgGDPZOTd2u4oYLtJzMuhZ1
         OwC09gM2VBnlbiG+lOGYrbnX6Ij+B9QoCDqPDz/S6b44iWmfe1L4kwvQGr4PEWoe/MvI
         jYMQ==
X-Gm-Message-State: AOAM533UiWtS54Y0l5XquFiOpbz1P927kFo4zLLAhTO461MvS/LLuJri
	ik3t309z4wz7BYQv97odbn1DjQ==
X-Google-Smtp-Source: ABdhPJzMnN8B6FO9tAuqRbT/IvWGcIChRi6Gj+uHJVi4s2P8VaVhe+EpgYkhfQ7KfQ7fMyV1+QxVwA==
X-Received: by 2002:a5d:59af:0:b0:20f:d3fc:c5ba with SMTP id p15-20020a5d59af000000b0020fd3fcc5bamr34780364wrr.436.1653943347514;
        Mon, 30 May 2022 13:42:27 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id w13-20020a7bc74d000000b0039b17714eb2sm262253wmk.34.2022.05.30.13.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 13:42:26 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	Matthias Brugger <mbrugger@suse.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: power: Add MT8365 power domains
Date: Mon, 30 May 2022 22:42:11 +0200
Message-Id: <20220530204214.913251-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_134228_999832_857CAD8D 
X-CRM114-Status: GOOD (  13.22  )
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

Add power domains dt-bindings for MT8365.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../power/mediatek,power-controller.yaml      |  2 ++
 include/dt-bindings/power/mt8365-power.h      | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 include/dt-bindings/power/mt8365-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 135c6f722091..2c6d3e4246b2 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -29,6 +29,7 @@ properties:
       - mediatek,mt8186-power-controller
       - mediatek,mt8192-power-controller
       - mediatek,mt8195-power-controller
+      - mediatek,mt8365-power-controller
 
   '#power-domain-cells':
     const: 1
@@ -67,6 +68,7 @@ patternProperties:
               "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
               "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
               "include/dt-bindings/power/mt8195-power.h" - for MT8195 type power domain.
+              "include/dt-bindings/power/mt8365-power.h" - for MT8365 type power domain.
         maxItems: 1
 
       clocks:
diff --git a/include/dt-bindings/power/mt8365-power.h b/include/dt-bindings/power/mt8365-power.h
new file mode 100644
index 000000000000..4f50997a13b4
--- /dev/null
+++ b/include/dt-bindings/power/mt8365-power.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef _DT_BINDINGS_POWER_MT8365_POWER_H
+#define _DT_BINDINGS_POWER_MT8365_POWER_H
+
+#define MT8365_POWER_DOMAIN_MM		0
+#define MT8365_POWER_DOMAIN_CONN	1
+#define MT8365_POWER_DOMAIN_MFG		2
+#define MT8365_POWER_DOMAIN_AUDIO	3
+#define MT8365_POWER_DOMAIN_CAM		4
+#define MT8365_POWER_DOMAIN_DSP		5
+#define MT8365_POWER_DOMAIN_VDEC	6
+#define MT8365_POWER_DOMAIN_VENC	7
+#define MT8365_POWER_DOMAIN_APU		8
+
+#endif /* _DT_BINDINGS_POWER_MT8365_POWER_H */
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
