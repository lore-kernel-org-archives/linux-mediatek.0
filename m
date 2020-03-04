Return-Path: <SRS0=cHEQ=4V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AEAC3F2CD
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 12:20:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB95720848
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 12:20:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D3pbjs0P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB95720848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v+/BKPFapjIgH/S2aa8dveYHDdnxBB6GIfbJBhGcKZI=; b=D3pbjs0PjfBJFa
	MHm0sMLr9/OO5Bp1O8/rx9AuVwXg/sLC24w2pre/5dw1jS2auQg/GBUpv+FzuG+m1gUYQYPuvw8we
	RtVITWr2qyt++VerthYiSWkOrsAhIPqwDJ/7FdvLzSPFqj5bvuSBahAUK0OyiZMISx36DuvsN8/tR
	/1PzqdebUWz+A8cXqp9osgndUkocfrWRrlU4UkUv5JkY+tYn3MI8hspun4b6UguuwSrMHU40W5rgR
	vtBrZRrQQWMtdcWgwGh21Bpm+fevznI/68s92nkZu4pZvLdC8eNGBfC3n8tYVZjAFtzyGhwSxB5LS
	FmY+KerCVnclY1FchzuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9T0R-0002z5-6r; Wed, 04 Mar 2020 12:20:07 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9T09-0002Jj-VM; Wed, 04 Mar 2020 12:19:51 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id BB74A70B5BC42A7D5B3D;
 Wed,  4 Mar 2020 20:19:38 +0800 (CST)
Received: from euler.huawei.com (10.175.104.193) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Wed, 4 Mar 2020 20:19:30 +0800
From: Chen Wandun <chenwandun@huawei.com>
To: <nbd@nbd.name>, <lorenzo.bianconi83@gmail.com>, <ryder.lee@mediatek.com>, 
 <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] mt76: remove variable 'val' set but not used
Date: Wed, 4 Mar 2020 20:34:11 +0800
Message-ID: <20200304123411.33499-1-chenwandun@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.104.193]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_041950_174158_5B5374E0 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: chenwandun@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/mediatek/mt76/mt76x0/phy.c: In function mt76x0_phy_rf_init:
drivers/net/wireless/mediatek/mt76/mt76x0/phy.c:1158:5: warning: variable val set but not used [-Wunused-but-set-variable]

Fixes: 10de7a8b4ab9 ("mt76x0: phy files")
Signed-off-by: Chen Wandun <chenwandun@huawei.com>
---
 drivers/net/wireless/mediatek/mt76/mt76x0/phy.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c b/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c
index b56397c05218..09f34deb6ba1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c
@@ -1155,7 +1155,6 @@ static void mt76x0_rf_patch_reg_array(struct mt76x02_dev *dev,
 static void mt76x0_phy_rf_init(struct mt76x02_dev *dev)
 {
 	int i;
-	u8 val;
 
 	mt76x0_rf_patch_reg_array(dev, mt76x0_rf_central_tab,
 				  ARRAY_SIZE(mt76x0_rf_central_tab));
@@ -1188,7 +1187,7 @@ static void mt76x0_phy_rf_init(struct mt76x02_dev *dev)
 	 */
 	mt76x0_rf_wr(dev, MT_RF(0, 22),
 		     min_t(u8, dev->cal.rx.freq_offset, 0xbf));
-	val = mt76x0_rf_rr(dev, MT_RF(0, 22));
+	mt76x0_rf_rr(dev, MT_RF(0, 22));
 
 	/* Reset procedure DAC during power-up:
 	 * - set B0.R73<7>
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
