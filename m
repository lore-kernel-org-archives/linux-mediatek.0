Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CDCC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 13:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pp/BcJxCS8S1zWn0Junj6GieG+Z9HzWQnifQoSGb//k=; b=I9hKzGMs5gJ08xwTA6TYdGT1hl
	jBj8xNFRF8MsR9ZPXZ/HGs1tRpw7VEMt7xIyr8GiHEya9FmkHSpAjo8VDdUYEUOwqkh8cXg49lW8R
	2hXvdmYe5R0G+HvfoHeJ7ji9bLV7A7qyeEF6f+CnaA2ykhyDRbmmRzcJUA4AfC4/2Bw0uMHpXWQjn
	mZfQKd3myk96NS9cwC4GVnZXU35y0vCPq+03kMFoo7j+FRY0+dKjhUO5YkAPoHbQqPgE2G3om2tiX
	T7afVyOOK5JI9f8v5GIgQeo1/GUweh3khwxRNe2OjcaZlI7yYExU2i1WDeLwN0Y6bSXsjsix57fGS
	5PWZRtjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdtw-00AF3N-Dn; Thu, 16 Feb 2023 13:02:16 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdsJ-00AE4z-7Q; Thu, 16 Feb 2023 13:00:37 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 51B0166021AD;
	Thu, 16 Feb 2023 13:00:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676552430;
	bh=CGTdGgAkIa0N9/8JF5Pc98xYJtzEvXtjERV+RFs8Mn0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c0qRVUW1m3Hm+37hwH7b9QiKLsEcAYSmzQ7U8v/BBuloJHMcYTdowiuvNJNKPyD03
	 I2T+K5gTR0O7ej6LueV0WqxLPdFLs4v1SvqxeMScyl/7Bp7tWBH7qR21D7Sw0g+pEw
	 kjbDu0IvDlTtkbP0mtBlgS2CxL0bc7iYLLusntrRYtXiBo4vb1KXHvQcTCHn5XSIDx
	 a9gbdwe86XgcSerMs8FK2AbfqZ0IMvl7SKAleJ3SWlTA+UYopIBu2RSM+zgQmeXX7l
	 HmwJ84H9TrMfZYo6b5D54j82bdVnmttqjJHHKI0yp3HSICkBE9Gax5GldHbhRupZp8
	 /H0QQalo9ZvwA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: jason-jh.lin@mediatek.com,
	chunkuang.hu@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 6/9] soc: mediatek: mtk-mutex: Replace max handles number with definition
Date: Thu, 16 Feb 2023 14:00:18 +0100
Message-Id: <20230216130021.64875-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216130021.64875-1-angelogioacchino.delregno@collabora.com>
References: <20230216130021.64875-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_050035_417110_E4012D4E 
X-CRM114-Status: GOOD (  14.40  )
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

Replace the magic number "10", defining the maximum number of supported
handles with a MTK_MUTEX_MAX_HANDLES definition.
While at it, also change the type for `id` from a signed integer to
a unsigned 8 bits integer to save some (small) memory footprint, as
this number is never higher than 10.

This cleanup brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 5c875139425c..fb6bd0838892 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -14,6 +14,8 @@
 #include <linux/soc/mediatek/mtk-mutex.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
+#define MTK_MUTEX_MAX_HANDLES			10
+
 #define MT2701_MUTEX0_MOD0			0x2c
 #define MT2701_MUTEX0_SOF0			0x30
 #define MT8183_MUTEX0_MOD0			0x30
@@ -234,7 +236,7 @@
 #define MT8195_MUTEX_EOF_DPI1			(MT8195_MUTEX_SOF_DPI1 << 7)
 
 struct mtk_mutex {
-	int id;
+	u8 id;
 	bool claimed;
 };
 
@@ -264,7 +266,7 @@ struct mtk_mutex_ctx {
 	struct device			*dev;
 	struct clk			*clk;
 	void __iomem			*regs;
-	struct mtk_mutex		mutex[10];
+	struct mtk_mutex		mutex[MTK_MUTEX_MAX_HANDLES];
 	const struct mtk_mutex_data	*data;
 	phys_addr_t			addr;
 	struct cmdq_client_reg		cmdq_reg;
@@ -616,7 +618,7 @@ struct mtk_mutex *mtk_mutex_get(struct device *dev)
 	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
 	int i;
 
-	for (i = 0; i < 10; i++)
+	for (i = 0; i < MTK_MUTEX_MAX_HANDLES; i++)
 		if (!mtx->mutex[i].claimed) {
 			mtx->mutex[i].claimed = true;
 			return &mtx->mutex[i];
@@ -888,7 +890,7 @@ static int mtk_mutex_probe(struct platform_device *pdev)
 	if (!mtx)
 		return -ENOMEM;
 
-	for (i = 0; i < 10; i++)
+	for (i = 0; i < MTK_MUTEX_MAX_HANDLES; i++)
 		mtx->mutex[i].id = i;
 
 	mtx->data = of_device_get_match_data(dev);
-- 
2.39.1


