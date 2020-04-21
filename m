Return-Path: <SRS0=9cIZ=6F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFBAC54FD0
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 11:06:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB18F206B9
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 11:06:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WUPSAqei";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SbdGbC/I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB18F206B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ax9hnvRnH9IvXbChw7UDJ764Wk+nQG0i7j4WJHFQc48=; b=WUPSAqeivv65+b
	13/LzY8W/ZI1X6fbKSAgASWWp0eW/l6Tg4mZjlyfqFsmTHkZ1I5FmIvw2FX5m8WNOHvsBZqOL8hk3
	FodFCwbQMyxqOWrI/TuLMFQQBgwtwgGZEDTdCsChtD6I4QIy8mJkFKqEqUeyhu5nNn0lYNX3EAJUV
	IqDzfkyCBG8dAbvxVhMP5UVJBAjihcrPqyRT9UFiu39g3GG9jIrZ344WksAecnsPxB0Ayqo8FpGDE
	AOlof2VXItfGAdfmhqi+BlAvgTApgnDUq5cJ2MJ9OSMOW9MursP2utwDt5f1lYn6JD5Amv9xM2A1T
	RP+uAxl1ivszwvFl0Xcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQqiz-0001t8-6H; Tue, 21 Apr 2020 11:05:57 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQqis-0001mK-GA
 for linux-mediatek@lists.infradead.org; Tue, 21 Apr 2020 11:05:54 +0000
Received: by mail-pf1-x443.google.com with SMTP id w65so6435497pfc.12
 for <linux-mediatek@lists.infradead.org>; Tue, 21 Apr 2020 04:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YQowLReDtrDqWyEJqghrzNfGRqjMiBQBGzRSAxJByhg=;
 b=SbdGbC/IZ+waY6GcW1FEvdinhHukPVmS1p6/7X2InvP61zjhI4qpd7hLtKztakfwBW
 K/WjnxqclzbwymHpj7ms7y45VRWSoPlhGP1GQNDXoz4U/3RUj4IGyl74e3+eK1/slIgX
 VzvDNsEsz+ucIetAZgKyCrnP39XwSe2Myt7Z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YQowLReDtrDqWyEJqghrzNfGRqjMiBQBGzRSAxJByhg=;
 b=XYnotQpECefXVY6U/bV5NGOve8fii+VuZUwIsj2bwfit9dK3HWp722uSaG5uaGb+Vx
 io9pTz1k/tZ5fKwYYXo8c3PRjahQzYmbXpWEw3xLlRo+tygKe1hTUPp/quepTcin1FIA
 HOz/CoYMUFnue0bH/Xtwg423Q3S3SupWMR81rQjMnN5ubqNSApCILqt12C78OitGPANY
 0T/wos7SlzN64upUk0IdW3RX/0yQr+3Xn55kQj+0oue0IDo5QlLvo1KICwxIof4augvh
 7dxJTc5VbkrPgdJBJh64q1IrkNgJAEI36hUrE1GPz7hPozLknY1lk8EHCBgK2/ttdxxU
 7Omg==
X-Gm-Message-State: AGi0PubQXMmS+6Aht63EvaVEmiF537GDLQ8yIF3Jz2uQ2Ph/oDuK/1W+
 lOwFM25QlAgMhfUv8XY5qK6jHA==
X-Google-Smtp-Source: APiQypI1YwJmHmSy0x0sI6jBe5ajdThi9X2rhSR2zjbZmeUsSjXpy1kYTU95kpNEOJjKxjiOS0aNBA==
X-Received: by 2002:a63:6f4c:: with SMTP id k73mr1751689pgc.241.1587467149882; 
 Tue, 21 Apr 2020 04:05:49 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:1105:3e8a:838d:e326])
 by smtp.gmail.com with ESMTPSA id c84sm2258841pfb.153.2020.04.21.04.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 04:05:49 -0700 (PDT)
From: Evan Benn <evanbenn@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: watchdog: Add ARM smc wdt for mt8173
 watchdog
Date: Tue, 21 Apr 2020 21:05:19 +1000
Message-Id: <20200421210403.v2.1.Id96574f1f52479d7a2f3b866b8a0552ab8c03d7f@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200421110520.197930-1-evanbenn@chromium.org>
References: <20200421110520.197930-1-evanbenn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_040550_632313_5F909164 
X-CRM114-Status: GOOD (  12.51  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Evan Benn <evanbenn@chromium.org>, xingyu.chen@amlogic.com,
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

Changes in v4:
- Add arm,smc-id property

Changes in v3:
- Change name back to arm

Changes in v2:
- Change name arm > mt8173

 .../bindings/watchdog/arm-smc-wdt.yaml        | 36 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++++
 2 files changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
new file mode 100644
index 0000000000000..5379d9f798d84
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/arm-smc-wdt.yaml#
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
+      - mediatek,mt8173-smc-wdt
+  arm,smc-id:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - default: 0x82003D06
+    description:
+      The ATF smc function id used by the firmware.
+
+required:
+  - compatible
+
+examples:
+  - |
+    watchdog {
+      compatible = "mediatek,mt8173-smc-wdt";
+      timeout-sec = <15>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index b816a453b10eb..0f2b39767bfa9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1457,6 +1457,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/interrupt-controller/arm,vic.txt
 F:	drivers/irqchip/irq-vic.c
 
+ARM SMC WATCHDOG DRIVER
+M:	Julius Werner <jwerner@chromium.org>
+R:	Evan Benn <evanbenn@chromium.org>
+S:	Maintained
+F:	devicetree/bindings/watchdog/arm-smc-wdt.yaml
+
 ARM SMMU DRIVERS
 M:	Will Deacon <will@kernel.org>
 R:	Robin Murphy <robin.murphy@arm.com>
-- 
2.26.1.301.g55bc3eb7cb9-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
