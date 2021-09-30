Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C8BC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 19:13:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF62C619F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 19:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF62C619F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EVnhCHAL7AzUfiObYITP9/HbIRxXRcwqXPt0NSepnH4=; b=3YOJVH2XagRpxN
	x1ntdb2TbXG2k8qTKB24uoQkopU/VIM1+RoR/x9LefSZaLKjkK2+y/FM+DyUzsI61D0Uzuztojf1c
	w6V5vEwYCyzUH1l9ilAo9oL/yg/C5xBuJ1zZ6ioxurDn0b4Vsh0DKgOSWXlAg2O6/QItYqVCDfdHT
	DZeTslRzzGOZYWxJn46cXpch5JLXuCexjCV60xNG5tz9MX9JThAapqYXu9Cmo6tHJPRn9EviBpLls
	JHImh2yPeApRFBtw/n8XHUd0Xj/SNYB+ZbYU8Iiek7Vu5cz7uIkb3RaGc7/JmsLDdHkgfFXSka0xJ
	Pz15eQtmjmFMbN4jgdvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mW1UU-00FqFr-Et; Thu, 30 Sep 2021 19:13:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mW1UH-00FqEg-Ef
 for linux-mediatek@lists.infradead.org; Thu, 30 Sep 2021 19:13:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 205-20020a1c01d6000000b0030cd17ffcf8so9300897wmb.3
 for <linux-mediatek@lists.infradead.org>; Thu, 30 Sep 2021 12:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y3dpOnDXlgJcFTCuS+F/+JL7imW1C4nTJ31Epoj0e+I=;
 b=bwAS4qXyVy5lrCFNe3bp3qWlLe4NhL1c36wauGEWB6DyD18i4Ss7dObFv4YdMqDGZW
 skhpVHNiYGzPXclorFKhF9zPBjfhDnzW/qpNsANXsPMKKYLxc/XviSoH+sJAiBkMzdgI
 wKEx5UKAxPCIL8hdltmLbcOlHDNP+AQ4PpzueOtP9j4vx22We2l03/wwpCea8a9o0T2V
 FYwNPUkk8C7WfQan6eDbF8HI4PDVuZ33RSefMmtiPDFQFj+l6izgK1Uz42X2AnQ0QTli
 O0xEhuaqx4DgcH5xDKKHJE/F5qeaUOit6yCZTajclWlYqEC+pG3Tr1nZweP/b/RMnrEw
 1vWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y3dpOnDXlgJcFTCuS+F/+JL7imW1C4nTJ31Epoj0e+I=;
 b=RxzWJBBALl8LdejIStwfAlPjZ40aLuAOeiQ4Bj41+UdVT479bxXWwZzBbkZsQCvu4W
 s/XYPtcBqaRtNFBDtHHMh5571qXzuKb86aCgl6hLg1FVl5/jdwYSqsXPWPUU8vKbs8NB
 6WkSs5VcesJXklIEegc2LuVr8YDl7V/0PhEjwCQsiYmxVQnGO7i6EfE1J+KAHod56yoT
 en1wS/vov0G3D1nD3VOqscLxpaIvdzgQSEox95rGTM9JSyJwkdBh14WDzFvS2owneqt0
 YQp+mECbdpHUTfTD4ZLnAsHypq9JmRTF2eM2KoU6IIErMRL0+6B+BDXb113Y94RcYGc1
 t76g==
X-Gm-Message-State: AOAM532FQhM14YtOhyGfytZ9+HWXy0rR1SDxRuT2m/FP1PjV631NLeOs
 y5y2sbF7IhrVhu0cNBVyHuhOxw==
X-Google-Smtp-Source: ABdhPJwrtPqllvSZg5XcCvZ2XXZZaUirsC+ZKZwYlgp++pji+2vnfiAHalOo1fEL4a19NSKpsLasvA==
X-Received: by 2002:a05:600c:3506:: with SMTP id
 h6mr782894wmq.62.1633029172329; 
 Thu, 30 Sep 2021 12:12:52 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id l11sm4813809wms.45.2021.09.30.12.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 12:12:52 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Sean Wang <sean.wang@mediatek.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Matt Mackall <mpm@selenic.com>
Cc: linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH] hwrng: mediatek - Force runtime pm ops for sleep ops
Date: Thu, 30 Sep 2021 21:12:42 +0200
Message-Id: <20210930191242.2542315-1-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_121257_584469_CBF190EC 
X-CRM114-Status: GOOD (  12.23  )
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

Currently mtk_rng_runtime_suspend/resume is called for both runtime pm
and system sleep operations.

This is wrong as these should only be runtime ops as the name already
suggests. Currently freezing the system will lead to a call to
mtk_rng_runtime_suspend even if the device currently isn't active. This
leads to a clock warning because it is disabled/unprepared although it
isn't enabled/prepared currently.

This patch fixes this by only setting the runtime pm ops and forces to
call the runtime pm ops from the system sleep ops as well if active but
not otherwise.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/char/hw_random/mtk-rng.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/char/hw_random/mtk-rng.c b/drivers/char/hw_random/mtk-rng.c
index 8ad7b515a51b..6c00ea008555 100644
--- a/drivers/char/hw_random/mtk-rng.c
+++ b/drivers/char/hw_random/mtk-rng.c
@@ -166,8 +166,13 @@ static int mtk_rng_runtime_resume(struct device *dev)
 	return mtk_rng_init(&priv->rng);
 }
 
-static UNIVERSAL_DEV_PM_OPS(mtk_rng_pm_ops, mtk_rng_runtime_suspend,
-			    mtk_rng_runtime_resume, NULL);
+static const struct dev_pm_ops mtk_rng_pm_ops = {
+	SET_RUNTIME_PM_OPS(mtk_rng_runtime_suspend,
+			   mtk_rng_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
 #define MTK_RNG_PM_OPS (&mtk_rng_pm_ops)
 #else	/* CONFIG_PM */
 #define MTK_RNG_PM_OPS NULL
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
