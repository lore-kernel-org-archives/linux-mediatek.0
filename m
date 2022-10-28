Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E536C38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 23:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qek8CJa1Lf5wEjUCizwM4dNQR7j2cqTQjO+0iv1r63c=; b=k/Dcp9tGjGFZ4nuUfQ2BPHunjp
	w4+FWgPuwMdibRxre8u2VXIpnpYvzRwqAghHkW4+8GN/8s4hVQXk+gceTLekWAr8oWCqRjfW48b4z
	uJnVPKI7Gbp9nH5pdNeEurxHE6VkxGulV2nYKFoSz0GdiyoZgP7MI6HYF38AprUkWzQM+MdfuI6Rc
	E2v4+HmCKAWWAovb+mreD6Jy6Aj4zEVlx/dzv/otF2Si0XSxHpQ//LBG3jmKwXRq01Lt1VJMxC+9g
	JzKTK365xzIXnQq950PHZbXOKkl6JSu2LmT7z8Uplw8Pxp8PCNTTZsPTgvzgtwxPcSlS0gLZP01tK
	6O5pSoWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooYue-003Gin-EA; Fri, 28 Oct 2022 23:37:20 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooYuS-003GgX-2t
	for linux-mediatek@lists.infradead.org; Fri, 28 Oct 2022 23:37:09 +0000
Received: by mail-qt1-x830.google.com with SMTP id e15so552165qts.1
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Oct 2022 16:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qek8CJa1Lf5wEjUCizwM4dNQR7j2cqTQjO+0iv1r63c=;
        b=hk7vFQaNCWPnjqyN+pYrb5525vC9R4X7XMfyX7/BkSDIU5Tm3r/0v0+TWdK46WXvCl
         UY9Gm0ZlDLJtz3sF+mnLQNoELTfwY0ygkgYMVJioK4wjpvwXaT9IB4/yYR7WrtR4St+r
         2czE5TuDN0hWLaY6gZIvsywcxQAP3XfW9pH+0/+S6VZAaOPHu8MvLwidnj9dM+zuplfb
         uCEBNT4Nn6I9a9bywLgOZd2hTEVHPdLWvI5zwc4VCUfc9amEXsrHX2KUAqtjSxiN0sGw
         YoU+iu8Q13rzOnei8nCEQTCZn8hNKCuU3sCzbIIF4qMpnxIBmqC7+kPZCcJ79NovaIHU
         ioHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qek8CJa1Lf5wEjUCizwM4dNQR7j2cqTQjO+0iv1r63c=;
        b=rkamTpvbKP3sJjlZkLvzmUQQp/fj42e8ZTqi0jxNX/NR32V8mlZr0+Cad7b0cKUVnf
         1gShqi8TXowdrAcHXntqqI6iaNAWYOw94V0R9TgQjXF4cbERtTXLhdCjzso2ue3/IVlg
         QxmftJMYMcGc2LfQTQeoLQonSFk6NTaj7P148BtqYWy3Q4Od+5GdTiydEQvmn28thFlN
         OrvCum11r7/Sk4u514T/PfSO8Y0Nx2OjYQdcs0xSk6p+YwE4xR6ja0ayCSLCPFwOtS8j
         eLT5Qq5Xc0lY6PEPbCOSKzjwJHulTaldI9SIRWGqFlAQIHb/x7ZzuvikKzB+1d79bxXo
         5zlA==
X-Gm-Message-State: ACrzQf1/KVjbWuM24jAvKfz2VK4Fnk0QYT7VmMNzEtAbrLqflM/s/PxI
	uyXHD3+kz0sAIItjmsF/d8a3Yw==
X-Google-Smtp-Source: AMsMyM4oGOVw8wPLrUx3Hh65mu5pC5F3uf+DHCFGbjcpaH8B5SW6WXAiEl3L2y3fsnOR9cr/2TIm9A==
X-Received: by 2002:a05:622a:284:b0:39c:cbec:e1f0 with SMTP id z4-20020a05622a028400b0039ccbece1f0mr1746595qtw.451.1667000226142;
        Fri, 28 Oct 2022 16:37:06 -0700 (PDT)
Received: from krzk-bin.. ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id c23-20020a05620a269700b006f84ee3a4f3sm26580qkp.48.2022.10.28.16.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 16:37:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: examples: add a list of templates and solutions
Date: Fri, 28 Oct 2022 19:37:01 -0400
Message-Id: <20221028233701.572280-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_163708_148147_72C6ACBF 
X-CRM114-Status: GOOD (  14.87  )
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

It is useful to start from existing bindings when writing new ones,
especially when one does not know that much DT schema.  However we have
several bindings which are not the best examples, so people tend to copy
their issues into new bindings.

Beginners also might not know how to achieve some more complex solutions
in DT schema, e.g. how one of two properties should be required by the
bindings.  Some of such solutions are already in example-schema.yaml,
but several other are missing.  Add reference with such re-usable
design-patterns.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/examples.rst          | 63 +++++++++++++++++++
 Documentation/devicetree/bindings/index.rst   |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/examples.rst

diff --git a/Documentation/devicetree/bindings/examples.rst b/Documentation/devicetree/bindings/examples.rst
new file mode 100644
index 000000000000..710eea81d8b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/examples.rst
@@ -0,0 +1,63 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Examples of Devicetree Bindings to use a base
+=============================================
+
+Following Devicetree Bindings in DT Schema are a known good starting point when
+writing new bindings:
+
+1. Simple SPI device:
+   Documentation/devicetree/bindings/iio/adc/maxim,max11205.yaml
+
+2. PMIC (MFD) with several sub-devices:
+   Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
+
+3. Battery charger (power supply):
+   Documentation/devicetree/bindings/power/supply/bq256xx.yaml
+   (but use vendor prefix in filename)
+
+4. Clock controller for several devices with different clock inputs:
+   Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+
+5. GPIO controller:
+   Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
+
+
+Re-usable design patterns when writing your own bindings
+========================================================
+
+Following bindings show how to use common pattern of writing bindings:
+
+1. Property required and present only for one variant.  Property cannot appear
+   on other variants:
+   Documentation/devicetree/bindings/example-schema.yaml
+   Line: 212
+
+2. Excluding properties, but none are required:
+   Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
+   Line: 155
+
+3. Excluding required properties, but one is required:
+   Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
+   Line: 91
+
+4. Array with numbers (items) from given range - min/max:
+   Documentation/devicetree/bindings/arm/l2c2x0.yaml
+   Line: 74
+
+5. Array with numbers (items) from given range - enum:
+   Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+   Line: 101
+
+6. Uint32 matrix, variable length of two-items:
+   Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
+   Line: 278
+
+7. Phandle to syscon with offset:
+   Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+   Line: 42
+
+8. Variable length of array (e.g. clocks and clock-names) but narrowed to
+   specific variant:
+   Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+   Lines: 33 and 71
diff --git a/Documentation/devicetree/bindings/index.rst b/Documentation/devicetree/bindings/index.rst
index d9002a3a0abb..fb8fab7217af 100644
--- a/Documentation/devicetree/bindings/index.rst
+++ b/Documentation/devicetree/bindings/index.rst
@@ -4,6 +4,7 @@
    :maxdepth: 1
 
    ABI
+   examples
    writing-bindings
    writing-schema
    submitting-patches
-- 
2.34.1


