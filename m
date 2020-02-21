Return-Path: <SRS0=GSZf=4J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E23F3C35641
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Feb 2020 05:38:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1E0F24650
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Feb 2020 05:38:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fef87FcC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NHBlsLvE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1E0F24650
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+2Uk6LxZJuw0C/89QCF20bLA18p0+vUqPQPskU73sU=; b=Fef87FcCIOctMr
	iy4GCfLRiDZRqAAOjntDSMg7kf40NiTvEqUgqVqmTLrZ+tEuKwhRMr+hsv5GLGV9iEPS84aQb1HSy
	iiSMxNq6xBxvJyUhSUYDzBFVIK/Ij1snk0oO9qd9nlJsJa7atW7tneJcwb3e1XSf+OUxwOvOEHsVn
	hBqp3rww/mlSuTwELjTkcU0c33pZ9WqiZUc8++tA75F+RttP1xRvVWqDSZcc0HNZlQnRVNwiXKYBF
	PSJ8KAhxBwXFEN/lyRseJcdM5GYVssxmADcS36HxA9vK4z91HqCtosLWtgJaYFI9K447rfBaKHxK7
	AMy7gepqib9Nz/V62DAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j511N-0000SF-Ix; Fri, 21 Feb 2020 05:38:41 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j511D-0000J7-25
 for linux-mediatek@lists.infradead.org; Fri, 21 Feb 2020 05:38:32 +0000
Received: by mail-pj1-x1044.google.com with SMTP id gv17so240885pjb.1
 for <linux-mediatek@lists.infradead.org>; Thu, 20 Feb 2020 21:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CapMNX7pjr8MkESV5PbFvA3nh0aG4lhz0SRP146DeOk=;
 b=NHBlsLvEzhPsV9lVrqrxLfj46dzf+dfvYfal/9H20MGjw4nLWWSVa8v81TGtfCiHGG
 UNImlkJ6xyOWAA6l1H1xA2JqGLXbVDYYjArPqkFMKmwUZffHJaGPMeXaVTJX8lG24W7Z
 1BH97JwtFsJ//+S0hygIEpEECdThBP537UmUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CapMNX7pjr8MkESV5PbFvA3nh0aG4lhz0SRP146DeOk=;
 b=hR3IX7TdUQQT2tUp+NrFXbaN/k92uPu8409lGAmX5+y4F7FALck2iXYdgn8yMXuV3j
 +djYHomumZbRvD5B924pf590ZsdMVX+sCJBGLFR9y65OwPE+zE3Gns+HRWkBjbNzRe9n
 Qh3R0qYeBDTbWnYrQNL3LCXwG0/6GMil2S+kSuAqVwNrmB9G8IS19j6U5NXl487i5i2Q
 VKSwIlam+MwzTFLfqVNNMqXAgvpSurDZ+2y0umnaV4bbWKVR/jJf5DqvzIOkE3ig7hYY
 C5TbVWHN3Y9pxt7CznXl24U9ZRggEzrCSaHgd/PdmcKIpHXJ6fhfdMQJMgh8lmgAQ7dj
 f6gQ==
X-Gm-Message-State: APjAAAWHyPm+WQq/Dm68IhNOPhXf5TYMjUhr+cnBwwcinwIavWiYRjDL
 NCntqtAFrysk6HOnZM9bGrtrDw==
X-Google-Smtp-Source: APXvYqz+fNCi7RyQICRTNgU9IYDRlA2CBQL0xzTHdNzESzxk/Lp56MofgOU6MTmKnMrgVqSEjK8ojg==
X-Received: by 2002:a17:90a:804a:: with SMTP id
 e10mr1046782pjw.41.1582263510005; 
 Thu, 20 Feb 2020 21:38:30 -0800 (PST)
Received: from localhost ([2401:fa00:9:14:1105:3e8a:838d:e326])
 by smtp.gmail.com with ESMTPSA id m12sm1324157pfh.37.2020.02.20.21.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 21:38:29 -0800 (PST)
From: Evan Benn <evanbenn@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: watchdog: Add mt8173,smc-wdt watchdog
Date: Fri, 21 Feb 2020 16:38:01 +1100
Message-Id: <20200221163717.v2.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200221053802.70716-1-evanbenn@chromium.org>
References: <20200221053802.70716-1-evanbenn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_213831_109525_BA19F20F 
X-CRM114-Status: GOOD (  12.24  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mediatek@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Evan Benn <evanbenn@chromium.org>,
 linux-arm-kernel@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, jwerner@chromium.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "David S. Miller" <davem@davemloft.net>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This watchdog can be used on ARM systems with a Secure
Monitor firmware to forward watchdog operations to
firmware via a Secure Monitor Call.

Signed-off-by: Evan Benn <evanbenn@chromium.org>
---

Changes in v2:
- Change name arm > mt8173

 .../bindings/watchdog/mt8173,smc-wdt.yaml     | 30 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++++
 2 files changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/mt8173,smc-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/mt8173,smc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mt8173,smc-wdt.yaml
new file mode 100644
index 0000000000000..ff45e13bc548b
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/mt8173,smc-wdt.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/mt8173,smc-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Secure Monitor Call based watchdog
+
+allOf:
+  - $ref: "watchdog.yaml#"
+
+maintainers:
+  - Julius Werner <jwerner@chromium.org>
+
+properties:
+  compatible:
+    enum:
+      - mt8173,smc-wdt
+
+required:
+  - compatible
+
+examples:
+  - |
+    watchdog {
+      compatible = "mt8173,smc-wdt";
+      timeout-sec = <15>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index e48ab79879ace..59e8779363c12 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1421,6 +1421,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
 F:	drivers/irqchip/irq-al-fic.c
 
+ARM SMC WATCHDOG DRIVER
+M:	Julius Werner <jwerner@chromium.org>
+R:	Evan Benn <evanbenn@chromium.org>
+S:	Maintained
+F:	devicetree/bindings/watchdog/mt8173,smc-wdt.yaml
+
 ARM SMMU DRIVERS
 M:	Will Deacon <will@kernel.org>
 R:	Robin Murphy <robin.murphy@arm.com>
-- 
2.25.0.265.gbab2e86ba0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
