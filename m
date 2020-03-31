Return-Path: <SRS0=zTQl=5Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF0EC43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 06:52:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F3AB20748
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 06:52:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jGyXn7JZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tuQugvTR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F3AB20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=icgJ67WsKxKaHZT6k0Gpt9tB/M4ZrhNGR9Y5CfXxwjo=; b=jGyXn7JZm/s8mE
	4wOns+Yw1oZTe5jRPpjTn44skFhSlMOBCiykR9lKc9icXq6/3rnsp7A37zKxP9SNjjPEBWTvvcc/e
	27stQFUazNGac825gYZV04C/gRd4ET+XNOC7e0x/EobHKqCqX9h3xtRjxhZNWnRfmZdm70Y39yZzB
	UX8ojHGRsHB0fjxvEEg/eFldrlCQGTua8dK+AD2m+aZTPiKx8vpNx8AZSVB4yQ4rws8aOtMC9h79r
	thqPac2oKhNgiJG4PncK6fkIVtailOd/AwI3RAQqXWV36mdDiacx9yynL/jO5soWQOGdwfwk6Rzff
	K6ogxuSKvLEKQ2GRN5Fw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJAkc-0000Ie-GH; Tue, 31 Mar 2020 06:51:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJAkY-0000CK-C8
 for linux-mediatek@lists.infradead.org; Tue, 31 Mar 2020 06:51:51 +0000
X-UUID: de77378cd7144e58977dba360e56ddc2-20200330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=u13/otOsZwQRNSYopzBCUAzrteMoNJLZU3KM9kEkgXI=; 
 b=tuQugvTRNlpEBYwK7607rkL/75D+tLtPgynY0DeE9qLED17rLnHRThAQFZ9SnbtFoV9CnLsAmxvaKsiYaxfTH/cKaj2Jk7I4mTNf9jiOVosBg47Bkhnzafjttqby9rc7OwR9iaYV2byHJTHzKej4Zl5pIIovQIlGeSFPih4plU8=;
X-UUID: de77378cd7144e58977dba360e56ddc2-20200330
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1222291721; Mon, 30 Mar 2020 22:51:27 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Mar 2020 23:51:39 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 31 Mar 2020 14:51:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 31 Mar 2020 14:51:37 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 1/4] mt76: mt7615: modify mt7615_ampdu_stat_read for each phy
Date: Tue, 31 Mar 2020 14:51:35 +0800
Message-ID: <1fc90ec2a64d062ac7264aaa3dd158f2282ad7b8.1585636614.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_235150_469969_0F590CE1 
X-CRM114-Status: UNSURE (   8.29  )
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
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is a preliminary patch to add more Tx counters.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7615/debugfs.c   | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
index b4d0795154e3..9fd40d723201 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
@@ -120,12 +120,17 @@ mt7615_reset_test_set(void *data, u64 val)
 DEFINE_DEBUGFS_ATTRIBUTE(fops_reset_test, NULL,
 			 mt7615_reset_test_set, "%lld\n");
 
-static int
-mt7615_ampdu_stat_read(struct seq_file *file, void *data)
+static void
+mt7615_ampdu_stat_read_phy(struct mt7615_phy *phy,
+			   struct seq_file *file)
 {
 	struct mt7615_dev *dev = file->private;
+	bool ext_phy = phy != &dev->phy;
 	int bound[7], i, range;
 
+	if (!phy)
+		return;
+
 	range = mt76_rr(dev, MT_AGG_ASRCR0);
 	for (i = 0; i < 4; i++)
 		bound[i] = MT_AGG_ASRCR_RANGE(range, i) + 1;
@@ -133,6 +138,8 @@ mt7615_ampdu_stat_read(struct seq_file *file, void *data)
 	for (i = 0; i < 3; i++)
 		bound[i + 4] = MT_AGG_ASRCR_RANGE(range, i) + 1;
 
+	seq_printf(file, "\nPhy %d\n", ext_phy);
+
 	seq_printf(file, "Length: %8d | ", bound[0]);
 	for (i = 0; i < ARRAY_SIZE(bound) - 1; i++)
 		seq_printf(file, "%3d -%3d | ",
@@ -141,6 +148,15 @@ mt7615_ampdu_stat_read(struct seq_file *file, void *data)
 	for (i = 0; i < ARRAY_SIZE(bound); i++)
 		seq_printf(file, "%8d | ", dev->mt76.aggr_stats[i]);
 	seq_puts(file, "\n");
+}
+
+static int
+mt7615_ampdu_stat_read(struct seq_file *file, void *data)
+{
+	struct mt7615_dev *dev = file->private;
+
+	mt7615_ampdu_stat_read_phy(&dev->phy, file);
+	mt7615_ampdu_stat_read_phy(mt7615_ext_phy(dev), file);
 
 	return 0;
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
