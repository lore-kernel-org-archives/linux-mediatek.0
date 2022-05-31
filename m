Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437C6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 12:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PF993pDtOtpfpACjO6YosGDNVzyY0I3Y8/OtvIzCFsc=; b=eId0HkW1o7DFEj
	6aXWQ0Hs1yWzBtORN5b1xn7vIsYDFvassWOPKaBzXA+zwxSZ5LHL2KgLUXG1dKTgYVHvh0nAMdjJ/
	Fxyz60fDvOaLk9tB24YMzyh0cNyxD2FmM+NytQ1EWy6uZN35WQplJgM5TbSr3UYhUtW4ixWAI/khP
	PW/4T1ePXDIEx8Gli1AOUhjjayLEH1a5bTtDBnjn6hay7mr9yWjIV4h+hxN42fKmx3umX0h4J9HLF
	8LT+zDTNzy4uv3hYRfl6R6FnTQQR7JpiJa+4APWk9OEzH6txv9hdq6T+QyD6UlEuFsLux/HavrX5a
	F+ykJ+LcKJMNn0gSM5Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw0mX-00Afww-LZ; Tue, 31 May 2022 12:15:29 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw0mK-00Aft5-QD; Tue, 31 May 2022 12:15:19 +0000
Received: by mail-pf1-x442.google.com with SMTP id z17so480742pff.7;
        Tue, 31 May 2022 05:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WjL5ChPbIi7K/V0MdTfM2rPQhvrdOuYsXgOFgMyivaI=;
        b=XUW9GdGy4TqDailNbK9B/jsEL99PnLrY7N6e/R0pDDK5Mj+ioTShKiwSiYxB9IrpFZ
         Mu3bFnjNhNRaCm4FfOxekdr+q7O7xZKCPbbEoseMPnqAarbIXgRmHW9h3DpetYJf7ROx
         Ja+9DYEYKdvr64YWdrTt4qJ11drlS3wdTSWTi7j13Ai0e/Q7DhS7yuAPTQlrJEyqP4Gk
         kDB08TOcStQLLZ1WkA02qea053UKUM83GOEnr0x5ERuvahMFRYEzMfEmWRCIc4LSeeS4
         RBFRcPlfiABIdr9tYu6684lGowuRpNzZS7laB1vAZXldhJ6Huk82Yv+uPmFry5CRdKBf
         ZjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WjL5ChPbIi7K/V0MdTfM2rPQhvrdOuYsXgOFgMyivaI=;
        b=PNtfHvw7p3raSE3UQx0rZzOAwFTmVsUN8Jd9SA1JrAUF/MdoK9dX/3sd2gOoPCAbEJ
         aqJtrc20VJFfoH5SZlkH/r1mlN9CkGXg85oVulEk2QgMKrUraQ94LZ0z377qCCiqk66u
         6XzbMrrLgxUy2UzebfsqOxPYrx8ydLplg67PAv1OS/H4Rst7BMKjD32uZ8/wfGf/sw8m
         i9Kh0xzie9jhzCcIVMvOk7sL1mM4o5VDLfZtsMcjEBdlE5VJFMksNct7J76s88TMeJ7U
         mmWL0F3QsgYBes8DIRFQ0EjWJdDAUOZkz03WAlVFbeOhk0FNLHwnR1PEVEC2y7GM5COe
         Fwjw==
X-Gm-Message-State: AOAM530/QGwuhm4bV2rK6NG8YOxoh3lTrxF+jtp3Pm2itYyZi4/+zxQJ
	ydjItbdlItxPiYUYMwbEmwc0ZF/uHHE=
X-Google-Smtp-Source: ABdhPJzhoIKkLqm77ivXQGmG9uiBv7avEg57jLy4emn49XKC6kCSn41nkMkpf9Cog5z8VCg8vYRfpg==
X-Received: by 2002:a17:903:2310:b0:163:e054:9c0f with SMTP id d16-20020a170903231000b00163e0549c0fmr9477567plh.57.1653993044377;
        Tue, 31 May 2022 03:30:44 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net. [42.72.220.172])
        by smtp.gmail.com with ESMTPSA id c1-20020a63d501000000b003c14af50631sm10216519pgg.73.2022.05.31.03.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 03:30:44 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux@roeck-us.net,
	heikki.krogerus@linux.intel.com,
	deller@gmx.de
Cc: cy_huang@richtek.com,
	alice_chen@richtek.com,
	chiaen_wu@richtek.com,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH 09/14] dt-bindings: usb: Add Mediatek MT6370 TCPC binding documentation
Date: Tue, 31 May 2022 18:28:04 +0800
Message-Id: <20220531102809.11976-10-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531102809.11976-1-peterwu.pub@gmail.com>
References: <20220531102809.11976-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_051516_879270_283A71A9 
X-CRM114-Status: GOOD (  10.92  )
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

From: ChiYuan Huang <cy_huang@richtek.com>

Add Mediatek MT6370 TCPC binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../bindings/usb/mediatek,mt6370-tcpc.yaml    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
new file mode 100644
index 000000000000..49316633f92f
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/mediatek,mt6370-tcpc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Mediatek MT6370 Type-C Port Switch and Power Delivery controller DT bindings
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  Mediatek MT6370 is a multi-functional device. It integrates charger, ADC, flash, RGB indicators,
+  regulators (DSV/VIBLDO), and TypeC Port Switch with Power Delivery controller.
+  This document only describes MT6370 Type-C Port Switch and Power Delivery controller.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6370-tcpc
+
+  interrupts:
+    maxItems: 1
+
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    description:
+      Properties for usb c connector.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - interrupts
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
