Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6E8C55822
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2026 15:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GE0WgxrhQlszpq0bFS8ekUeWF2E3M+uVciQ9zYtpewc=; b=wRgLw/NT5lRS6vGsP7fItr8f9l
	npLfnZzarPEziqzFoPnYS+hVB/90JWj7gCif9D2hBkbsJ69+gPl18hyIXZ0+/allI096nFzbeMnqv
	vShJyIljesjKKv6ZqjDsQ2taUNYKTzY76JT11HxP2IkRXZ4GAx+hN/vKRvMCDJ6VKhqMF8CG4gjcm
	8ujUBeDRXNGMbe5yuL+jGfBx8Tn9+nAjxRLi0d97lK9jIt39yraM8lSpyx4ASCHFPXrvOuViu4qYO
	wfXVXnDw6SVbkx0eis6zp2hhU9WnZyLr36AM5OIx30hof1FMEX2qgZnhorenqQ8WsB27D4ESyRpLH
	l/HzlFMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHEy-00000002ETq-2VfK;
	Tue, 04 Aug 2026 15:39:40 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHEv-00000002ET0-2oCk
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Aug 2026 15:39:38 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso5706412b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Aug 2026 08:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785857977; x=1786462777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GE0WgxrhQlszpq0bFS8ekUeWF2E3M+uVciQ9zYtpewc=;
        b=EPul2gfReCeOdjn7GI9YZDU1YtADoDCjBEhXLWpfwzUti+AxbPlsTG6qTbvruGDidq
         MPIl8iVs2gm/FHdOQ2oK+rdAI9tPss9QHwu3V+YIUnPk0LLV4KSh/M6wZiYr3eqf+D9I
         j3VxDxAUnA3wLD22faNbh0Q+RByg2V0mz9+4pVmaIbUxJb5iSOtmzeWaXbf1vEUqpbDU
         lbjJPEE0NtsmLJJK824VwIchEABJQSnpo9IufFDdHBW4IMl0ic0p96G1w0jjeOsABnNd
         0qK6Fyzjt254u3jzqW8a1QNqP7OGh4hOJjiaxb66njzNqiji+AV8oEfSsZ7HZ67SzOv1
         zAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785857977; x=1786462777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GE0WgxrhQlszpq0bFS8ekUeWF2E3M+uVciQ9zYtpewc=;
        b=qJYmUrCwt6raa8/5MoM0LzhRhbOswiDztGUGhERj5cOD2MYXmsvVcAv1qqaFZAzgIT
         yV0o2orQclX6veUXegDqQjUKZbU2D5kQqk7/YfTG2IH/PU7LT9WLh2n/A+fPtwNSbvXq
         INm/bJmjRuZ5sBaChFzHgRUqRo6jV0oN7H/BZ/PUBDC5cYIf42TmihDdN19fUSz6lfR/
         b1mV54UuxZnrWvI2yrs2W5eWUsn2AK5V8NKwpdTzrS12B0nWOe2YI9Abu89mtLIkAMqs
         45QOvVYqeMB0svGf9R8fA7iyXSwfH+VTSrs5Hcz8CZFsYr27gFaw69hnys/QBtQwK75v
         HCxw==
X-Forwarded-Encrypted: i=1; AHgh+RorJgHLG76XO1OQlCoSppKuXFjKhrvw0/2PTzDOhrNAqwOQj6lnATQIceIfM/UtBUt41Hy8xGy1cAgD+ElvLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YynQ2hCn0W5JB/2pOYdf+VIItfj9nHxberPecXq5vLFA/3ZaFdx
	VMf6eFhY1jobrjLiUFNEdMNO11AaneAiSO/31Ntz7zwiKYMepgYCaFs=
X-Gm-Gg: AR+sD13ihBWK9FGBe1RhtLeAACo6/Bs6Bu75v9ueekAECypc6ixaeOKBerAN68KhvHm
	w6FPWceDNwp4VOFYkY7qtSXXdPYgzgncIYMwbRB/ZV/AC+AaFnqqCxgEafERAIpiMzrvJBbYkGO
	9AcWWVKB4jR5eK1K+5Dd5DbSYxrltmzG6w/0hEeAXi9gY2AjIQ6qFS9yoFSwhs1KJkcP7VSZxU5
	QqWCGLL/Y3lESZTWzqQPO9VFagrXAiQUXN7QZQpnM836U85zDZ0xKzIgG24Odg74KCQINa1K6dW
	6vq//uaA7nHqnInjeaWiAnGej2Ygw14UL2hzPdaccpK32L+XkFatAMoRXScurTXGvJp5hXRUETR
	O3qYJRnc+mSxEcsoSDg8/xudTVyicrJKjD4rqvsV5RtztFT3l22wNfb/usm3JgwJprEjuNtR+7i
	Hu6mB35j1Ys4Pb4FLya9/264wN2Blg9DYdNwPmeM8TgZhoNmIacWKE9UlJW948lEJRMF9o7KJh7
	EPCjXd3Fr+4zgZ2PAnhsGdeDGqqpMofV4xixUz8gfR53VNH5vqKujvu837YbIq04XnzncuQ2xn1
	7bhdqg9LyCx3h1pptcCiRKY=
X-Received: by 2002:a05:6a00:3cd1:b0:847:98ff:4af5 with SMTP id d2e1a72fcca58-84ee47d5328mr14103507b3a.26.1785857976549;
        Tue, 04 Aug 2026 08:39:36 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd31639sm5581184b3a.9.2026.08.04.08.39.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Aug 2026 08:39:35 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2 RESEND] dmaengine: mediatek: hsdma: fix runtime PM leak on init failure
Date: Wed,  5 Aug 2026 00:39:24 +0900
Message-ID: <20260804153924.49627-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <aj1RSj5ZXvc-9yu7@lizhi-Precision-Tower-5810>
References: <aj1RSj5ZXvc-9yu7@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_083937_706801_05F75F57 
X-CRM114-Status: GOOD (  13.62  )
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

mtk_hsdma_hw_init() enables runtime PM and gets a runtime PM reference
before enabling the HSDMA clock. It currently ignores failures from
pm_runtime_get_sync(); if runtime resume fails, the usage count remains
held. If clk_prepare_enable() then fails, the usage count remains held.

Use devm_pm_runtime_enable() to manage runtime PM enablement, and use
pm_runtime_resume_and_get() so resume failures do not leak the usage count.
If clk_prepare_enable() fails after a successful runtime resume, drop the
runtime PM reference before returning.

The probe path also ignores the return value from mtk_hsdma_hw_init(), so a
failed hardware init can continue as a successful probe. Propagate
mtk_hsdma_hw_init() failures from probe, while keeping a separate unwind
label so mtk_hsdma_hw_deinit() is only called after hardware init succeeds.

Fixes: 548c4597e984 ("dmaengine: mediatek: Add MediaTek High-Speed DMA controller for MT7622 and MT7623 SoC")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Changes in v2:
- Use devm_pm_runtime_enable() for runtime PM enablement.
- Drop manual pm_runtime_disable() calls from init/deinit paths.

 drivers/dma/mediatek/mtk-hsdma.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
index a43412ff5e..27cb370106 100644
--- a/drivers/dma/mediatek/mtk-hsdma.c
+++ b/drivers/dma/mediatek/mtk-hsdma.c
@@ -848,17 +848,27 @@ static int mtk_hsdma_hw_init(struct mtk_hsdma_device *hsdma)
 {
 	int err;
 
-	pm_runtime_enable(hsdma2dev(hsdma));
-	pm_runtime_get_sync(hsdma2dev(hsdma));
+	err = devm_pm_runtime_enable(hsdma2dev(hsdma));
+	if (err)
+		return err;
+
+	err = pm_runtime_resume_and_get(hsdma2dev(hsdma));
+	if (err < 0)
+		return err;
 
 	err = clk_prepare_enable(hsdma->clk);
 	if (err)
-		return err;
+		goto err_put_pm;
 
 	mtk_dma_write(hsdma, MTK_HSDMA_INT_ENABLE, 0);
 	mtk_dma_write(hsdma, MTK_HSDMA_GLO, MTK_HSDMA_GLO_DEFAULT);
 
 	return 0;
+
+err_put_pm:
+	pm_runtime_put_sync(hsdma2dev(hsdma));
+
+	return err;
 }
 
 static int mtk_hsdma_hw_deinit(struct mtk_hsdma_device *hsdma)
@@ -868,7 +878,6 @@ static int mtk_hsdma_hw_deinit(struct mtk_hsdma_device *hsdma)
 	clk_disable_unprepare(hsdma->clk);
 
 	pm_runtime_put_sync(hsdma2dev(hsdma));
-	pm_runtime_disable(hsdma2dev(hsdma));
 
 	return 0;
 }
@@ -983,7 +992,9 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 		goto err_unregister;
 	}
 
-	mtk_hsdma_hw_init(hsdma);
+	err = mtk_hsdma_hw_init(hsdma);
+	if (err)
+		goto err_free;
 
 	err = devm_request_irq(&pdev->dev, hsdma->irq,
 			       mtk_hsdma_irq, 0,
@@ -991,7 +1002,7 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 	if (err) {
 		dev_err(&pdev->dev,
 			"request_irq failed with err %d\n", err);
-		goto err_free;
+		goto err_deinit;
 	}
 
 	platform_set_drvdata(pdev, hsdma);
@@ -1000,8 +1011,9 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_free:
+err_deinit:
 	mtk_hsdma_hw_deinit(hsdma);
+err_free:
 	of_dma_controller_free(pdev->dev.of_node);
 err_unregister:
 	dma_async_device_unregister(dd);
-- 
2.47.1

