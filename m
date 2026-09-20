Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68381C982D8
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2026 05:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqP4V2+10gRQA7yGYe82IeB5bWtXD1MRgeLzqXm0MrQ=; b=GuCCF6yULQyUz9VuU++WGLIt0c
	s8NIKRIVIECLzJP1VWYUPQIsSfbp1Dle3j17AGWd3TWlETVSXf/F/221iLujfvBSeCnn9dzJPO0O2
	s+cpGqH7b5wdmSkmD/3cbT7aFh6Lf9dxVIzn+rWZV8+7wFLtYPGho5BXS+lfhBHh1dhPk96yDh4JM
	v69eKOBjYy9o8RdMX6TlMMWqepJ98XKY/RjK3en+FCb7hhrgxwgZ7+JYf1VIkNC1Y8kw7f5xY96dr
	R2ewpMFX4BujBYGUNBAMoeIWXCmxaD0HaQ3XfnVcXoEEDcleo7tIpqcxsbBl/B7tq9MkZQEW+1SCb
	sCuEMmig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8A9q-0000000GwTe-0RLO;
	Sun, 20 Sep 2026 05:32:10 +0000
Received: from mail-oo2-x06.google.com ([2607:f8b0:4864:31::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8A9i-0000000GwOB-2XdA
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Sep 2026 05:32:04 +0000
Received: by mail-oo2-x06.google.com with SMTP id 006d021491bc7-6aafac56856so892859eaf.1
        for <linux-mediatek@lists.infradead.org>; Sat, 19 Sep 2026 22:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789882321; x=1790487121; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqP4V2+10gRQA7yGYe82IeB5bWtXD1MRgeLzqXm0MrQ=;
        b=VrEMooy88twKz+IrSlJJSuCEgOfb2SrGtNiUaBP4OezOTyIu97bGqOVD3J9tnWGK+o
         dl8OF40W5cFPc6VqDjo+BAmiO7V3FPv5HsU5dxElGPP430rikjH3cPbG/pruQNjWtJ1k
         xMT7vutXgjIa5u8DD84WDRL5TZfMukNqmaRDcWg4urMILlWStYyeptwDBVeEaQqvhGAF
         HOVKTulATdfSTnBGzzOomU58Tv8jzpVprugEeKk4rmo6SQMXtnvJBqeI54JKjox3RzJr
         2x9ZFiwRuXNS5U41kcQaqy3qL84v2149Qld0VsI56Fek9AtW+w4xUTcNYcUAjmbAxXVd
         vMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789882321; x=1790487121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqP4V2+10gRQA7yGYe82IeB5bWtXD1MRgeLzqXm0MrQ=;
        b=DvNGn1UHoSLaH27Ws8nQM1mJoggqnf950mb0Cx9fvYn3U7lUJveeZmA9VzyEsA2aUw
         FvX8CPl9vtrygZ2ONe/Ymvp50pG5MQJFnXKxFT6XWlS7sjYi/Zr1bPbzeGQQYe2V1IEZ
         +tF1zANd9ZEgrCTbl9tTNxAA9d44f8bo8fFqJGaSxsLVJ2DuFvU2Djk1AJh8rNCcREI0
         xZlJjHMKUzMm7HLfp9axmW61/SHRVYNva5F5yU4Nlf/q/do2HYDbqY87KFGuKSsGrSQW
         h0gVXMI0GH+SBWCjgNG43pBDyVQ5hQUIR9HKQv/R501CO+W+qHscAAtyur0IEnMJx1Nr
         HKoA==
X-Forwarded-Encrypted: i=1; AKwUvBwcV3Se3xr08R6d7TiXP5F/wU2/ndWdm4xv9enkVRbNV6AiDmGfHYEk/YewY1q/SYAnnSPea8TAbJabpc0uEg==@lists.infradead.org
X-Gm-Message-State: AFuF++kpL/DdxfDvTNUFvx7cLRcmjRrQcD1WtQV+m3sPUSoPH8XfLVM9
	XzvEQs9pIovbA8kzGtomkuM8A/3du3cNc8Ih13gPfLzeTo36f+d85V5N
X-Gm-Gg: AYBFou1wJoaDTAUFBbhdQKp1UNEyX6o+Tz5CV1R5Aku/jnY6R7yIK3us2q1NvhqyHxm
	MrV8vUKz4X9xRwwdffPaU+tjcgwi2oWVnzeMcTGhFXa7U7LEwzcuURor00mj/KOMhphKe5gwbG4
	PQJD/iiV3p/o8zR8/9hm93Z0uwSLJ+9OcjhZGuVTtQgFWY6YzJSOelEYZfxxw0Kwh0XkeSJcPe9
	5NgOh5lIaJH6kGpvwayWxpjctKpARkj2SMObMPfu/euk6qvoWr50Vel2vTPRxnNJuGJKlTdve/r
	4ZvySlwRBB+5xglyyTnixeMNo03fxer77o+1TO3ZPYH/0DV20n4d2dW1XFeTxTpePmAk9CZ6+U5
	T4SZ22ZCwgmqx2OBYtNe5HohP+3kQLz0Zp0d2c1e6bWK3CGCPtMHY8zNJEFkJe2ivtXOA7onPtm
	S5Lv+6xu6qlKQ2xcIhaI20evAaA44vcxeCCz094COXbilp9UPYd+2CmnA0GoSZKS07K3o=
X-Received: by 2002:a05:6820:c0cf:10b0:6cd:3fdc:6009 with SMTP id 006d021491bc7-6cd3fdc6073mr2569288eaf.90.1789882321459;
        Sat, 19 Sep 2026 22:32:01 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd3541f07fsm5007319eaf.10.2026.09.19.22.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 22:32:00 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 20 Sep 2026 00:31:51 -0500
Subject: [PATCH v3 1/3] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add
 mt6397 PMIC AUXADC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-1-c00edacbee64@gmail.com>
References: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
In-Reply-To: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789882316; l=2681;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=fwlPkqstrQlpYtzSAbjI/xkIKHHpjI1afmv6T7fC7po=;
 b=Opl97KH8MrqT3zIoiO069ry22IpQqYaPkHHieyAt0MVeeRXmAV1cUFOzXcG3h4gqUISqz8ECP
 zcigdUcPK5ID5aT4XknZj1qigND/X/OZwurcQvc1nDaYdP5H9wRI4Y3
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_223202_657240_FE9A63B6 
X-CRM114-Status: GOOD (  14.75  )
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

The MediaTek mt6397 PMIC includes a 10-bit AUXADC used for battery voltage
and battery temperature measurements. It is not register compatible with
mt6359: a conversion is requested by writing a channel number to a select
field and pulsing an edge triggered start bit rather than by setting the
channel's bit in a request register, and the results live elsewhere.
It therefore gets its own compatible rather than a fallback.

Add the binding and the header naming the channels a consumer puts in
io-channels. The battery channel is named for the input it measures,
ISENSE, which is what mt6323-auxadc calls the same input.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 .../devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml      | 1 +
 MAINTAINERS                                                      | 6 ++++++
 include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h             | 9 +++++++++
 3 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
index c2f7387e4bfc..2847bd5d5bc4 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt6359-auxadc
           - mediatek,mt6363-auxadc
           - mediatek,mt6373-auxadc
+          - mediatek,mt6397-auxadc
       - items:
           - enum:
               - mediatek,mt6365-auxadc
diff --git a/MAINTAINERS b/MAINTAINERS
index c2414447892c..41d7b3a67415 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16713,6 +16713,12 @@ S:	Maintained
 F:	drivers/iio/adc/mt6323-auxadc.c
 F:	include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
 
+MEDIATEK MT6397 PMIC AUXADC DRIVER
+M:	Ryan Brue <ryanbrue.dev@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
+
 MEDIATEK MT6735 CLOCK & RESET DRIVERS
 M:	Yassine Oudjana <y.oudjana@protonmail.com>
 L:	linux-clk@vger.kernel.org
diff --git a/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
new file mode 100644
index 000000000000..b696c1cb5ebe
--- /dev/null
+++ b/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_MEDIATEK_MT6397_AUXADC_H
+#define _DT_BINDINGS_MEDIATEK_MT6397_AUXADC_H
+
+#define MT6397_AUXADC_ISENSE		0
+#define MT6397_AUXADC_BAT_TEMP		1
+
+#endif

-- 
2.55.0


