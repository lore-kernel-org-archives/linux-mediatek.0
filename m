Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CCA5C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 11:37:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29E142087C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 11:37:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iIwO0UJu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2B57zh/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29E142087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nhhgkf6hYVA4+OxDbRtc26Qd6BGlMv8bpE2MFcLYKI=; b=iIwO0UJu4kTbSbaN30K2spTG5R
	XQJyBr2MXPRKfX5K5klLh0UfwAdV3Ah4GE3XSa2tCr+9v9nyWEN2dQrO+rG06YOYBwAOyNUH2iNJn
	zbMtHHppMcVssPc/N8k4KTIhLbpFjmHhtaktsHMGOw5M6rCACpCOYOM8AfwBrsUbcIyJdjPuHv+2z
	d60EnfDc/GXKXC14kfdgpZbHrFISn5ckInRzlNy+TXU+MTCydiZPHv0Hvuo1uu+WQAlgPVB43Wu9E
	vSLn2s+TXJbLQXMtB1lnChJlzIov/khXS/RcLDcripcETaXuuSXecaAxBEQl42eHiB7U6wzNqia8H
	gaf4a5AQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAtkR-0006o2-HJ; Wed, 26 Aug 2020 11:37:47 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAtkG-0006lN-Ko; Wed, 26 Aug 2020 11:37:37 +0000
Received: by mail-pj1-x1042.google.com with SMTP id mw10so741746pjb.2;
 Wed, 26 Aug 2020 04:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Vt41UNzwhd7H8iOJWWQaJ2po5o89qJA4//y1ixZpDJA=;
 b=f2B57zh/EGUaA7PQLarcSXY8LmHSM4t/5IYJRkigwlX2JbvU4mCjJbK99OdAz5Fx9I
 xjmHmh9I8H1AHvVdd2PwLXb0gFNV/mooRXS2OwqCi5+sGqi39TovZMUZfMDS286/VsS/
 xMJzF+yEA+5BhFqoAotNw/qi5ik02UPO+cDWl6MH0W9R0uiTGXjliFJEZbh91OL0MA4k
 kWvRguE7ObqrX2wgJUeHpv0AKoGz+KLfMXfSCDMOjfUCVsmql4n3K7H7olz/rVwk1Hzi
 ZmAeKUuIDxvF7WPhTifjjM4xGxN5zt8G9UJZVmK6p65sCH7wHudUKFXNZ8yM/VUC28qN
 ewgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Vt41UNzwhd7H8iOJWWQaJ2po5o89qJA4//y1ixZpDJA=;
 b=FwaVpulnosxbheBuucpyAF6s1BH1MWPLVNaL/isqcVnZjHH/xmEHgz2fwisU+shLNa
 GD+B9NXToGjdbAD5HTWnTkr1pSofekgML8G7+rjTp9y1n2ri2nenN8UfEKVwijZ/Sqxr
 lpBqSxX7647UYbK/MY6Qd3fqX//NuJspEOBHC0/02nM6lGFjE+KoiQus/25i6v4odqrl
 9ztzZuXMuEG8ep0kvUhpGsz7qpfxL9yiw9r3ADE1ukBSxlwP8iI8FtBxCY63U5Gu6QwB
 McewYgNEN7K86A0uYQ9LusKGwuuWd4ljwbQO6Z1ziw1C1dkdEzEM/W6xG95CZ8WBHveX
 z+5w==
X-Gm-Message-State: AOAM533rAqvVrz9oVBMvC/crIIbIPSewlpbFfVrcglOFf+bsoNlGZPRd
 n1k0ISivP3Q+e/yl4JV4MaM=
X-Google-Smtp-Source: ABdhPJzBGZnfnxqRta01CVr9x9ijWsljVtnE050DIPGOxgcWkmTkxadvUO5k7vIIYadCfhHoJ3ZuRg==
X-Received: by 2002:a17:90a:9483:: with SMTP id
 s3mr5694994pjo.98.1598441854639; 
 Wed, 26 Aug 2020 04:37:34 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:56a:2197:d2eb:7e49:dfa1:a882])
 by smtp.gmail.com with ESMTPSA id x5sm2591047pfj.1.2020.08.26.04.37.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Aug 2020 04:37:34 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com,
	pavel@ucw.cz,
	matthias.bgg@gmail.com
Subject: [PATCH 2/2] dt-bindings: leds: Add bindings for MT6360 LED
Date: Wed, 26 Aug 2020 19:37:20 +0800
Message-Id: <1598441840-15226-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598441840-15226-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1598441840-15226-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_073736_790839_6B6C7890 
X-CRM114-Status: GOOD (  15.85  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org, dmurphy@ti.com,
 linux-leds@vger.kernel.org, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Add bindings document for LED support on MT6360 PMIC

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 .../devicetree/bindings/leds/leds-mt6360.yaml      | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
new file mode 100644
index 0000000..4598be5
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-mt6360.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LED driver for MT6360 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Gene Chen <gene_chen@richtek.com>
+
+description: |
+  This module is part of the MT6360 MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/mt6360.yaml.
+
+  The LED controller is represented as a sub-node of the PMIC node on
+  the device tree.
+
+  This device has six current sinks.
+
+properties:
+  compatible:
+    const: mediatek,mt6360-led
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-5]$":
+    type: object
+    description: |
+      Properties for a single LED.
+
+    properties:
+      reg:
+        description:
+          Index of the LED.
+        minimum: 0
+        maximum: 5
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+additionalProperties: false
+
+...
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
