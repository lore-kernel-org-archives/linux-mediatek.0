Return-Path: <SRS0=6qD2=2L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD6FCC43603
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Dec 2019 07:17:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F203206EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Dec 2019 07:17:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZVuC3/f0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cqqFjOcc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F203206EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FwCM+vKm8Z+DZJlRtNnQAR8r7ItWhDqxTwci363yj3c=; b=ZVuC3/f03oEjJA
	bfnLu37Y4MUo+qz/OAbPkXmdxcJ2K9BbL9a9Kkg4gD7BU8DxkrNctOABY72xM6QcSSgWy1DJQZqh5
	xUjCwgV8ZiWhXI15H+j7rXibhZ+LkCEnCZ+exOx0awD/9SW8S/k6DBlJXHHoYZOXbBgvntg0JVcxd
	ZcjPsE6FDQeohlLe2tiduUHVwWdx6tq4e6agQua/qHWkT1zWfYeP5UBhX3+O2RQ9NMiTyz3V3Z3HX
	Cnn9I3KGooXVXZtlpAPB65DW83lk3BVF58A0epyUCeT5lTEXyrUPDuGsO6wwHjHN+OGruh/o8taaE
	O9ySE9hz8du51bGCVQWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiZ0s-0002xs-Os; Sat, 21 Dec 2019 07:17:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiZ0p-0002xD-Q5
 for linux-mediatek@lists.infradead.org; Sat, 21 Dec 2019 07:17:22 +0000
X-UUID: e43c2fbe4a9545d997e0cdf157bc39f3-20191220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6a1RKfO0AH2bkibQkHqHEE9QU8OujxhL2WQH1gq5fq4=; 
 b=cqqFjOccVxh6YQ/wcKv4ytO37RDX6T1qtnzbbrv3V7O3rKPnpQcI1Wwk32mnJxB49Qz3O4gZYIPflkviRyX2WvBBIoACxK/WgHJqctcqBbid4Dl4I3/dJOR6HebBcJw3gNsar9+hRCGy/Gx+x9aQlDe7Pj4chpn1PdFERl06pLw=;
X-UUID: e43c2fbe4a9545d997e0cdf157bc39f3-20191220
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1889264981; Fri, 20 Dec 2019 23:17:12 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Dec 2019 23:17:29 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 21 Dec 2019 15:17:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sat, 21 Dec 2019 15:16:20 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: mt7615: fix MT7615_CFEND_RATE_DEFAULT value
Date: Sat, 21 Dec 2019 15:17:00 +0800
Message-ID: <373ef6c1a4a0252cc21dde3f08e618a62629ba38.1576911997.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_231719_854341_42F1C920 
X-CRM114-Status: UNSURE (   7.39  )
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
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix defualt CFEND_RATE and replace hardcode values.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/init.c   | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 442736ceabe5..94a0dc8bfa28 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -35,8 +35,8 @@ static void mt7615_mac_init(struct mt7615_dev *dev)
 	mt76_wr(dev, MT_TMAC_TRCR1, val);
 
 	val = MT_AGG_ACR_PKT_TIME_EN | MT_AGG_ACR_NO_BA_AR_RULE |
-	      FIELD_PREP(MT_AGG_ACR_CFEND_RATE, 0x49) | /* 24M */
-	      FIELD_PREP(MT_AGG_ACR_BAR_RATE, 0x4b); /* 6M */
+	      FIELD_PREP(MT_AGG_ACR_CFEND_RATE, MT7615_CFEND_RATE_DEFAULT) |
+	      FIELD_PREP(MT_AGG_ACR_BAR_RATE, MT7615_BAR_RATE_DEFAULT);
 	mt76_wr(dev, MT_AGG_ACR0, val);
 	mt76_wr(dev, MT_AGG_ACR1, val);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 554bd04d6d81..48810eda1cd6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -40,7 +40,8 @@
 #define MT_CHFREQ_DBDC_IDX	BIT(6)
 #define MT_CHFREQ_SEQ		GENMASK(5, 0)
 
-#define MT7615_CFEND_RATE_DEFAULT	0x69 /* chip default (24M) */
+#define MT7615_BAR_RATE_DEFAULT		0x4b /* OFDM 6M */
+#define MT7615_CFEND_RATE_DEFAULT	0x49 /* OFDM 24M */
 #define MT7615_CFEND_RATE_11B		0x03 /* 11B LP, 11M */
 
 struct mt7615_vif;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
