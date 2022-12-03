Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF96BC47089
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Dec 2022 03:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F3N+BXWVouR7PHRflmwklN0n51QgK3XV+XrOP4kaVCk=; b=Zg31Q4cR7vJSTV5bPDuzoXzJKB
	5M7JnbEC+nlOe7DHBsxsgJ7FYp/B5OlXe9SIkF4yQQWBFDnlM/W6WOUjgY5Jexd5YvXIPDALHcYQs
	8C7B8IOz/rifZ3gfbT/ds9EG96eGGEE2QGfqx8DX4z19GM4fNtxZk1GQN2nTjYvgnzdSyh8kOjeGi
	SHP4UGv0C73VAQjosYfQws6eyQSYmYsnHC4t0c0k/sD8m9JJs5IGWj20PjqkvCwYmAduI+IpSzYkj
	W8ElpuXdFnbhgchLLL1jbRoruLJ0VND67788upTtwshGbsHGZLrp2kV6dyQBxvbGjNyRFl3IlwC49
	Ja4Arkfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1JZv-002Ht0-TU; Sat, 03 Dec 2022 03:52:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1JZt-002HsW-Bv
	for linux-mediatek@lists.infradead.org; Sat, 03 Dec 2022 03:52:38 +0000
X-UUID: 43ab6e8d82b547938bded4323a19f2c1-20221202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=F3N+BXWVouR7PHRflmwklN0n51QgK3XV+XrOP4kaVCk=;
	b=ag9+AMTPWlSZ1l3aqzbiOYyHGEIT5lonwEVfMEthAp7zXliU7CKmU4dHc2Pf8e9PrIr8RVpUPIkACLXx65+S0hbP5B9pZiTqMP3SH9DGYT49logRN56S4A4opyrMT8PAzy//2TBHE++y5QhQoRzh0fYl5WDTmU/x9qsv5iY4teg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:81f0d39d-f7be-4042-a882-c96112135296,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:af2e071f-5e1d-4ab5-ab8e-3e04efc02b30,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 43ab6e8d82b547938bded4323a19f2c1-20221202
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 949910264; Fri, 02 Dec 2022 20:52:29 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 3 Dec 2022 11:22:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sat, 3 Dec 2022 11:22:26 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/4] wifi: mt76: mt7915: fix mt7915_rate_txpower_get() resource leaks
Date: Sat, 3 Dec 2022 11:22:22 +0800
Message-ID: <ce05914d5a4d73cea21ef2c359f3a5bb7c61a86e.1670037462.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_195237_425675_82116098 
X-CRM114-Status: UNSURE (   8.18  )
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

Coverity message: variable "buf" going out of scope leaks the storage.

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527799 ("Resource leaks")
Fixes: e3296759f347 ("wifi: mt76: mt7915: enable per bandwidth power limit support")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index fb46c2c1784f..a7fdcd1f3d98 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -996,7 +996,7 @@ mt7915_rate_txpower_get(struct file *file, char __user *user_buf,
 
 	ret = mt7915_mcu_get_txpower_sku(phy, txpwr, sizeof(txpwr));
 	if (ret)
-		return ret;
+		goto out;
 
 	/* Txpower propagation path: TMAC -> TXV -> BBP */
 	len += scnprintf(buf + len, sz - len,
@@ -1047,6 +1047,8 @@ mt7915_rate_txpower_get(struct file *file, char __user *user_buf,
 			 mt76_get_field(dev, reg, MT_WF_PHY_TPC_POWER));
 
 	ret = simple_read_from_buffer(user_buf, count, ppos, buf, len);
+
+out:
 	kfree(buf);
 	return ret;
 }
-- 
2.18.0


