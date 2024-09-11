Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2801CEE01F6
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 00:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kwoHgHGCKF3DSrT9N1RW+DeyibROwQHKLdIupTJJ14M=; b=ZR9hzzUb3zWERybg1m5jJKrgw/
	43BCzKmt2ZbNrhGZ5wSqBIcrEGOCJNY+DKhLrmE+pI2u3hLDdDcJGSSqrnbPF4O48hUb8/gXsgvfL
	WHQ3UyZQAJnPngdKwawfPnd04TJldel/yymWlcNahY1OUH0VMqaXknb7kT5hqMbyt4AjC8qvoXKY3
	oKkmyR7Bivy3mxRfvtBjjHh74AmzJoI3uw2VOsqrfehl5ZNxKUzgGkJB2pWIMWNQ0OOL4F4WCZOCs
	3Bz/tWqFl7eIlSr2SZkNYDCl8Sph39wodsAokfoLBwvTu64hpQz7GRyjB9/lM53LEcOMH5MEbjrlF
	tOVbOdLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soB9l-00000007Zg8-335G;
	Wed, 11 Sep 2024 00:24:25 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soB9j-00000007ZfZ-05WS
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 00:24:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=kwoHg
	HGCKF3DSrT9N1RW+DeyibROwQHKLdIupTJJ14M=; b=HJ2PN/IdwIO8NPvwZ5lsQ
	Y0Bfpb2Dk+rHKPaAt5CU+hKrLff+mb+0B4i8yS4ymC9egc5MQ80D85WNk0JdjKlE
	+N0bQoZtRdQS4ogQWgJgL8LC1t9xEmNhvbcVFip/xo7Du8HNnKpl6WwtYmnOmbsx
	Q9WMAA+Ohd8fwK6wTXzqA4=
Received: from iZbp1asjb3cy8ks0srf007Z.. (unknown [120.26.85.94])
	by gzga-smtp-mta-g3-3 (Coremail) with SMTP id _____wD3n4714uBmgx9WCw--.6962S2;
	Wed, 11 Sep 2024 08:23:17 +0800 (CST)
From: Qianqiang Liu <qianqiang.liu@163.com>
To: amergnat@baylibre.com,
	angelogioacchino.delregno@collabora.com,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	matthias.bgg@gmail.com
Cc: linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Qianqiang Liu <qianqiang.liu@163.com>
Subject: [PATCH] ASoC: mt8365: Fix using uninitialized value "i2s_data" issue
Date: Wed, 11 Sep 2024 08:15:17 +0800
Message-Id: <20240911001516.47268-1-qianqiang.liu@163.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3n4714uBmgx9WCw--.6962S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw45AF1fAr47WrW8uFyDWrg_yoW8JF4xpF
	s5K397Cr9xWr1jkr47CF1Uta9FkryfZFy7WFW7G347Xa45uw4Uu3WvyFZ0yFWvqr92kan8
	KrW2gFy7uFs5AFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRvPfLUUUUU=
X-Originating-IP: [120.26.85.94]
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiLxlXamVOGP6WDAAAsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_172423_551783_7500C185 
X-CRM114-Status: GOOD (  10.16  )
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

The "i2s_data" might not be initialized before using it.
Set it to NULL by default and also check if it is valid.

Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
---
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
index 3482d8f8b4e7..3a8a5d975a04 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
@@ -465,7 +465,7 @@ void mt8365_afe_set_i2s_out_enable(struct mtk_base_afe *afe, bool enable)
 	int i;
 	unsigned long flags;
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
-	struct mtk_afe_i2s_priv *i2s_data;
+	struct mtk_afe_i2s_priv *i2s_data = NULL;
 
 	for (i = 0; i < DAI_I2S_NUM; i++) {
 		if (mt8365_i2s_priv[i].adda_link)
@@ -474,6 +474,11 @@ void mt8365_afe_set_i2s_out_enable(struct mtk_base_afe *afe, bool enable)
 
 	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
 
+	if (!i2s_data) {
+		spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+		return;
+	}
+
 	if (enable) {
 		i2s_data->i2s_out_on_ref_cnt++;
 		if (i2s_data->i2s_out_on_ref_cnt == 1)
-- 
2.39.2


