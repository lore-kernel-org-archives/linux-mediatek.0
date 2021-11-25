Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C959C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 18:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NvWwOcYkXBHaQBZG7hKk4JjbQKDxcEhK+dwjHbGf2Hk=; b=Qh9RBcWTAI5N8X
	k8sVFcFw4cRI+oebl9lS4WTVsprJS9V38U3ztST6GJSrfgLy4I7/fLOEdZdG/yKULhBnG3W5CsDuf
	EXrUy1A+g+DyXxZ7qbof3LYqIKXGqjVIxGqpXRex7Hy46zXILpVZefvlco5igrPDYEswQcvPKB3QB
	EcpYEfi4TaNFNgKxhoxqRHf/0tSJv5eN1CuNW4aD1ggFNvrn9rN5g7EevISsRwgrU3dThR7vQ4GxQ
	F15Zumle6QYvLaJK7Z/GbgOafgjC9IuVDocJzoyBy+rulDWxCR/uYb6l63kSRUpV5O65vnis0R2uN
	vZH2/jL6oXCWBoTfXYSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqJcE-008T2E-5a; Thu, 25 Nov 2021 18:37:02 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqJcA-008T1w-Nq
 for linux-mediatek@lists.infradead.org; Thu, 25 Nov 2021 18:37:00 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1mqJc4-00026U-4x; Thu, 25 Nov 2021 19:36:52 +0100
Date: Thu, 25 Nov 2021 18:36:45 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH] mt76: eeprom: tolerate corrected bit-flips
Message-ID: <YZ/XvfwzqUyjmBCm@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_103658_822444_A783907C 
X-CRM114-Status: UNSURE (   9.42  )
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

Acked-by: Hauke Mehrtens <hauke@hauke-m.de>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index 2d58aa31db934..0eb98f7ff7ec0 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -65,7 +65,7 @@ int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
 	offset = be32_to_cpup(list);
 	ret = mtd_read(mtd, offset, len, &retlen, eep);
 	put_mtd_device(mtd);
-	if (ret) {
+	if (ret && !mtd_is_bitflip(err)) {
 		dev_err(dev->dev, "reading EEPROM from mtd %s failed: %i\n",
 			part, ret);
 		goto out_put_node;
-- 
2.34.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
