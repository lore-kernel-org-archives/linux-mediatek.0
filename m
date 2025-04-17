Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA11BC369CA
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Apr 2025 22:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s81pV5jIkn/GlgtQ08lcgCCxshbcpxyENaufyDqFoXU=; b=cpCBaKm6KZMDHik4uNJOyxtJGg
	Y0s52YCXdbgBy4P3KObtVO4BJNSiwDQq/mUtMnAf03JK12YBpXnMnTGejDeo36Cu4sGvwPiOB/5Kj
	bk9Zcbus840qluTW/Gg0Cm30uJ9NGyUjv6ArfaaEy+CiwN2bzzrpqoTZbEwuAEDzm1ViCTwi1KtgL
	KyeubnnX9olLXlJ27L6jF/3DuM1ChkBqr9WsU8zKVrl8kAgTx/ExeUHCrb2HFtHgULQbwkPs+Cmz3
	hVSVv7D4Xig/xBG5eSFCPgsj1zuVXcEW2kCiDAMYnVuLslNYZbApXvYUag7+eGNelrtsclc99rcyG
	+F/nFFvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5XkW-0000000ESXH-07Y9;
	Thu, 17 Apr 2025 22:30:24 +0000
Received: from smtp-17.smtpout.orange.fr ([80.12.242.17] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Xie-0000000ESOG-0Wfw;
	Thu, 17 Apr 2025 22:28:29 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 5XiQuDWqjETiN5XiTu2OP2; Fri, 18 Apr 2025 00:28:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1744928899;
	bh=s81pV5jIkn/GlgtQ08lcgCCxshbcpxyENaufyDqFoXU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=A3bMACpVFPDO5ND/TN1ebf1eXSQbRYcajI4fSEkK2EuoyaXRJJCMQ0DKuRg2pLwbo
	 VS1SzNTDU/QGlLRK48q+hfy70nXkrjVOqvXJKy6cLUbuEmyYjeKVb4yZiNp4q4xI9z
	 b0dPos/V77rW4wUyHfKM78m5ODsUUU5X9kN0umDf6ayTHUVAoBfriVwuJe26uXzeSx
	 IUjLF5Hup2fcvgXBmGKCEY1Oslxt/Kb+scpWif99qpgTVtRXPtI6FNJkgekmY1blZT
	 Bj0fQxlre8TwyfBdis+sqsWCTNYZkwGVlZXi4+paEie7bjPRQMN1PR2mw+jQefOL/+
	 jJjypGAjhMriA==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 18 Apr 2025 00:28:19 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: Remove an unneeded local variable in mt76x02_dma_init()
Date: Fri, 18 Apr 2025 00:28:01 +0200
Message-ID: <e86d5602bdd8b6bd22258ee69536992f39470bf5.1744928865.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_152828_299639_4624795B 
X-CRM114-Status: UNSURE (   8.74  )
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

Remove 't' which is unneeded since commit f3950a414143 ("mt76: set
txwi_size according to the driver value")

This slightly simplifies the code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
index a82c75ba26e6..a683d53c7ceb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
@@ -174,7 +174,6 @@ static int mt76x02_poll_tx(struct napi_struct *napi, int budget)
 
 int mt76x02_dma_init(struct mt76x02_dev *dev)
 {
-	struct mt76_txwi_cache __maybe_unused *t;
 	int i, ret, fifo_size;
 	struct mt76_queue *q;
 	void *status_fifo;
-- 
2.49.0


