Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83085C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 13:57:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 560B060EBB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 13:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 560B060EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+wuxk7HnkqbeLKOHtSUhl3LKrLrZhlmZlshFFk69aDU=; b=w4ODWWrvfKHOER
	/dqD5iO+j5cClXWGlEFMl10OeKd9/cn25dOxKRk3vChXUwAH+cSFXWQFsHXOFTnCSq+8aN1tHFeIC
	Y6T02z2/+6IY9zFdR2hAKlRt8sQj7rbSsWUQW2gDjMvCJJn3T33ivaC8UaplEg9GHGAKLqPxrbKCf
	w8bmBjqAln5FL6e8HIbfOIB0oUdq2vBkxFn5VYm86xSoKb9DVDLh8H5CD1MhiU0WeIcot+6wFWWB8
	TY24AMuepGBinlCfU43lMQQ9/LQm2q0472jiq0wP7oJHwOavv0ZvNNr4Q4La67bx9T7EGVwrt1BKB
	ODXgrxKHb25tg9N+3qEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb1Eq-003L0i-FV; Thu, 14 Oct 2021 13:57:40 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb1EQ-003KtQ-1N
 for linux-mediatek@lists.infradead.org; Thu, 14 Oct 2021 13:57:17 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r7so19830444wrc.10
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Oct 2021 06:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CJsCWcU0YdDyrwMeRQ7adfzbBn9rJ1IRoawBpqp6LUY=;
 b=nWdcXGVnk8Oz4L0y1/sfaNNPdvqBC8SWVQ5nnv5b8TQyWXphWKaoUoiCpwNZG8Kmg7
 3dj3uagsMpT5Mkox9mRqXNBxgELAR6KQRJP9qR7cIbMpgcAwTrHHxyN3OM34CHGR60Kf
 uIoST2ZV+XIqKoziuz9ddYYjU2uuTxUp8n0OkD0kamILuU2BO4qcyQAoYlx5tI534hXJ
 8wX7ijJxd8dBsX1S0k56zxW+ymjGBOBsd4ztmANLtNmhWda2bOwt25nOHi8W1weYloLU
 m4XidWIX7hPvKFUYi1gyqqnTuCRudf4eTSdoq2TPK4/ZCBoXD2FMfrqCXrtT1XLD+5mN
 fCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CJsCWcU0YdDyrwMeRQ7adfzbBn9rJ1IRoawBpqp6LUY=;
 b=hCbPUCxp0p5I0x1Mg+cN9jp1CpULj5I7hKHf2x8qfns1yWbJ3vOuq1q7LS8iftgGfG
 zqWL0HB++kzdwqKBQxkNZ/teurKk+OK5/JY4F6iDWAYUN2miauIti1Elr8auIchHqkiJ
 QqqBnf47pClJk2cXQymcuLKyLLi14d2WFK4ZV0WO2RIRik7xY2pkDHBLRnjepT0m4bnp
 dBNeDa7pjuk8DmbD1oLMvqAWfUQOMLj668NUS9KDevAShBAjB5iKFImJdvf22svocGs+
 uv6Ry2JLDR9F0dN+jfBauUer3C3+hT8SFH4GDXY5zkxzNfrzr7SjkHafUT2ilXyuL39W
 Go+A==
X-Gm-Message-State: AOAM533cfXsPoWAgIbnrtRCvG+PSeqTyCMrhY6R9928xXvWhYGll5q9m
 WVdkP+TGcIGNVqS3R6ffkL/jxw==
X-Google-Smtp-Source: ABdhPJwQIpKFObMCc8ia1BlvyYCeOcB3+iofnWS2JorNe065Bk+P85rDl3QiHz/L0kIPBi56mMyzOw==
X-Received: by 2002:a5d:45c9:: with SMTP id b9mr6722258wrs.365.1634219832217; 
 Thu, 14 Oct 2021 06:57:12 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id d1sm2596480wrr.72.2021.10.14.06.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 06:57:11 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 fparent@baylibre.com, khilman@baylibre.com,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH 1/3] dt-bindings: thermal: mediatek: Add mt8365
Date: Thu, 14 Oct 2021 15:56:34 +0200
Message-Id: <20211014135636.3644166-2-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211014135636.3644166-1-msp@baylibre.com>
References: <20211014135636.3644166-1-msp@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_065714_161443_A865AE02 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

This unit is present on the mt8365 SoC as well. But there is a
difference in the usage of an apmixed register.

This patch adds a distinct mt8365 to the list of compatibles.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 Documentation/devicetree/bindings/thermal/mediatek-thermal.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
index 5c7e7bdd029a..ba4ebffeade4 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
@@ -14,6 +14,7 @@ Required properties:
   - "mediatek,mt2712-thermal" : For MT2712 family of SoCs
   - "mediatek,mt7622-thermal" : For MT7622 SoC
   - "mediatek,mt8183-thermal" : For MT8183 family of SoCs
+  - "mediatek,mt8365-thermal" : For MT8365 family of SoCs
   - "mediatek,mt8516-thermal", "mediatek,mt2701-thermal : For MT8516 family of SoCs
 - reg: Address range of the thermal controller
 - interrupts: IRQ for the thermal controller
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
