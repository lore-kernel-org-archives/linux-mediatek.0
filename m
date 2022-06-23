Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE559C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 12:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dE7fmtBOiUOU4sxLu/vNILMBhpIA2O6k1eghYdjC8Mg=; b=VNdZcliXuWP3pybAm9R7SbEIT8
	jEzNh7aoOPT7M2qiJtt/z2kP5LKJb3Q50yjxUUzvXqtgyIApZsia7mKRiLff/aTLoXQXH9BNW0OEW
	wx91B9Sb0pqFH/NlS2Ak+7OwPMCip4gd00f5WuRtDcLVnc/rpG1e+MRLEawHUc2n5T53dbXUF8WLb
	h9SWOuMfiXi0MVlNtqT7K1Jk9FzCWRqIyGpojmtBLjrNqHAyP42i4wKH/9HIn/Z0Fh76inZc1z7LG
	5GMjMrOG8sG5bM8u3r83cRsuvlgO5PQeoam+LlPLZiUjmJliTQBEGZvZnVK0GiH/l5S6JIehw8Q1A
	w/GxTXVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4LnK-00ExxO-Sx; Thu, 23 Jun 2022 12:18:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Lkl-00Ewn6-S6; Thu, 23 Jun 2022 12:16:10 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 020916601796;
	Thu, 23 Jun 2022 13:16:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655986565;
	bh=c1ltb7P9u2qj0Fs9oN4PA6mGEwCxXTSVI8fdy2xBOek=;
	h=From:To:Cc:Subject:Date:From;
	b=RX3sx2edtnPFcOUv7DhwLjcZnlIaU5CXGUFNocWsBWPytjo8PsYREV0r1riRDTLJP
	 PW2HWltXu4DfHXZP7dWqOJ1PoLkqfRDAX/WO43328Vv/EjCvaS6iK+LrmttSpYJa4B
	 0IoS/v0N3SiDaxzONf52VZ7Zv8OYasyujEPr4/Sj3eElcVfKq6hFMdxKeN+LDrJFC/
	 liVLI3d4q7A6IROK7EczfZVtPkYIR1FTtHJBMW/5NbokP758X8lP/KeY0EK1PsBuzN
	 2nKE+Lu+tJzXCN7oowhpCr3Hg69fA7KNZsFp6m6WKwPupQ1bElBMsIXP/eDyfBcqhF
	 fDt/iGrpfvcww==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: srinivas.kandagatla@linaro.org
Cc: matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] nvmem: mtk-efuse: Simplify with devm_platform_get_and_ioremap_resource()
Date: Thu, 23 Jun 2022 14:15:58 +0200
Message-Id: <20220623121558.107400-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_051608_158180_B058DB0E 
X-CRM114-Status: UNSURE (   9.68  )
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

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

No functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/nvmem/mtk-efuse.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index e9a375dd84af..a08e0aedd21c 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -41,8 +41,7 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->base = devm_ioremap_resource(dev, res);
+	priv->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-- 
2.35.1


