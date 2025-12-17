Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60733D6552C
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Dec 2025 10:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K04ow0eNGFdOpSpME/SmZeUSWAE32cTHhjE42HTO9TQ=; b=vA/wPhrHya6wzc
	50sav5K0fRJdM4yfqsQZ0cH3MdNyNahlaPGRxGjV+nZek7kLD8eVJ66hazSPOOrjIefJvX6xGO8h4
	JJtW4uyFZGkr686h/HP582F+LI/1OY6dkHbxo312fKIT6LpQln23zQlj9Mo01THuzNFnANGxAxX9X
	T/imbtXT9r0rcTesIsOYU8zMbUCCFm+GAXWoF3UVHJdq2DCW6sBTwLexv1oMhgFhsL9tEiFxHRHgr
	gXzUEvZC1gVLfUKVhnxsICCECtW1e26bRcY6UgaBjE+6d5n5W1KOsAmHKHX9SVU3aXYLCyy03Ncqe
	czUjp8UUtMOPJ8oCXb+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoVj-00000006VrX-48gU;
	Wed, 17 Dec 2025 10:11:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoVh-00000006VpI-1w2H
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Dec 2025 10:11:58 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a0c09bb78cso3107665ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Dec 2025 02:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765966316; x=1766571116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K04ow0eNGFdOpSpME/SmZeUSWAE32cTHhjE42HTO9TQ=;
        b=BCCM3oIAngZl4BhSc9ReN2w7CDl1pq7gegvAQiOCjoUKXDieV2ij4j4ni+NI2WiZrI
         GUzODFP8Nfga8tSl3wLxOpIphGDAuFpWA0yXIOPEIMjrnEjgZCZedevyxcXeNDTFGiYh
         eDhdtNoReW/F0suG/7pa6fcB1WcXlD9RBeGjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765966316; x=1766571116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K04ow0eNGFdOpSpME/SmZeUSWAE32cTHhjE42HTO9TQ=;
        b=aDXEkQCrvnp/1JyJ/zeb1SjPxRmL8pz3WlbUC66Lz85yyjPl2awIn2XCWFvMbflhm2
         BnaKb3DPABGLe0m/28AHmIFK6RPK1Y1CxHm0EvVmNgo4DcoQ4YFs8FELGDXx+AINy+Kt
         U/veBM1HYn68x3SMo9rpd2oMfvVkY/z2tyvigNXsSM0ySBKmZXmPytpNyAu9oTXpiGCO
         0hlEK7bsuj1qCSYRBIwWSqeGiUlHBygl56/922LvZpZW/P9MJyCWU+phxrh9WmWu2ddL
         lIlWWXqqzYlnbI/WY7qiG9cs5a2wPyPgbrzCkG+oxaW9I9n8DT19z8kNWPgrFHb5PhYP
         x7sg==
X-Forwarded-Encrypted: i=1; AJvYcCVDAKsy/xQxblqaVKdh7LlPQeWlJfJ3ddAUIK3FfUd5hUDSfSQ1tU1q5eiuWTH9NIK7UkEVT9uXmLvE9Fveaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHAjyzeMIeJ5qgDQzpjKnIKqYNjMPsieV3dRIcThljCZy725vv
	9oVZjTP/KNKMxr1bIlrqJ1Po4QR5LJjNhzQQCjxrKBpWRmK+2EHmsPYLpUEgX0c7Jw==
X-Gm-Gg: AY/fxX7GnUK0xK7VicuLvtE9y4WZoqnTplOyo/+LeCsXzRPYRI0as0LfOBq1KzoQs6G
	8TuADNFTpj8R8iqKNpdAdXMeJ2FGkuQ3u4K7CzfHIfIYUYg2irhur9Ul54TXugPLQYGdD7wAoy2
	gsjEy1sAwKRIToQTzQ29M1LIFl/YpFYITtwdDcMa3JA2AqY/my0csqTulf8GMPRPSOZ27goOoTD
	PqPwCO+CmoBNCjPCB5YuRykT8jG2Rncr7IhdMWPThir43O0PyIPkNUldzNs2AXaB7P2MXcm2t8d
	CYmdOAW+TVnys1qQy806Xv/yoAjZU0GpGfvx67UqGgITw6ErBMDFRgP7vtNZ6wYbLqo1VWRP9Q3
	r/GhkJOofhW5R6hlfSeRZX5SLra0eguV3lA4otKcvuZ6U38kRAJlSpMpawEOQeSB7idJs+Lq/Ss
	Ty4rV2L82ZXzB+NUR6McmUboiUbWWHaLAJo9Wu0pImuVTIQfRYeqxLOSGAxcTafgCiv5ZA
X-Google-Smtp-Source: AGHT+IH9JDk9/8ttnmED8uX+Mmzi2jbUa2ALm/TceQ9Kmj2oqUNGhg7IR2LAST5VvPsW7hnAHuK+Yg==
X-Received: by 2002:a17:902:ea0f:b0:2a0:9238:881d with SMTP id d9443c01a7336-2a092388d07mr158621885ad.15.1765966316255;
        Wed, 17 Dec 2025 02:11:56 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:201d:8:6cf9:c1ec:793:b8d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0cf143804sm102912045ad.73.2025.12.17.02.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 02:11:55 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] spi: mt65xx: Use IRQF_ONESHOT with threaded IRQ
Date: Wed, 17 Dec 2025 18:10:47 +0800
Message-ID: <20251217101131.1975131-1-fshao@chromium.org>
X-Mailer: git-send-email 2.52.0.305.g3fc767764a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_021157_517328_0332851F 
X-CRM114-Status: GOOD (  11.22  )
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
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This driver is migrated to use threaded IRQ since commit 5972eb05ca32
("spi: spi-mt65xx: Use threaded interrupt for non-SPIMEM transfer"), and
we almost always want to disable the interrupt line to avoid excess
interrupts while the threaded handler is processing SPI transfer.
Use IRQF_ONESHOT for that purpose.

In practice, we see MediaTek devices show SPI transfer timeout errors
when communicating with ChromeOS EC in certain scenarios, and with
IRQF_ONESHOT, the issue goes away.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/spi/spi-mt65xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 4b40985af1ea..90e5813cfdc3 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -1320,7 +1320,7 @@ static int mtk_spi_probe(struct platform_device *pdev)
 
 	ret = devm_request_threaded_irq(dev, irq, mtk_spi_interrupt,
 					mtk_spi_interrupt_thread,
-					IRQF_TRIGGER_NONE, dev_name(dev), host);
+					IRQF_ONESHOT, dev_name(dev), host);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register irq\n");
 
-- 
2.52.0.305.g3fc767764a-goog


