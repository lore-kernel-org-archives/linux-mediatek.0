Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C97BC77B75
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 May 2023 00:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T799V0Rg4l+Z1fTZUIEbXxnhKm7rQQwawA3zEsGblaA=; b=G41zE0q/mjY3aBV3xXCp7l36nW
	BiWW5V/qP166Gt2rIGiwlnh1Hlew3sfGvLq8RwjdtPO2BIBwbjt7sSiPqKgaVFGqarcqEYVxNifRw
	C1ywXHX2fZSc6lKf87ngz7EQJ+UKnANA1Ha9K9ov88d7iZL5qJ3Fh9MSAwRtUVD5mqh9IKkAraG8i
	GwmNj3aaVW55d9MTN4KcmMayk+Ps9GiNm8tyDy74zf2CZkM8pHh9HwZiEyiXtr5LotGHnHJvETbr5
	0qCmmQDqBKzfTYzkRk4kHr+sQpRxutsNNE1HtMMLQ8XSc+rJY/9DkX4bscksgVdkwmGfjnzPkcWNE
	qwS0RKLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puN9m-006Cjc-2X;
	Thu, 04 May 2023 00:49:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puN9f-006Cel-0g;
	Thu, 04 May 2023 00:49:09 +0000
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 74E4A66032D5;
	Thu,  4 May 2023 01:49:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683161342;
	bh=BKsoOLwf3MWeyx0HHhnkyVrCjdOFjcx9T5XOHh5ftLI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cG8oO1FMlYR32CajRzJJVGbLBrqEm+Rao9pbnJI+p2DKG+H0HpAJCrzUTxu34UoFh
	 J0iJ4VnhjzRXH9wGOkIfl9Cz3H1ByVdl+ZSSJfF0ZFFFN66hVLiv858pQY837vMxcu
	 du+KXes9bKEAI6gZiFc1MozFZRQVslqDMBK9ZHBvEUX/14kQP3d5uDk5GiRq9bGGXf
	 P/60wwO8laC5FQW6H+Ei6L7AYDD2ZPCw/K7DfP2eAYK0M5VnIwM9NWICkrpvss5ZQ+
	 g31KHb6Qb6GLHi8bFy/RaPRQguhAcWcpB4ts+MqZDgMWyScTLyWIiL2z4oxGUlh5ib
	 eTkSLBzCVvteg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: kernel@collabora.com,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Balsam CHIHI <bchihi@baylibre.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Alexandre Bailon <abailon@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Amit Kucheria <amitk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 1/6] thermal/drivers/mediatek/lvts_thermal: Handle IRQ on all controllers
Date: Wed,  3 May 2023 20:48:47 -0400
Message-Id: <20230504004852.627049-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504004852.627049-1-nfraprado@collabora.com>
References: <20230504004852.627049-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_174907_404035_BA43B3F0 
X-CRM114-Status: GOOD (  14.17  )
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

There is a single IRQ handler for each LVTS thermal domain, and it is
supposed to check each of its underlying controllers for the origin of
the interrupt and clear its status. However due to a typo, only the
first controller was ever being handled, which resulted in the interrupt
never being cleared when it happened on the other controllers. Add the
missing index so interrupts are handled for all controllers.

Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

---

(no changes since v1)

 drivers/thermal/mediatek/lvts_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 3df4989f9902..2988f201633a 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -450,7 +450,7 @@ static irqreturn_t lvts_irq_handler(int irq, void *data)
 
 	for (i = 0; i < lvts_td->num_lvts_ctrl; i++) {
 
-		aux = lvts_ctrl_irq_handler(lvts_td->lvts_ctrl);
+		aux = lvts_ctrl_irq_handler(&lvts_td->lvts_ctrl[i]);
 		if (aux != IRQ_HANDLED)
 			continue;
 
-- 
2.40.1


