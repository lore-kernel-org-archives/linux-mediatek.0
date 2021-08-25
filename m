Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F18DFC4320E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 01:32:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93BAB61220
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 01:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 93BAB61220
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WeAXpgpbh5uTgS6vx9D73l0QtDuevCfZ74GxNWq6yZk=; b=17QgsV66VBbUuH
	vY7UUWuFPYDJSxxE2CD770U6c/pLlPshDuqeE139+ERsvAVW27B069cD2HrKbx2ZeR5bTPoa22i17
	h6NIp3uZoZhh4K9IiXc/Z2qgjB+SPAJ0y1e3jdvZhC9VPYokcUccIgey03GJRJoVk66DALVYAkzWY
	GY+XqPM4MSOkDLjMFGBG1s8C4XdOFiTyd6U2CcnZyzjthAUUF1mbPBAkoPzWvFSy/HRJyjAhb4bmr
	7D/3+26hInY7Rkg+g7WP2rK4g3ttfMB7FRLgcpNu6yrM33BPI2szxjE5cbQ8gWx5wKhBxb0pkQmmm
	m5HC2G22rsWoUMmwPaZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIhmM-0055ry-4I; Wed, 25 Aug 2021 01:32:34 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIhmJ-0055rT-N2
 for linux-mediatek@lists.infradead.org; Wed, 25 Aug 2021 01:32:33 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1mIhmE-0007rm-DA; Wed, 25 Aug 2021 03:32:25 +0200
Date: Wed, 25 Aug 2021 02:32:16 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/2] mt76: support reading EEPROM data embedded in fdt
Message-ID: <YSWdoKIaVCqAU6nG@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_183231_797617_7A9E150A 
X-CRM114-Status: GOOD (  11.69  )
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

Some platforms boot from SD card and don't come with calibration data
stored anywhere on the board.
As EEPROM data is rather small it can be embedded into the device tree
to be loaded from there by the mt76.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index 3b47e85e95e7c..01bc42dc71c26 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -15,6 +15,7 @@ int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
 	struct device_node *np = dev->dev->of_node;
 	struct mtd_info *mtd;
 	const __be32 *list;
+	const void *data;
 	const char *part;
 	phandle phandle;
 	int size;
@@ -24,6 +25,16 @@ int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
 	if (!np)
 		return -ENOENT;
 
+	data = of_get_property(np, "mediatek,eeprom-data", &size);
+	if (data) {
+		if (size > len)
+			return -EINVAL;
+
+		memcpy(eep, data, size);
+
+		return 0;
+	}
+
 	list = of_get_property(np, "mediatek,mtd-eeprom", &size);
 	if (!list)
 		return -ENOENT;
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
