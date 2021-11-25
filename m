Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE10C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 19:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xrzd7oRPgY9KOwuKTuv+tjl0BJLYy8E8WZcirW4D7VI=; b=gkLpzCt1qYUumE
	YtlKQNl2FSwOg3FK/LxDEC3KTFGQPprp6S6kqsz28MnqpSXiQRL8tFG/IZVTfjZZZR+ssqzKpfsdz
	rFNPoA8cEunWzQ8HusJD5GNZNhHXDXUmGNLiYHVQR8nxDaa/fyWgPC+JST9Cut/sMLmWs1uGSWUue
	SlZMQKZ5pHZe9anMNGbVw5xLFF1bU3+mSwXnylHVLlu7DXO0Uqzxbq7yJlKuVUKNJkuD1qyAKfz7R
	mPeq4dNPKMMj0g+9MUIKSWt693M1CXlzoMcK7sLwUM3LlzDrHttnl+thBpM4JLg4X/oirgTgZKHTZ
	jXCBbjRgu+LDPcWnnDfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqKgE-008Y9T-EW; Thu, 25 Nov 2021 19:45:14 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqKgC-008Y8Y-4s
 for linux-mediatek@lists.infradead.org; Thu, 25 Nov 2021 19:45:13 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1mqKgA-0002NO-5q; Thu, 25 Nov 2021 20:45:10 +0100
Date: Thu, 25 Nov 2021 19:45:03 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v2] mt76: eeprom: tolerate corrected bit-flips
Message-ID: <YZ/nv74JH/uQwpBt@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_114512_207082_8DAC7793 
X-CRM114-Status: UNSURE (   9.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtd_read() returns -EUCLEAN in case of corrected bit-flips.
As data was read, don't error out in this case.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: fix wrong variable name

 drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index 2d58aa31db934..4a5d14473ddc4 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -65,7 +65,7 @@ int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
 	offset = be32_to_cpup(list);
 	ret = mtd_read(mtd, offset, len, &retlen, eep);
 	put_mtd_device(mtd);
-	if (ret) {
+	if (ret && !mtd_is_bitflip(ret)) {
 		dev_err(dev->dev, "reading EEPROM from mtd %s failed: %i\n",
 			part, ret);
 		goto out_put_node;
-- 
2.34.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
