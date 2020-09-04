Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F1CC43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 06:01:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DFD6206E7
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 06:01:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lRr9ZC5I";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jOi6ySow"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DFD6206E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T1qF+aLyI6XeN/OrvZZC/5E6RFuF6dD1hkkfJZF9oLA=; b=lRr9ZC5Ih1xs7q6Ck+GOzPjc7P
	9YIfLz98yp/OS0trZelrqCPkrFlWTD0kJhfbK7WGIBryJWCUWSl3a5sE+FGBfByr1WhleNCcgwBot
	eQMLsfl81WborwAZ0tT6qSUjgrK5dEWeKoSGoYgB7izeDArtqavZaKYxwah0efl1CewUYlGWXNqAL
	EB8ytUfvhFYkR5FoKAbF1azx9lDcuqQZxsY0ZCMBtt+C3az8bqC93jUTsWEwshF1gGreuM91rB1VF
	SPWSe2Wl7tPgTW0pLJXJmTScum/krRamKCKWDmmndVxTc+5m6oaNCA/K1LE6uKow0An2s8E2eo/0H
	ywmca+4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE4mx-0005kd-II; Fri, 04 Sep 2020 06:01:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE4mu-0005j5-Lx
 for linux-mediatek@lists.infradead.org; Fri, 04 Sep 2020 06:01:29 +0000
X-UUID: 24512b8599314a33ac01bd32e8d63ee6-20200903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=jPwwJyFn/+V/3BD7kswj4A4OC14ihyANbZY+bcDcNig=; 
 b=jOi6ySowdlOa3/dwTxbrW1Wr5jWrpcmDZ4A+QHZ14oEYKgvn5sovrc5+5keTFOaC5OU8mYDeTWSrSGgnDi3KttN29wIl+7yab3nLobMMj8SrIzT0pbPLuON3kunkUgjKHCOMU6Cts6pO5zxdvwXynxBeAvzZW9bnTNLFA/tk9xM=;
X-UUID: 24512b8599314a33ac01bd32e8d63ee6-20200903
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 442623124; Thu, 03 Sep 2020 22:01:14 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Sep 2020 22:51:12 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Sep 2020 13:51:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Sep 2020 13:51:03 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: mt7915: fix unexpected firmware mode
Date: Fri, 4 Sep 2020 13:51:02 +0800
Message-ID: <1ff9c333497bc23c535028c53e19e9d9724cf4c0.1599099379.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_020128_895791_A6558975 
X-CRM114-Status: GOOD (  10.77  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 Chih-Min Chen <chih-min.chen@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Chih-Min Chen <chih-min.chen@mediatek.com>

Avoid firmware falling into spectrum mode since that will set
unexpected PSE/PLE thresholds which lead to Tx hang.

This mode should be cleaned before firmware download stage.

Signed-off-by: Chih-Min Chen <chih-min.chen@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 6 ++++++
 drivers/net/wireless/mediatek/mt76/mt7915/regs.h | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 517f526ec852..5a2dbbd9aa5a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -139,6 +139,12 @@ static int mt7915_init_hardware(struct mt7915_dev *dev)
 
 	set_bit(MT76_STATE_INITIALIZED, &dev->mphy.state);
 
+	/*
+	 * force firmware operation mode into normal state,
+	 * which should be set before firmware download stage.
+	 */
+	mt76_wr(dev, MT_SWDEF_MODE, MT_SWDEF_NORMAL_MODE);
+
 	ret = mt7915_mcu_init(dev);
 	if (ret)
 		return ret;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index e06c4d6cd2fc..cb852a4bfd97 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -371,6 +371,13 @@ static inline u32 mt7915_int_rx_mask(enum mt76_rxq_id q)
 #define MT_HIF_REMAP_L2_BASE		GENMASK(31, 12)
 #define MT_HIF_REMAP_BASE_L2		0x00000
 
+#define MT_SWDEF_BASE			0x41f200
+#define MT_SWDEF(ofs)			(MT_SWDEF_BASE + (ofs))
+#define MT_SWDEF_MODE			MT_SWDEF(0x3c)
+#define MT_SWDEF_NORMAL_MODE		0
+#define MT_SWDEF_ICAP_MODE		1
+#define MT_SWDEF_SPECTRUM_MODE		2
+
 #define MT_TOP_BASE			0x18060000
 #define MT_TOP(ofs)			(MT_TOP_BASE + (ofs))
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
