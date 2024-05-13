Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DA2C25B10
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 May 2024 12:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fXvZVy+O0FXOwaoVLJHn7SMWSPa7OrLUhbpPfhZ4/e8=; b=1zkt5qeBD17pgh/IOJPDGUG8JC
	tvUM6k+d2nhpmbxBbVkMctql7hLkszmDHM9BNrWi1yjrggUm/xDbPBchxBjvaiGgAFL2yuVsIG8s1
	ke/OrNCwi3sILl68ulRtR84PtR+GT9hROETr5I9Lo6HMBjYdDNNLyVRmBp3Y7lMF5jNfuCQbT0wT2
	7b+W0MjvOzESY+eemdOKxQ7U8GdrBW9uA76BCUz7/Ljva2yQHz9b5XQ7XG6dvNRKAvMTivNqFwBvC
	QsVyVFUDlOrv+pI5D4NBu30CFXm3fNiKlmwgAVMKHDhfoZBVHBL1Hr4l52t/Xm73eoCvM8eh7BWCL
	MutRlTDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Uj0-0000000CnrX-3F5K;
	Mon, 13 May 2024 12:24:14 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Uiv-0000000CnpK-47Jt
	for linux-mediatek@lists.infradead.org;
	Mon, 13 May 2024 12:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=fXvZV
	y+O0FXOwaoVLJHn7SMWSPa7OrLUhbpPfhZ4/e8=; b=D8Hm/MyCPnHJihPxUCHiI
	P1HSTNEkpHjBo1Kl3c6zL2djILhqLO8vGi+XVR5Pf7U3CqY7Noey5cRHv1FSt5HU
	7Dz6htONyX1b9UlIJ8BfbDgR0HGTV8EIwkl+Q16i38MalqWQeZSvCbCEZj8m6lVn
	vrj49TR2K73YVUDXYkYoRY=
Received: from flipped.. (unknown [159.226.94.118])
	by gzga-smtp-mta-g2-1 (Coremail) with SMTP id _____wD3f6dEBkJm50hfEQ--.9117S2;
	Mon, 13 May 2024 20:23:33 +0800 (CST)
From: Sicong Huang <congei42@163.com>
To: nbd@nbd.name,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sicong Huang <congei42@163.com>
Subject: [PATCH v1] wifi: mt76: mt7615: fix null pointer dereference bug
Date: Mon, 13 May 2024 20:23:29 +0800
Message-Id: <20240513122329.170380-1-congei42@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3f6dEBkJm50hfEQ--.9117S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryDKr1rKr17WrykJry3CFg_yoWfCwb_WF
	WkuF1ftw18Gr1kKr42vr4xArW0k395Za48W3sIqrWSq39rJFZrGryavr9rGrZrCrn2vrW3
	Gr1DJFyrX39IvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjvtCDUUUUU==
X-Originating-IP: [159.226.94.118]
X-CM-SenderInfo: 5frqwvrlusqiywtou0bp/xtbBFQfd8mXAlaaUfQAAsC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_052410_644645_88540E70 
X-CRM114-Status: UNSURE (   7.90  )
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

Function mt7615_coredump_work will call vzalloc to allocate a large amount
of memory space, the size of which is 1300KB. There should be a null
pointer check after vzalloc. Otherwise, when the memory allocation fails
and returns NULL, the function will cause a Kernel crash.

Signed-off-by: Sicong Huang <congei42@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 7ba789834e8d..04eb52904520 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -2341,6 +2341,9 @@ void mt7615_coredump_work(struct work_struct *work)
 	}
 
 	dump = vzalloc(MT76_CONNAC_COREDUMP_SZ);
+	if(!dump)
+		return;
+
 	data = dump;
 
 	while (true) {
-- 
2.34.1


