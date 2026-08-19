Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA760C5DF87
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 10:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnZE7wbRFGJKlrtdBKnnD6qNsCW/P/b4SFhiLIR6sD4=; b=2jGeVtZHZ4c/WmyDJKYe2xkRLf
	AT4yX22AfqKbdlp8PcNsKROv6L2JcTnOwTahkJQi8L9qWQR+ht0U/a+w3LUqQSzvSEh2jtMPPwbKy
	pJdEUlIqzkbkrfYmoygvA3gnbqWnzqgDe9EWhXWcrqYUolxJU21P7oF36QedDttZ+rOuz6fm+MvCa
	Z2qt594VYDZpuV8cbJEoIta6mzuXpzg24Tlmo+AQjisMTYEatHiY0IXrkM/3638t6czUjx7zRRu4J
	3MmZsYClA9sJAX/B5RBKYJrn/yrFZBJSMLlNhsDrwSrL3XUQV/yJXLUOy1VS6YY/oWhivaB0YYHzF
	/xGrKKMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdP4-00000009WXM-1j5n;
	Wed, 19 Aug 2026 10:20:14 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOK-00000009Vz9-310l
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 10:19:33 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4980dc26022so8683245e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2026 03:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134767; x=1787739567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EnZE7wbRFGJKlrtdBKnnD6qNsCW/P/b4SFhiLIR6sD4=;
        b=TyjrUsL+NZybtEoduTjpvw4L0hzrQ8Mzxa2i2nQsqQsZ3fP7KLduwz3OckNhLQq1qV
         NMRzs79dCNNf3OBP4tJSydBGXpImu04Oi+Oy98Q2U/pm5lRiwDLd75qMxXpwcQWD5PIN
         je7eybSGm7OsEgiEKDRjMbJwOXYatml0t9cFv6OSEP1aLZjwL0XDUy3FygdDqG8hZYoS
         UU3hicNnf3XchVnjjqagXVT3oDk4AzDU6/9KFHzZDPVzWfF4Xqx8l5b6rqujZWPSLWA6
         bEt6wnslpnLzVfVKE81ER7d5fnueGaPyJhxf0m/ms3W4fnAIUVZmkwifcMCf3jJqDke9
         UitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134767; x=1787739567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EnZE7wbRFGJKlrtdBKnnD6qNsCW/P/b4SFhiLIR6sD4=;
        b=nvJO7xO9pr+JCPqF5Rw/ouyvmtHvuTnI0HP6k+vbyPvccdYti3dWd7EloPP0h3Xlcc
         9lTPf7840W1YXqGAwizZBOZKfB3dalZONbBlIL1NFLHQeqsbVKGanuUQQn8085LXr8uO
         yKRf8Jf1pwnzVmGnyfFU7EFX6Tqgr/XMNo35WwLbbgV78EDW3hGIm5edfiSg2vliWW6D
         lw0tsSRBSHsOd5NprNeR+CcQAffYwxoKbumm3Qh8J7XwFBI+89LRzvvA4jRgEY/d8jzC
         CayxuH+pp+qzzYLGG2Ol+yt/UBGxHqCviksBx24aBddvz23jxVUjuq2dYUfxdSwuD2Yw
         1/EA==
X-Gm-Message-State: AOJu0Yw29N7R9pEkYXk8oKTRZh9C9bwtaVmTNv95Gl/bpJ8p8Ol9y5Qz
	NNUpHT5/7u+TslRnaxDojAGvRvq05PMoWY8z2tLAppBA5T5mLEcqz7frvLK4uSWE
X-Gm-Gg: AR+sD13zi+oT8uvjYJgAT6bXHHRmrnnognvuGrMbE/bjxDCZ6DdFwCaAvRR2wA+zlvF
	lM/54jUOgF9Meq6XzQfwS8XJl9jE6qtOQOdSyu7Ifzu9E6/Q7/qfOU+vFRuoQYPuKecu34fDLAn
	MydKf1xm5DtFY7PHGbLgnF2xN5LyDDa/55QANwra953xQW1/VMpjpplpUYvGZj33Ksc2EE0z1nA
	lAFwgBSc1h9x3TtcYLexAbasXpMf4TDy1qyrLtSQLhMEcTmq7Pt8Nutco/L4VytdyUAJEugcPnC
	8Sm4aiPFHtXOosWLodpHVX9ujK/0sYinv6XHqzbuLGU5dm9XBueMce4hRD//ceFRlpxKXSoH3TC
	jPebpszQJbs4HpFj5GYfq8cokQjZ38E44UrQ+LvBayOTWXy2y6DbRhVXQcwb7t8oKRgp3E9UauG
	8z0/0Sn21S2BrbwWT8y3XHlEhiSR4mm0kiSn5dydfbEvUaVP4qFVtQK0RPLEEeht74
X-Received: by 2002:a05:600c:1d1a:b0:493:a623:d090 with SMTP id 5b1f17b1804b1-499aa1dde53mr59985075e9.10.1787134766581;
        Wed, 19 Aug 2026 03:19:26 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9b7c987sm27316965e9.1.2026.08.19.03.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:26 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 7/7] arm64: dts: mt8167: Properly describe the SoC watchdog and mmsys resets
Date: Wed, 19 Aug 2026 12:16:28 +0200
Message-ID: <20260819101853.44681-8-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101853.44681-1-l.scorcia@gmail.com>
References: <20260819101853.44681-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031932_530695_F8584CD2 
X-CRM114-Status: GOOD (  12.33  )
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 toprgu is not really compatible with mt6589 (it has 14 sw
resets instead of 12, and the reset IDs are different from mt6589).

Use the dedicated mediatek,mt8167-wdt compatible for the watchdog driver,
as it correctly describes the SoC resets.

Also add support for mmsys resets by declaring the reset-cells property.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..cccc487086a1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -8,6 +8,8 @@
 #include <dt-bindings/clock/mt8167-clk.h>
 #include <dt-bindings/memory/mt8167-larb-port.h>
 #include <dt-bindings/power/mt8167-power.h>
+#include <dt-bindings/reset/mediatek,mt8167-mmsys.h>
+#include <dt-bindings/reset/mediatek,mt8167-wdt.h>
 
 #include "mt8167-pinfunc.h"
 
@@ -95,6 +97,13 @@ power-domain@MT8167_POWER_DOMAIN_CONN {
 			};
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8167-wdt";
+			reg = <0 0x10007000 0 0x1000>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8167-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
@@ -124,6 +133,7 @@ mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8167-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		larb0: larb@14016000 {
-- 
2.43.0


