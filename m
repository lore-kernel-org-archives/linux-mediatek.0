Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8ACC5321E
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 08:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gAlDnV00OTi8pOFAQvJJe9at6x6rDLA71GGMr4eI9rs=; b=J8cSA/IGLMBUMHYjj5whDGD+06
	3T30gzUS6EVZQlnh6/d3WAdVmB/z5ag7rt4OvkhIsi1bm+G3KMVPOguCNjCnwqV/L0RPtA4ygJY27
	JqZ1kYQ2qI+DSO9HHp5dXrFSQA0mNFLM3eUnDHUkHX+l0fnQjSLa5hMSE4Ts7Wu8qFcgO+qEReTK1
	XYH94U9IlfHQFgyCwGWYlVtqkA0HNBj5iyQHONDSdFw6Akt1on6xRLvL6Yldl+s9Iqv9Vbc4OQNYt
	jg329cbAHTNrsQBHy2SbGUukVBgT7wj3DpS8aa1nOKibsJlMveljTmJZrT0js4/pZgGcMi+2RIINI
	qrp8SMuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siUsh-00000006R0E-2vmK;
	Mon, 26 Aug 2024 08:15:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siTmH-00000006BoV-1uua;
	Mon, 26 Aug 2024 07:04:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=gAlDnV00OTi8pOFAQvJJe9at6x6rDLA71GGMr4eI9rs=; b=j/ZLd56Z2JqmsvsQ4hEYRHG89w
	aMKj6xDLW8XQ4tNYJ983VkY5xiiZoL5GJVe4qHXYpyyy76A3+cHrRJ73s3sMp/ZkS/kj74zkSvgzY
	zvbVaikQL9D1M/DBYq4K8zPtugAvlJyJLvj4sYHni3OyGuqpNDww81D3QPdUQRJs87f4PGNTJEjWi
	2xSuErX2j7QnTY4t3IEqYHZVB2zDFDC2pnQgiop1qoriZxDETai2z0iSw79gYcXtHSihapebcls0t
	mwxNi3SdaPzyg36sCPdegFMYgm9r3OQx6q4vxvdF3LbBH5z39AHwk28aj5XnNZwNO717K1bt4LYJG
	hxHcMIBA==;
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siTmD-0000000AZVB-2IQk;
	Mon, 26 Aug 2024 07:04:36 +0000
Received: from laptop.lan (unknown [125.33.218.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 47BB040958;
	Mon, 26 Aug 2024 07:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1724655870;
	bh=gAlDnV00OTi8pOFAQvJJe9at6x6rDLA71GGMr4eI9rs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=Z2el6X1/fY1wc1fFsRSyoIlp9qBErm9kXKZcrvzLG1pKHpREBYrra2to49U9iOGCm
	 DoXWADbBeiI7bnjF8kYJHT2alR9G1hl2aGpyiFCaUDr7ajeAKie80HqWpmg0jRm+zM
	 xKALjg+angNL+TtQSJ4FniiQV1fj6OEOy+12j2Zjgg3/q4fn1QEHAoZEn9R9YXFjeE
	 k3gy0nef3E21WHgyvq2d6DYSYM99NE4PEjW369wsO72rb71dq8q7x3nBqpBxZday8v
	 UWpqgYNF0OHAepgvPkc26dcNl9TOQmmhTx/y9jdsh6nBYlVbUiSvRYQ2HE5TvnDcin
	 ju4H2czWLnD/A==
From: Guoqing Jiang <guoqing.jiang@canonical.com>
To: sean.wang@mediatek.com,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] hwrng: mtk - Use devm_pm_runtime_enable
Date: Mon, 26 Aug 2024 15:04:15 +0800
Message-Id: <20240826070415.12425-1-guoqing.jiang@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_080434_530121_39F5A242 
X-CRM114-Status: UNSURE (   9.63  )
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

Replace pm_runtime_enable with the devres-enabled version which
can trigger pm_runtime_disable.

Otherwise, the below appears during reload driver.

mtk_rng 1020f000.rng: Unbalanced pm_runtime_enable!

Suggested-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>
---
 drivers/char/hw_random/mtk-rng.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/mtk-rng.c b/drivers/char/hw_random/mtk-rng.c
index aa993753ab12..1e3048f2bb38 100644
--- a/drivers/char/hw_random/mtk-rng.c
+++ b/drivers/char/hw_random/mtk-rng.c
@@ -142,7 +142,7 @@ static int mtk_rng_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, priv);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, RNG_AUTOSUSPEND_TIMEOUT);
 	pm_runtime_use_autosuspend(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
+	devm_pm_runtime_enable(&pdev->dev);
 
 	dev_info(&pdev->dev, "registered RNG driver\n");
 
-- 
2.34.1


