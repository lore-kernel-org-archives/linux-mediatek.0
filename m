Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06A1C07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:37:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE26961CFE
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE26961CFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cwSrG9plFsMJvL/+YBJR2IGeFbqNCQUSPlOY/Dom3yk=; b=qqx7OzSeftk7yN
	IVO5VmEbELZ2ELC84Qh5O6ABamckxC8kbbsX/xzl5LemIt88Llx5ST7313EiETqEgYkJ0DkH2JoxN
	VKT5vuFac/NzYmJsHRjlxTjwaw4OOgHtM56QfmvJkZ8km2S3owqA/JIvaOzHGEvHt6c2SSQwTFgKQ
	OmHWiW906N77LDhqQKnGQPSEg0ELnEzNdLn1z6G2um/13wdgpuIMj5t1rz0z7pyUpKHAtDg1jaSmV
	hXUj8LOO8B6ZY2iCVipMkiVd9E+RTTA0a6Xxq+Bk5SRhimh+Kq24Pam5UkaFEMgGHV/9zbZdPe65/
	sC9z5QB6Yv+ifiNHtSzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0jNv-00BQw6-V4; Tue, 06 Jul 2021 11:37:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0j86-00BGpq-7G; Tue, 06 Jul 2021 11:20:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0AF561D74;
 Tue,  6 Jul 2021 11:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570441;
 bh=RPRNZmvuVCB5xcnAbD+p7zyjY3mC4jznPrHztNSsvbg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rwLM+VYWcfX66hlLYujZLzI55HgE16ltHHg7soUqI+AmQZTJRqJsgm7wu3E3KKWKa
 IJTwdFOFv4Z4o5Cj9cfn/mUgastRW0lIvqsVoCTVUYzQ0NRuVtnwtR4gRrmT2SZ9OB
 6p8/5oTTnUoCFpt/wuWEJ3D06e1zVbPBknYzMjsmsSetZe17rho76IAzrLI2Us7tSk
 sJb02XweYrNoqHKxKzwQ6teDaeByfR+PwlNbmXJaaKyxQRGz8y8CZIjMMQFZSUm9hu
 Iih/rpAGmaH3Up9WZPE3HioEq+pnHmRVraiBSQ4Jzc21ZxMAIRPo0LAiPjTlCZHOiG
 pFZ7xzZ0zVZzA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Sasha Levin <sashal@kernel.org>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 101/160] mt76: mt7615: fix fixed-rate tx status
 reporting
Date: Tue,  6 Jul 2021 07:17:27 -0400
Message-Id: <20210706111827.2060499-101-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111827.2060499-1-sashal@kernel.org>
References: <20210706111827.2060499-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_042042_332041_56C4DF27 
X-CRM114-Status: GOOD (  10.08  )
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

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit ec8f1a90d006f7cedcf86ef19fd034a406a213d6 ]

Rely on the txs fixed-rate bit instead of info->control.rates

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 8dccb589b756..5a63869193f2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -1194,22 +1194,20 @@ static bool mt7615_fill_txs(struct mt7615_dev *dev, struct mt7615_sta *sta,
 	int first_idx = 0, last_idx;
 	int i, idx, count;
 	bool fixed_rate, ack_timeout;
-	bool probe, ampdu, cck = false;
+	bool ampdu, cck = false;
 	bool rs_idx;
 	u32 rate_set_tsf;
 	u32 final_rate, final_rate_flags, final_nss, txs;
 
-	fixed_rate = info->status.rates[0].count;
-	probe = !!(info->flags & IEEE80211_TX_CTL_RATE_CTRL_PROBE);
-
 	txs = le32_to_cpu(txs_data[1]);
-	ampdu = !fixed_rate && (txs & MT_TXS1_AMPDU);
+	ampdu = txs & MT_TXS1_AMPDU;
 
 	txs = le32_to_cpu(txs_data[3]);
 	count = FIELD_GET(MT_TXS3_TX_COUNT, txs);
 	last_idx = FIELD_GET(MT_TXS3_LAST_TX_RATE, txs);
 
 	txs = le32_to_cpu(txs_data[0]);
+	fixed_rate = txs & MT_TXS0_FIXED_RATE;
 	final_rate = FIELD_GET(MT_TXS0_TX_RATE, txs);
 	ack_timeout = txs & MT_TXS0_ACK_TIMEOUT;
 
@@ -1231,7 +1229,7 @@ static bool mt7615_fill_txs(struct mt7615_dev *dev, struct mt7615_sta *sta,
 
 	first_idx = max_t(int, 0, last_idx - (count - 1) / MT7615_RATE_RETRY);
 
-	if (fixed_rate && !probe) {
+	if (fixed_rate) {
 		info->status.rates[0].count = count;
 		i = 0;
 		goto out;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
