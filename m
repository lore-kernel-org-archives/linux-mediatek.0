Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB244C3601E
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Apr 2025 11:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uoFJ4ptUi5AV/TAN1DOX2Iv9rd7IiSOqJe1GTR29a9I=; b=KTQG3kKTiobi+GST2hrT19GVQ1
	KlJ0pG/uQw7FtqFPXFWSQ/QWYBHTMwW+MupaVwKAhNMEaJb16jPOOI2CR4ckmqWW2SbiwRV7i8u5J
	1BEBJSiIs/GXyvyonoudy+rq6X/Jz4QLv72lL78r5RCk7JoYywXRvINZ3rj6a6ICDdtQ4vy72MqBz
	g3fzkFzdKefZWE/ioQSfV4Cz8q1ianPUVWE/KRd+67Z4xM6VptIXMAVeWq8KP5W5eyUM23oFrTjOh
	5pEcdEebI9hsj4a+WgKLiSrtkC5Dv3GdJEPSzB9f260HaZmcPsV2OyuwFSylEk4pk9zujstS5wBA+
	QL1qqe+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fDo-0000000BY5v-36ue;
	Fri, 04 Apr 2025 11:28:28 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0f9Z-0000000BXHn-43i0
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Apr 2025 11:24:07 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cf7c2c351so1463095e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Apr 2025 04:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743765844; x=1744370644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uoFJ4ptUi5AV/TAN1DOX2Iv9rd7IiSOqJe1GTR29a9I=;
        b=RH8J1S9H2vnKjgrpD0rT3Y3/t9WW+z3ie9b3UjGQ+w9oWWvlADNUPmQs/qW/9zPvg8
         mfaE68e/6h2wy8Gmy28bFkojVw4UBDtv2zTkPUogWHQ4yKSTNxagawsM8oAmc/8jham/
         msLT2W1fv+ueGoiFPIGQ4ounDy+NTTDbzG5sXsCNgNAj8jnQaKI2sWw9Yx5H242wqBsV
         6FOw2ebRFtZAhoLoafYw6CQsjWrgVmsAVFxFpE4kIzlsjmlzcSuh7BSON1WKK80D2z+M
         ZWr+WEmH0HrNgaZ3LuZtVWHHP5B/FWZlZPhSd1kBLQhjBxYTp9LpRZGaHkKdji720YA3
         P7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743765844; x=1744370644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoFJ4ptUi5AV/TAN1DOX2Iv9rd7IiSOqJe1GTR29a9I=;
        b=c1/dnz0K1159e2jUxGKIaf2VVPMRE4NanFSIlhdbhelrq5cDc/3tGLIRB74rUNfSPr
         /jYo0fwBbXZohh0tbKKrO5LdNp/ObxmnAOMtFDmX4jfeK9cFIDxVcyzSstHJpeY52Vlk
         Urn9O9h9w848QAAEKRN9gvh+SVUBofvDFlQti7L7r82oaYkLbhDP4UqKmoK4UGu3V1ox
         D+uW+QC8/+inIH4kesrv94LqeEPM9pRWXqDAz1bdWY/oQ692s8LU7EEa7WbSMdOTtg1I
         OA8NpN000E7/ezMoy28C615qMTMV7RFLIaqFeFaIWz2ee/SXDzjzQcZ7LFDO6ylCX1r/
         pE5w==
X-Forwarded-Encrypted: i=1; AJvYcCXqLJKLadZjG9X821L2HmsnOIMkpL1hjpDE/bPvynq2JywZq1yhbt7DgeQDVfltYMpVtrGeM6X5c03gyFXXAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBF0CKVcr9AXUE/P9XEo3Y1UlLxbAL7ditEnBfa6/TcUKWeYCu
	gROJIBH9iPGkgU4xLYuyHRrUKYE42PI2geVYM/sqn0PpApNV2/3wMxzsS1X3k4M=
X-Gm-Gg: ASbGncuAwB2sblLvHG4zf4AU4rCZvXWBgDOxzwtJzBelLqVHYzgvQku5SJteIEBVM2+
	inYCV96Ydrq0rnBBEvt8ZeZD4sQymKzxhFZwkBZcq0Sy1V3SZlSfrCDpEdlamyyMSS78P6RQYLy
	uqQ6gvN9yw/mcRzFjDvgQCSH4oYQDq8i49sI4HfJaD5ERMcBTCDqOm2o+lttJl8oG+bvCURD2nC
	06jBaxNFs3EAwRC23elh3pPKTx6rfFHrgcVQkyc8uhgu7vwKP8mDfTEq9AgkSM1aHVmw3vlUzt6
	xisp0i6gw8dAAd1knnK9ucf8iK2SF/sH8g86rrUI0F3LymNBSx9pfw==
X-Google-Smtp-Source: AGHT+IE3ZXg+NpgHFPkT9tkd3OeMOY/cHa7ymbfFF9D3KVwgwJD5IbYwCsgQ9PomEA437IeP0SFhSg==
X-Received: by 2002:a05:600c:4f0e:b0:439:a30f:2e49 with SMTP id 5b1f17b1804b1-43ecf9c372cmr8116095e9.5.1743765843644;
        Fri, 04 Apr 2025 04:24:03 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342be6asm44913355e9.5.2025.04.04.04.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:24:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] soc: mediatek: Do not enable MTK_SOCINFO by default during compile testing
Date: Fri,  4 Apr 2025 13:23:59 +0200
Message-ID: <20250404112359.255053-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_042406_012771_AC7979DB 
X-CRM114-Status: UNSURE (   9.86  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enabling the compile test should not cause automatic enabling of such
drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index d7293977f06e..006214f8e5ee 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -81,7 +81,7 @@ config MTK_SVS
 
 config MTK_SOCINFO
 	tristate "MediaTek SoC Information"
-	default y
+	default ARCH_MEDIATEK
 	depends on NVMEM_MTK_EFUSE
 	select SOC_BUS
 	help
-- 
2.45.2


