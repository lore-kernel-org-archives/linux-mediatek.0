Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EC7CA0FE8
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Aug 2025 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gXvOq0WDJymydEahTOESPI/du0vd8E1f2zWurTAGrWI=; b=oDmPxirqz81tLbEXiiqBeNR4vH
	uRvY7h78a16d+ZeqFFTxHZwDR8lzloiiwawvfeuXHVMciYYAd4c5q7MgYPfy6SqgqokSngnut95+k
	Uq5ls/wbYwu84vauO6INGYir/cuJS+FCTmtY8X3fCvYBBL066FOrAY11XREK7KCjHCnFLVwaV7gq3
	Yi37FIfrtbTLInaTi/AVTZHxnMSGdaAPYrAhgtyjDhG5Dpd3p5eb20ugQ3wQFNTsVDlbnu9sowLZB
	BGWvoVbRE08Sy0WeyghW3zLiHzroBRpDEo2pDJpgSeSG4pysp0O5pqI9pQTlrrz+XbpkWuLY7ijfI
	vVEWtoWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upScW-00000002mSY-1uA5;
	Fri, 22 Aug 2025 14:19:56 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upMeU-00000001rtJ-3SDx
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Aug 2025 07:57:36 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6188b668b52so262865a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 22 Aug 2025 00:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755849453; x=1756454253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gXvOq0WDJymydEahTOESPI/du0vd8E1f2zWurTAGrWI=;
        b=dE2HUNUIl4UQyUtBBE/d5ob1tn2SrreTT/k3FDDutF15v4YxKBfEaPM14EYiS4dIVy
         0gW9yTBxfPwLAeLBigd0MtPIx0eBzmm5wlDQ3vOARtlGVUwfBXwxET3+rVO1ymZ/3/O8
         Q1kG1nGKz1svidusOuH3foYaNGYYsl3Brs5Sl+ZsHbXdcgDW90bDSZhaw7D1f06d/cGw
         2upEJD6LfBtDPG/srmtiyixR9QzOHvrEISsR6ULf+UU19tJ22ZUuWR93juDd1UIFbGCV
         pwG225NSseAlEIyPwGnBeZMzQ0KzEHdReGYRViEPGHovth0lHiYn4Y9wZ2DMzLd5bwVN
         a1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755849453; x=1756454253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXvOq0WDJymydEahTOESPI/du0vd8E1f2zWurTAGrWI=;
        b=QiSMB1LLO/p1i29OEcK33YJdBiBdR5+xsFuS9kgk5LuBQOvdaJNqjPMkDxff4CXarF
         PfQA9WRBrdOA+ICdTiHKSJZEOd1Bd5DsSaj64snoP/McQLAp1xUzcBsiajN2fZbSrAZW
         rGFHtUyN8wVJ2HqRVDozrvKkC/Sjpn9JtiDzF3rnee1b0PDdWOeEP/aKRkXaw8CxoHjm
         IYRFIFyDYG3PO1QTp9KP9cse5ra268CbAD82W5BCOZaRDt7Njn9nlkggwvDBXRV2fA0R
         picOrEwNhEKMsR+WfC4uSJ+8arjVyNFFbNKqWIg0Gg4nzjyfbCO1od1EdinvQTLMXIKK
         qGXA==
X-Forwarded-Encrypted: i=1; AJvYcCVxa9MY8FeDpCgCqSCbkdZrHua2D1WiIWWCcReb0qwc7mfQQav2cvKqCwpeqKOdu17YkbwYFYLF+DZeetdwHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEJv3kz3xQQXCegFBDJEJLySCBzDvPrYg1Z2dfhFHpd976+N+P
	rA6s8WTwutsR3HE3AHr8BlHSERpY2BMhA9dBNJUut0kFNRAld7Orkq9X8j3UG2/8/Pc=
X-Gm-Gg: ASbGncuYUEvSSOQZQQTeIAOpxDBt/NxMr/LheEHXxS/1FZ2mRqYFgP3C3F1npNTRs+e
	SiB5zJ++zeFQlLdbeEHjaCUj9JAhXmoDOn6ugduCcsP3j/KJb9SOep6tWMxV3R+ftH1Ecn3XSQV
	KGBZR/D/QdEQKCYyDbaublQBwzMNP4Tmn52Qeeg3ulvxcrcndpxXNkrDNaMZO+bi/c9XI0fagE2
	mArtHLZweuFPJ070U5oSKshE50pglRSSeTvTvhpFq3lCWrNB/1aCqBB+ylDBUolI340L6dTBy/+
	5mX2rvbvyv3sPIkkV1BcmQ8LYcR3mNmwpYl6pEsAWGqysqtgaoLcl9beu5obKgjPExXEkEFDesO
	iluOx7AMoKqd1NDKpAMEdIawkG8+jTdKJuw==
X-Google-Smtp-Source: AGHT+IHAfwxJieXRqNAC4E/jPz9pCyUBG2KPd9gNolTqqry4bihuNop6WHp+vaYNcJgpxRXSZfhW6w==
X-Received: by 2002:a05:6402:2714:b0:61a:34c2:58c2 with SMTP id 4fb4d7f45d1cf-61c1b3c8aa9mr786406a12.2.1755849452760;
        Fri, 22 Aug 2025 00:57:32 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c25709d66sm197196a12.22.2025.08.22.00.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 00:57:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tim Harvey <tharvey@gateworks.com>,
	Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jean Delvare <jdelvare@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Lee Jones <lee@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mathew McBride <matt@traverse.com.au>
Subject: [PATCH v2] dt-bindings: mfd: Move embedded controllers to own directory
Date: Fri, 22 Aug 2025 09:57:13 +0200
Message-ID: <20250822075712.27314-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11465; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=x0j2EQXRqyvt7rxVFdqIAdXw7ahQ63q4FEnvUznWpfY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqCLYC7FUAFD9qCGlqJnlBxpbt50g8PbOa+l9M
 NreIM7mVGCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKgi2AAKCRDBN2bmhouD
 17nZD/0WwWQbLXAduO94hhdip6gvnEFCKdZQRALnWyof1QUZFB9t8NgXrPsWvOUtfGM+9UJd/cw
 PoGktP7MAH4fUgWw64i0ZEp+gbYqfT5EQYbW5yJX+k974ImWaS10DMuCeJbuIFzO45vRbivrgwJ
 L8H6pNDJq9yzx2PWuh60O59CNcOJ/dtCDi1sd2X+HZsGvgAzBpecjMA5/1fQDOC4BAm+DoRKpdG
 0tbnoO1lDeyPwJ0JC2eCV1BlqMf5jdK+mGuwjwmivYYztUdEoL5dr/F8z/Aliw962+J3NHvcvbC
 xbpPa/fFAz38dADypYTaIydz/WlHz9EfuIqkZKA/S8pVLzW2HIBoZ/En4i9OZbkrIC1YRnurI8i
 66aEasQAtZSnlDGxtBfdyEDd4Ph7VOFL7xKlAdLuGvak6P6eBEx+lBPWV5o7oQvf3HMqmmisBWf
 XFFuSUEkYassRF46J7si7c6thwg8u6/B6qEIO7egCiW2WjPjkBm651TafCF/IjySIoPMY0eg4CL
 v0C+kqxM7AenLSpDOxy1wMw5K6faJLKRjBUpQm3IkgaD84LS0qANc02VWvfPMzoxY2YpYe9Sq95
 cEoj/vK9qke/JFDIztGSpT8Q06VaR/Y1RFRq2TtpR9XfReWS94nMp8z1A09h3D/dX/jFzlljNdI OBEr0pNkAcS8t3A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_005734_867620_F1897A82 
X-CRM114-Status: GOOD (  14.20  )
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

Move ChromeOS Embedded Controller, Gateworks System Controller and
Kontron sl28cpld Board Management Controller to new subdirectory
"embedded-controller" matching their purpose.  MFD is coming from Linux
and does not really fit the actual purpose of this hardware.

Rename Gateworks GSC filename to match compatible, as preferred for
bindings.

Acked-by: Michael Walle <mwalle@kernel.org> # for sl28cpld
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Cc: Mathew McBride <matt@traverse.com.au>

Lee,
Can you take it via MFD?

Changes in v2:
1. Correct remaining paths in other schemas ($ref and descriptions)
---
 .../bindings/{mfd => embedded-controller}/google,cros-ec.yaml | 2 +-
 .../gateworks-gsc.yaml => embedded-controller/gw,gsc.yaml}    | 2 +-
 .../{mfd => embedded-controller}/kontron,sl28cpld.yaml        | 2 +-
 .../devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml       | 2 +-
 .../devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml     | 2 +-
 .../bindings/interrupt-controller/kontron,sl28cpld-intc.yaml  | 2 +-
 Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml | 2 +-
 .../devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml         | 2 +-
 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml     | 4 ++--
 .../devicetree/bindings/sound/google,cros-ec-codec.yaml       | 2 +-
 .../devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml    | 2 +-
 MAINTAINERS                                                   | 4 ++--
 12 files changed, 14 insertions(+), 14 deletions(-)
 rename Documentation/devicetree/bindings/{mfd => embedded-controller}/google,cros-ec.yaml (99%)
 rename Documentation/devicetree/bindings/{mfd/gateworks-gsc.yaml => embedded-controller/gw,gsc.yaml} (98%)
 rename Documentation/devicetree/bindings/{mfd => embedded-controller}/kontron,sl28cpld.yaml (97%)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/google,cros-ec.yaml
similarity index 99%
rename from Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
rename to Documentation/devicetree/bindings/embedded-controller/google,cros-ec.yaml
index 50f457090066..3ab5737c9a8f 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/google,cros-ec.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
+$id: http://devicetree.org/schemas/embedded-controller/google,cros-ec.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: ChromeOS Embedded Controller
diff --git a/Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml b/Documentation/devicetree/bindings/embedded-controller/gw,gsc.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml
rename to Documentation/devicetree/bindings/embedded-controller/gw,gsc.yaml
index dc379f3ebf24..82d4b2dadbae 100644
--- a/Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/gw,gsc.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/mfd/gateworks-gsc.yaml#
+$id: http://devicetree.org/schemas/embedded-controller/gw,gsc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Gateworks System Controller
diff --git a/Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml b/Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml
rename to Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml
index 37207a97e06c..0b752f3baaa9 100644
--- a/Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/mfd/kontron,sl28cpld.yaml#
+$id: http://devicetree.org/schemas/embedded-controller/kontron,sl28cpld.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Kontron's sl28cpld board management controller
diff --git a/Documentation/devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml b/Documentation/devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml
index b032471831e7..02663d67eac7 100644
--- a/Documentation/devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml
@@ -11,7 +11,7 @@ maintainers:
 
 description: |
   This module is part of the sl28cpld multi-function device. For more
-  details see ../mfd/kontron,sl28cpld.yaml.
+  details see ../embedded-controller/kontron,sl28cpld.yaml.
 
   There are three flavors of the GPIO controller, one full featured
   input/output with interrupt support (kontron,sl28cpld-gpio), one
diff --git a/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
index 010333cb25c0..5803a1770cad 100644
--- a/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
+++ b/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
@@ -11,7 +11,7 @@ maintainers:
 
 description: |
   This module is part of the sl28cpld multi-function device. For more
-  details see ../mfd/kontron,sl28cpld.yaml.
+  details see ../embedded-controller/kontron,sl28cpld.yaml.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
index e8dfa6507f64..87df07beda59 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
@@ -11,7 +11,7 @@ maintainers:
 
 description: |
   This module is part of the sl28cpld multi-function device. For more
-  details see ../mfd/kontron,sl28cpld.yaml.
+  details see ../embedded-controller/kontron,sl28cpld.yaml.
 
   The following interrupts are available. All types and levels are fixed
   and handled by the board management controller.
diff --git a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
index f7bc84b05a87..8f5a468cfb91 100644
--- a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
@@ -14,7 +14,7 @@ description: |
   Google's ChromeOS EC PWM is a simple PWM attached to the Embedded Controller
   (EC) and controlled via a host-command interface.
   An EC PWM node should be only found as a sub-node of the EC node (see
-  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml).
+  Documentation/devicetree/bindings/embedded-controller/google,cros-ec.yaml).
 
 allOf:
   - $ref: pwm.yaml#
diff --git a/Documentation/devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml b/Documentation/devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml
index 981cfec53f37..19a9d2e15a96 100644
--- a/Documentation/devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml
@@ -11,7 +11,7 @@ maintainers:
 
 description: |
   This module is part of the sl28cpld multi-function device. For more
-  details see ../mfd/kontron,sl28cpld.yaml.
+  details see ../embedded-controller/kontron,sl28cpld.yaml.
 
   The controller supports one PWM channel and supports only four distinct
   frequencies (250Hz, 500Hz, 1kHz, 2kHz).
diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index adc6b3f36fde..179c98b33b4d 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -58,7 +58,7 @@ properties:
     maxItems: 1
 
   cros-ec-rpmsg:
-    $ref: /schemas/mfd/google,cros-ec.yaml
+    $ref: /schemas/embedded-controller/google,cros-ec.yaml
     description:
       This subnode represents the rpmsg device. The properties
       of this node are defined by the individual bindings for
@@ -126,7 +126,7 @@ patternProperties:
         maxItems: 1
 
       cros-ec-rpmsg:
-        $ref: /schemas/mfd/google,cros-ec.yaml
+        $ref: /schemas/embedded-controller/google,cros-ec.yaml
         description:
           This subnode represents the rpmsg device. The properties
           of this node are defined by the individual bindings for
diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
index 1434f4433738..dd51e8c5b8c2 100644
--- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
@@ -15,7 +15,7 @@ description: |
   Embedded Controller (EC) and is controlled via a host-command
   interface.  An EC codec node should only be found inside the "codecs"
   subnode of a cros-ec node.
-  (see Documentation/devicetree/bindings/mfd/google,cros-ec.yaml).
+  (see Documentation/devicetree/bindings/embedded-controller/google,cros-ec.yaml).
 
 allOf:
   - $ref: dai-common.yaml#
diff --git a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
index 179272f74de5..872a8471ef65 100644
--- a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
@@ -11,7 +11,7 @@ maintainers:
 
 description: |
   This module is part of the sl28cpld multi-function device. For more
-  details see ../mfd/kontron,sl28cpld.yaml.
+  details see ../embedded-controller/kontron,sl28cpld.yaml.
 
 allOf:
   - $ref: watchdog.yaml#
diff --git a/MAINTAINERS b/MAINTAINERS
index 7969d09dff17..f3e4c1aa656e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10129,7 +10129,7 @@ F:	drivers/media/i2c/gc2145.c
 GATEWORKS SYSTEM CONTROLLER (GSC) DRIVER
 M:	Tim Harvey <tharvey@gateworks.com>
 S:	Maintained
-F:	Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml
+F:	Documentation/devicetree/bindings/embedded-controller/gw,gsc.yaml
 F:	Documentation/hwmon/gsc-hwmon.rst
 F:	drivers/hwmon/gsc-hwmon.c
 F:	drivers/mfd/gateworks-gsc.c
@@ -23177,10 +23177,10 @@ F:	drivers/usb/misc/sisusbvga/
 SL28 CPLD MFD DRIVER
 M:	Michael Walle <mwalle@kernel.org>
 S:	Maintained
+F:	Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml
 F:	Documentation/devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml
 F:	Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
-F:	Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml
 F:	Documentation/devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml
 F:	Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
 F:	drivers/gpio/gpio-sl28cpld.c
-- 
2.48.1


