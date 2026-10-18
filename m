Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB62CCF2C4
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2026 03:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T5pPwZ/48zpt+uZ5MPec+XhKwRcnWB3U80AGWU6HU3U=; b=y9slOM0vr3AAkGOGresGkZZYfc
	f6UOH9ry2q2sfPwP6nR7e//pTRyYI0+V21f0u5TALMgJmZV67y9xMFtO7I2TNiekZ9zFasbzsuEL/
	C2g/diU+h3Ma8+3CjeX3LbWSDvRtK0UnV0yvmHZpVS1vphf8D8a+5QparrN85zBJiqHsyf+cS0Tc8
	iXg2jf3dygrKRCXB+dRCtwiSoyaqS3ghu81yckYxJ2C50VjeVvxp6u5RU7WP7JJ4MDCTzJ7caMNSp
	AMSivosVLriOfWIs4DXgukRS6qkYU6ZoPNjzucCmQEnQNGNb9U1c2IrTbKi1UtIO4xg4VVCi7yy87
	/2CyYfTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIHpM-00000005UUf-1aus;
	Sun, 18 Oct 2026 03:44:52 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIHpK-00000005UTx-0amk
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Oct 2026 03:44:51 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-91b89c6caffso8311256d6.2
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2026 20:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792295088; x=1792899888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T5pPwZ/48zpt+uZ5MPec+XhKwRcnWB3U80AGWU6HU3U=;
        b=Rtxmi3kZbeQ9+MF3MEMdSHeoJvblJb2U78Sn8N/dImf4TKcMpm4Pvs78mcW77XOUhw
         Y/hRiNyP8m4vXLLnkBSbRW9TJt7RBo9NdyZv5M0Ab/je1HQry0ZXkbaMkiDHIYsSgZBT
         2gVQhZWkgJZMjD7D28qqgx4Il3jwaEwESrF1BtOweLrFV+FjhpfHmcfnRpKsePcsmxAN
         jnZrej24UoRkc1l7UojQ5UIo1B2l6E2u+Ngk770D+5/ZoV0Xm+R96QPfC+LS13tKog3H
         ED/oYZdGBKs+oKpQtUnTHcW7po879r2oeZldrmPn7Un6P1ROqZzKW/rEPPOYEocsbAUc
         uETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792295088; x=1792899888;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T5pPwZ/48zpt+uZ5MPec+XhKwRcnWB3U80AGWU6HU3U=;
        b=wo+qCbGjcPmDCXOhoMecsEYdseLCCWxjQBVzqh+VbgkTBzd+ZdL/EAGcze7hwMWaWz
         WA/i+Tx2wnSyMQnZz3e1qoTnZ0hxtE+aPCsM/4DLbzV1p10q6fIZIKWM5T5JAMQWIjzE
         JOMT/iviSdNq54U4gGE3dYbK29dGQcHhQU4+92uiC/8DbJn9kp0ka51W1V5gYSfligj+
         e0dXniF2uP1NRtYP5AFg+fiY471Qhn1Z+TmPUps1hD5HbfhAlWHH4/pL5jehodMXORgK
         24IUPFCSdC6r3I/Yr10Cxs8Um4rZlbmu2D7HOFI3MBhMcuBFZ3Qe3HvsYvwo6sfcOUex
         R+LA==
X-Forwarded-Encrypted: i=1; AKwUvByK3q5Hgb+yVmouJWL5p7OimyVp/rV+Bf97x9Hdz6cHgfF52AEgv5TtqylGjGDnmGd3oD7iLo4TPizuvPGlgg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLMhRZlR5l8TahETC9GHzaXInJdkgbXsF0tvlJnbkZvMWI/TFF3
	sVcdJIp3Dkfq+Y/HMIah8Pw3x9doe15KLiJ4LiukNXuHaPLjDdvLrFQ=
X-Gm-Gg: AYBFou1qLmTabvA8gLnL16XSygV8uAXaWzxSPNq4/KhxR/wy0mH9H5v7GAPSWwn1j5J
	/v+cdN+BKkQiXlMSqB71OrJlCC6yWGIcy4ec75ZsRR1AJ4QGHXPaV4PtpUz0llyAXhy/zC6h4IR
	cAWrepZrDFPDziCKY8KwUsA8An9eRoi+zJDIuvT7TskB3FRKUqMpsq6kNhsv5qBfqM5UZ8M9zab
	CVxds3xCux3AdZqYU1ZYCN+2cIPgnP7ZgR+4KTd43vPqTQYRcSrwtSZzMtsmvHODtBhNsgOGi0i
	ELyPpVctO28W/0faKb0P8zcVLoDhOJxvgsGEaLOL/D3cFWX02lp2gmYi/ifI8qZNnFCbMyHyOnG
	hNiaQ3wkQ3AmVkN6Erz0UhyKrm/OFUBWZQ9f0mXsNRQ6QpIkbfIP9obfbMgW/856hbWME19RO3j
	lPMadKyONsE6hBm65Az5bqtP7BsCA84SgCuGAsGCK1qSfhyBa3N2ZzJuAeFxLG9fSvQdrvVHVZf
	LL6sBqhF4MtrcpO+Hc7yEg4nh2UL79i24HrvHmd6CSW7p2X//b5JQWJ3ovZboZk5dZUF1E0BAsq
	3M5FiZqQxcXSDJ3RkGidDbGimFsI
X-Received: by 2002:a05:6214:2f89:b0:912:588d:55e8 with SMTP id 6a1803df08f44-91bdf0aa995mr67665616d6.9.1792295088031;
        Sat, 17 Oct 2026 20:44:48 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bea60e66esm22559866d6.26.2026.10.17.20.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:44:46 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] rtc: mt7622: allocate the RTC before requesting its IRQ
Date: Sat, 17 Oct 2026 23:44:43 -0400
Message-ID: <179229507333.3965554.17726204422948048488.rtc-mt7622-irq-init-order@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_204450_467125_4C3E8E24 
X-CRM114-Status: GOOD (  12.17  )
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

The alarm handler passes hw->rtc to rtc_update_irq(). Currently, the
managed IRQ is requested before the RTC is allocated. On detach, devres
unregisters the RTC and drops its allocation reference before freeing the
IRQ. If no other references remain, the RTC can be freed while the alarm
handler is still registered or running.

Allocate the RTC before requesting the IRQ, and initialize the hardware
and RTC operations before installing the handler. Register the RTC last,
once these dependencies are ready. Managed cleanup then unregisters the
RTC, frees the IRQ and waits for running handlers, and finally drops the
RTC allocation reference. The final irqwork cancellation therefore runs
after the IRQ producer has stopped.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: ba5d018135ef ("rtc: mediatek: add driver for RTC on MT7622 SoC")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Compile-tested with Clang, W=1. No hardware runtime testing.

Based on mainline 0fcb05b72344f40806cbe810de8872f1698bf053.

diff --git a/drivers/rtc/rtc-mt7622.c b/drivers/rtc/rtc-mt7622.c
index 9e17dd09d567..c86c8cf3f2d7 100644
--- a/drivers/rtc/rtc-mt7622.c
+++ b/drivers/rtc/rtc-mt7622.c
@@ -324,11 +324,20 @@
 	if (ret)
 		return ret;
 
+	hw->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(hw->rtc)) {
+		ret = PTR_ERR(hw->rtc);
+		goto err;
+	}
+
 	hw->irq = platform_get_irq(pdev, 0);
 	if (hw->irq < 0) {
 		ret = hw->irq;
 		goto err;
 	}
+
+	mtk_rtc_hw_init(hw);
+	hw->rtc->ops = &mtk_rtc_ops;
 
 	ret = devm_request_irq(&pdev->dev, hw->irq, mtk_rtc_alarmirq,
 			       0, dev_name(&pdev->dev), hw);
@@ -337,14 +346,10 @@
 		goto err;
 	}
 
-	mtk_rtc_hw_init(hw);
-
 	device_init_wakeup(&pdev->dev, true);
 
-	hw->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
-					   &mtk_rtc_ops, THIS_MODULE);
-	if (IS_ERR(hw->rtc)) {
-		ret = PTR_ERR(hw->rtc);
+	ret = devm_rtc_register_device(hw->rtc);
+	if (ret) {
 		dev_err(&pdev->dev, "Unable to register device\n");
 		goto err;
 	}

