Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADFEC88E77
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 04:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhwjcBFP/KKm35RjYsTK0NhciT0e3mhgRUR8OdcQ0MU=; b=18fr/SCq/j8NDntir5avHAxswS
	Id7ZqVFcRi7nzokbaHeTU+AnZfYt/NU7gP79ncD1PvOyZCiIpUxq7sS/oDeqTOfnQle07LVBTJNit
	xhgJVBIoax2HyahfX+fcQ1BT97+tIsSfSWCpZJ1VCQWSlOglqSuwFvUa1yAerZ3VOZBxAGBJbsMn6
	5CfXMD0L/YssEiHDXTYHBrM6kyxfh9yAgl1b622XeJkPrD9wURF0T0FujU9hawndFOGMjO1LecOFt
	1EU212ye1RxtwpWazXYXf8C0IK726pGHzgW8WEAbALQO7VBi0mWohVP9Xxpb6xXDbO4jVRCdCncv7
	XM8b8QCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6h3c-00000008I39-2ZYp;
	Wed, 16 Sep 2026 04:15:40 +0000
Received: from mail-oo2-x04.google.com ([2607:f8b0:4864:31::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6h3T-00000008HyW-3laF
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 04:15:33 +0000
Received: by mail-oo2-x04.google.com with SMTP id 46e09a7af769-7f4e9ec63a7so1383743a34.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 21:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789532131; x=1790136931; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhwjcBFP/KKm35RjYsTK0NhciT0e3mhgRUR8OdcQ0MU=;
        b=ZfGXpHLr7ArSqT3IJ1r+/Rmo+BsJaU4jGSHSfiVF5pTOZjaADxvZRzAubresojNAL8
         uUbXTd+eI1dTqjYNFKShToJExIX9k4qdLW4EORHcAOtlfacHHl7N/28EI0xGe613gp32
         F0icIKWQJ0nmCr1nGpyXxuujcKMphiBeqlXX/O+3fbkLoZNbt8ZB7nLV/InIXvGhYFrK
         QiSlKVE/M5cWO/A24U0bC7V97ai0hpndnyW7LBr7qEdX3VWQXOaoHHPTpMipHc/sAssc
         +N6aOTsv+eWMWUK99npZ8ML+QDfScyrMhu1j4xAx/h+KTUmOM3PBtjwM+VVoSNlkIPm1
         7U6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789532131; x=1790136931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhwjcBFP/KKm35RjYsTK0NhciT0e3mhgRUR8OdcQ0MU=;
        b=lcjyowwfeaIToq/KPnbhMNHMKSKoi/I/tBMY1Sj9ZDMkskV+KMvB3wfIbscRkR05DZ
         aezn7UcMSkP79zzXizmuP8zEsya1DuWW/ubJ8GF7ztvy8DNrGt/fu1M+LZbcUqQO/o8u
         fGM3ytxZLmZlUXhXusMtqlbjSe3ucjesJY0FAOBjs5qbbIOTobADuH3feY1+Qyqu86/0
         Rhy/vy4ej/AmaZjty75C9MRPD9WK3328/vsq0V07cWaOsbgpT+XOcB4Ru0sCamxOTYWN
         ZZ6XiKn+3Vx8oE622R5kXYpW3R3HB4x6v5QX+dwpM88GU6nACx/k+W1Q9JaWf/pnMmM5
         GGMA==
X-Forwarded-Encrypted: i=1; AKwUvByRGOGY0Q8WHQfalp3CgfVdyYtcAyKCBQ1UWjW4eNdToRsbD6hZ959R68qmgpo02kqZr1L43AtmqBnZctaiOg==@lists.infradead.org
X-Gm-Message-State: AFuF++lBkSFO5eP5QdTwQTlTwM7MAMBfd9cJyAXwWZm7FCExvYIlenU3
	evbp+z0svxfpp+nw3GKxMHRzQWWTP3Q0g6xAMxqCcxAL9XN+dj/93JKz
X-Gm-Gg: AYBFou1nR47A9nHAOK2FzczJH3aCdy7gKcevNlk7T7ROXyJ9gX0ElQ4VhSdTW8fbZjV
	nYOGUm9e2mv6ZNSa57P36dnHIdM9JT/RelZqixY4uxoGWgrVc2h7RbphPaDFqdXyot8GggCATjl
	i+c+SZDigP7pXZ0ZRDHYBNnKFeVksJZu6/t7p1zERVlxtU8tKeYQihqDMSQVNl1Rt2yXvaVwFZm
	msROa7qU9LTJtXFRimmO4+vIC3ZQSL676dTuxDwgIJl/hsQIPT1PPg8KdVzj6dpZdQa6dJhpqnH
	z31n6OcsP6gOlKgwc+bb8hCRR2OrlMgn1H5lcDFYOgItBFgTaShQTu70gBfI04X3CZyLgsM7ywx
	OhYroH4HYmRH1kPr5svriusbIRFbHtZUSD3HLhulxWfr6ThrheiNlsaqbCDpXFwrykJQbyNHV4b
	a1lTfHkSESx7m6EMDv//Eq4/sJiuS8zspcfvvh5lhiUyOS32mLImMxzsBAj2EA1d7mx28=
X-Received: by 2002:a05:6830:6211:b0:7fa:ab72:9e04 with SMTP id 46e09a7af769-80b2f7c830fmr1398025a34.28.1789532130742;
        Tue, 15 Sep 2026 21:15:30 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80b07ad0373sm1440484a34.26.2026.09.15.21.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:15:30 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 15 Sep 2026 23:15:26 -0500
Subject: [PATCH 1/3] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add
 mt6397 PMIC AUXADC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-1-d35d2ac3d6f0@gmail.com>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
In-Reply-To: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
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
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789532127; l=2042;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=pmiqpg+YqOsk+EKifCpoFFAOwMNO4lcDpbG+a0tTy6k=;
 b=zlRbINoqD2290MGLwe+MTrL1s4Bsp9ASTtTw5dB1r5/3VSi6a+YNhJDWnfn5xx5DMFAkDSpsR
 JKyOG0N88gfCa+Au6JKO0cUBK36yIriOBv3MjrXPSU5E4mjHwOdwFy9
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_211531_945833_110616EB 
X-CRM114-Status: GOOD (  14.01  )
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
 include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h             | 9 +++++++++
 2 files changed, 10 insertions(+)

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


