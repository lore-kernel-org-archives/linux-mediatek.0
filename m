Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF97F5A8C7
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2026 21:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FkjylHhPY5Zp4sZf/mKL22KMI1gZWywJJ0iSsDcvxlg=; b=zeVB/mQ72zHTdztISQ0foCdGme
	fXHBGemKNJ/beXFmIrHpwCZtJoJqhBTRYtimRcBq86KFhHGilW4k0h3esLi+xu0jJFplsVIkL39IM
	fopFpbTm8yG/cf7CPbhT3w7GjHpmby/nuFDJ5n1fQ1p3ajeg1xDT/39zSYxXns6Rnuej0+ZzH6c1z
	3jDDgSTk5oN3e71KSDgQCYYJGOQQ0ESU/klxFz7LN9eXUwqeGTYqrWGj8Pt7HHY5rDN1kSaGKibrI
	p2PrCVXfycsN8GnVMmW1FXY/ycEn78aNXhiR8dCSeM6EuoNeQiB+p3gNqWDpe9MXFgJiyeDDqUOfQ
	3zaDNjUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwJa-00000007k4T-1RGN;
	Mon, 20 Apr 2026 21:37:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwJY-00000007k3l-379k
	for linux-mediatek@bombadil.infradead.org;
	Mon, 20 Apr 2026 21:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FkjylHhPY5Zp4sZf/mKL22KMI1gZWywJJ0iSsDcvxlg=; b=v/+SGqVQUGq91bG+Z8RV6i0bB0
	Mss7AOVHvuFliYU6YfnIeEx7grWkYM7jwPMt9n5QKfZkqatdoryy3sV7hQbFo2jvTyxJ40291Oo1r
	6yh1yuPjydBfW44zapEgj//n3YQvDQGZTKEGsKcBcO7WR8kNCP6msXt5HTpb+fu37zuFvdLQ4MQyt
	rK38tl904y7VtNAQHwPnp12x6WMjQLdpX+SK/v3c+O6FQxAiZRV+TDQt1n4A7miU7cDrtdqbN7MjY
	/WeLRSzVysNpuew/Uh0DlZkL2Q1BqF7kvZjIJMbe8rBeWqEZRECWnREVUvTcXlZc98HimKmlxslIo
	PW4tm2aw==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwJU-000000095iY-2g6E
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Apr 2026 21:37:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488ba840146so33648625e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Apr 2026 14:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776721070; x=1777325870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkjylHhPY5Zp4sZf/mKL22KMI1gZWywJJ0iSsDcvxlg=;
        b=TjEKYupKQ99PH7RTi8a2yj/QYntBDnr41ia6A2jWrROFHbhskYR0mV5vXfAt4CC5h5
         PrsH3qh7CEFgMJ/vM7j66rrS4geF4EIl6+DXfC94FZ674RfNo839o/HdrEwXDcfcW1Dm
         0XRwZaHCoH6qVPhFPk1Ly5rOvdf9/o5UIfHApqZt9qtWYs3eWiUj/X8RleJQFp9O6x++
         5mo9E6f7gXh6/XWJf46RDrjNBT5DPdNGfa9+ZNwKUh3miagiI1Oe78SiDfCFgsHhoQAG
         jlxzwiULc6CASkvVQsOMuWZrfaeTmBDWNc4eSzoP8alOSCPi9ZvTgW9OigCIWF7g8frb
         brqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776721070; x=1777325870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FkjylHhPY5Zp4sZf/mKL22KMI1gZWywJJ0iSsDcvxlg=;
        b=ryb9AYG3aOVIRxiEMFHWGn9wDaRpUilgZUKivX1LKSycGfZBjWX6w/o7orFZhQt1a5
         KsNQOKtjTO03cEgn/eMJP2wclqtkRV388LVANUfiwO+j3SZnst5nF7m6PH2HGI49PC+J
         xPP/kzKp9seGrsHhZz+H7/pTa/l1RNKOfSTjTmRgntjkQEiDxkv/DoBHUERoUE6Yx0Ib
         OZj/1WQk3sWbDWUT9eh2S6iSDhDwHtGiszWtlqd2K/A5/MJyLD8Avt9V+vcQsK38tMKU
         HhcxmjIm+ENpJ6Vvn5a+iu5ugJf1KXmI6NO8y1YjuL0+8cJ+rsdMKWrqKwAH6q7psi1a
         K5Gw==
X-Gm-Message-State: AOJu0Yx6oti6g5ddC4Mj+UzwTmrYK39+OSKTw0a9QXX3SKJ/SUK5ihuk
	OtKXqdDYuGE5j8A8vMqUjcAL/o1D7Rt98ngLx2YYr5m88wSajwfQQ+6gk6m1DwjX
X-Gm-Gg: AeBDiesDgQSUTT3bR7fsCSyg1a1+l3S1Gw9mtVSYwyfRK+dzxeiiFCWik/AUa+J5Dvl
	LO17t0Gwfi9Dz0Fm2IAIz8byzWu6J2muIwsKOksNKOXAw/1vUbnzL71F49HsiwuhKkCZh2r48sS
	C76/vDXQ5GJSEUsRI73D4WETLe2u6s5kHbN2pBq4SNsi773OSMVyXtq1bfQAjn6v2mAWxxYVnEm
	kkPUCL06n01mYvSNwVl1oI1I9pmexKk1/DNbxKe5bsCUjtbIQ2dyTJrPewZLYwUdahGZr208dTV
	F0Ccf89dsgvz/DGZ0IUYAiKfhW2nk7dZA+rkeAEmCE3WWc4kiguFzWrFhB9CTxpbnchczi/tYV1
	JlmAyfAdVl9TZzQO37tfw6Dt5oKLDh7lbW9X1DVx0lcdUwA67qY8MJirMMtL76VnPpF0HT5fmO7
	9aQl+sq2Y3Rs5PtKTvHfTWIXLn7Knhig==
X-Received: by 2002:a05:600c:8115:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-488fb77d7d3mr178338515e9.21.1776721070421;
        Mon, 20 Apr 2026 14:37:50 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm289500355e9.12.2026.04.20.14.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 14:37:50 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 4/9] dt-bindings: pinctrl: mediatek,mt65xx: Add MT6392 pinctrl
Date: Mon, 20 Apr 2026 22:30:03 +0100
Message-ID: <20260420213529.1645560-5-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420213529.1645560-1-l.scorcia@gmail.com>
References: <20260420213529.1645560-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_223752_698461_A5291601 
X-CRM114-Status: GOOD (  12.38  )
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

Add a compatible for the pinctrl device of the MT6392 PMIC, a variant of
the already supported MT6397.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |  1 +
 .../pinctrl/mediatek,mt6392-pinfunc.h         | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6392-pinfunc.h

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index aa71398cf522..1468c6f87cfa 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - mediatek,mt2701-pinctrl
       - mediatek,mt2712-pinctrl
+      - mediatek,mt6392-pinctrl
       - mediatek,mt6397-pinctrl
       - mediatek,mt7623-pinctrl
       - mediatek,mt8127-pinctrl
diff --git a/include/dt-bindings/pinctrl/mediatek,mt6392-pinfunc.h b/include/dt-bindings/pinctrl/mediatek,mt6392-pinfunc.h
new file mode 100644
index 000000000000..c65278c8103d
--- /dev/null
+++ b/include/dt-bindings/pinctrl/mediatek,mt6392-pinfunc.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef __DTS_MT6392_PINFUNC_H
+#define __DTS_MT6392_PINFUNC_H
+
+#include <dt-bindings/pinctrl/mt65xx.h>
+
+#define MT6392_PIN_0_INT__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
+#define MT6392_PIN_0_INT__FUNC_INT (MTK_PIN_NO(0) | 1)
+#define MT6392_PIN_0_INT__FUNC_TEST_CK2 (MTK_PIN_NO(0) | 5)
+#define MT6392_PIN_0_INT__FUNC_TEST_IN1 (MTK_PIN_NO(0) | 6)
+#define MT6392_PIN_0_INT__FUNC_TEST_OUT1 (MTK_PIN_NO(0) | 7)
+
+#define MT6392_PIN_1_SRCLKEN__FUNC_GPIO1 (MTK_PIN_NO(1) | 0)
+#define MT6392_PIN_1_SRCLKEN__FUNC_SRCLKEN (MTK_PIN_NO(1) | 1)
+#define MT6392_PIN_1_SRCLKEN__FUNC_TEST_CK0 (MTK_PIN_NO(1) | 5)
+#define MT6392_PIN_1_SRCLKEN__FUNC_TEST_IN2 (MTK_PIN_NO(1) | 6)
+#define MT6392_PIN_1_SRCLKEN__FUNC_TEST_OUT2 (MTK_PIN_NO(1) | 7)
+
+#define MT6392_PIN_2_RTC_32K1V8__FUNC_GPIO2 (MTK_PIN_NO(2) | 0)
+#define MT6392_PIN_2_RTC_32K1V8__FUNC_RTC_32K1V8 (MTK_PIN_NO(2) | 1)
+#define MT6392_PIN_2_RTC_32K1V8__FUNC_TEST_CK1 (MTK_PIN_NO(2) | 5)
+#define MT6392_PIN_2_RTC_32K1V8__FUNC_TEST_IN3 (MTK_PIN_NO(2) | 6)
+#define MT6392_PIN_2_RTC_32K1V8__FUNC_TEST_OUT3 (MTK_PIN_NO(2) | 7)
+
+#define MT6392_PIN_3_SPI_CLK__FUNC_GPIO3 (MTK_PIN_NO(3) | 0)
+#define MT6392_PIN_3_SPI_CLK__FUNC_SPI_CLK (MTK_PIN_NO(3) | 1)
+
+#define MT6392_PIN_4_SPI_CSN__FUNC_GPIO4 (MTK_PIN_NO(4) | 0)
+#define MT6392_PIN_4_SPI_CSN__FUNC_SPI_CSN (MTK_PIN_NO(4) | 1)
+
+#define MT6392_PIN_5_SPI_MOSI__FUNC_GPIO5 (MTK_PIN_NO(5) | 0)
+#define MT6392_PIN_5_SPI_MOSI__FUNC_SPI_MOSI (MTK_PIN_NO(5) | 1)
+
+#define MT6392_PIN_6_SPI_MISO__FUNC_GPIO6 (MTK_PIN_NO(6) | 0)
+#define MT6392_PIN_6_SPI_MISO__FUNC_SPI_MISO (MTK_PIN_NO(6) | 1)
+#define MT6392_PIN_6_SPI_MISO__FUNC_TEST_IN4 (MTK_PIN_NO(6) | 6)
+#define MT6392_PIN_6_SPI_MISO__FUNC_TEST_OUT4 (MTK_PIN_NO(6) | 7)
+
+#endif /* __DTS_MT6392_PINFUNC_H */
-- 
2.43.0


