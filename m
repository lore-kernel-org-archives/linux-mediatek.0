Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9186C678D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 12:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjhrqpxloWE6ONs+Pg7avedoS40plQhwR7tQyDf+1NI=; b=dIyTsu2os5HDydIb6jrkFUvVC4
	ZBVpg6GskOT97FC0AbW7VawsR9ALVRgGX6NeZq4JBse+oosR+kqqB+/kYUkLIYk63EfWYE86nAWbH
	3VnbjVBxSS5yJPJu+m0Y1z6VdhreCXCRDQ97jh8tcYIuGQg6HFPf0JQZE6CckvP1BQxkjUAI7h8B4
	QPDQClpp9q8lEB5upPXhosl8I4E7h8Mp84Rn275kgpgPkB77vQHUM3JojclDnFVg1cfjUc+jFGFkb
	aI5cjvpeaCQ9yBx3go+kNind+mfQHbpcmsWIm9YMaGYDldKbq+YKFll6ZBZqewADy8Xgug7c0zkqL
	V7GR2hng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXiF7-002Buq-Cd; Thu, 02 Mar 2023 12:41:05 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXiEv-002BpI-3M; Thu, 02 Mar 2023 12:40:54 +0000
Received: by mail-ed1-x533.google.com with SMTP id o12so66960245edb.9;
        Thu, 02 Mar 2023 04:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677760848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjhrqpxloWE6ONs+Pg7avedoS40plQhwR7tQyDf+1NI=;
        b=gbmgoI6laQc6/BL/YNgDPvv1PN2ZRWGhLBi8S8/A7u4bqe/ANj4oQc6GPQglRPVuA9
         Yy5YRPkTen1Z/Swqt6UwBSkjqBHDXSRN2O3YqSWBDguoqCFFm6gCQccnR5IsA258ikYg
         oMCBC4P720JczFNcfpEA3H0dXicB8rkA6JzF9u/wTpJXi5Ks81wDDmhY0ZD9GUKzGbW+
         0hv0t5GhorZ1+n8e8b01+06ahUUp/ZJW7nVQag2BC6XZhB5kR6BqzFUaMOK4SIubEVJ5
         77OlUgZ/nl/Z3IOneSqFlKA12SHBmJy9GApBvWJFi9B4VQueoGcGfT3oOBZqYz5vcTTk
         lcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677760848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NjhrqpxloWE6ONs+Pg7avedoS40plQhwR7tQyDf+1NI=;
        b=fGFuyVuu6Kt1EvvrriAc8/ILYVyha4hHMMZCZ8h8bvAK3iXWEnY4tQgpepx7YFWuli
         skwNeGeDyetoBoIjx+uVsiazgyqt7BqjIj/i2N+3yp0tAwx2R5RWrtGsgijgLI7dfYTz
         6CztXB3gJdB76NTD1RCh7JbYQrTXlX67IjzTKKQI/Tj2+aVdQMtl8pUNHcWPdJW0EUNu
         GNSEW0zVBdD5hd2YqzbMEQmsVjp/UDpXuvbD168S4YcfuNei5jfCKjYD+7oqILdAyDjb
         rYOmGkBj3Ukf1TZIxNTY3FPH+LrU6/OSr6EIkEPjSb7LhHokoW1fufFfMpeROtKNTSe1
         sKfA==
X-Gm-Message-State: AO0yUKWfoDLZ2idIKS9juzLQ66quz1zVKJhZn3EkpQjBVyASebvSUzZQ
	Kvoyuu2Ms+rykPYwUlpJbnY=
X-Google-Smtp-Source: AK7set8/HK/oMZWKO35qnjajVW9FaD8X1JDnnELZEJrBvVOwMD1Ga4Z+YkLOvrNIWmDciTgh4LpShg==
X-Received: by 2002:aa7:d6d8:0:b0:4bf:d8d9:4b0e with SMTP id x24-20020aa7d6d8000000b004bfd8d94b0emr2145093edr.22.1677760847970;
        Thu, 02 Mar 2023 04:40:47 -0800 (PST)
Received: from localhost.localdomain ([95.183.227.97])
        by smtp.gmail.com with ESMTPSA id c22-20020a50f616000000b004c07b11deb8sm599036edn.64.2023.03.02.04.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 04:40:47 -0800 (PST)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: reset: Add binding for MediaTek MT6735 TOPRGU/WDT
Date: Thu,  2 Mar 2023 15:40:14 +0300
Message-Id: <20230302124015.75546-2-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302124015.75546-1-y.oudjana@protonmail.com>
References: <20230302124015.75546-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_044053_188162_C006E574 
X-CRM114-Status: GOOD (  14.17  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add a DT binding for the MT6735 top reset generation unit/watchdog timer.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../bindings/watchdog/mediatek,mtk-wdt.yaml     |  1 +
 include/dt-bindings/reset/mediatek,mt6735-wdt.h | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-wdt.h

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 55b34461df1b..009ccdb60b84 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -22,6 +22,7 @@ properties:
       - enum:
           - mediatek,mt2712-wdt
           - mediatek,mt6589-wdt
+          - mediatek,mt6735-wdt
           - mediatek,mt6795-wdt
           - mediatek,mt7986-wdt
           - mediatek,mt8183-wdt
diff --git a/include/dt-bindings/reset/mediatek,mt6735-wdt.h b/include/dt-bindings/reset/mediatek,mt6735-wdt.h
new file mode 100644
index 000000000000..c6056e676d46
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt6735-wdt.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_RESET_MEDIATEK_MT6735_WDT_H_
+#define _DT_BINDINGS_RESET_MEDIATEK_MT6735_WDT_H_
+
+#define MT6735_TOPRGU_MM_RST		1
+#define MT6735_TOPRGU_MFG_RST		2
+#define MT6735_TOPRGU_VENC_RST		3
+#define MT6735_TOPRGU_VDEC_RST		4
+#define MT6735_TOPRGU_IMG_RST		5
+#define MT6735_TOPRGU_MD_RST		7
+#define MT6735_TOPRGU_CONN_RST		9
+#define MT6735_TOPRGU_C2K_SW_RST	14
+#define MT6735_TOPRGU_C2K_RST		15
+#define MT6735_TOPRGU_RST_NUM		9
+
+#endif
-- 
2.39.2


