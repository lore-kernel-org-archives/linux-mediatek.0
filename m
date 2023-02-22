Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80386C6379F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 10:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5qC1XLVDYEJF9rL3YgsMUwTcag1bRb/HT9qGAHn9vs=; b=S6UbbnV3Zza0w7Twhkq7GTpeiG
	WRRaI5H8dY/F/zav2PpcqlbTjtf60ZVywOL+Q7F8tS5tCPG1SEq4XPgBg46dsfxrkNfMW5MDFEQFe
	Gui79qH2gfXS9K+wtO/rnVscw8Z0BpwO9bZgEY3ym6XDFSfqi03YOoD3ejgUj4kFUDzBRFLB6d9I7
	hEC8WK0huLodzvYLAtGnlUspCmF1i+4OlgYQuu/5NPWXjX8IT83kpV5aM6Up792LnMrwvth6lHXKV
	EVL+2frnSocRLyifocfvC4EpmQ5CVlAqOvnFcEe7ZNDOFZigkChEuU5Ft1cLDrnhtVqPkEkSU2FZS
	6bTaV9yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmLs-00Bv1g-3v; Wed, 22 Feb 2023 10:27:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUleT-00BYh6-49; Wed, 22 Feb 2023 09:43:06 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 57B2E66021CF;
	Wed, 22 Feb 2023 09:43:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677058983;
	bh=e3IoV4WZMMZpp/4i2Ywjd+HRfKbXhy2Fwpb6MBe7E9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TW49Kut03chnB17gy+oOlEdsRglJEPbtp6qrJAlIi8l9dX/aAXscA8EVrCy9h5pod
	 vmlmwn+lOeZGv4cNWr3zwCKFU6sjKUUdpXRoregGMJEZS2ToV0jetU4KDvkFgkDNaU
	 W7g2RJb0B6OWT8seVbkS8WSjlNLUWvr1/dZk0og0s2zISZ6AzFuu/J6egY6vuG+6au
	 GOw8/CCLUd+vh3VmweL7umYnQJIej/9xZwoENc4GXIDMz0/VvJcIeA7ih1wepdM+4i
	 GR39oKu2mPiAWnXXlcvz0CVVMU+XfsA9ZkWaD/9UrB7oSMH3yd8rZPa3h9ExIzoe74
	 kO087S6EsxWBw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: jason-jh.lin@mediatek.com,
	chunkuang.hu@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2 6/9] soc: mediatek: mtk-mutex: Replace max handles number with definition
Date: Wed, 22 Feb 2023 10:42:50 +0100
Message-Id: <20230222094253.23678-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222094253.23678-1-angelogioacchino.delregno@collabora.com>
References: <20230222094253.23678-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_014305_335380_FB00A6F8 
X-CRM114-Status: GOOD (  14.58  )
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
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/soc/mediatek/mtk-mutex.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index a59fde2bdcba..b68bb87bc365 100644
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
@@ -282,7 +284,7 @@
 #define MT8195_MUTEX_EOF_DPI1			(MT8195_MUTEX_SOF_DPI1 << 7)
 
 struct mtk_mutex {
-	int id;
+	u8 id;
 	bool claimed;
 };
 
@@ -312,7 +314,7 @@ struct mtk_mutex_ctx {
 	struct device			*dev;
 	struct clk			*clk;
 	void __iomem			*regs;
-	struct mtk_mutex		mutex[10];
+	struct mtk_mutex		mutex[MTK_MUTEX_MAX_HANDLES];
 	const struct mtk_mutex_data	*data;
 	phys_addr_t			addr;
 	struct cmdq_client_reg		cmdq_reg;
@@ -717,7 +719,7 @@ struct mtk_mutex *mtk_mutex_get(struct device *dev)
 	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
 	int i;
 
-	for (i = 0; i < 10; i++)
+	for (i = 0; i < MTK_MUTEX_MAX_HANDLES; i++)
 		if (!mtx->mutex[i].claimed) {
 			mtx->mutex[i].claimed = true;
 			return &mtx->mutex[i];
@@ -1007,7 +1009,7 @@ static int mtk_mutex_probe(struct platform_device *pdev)
 	if (!mtx)
 		return -ENOMEM;
 
-	for (i = 0; i < 10; i++)
+	for (i = 0; i < MTK_MUTEX_MAX_HANDLES; i++)
 		mtx->mutex[i].id = i;
 
 	mtx->data = of_device_get_match_data(dev);
-- 
2.39.2


