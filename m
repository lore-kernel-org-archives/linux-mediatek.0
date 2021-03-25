Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9559AC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 08:13:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 124D3619FB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 08:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 124D3619FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BQyK8nwy3FdipJGLIYpBccmSzmouOG9tOjiM+eE5CeY=; b=ZROVL6WKkozvbqUyNETHcmwGYR
	Xj8PW2Y3sjCyAED4NznQBifQy/Fk7Pl/Dxm/a0YzM/cNzKNTN22O5tEam6lcjRTuMGJBz6rmfNk5p
	Yqk7dR7bXBVKQjNj89HYj6broj3S35s75jczclYhMTzcHXYNoqh6pBsEa/Oqa7QU0MT8drWuCig+8
	CbS52XxUCfk3vxQs1Zc9U4Em61nQwDOhetomEmImcP3C+PAa9EwjPzSPac81tYF0d3TJbJOUiTuZm
	I9vn8BgclvcGf2JOUJTkDr+r1/Ext1d9xoz1IYAnleyEB4obr9UG/HYTUgKEMRPQIoweMcgV6wIrS
	lye4x6bg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPL79-000vNf-EA; Thu, 25 Mar 2021 08:13:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPL6s-000vJN-Vy
 for linux-mediatek@lists.infradead.org; Thu, 25 Mar 2021 08:13:09 +0000
X-UUID: 6a02b19cf6cc4c37a2351a84b291571c-20210325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=orj72jAEdVE/Bxwy+jlAMp/XOi3chbAp4VnwYkUtAko=; 
 b=ZMNIXfNVe5SCDG+Iq/DsGT9Ub4vWyN/MrTWbZwK8hx0uuL1sILPAX6ZExWQL7lPz8BDIf8FfZ0hYQleYHvUUpRuAgqz4fRVqMPlUe1BoNmIXqGTNX7mUGNe1dCljcq38HCvQ2FKy3H6JF974BWrjB+rBmkbeOIDwL68WRXMe8RE=;
X-UUID: 6a02b19cf6cc4c37a2351a84b291571c-20210325
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 751448576; Thu, 25 Mar 2021 00:12:11 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 01:06:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 16:06:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 25 Mar 2021 16:06:07 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/5] mt76: mt7615: only enable DFS test knobs for mt7615
Date: Thu, 25 Mar 2021 16:06:01 +0800
Message-ID: <20744fae1cbe0dcc098b3112b0a5ccb0b6254587.1616657048.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: E78712D97A52E628E3E6A02C6AA7D2A28D243A51270B44D3489959BDF49FF3602000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_081305_987000_32FA9F41 
X-CRM114-Status: UNSURE (   8.23  )
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

DFS knobs should not be visible to non-DFS devices.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7615/debugfs.c   | 29 +++++++++++--------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
index 7ae48b4fa564..1b414220521a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
@@ -517,18 +517,23 @@ int mt7615_init_debugfs(struct mt7615_dev *dev)
 			    &fops_pm_idle_timeout);
 	debugfs_create_devm_seqfile(dev->mt76.dev, "radio", dir,
 				    mt7615_radio_read);
-	debugfs_create_u32("dfs_hw_pattern", 0400, dir, &dev->hw_pattern);
-	/* test pattern knobs */
-	debugfs_create_u8("pattern_len", 0600, dir,
-			  &dev->radar_pattern.n_pulses);
-	debugfs_create_u32("pulse_period", 0600, dir,
-			   &dev->radar_pattern.period);
-	debugfs_create_u16("pulse_width", 0600, dir,
-			   &dev->radar_pattern.width);
-	debugfs_create_u16("pulse_power", 0600, dir,
-			   &dev->radar_pattern.power);
-	debugfs_create_file("radar_trigger", 0200, dir, dev,
-			    &fops_radar_pattern);
+
+	if (is_mt7615(&dev->mt76)) {
+		debugfs_create_u32("dfs_hw_pattern", 0400, dir,
+				   &dev->hw_pattern);
+		/* test pattern knobs */
+		debugfs_create_u8("pattern_len", 0600, dir,
+				  &dev->radar_pattern.n_pulses);
+		debugfs_create_u32("pulse_period", 0600, dir,
+				   &dev->radar_pattern.period);
+		debugfs_create_u16("pulse_width", 0600, dir,
+				   &dev->radar_pattern.width);
+		debugfs_create_u16("pulse_power", 0600, dir,
+				   &dev->radar_pattern.power);
+		debugfs_create_file("radar_trigger", 0200, dir, dev,
+				    &fops_radar_pattern);
+	}
+
 	debugfs_create_file("reset_test", 0200, dir, dev,
 			    &fops_reset_test);
 	debugfs_create_devm_seqfile(dev->mt76.dev, "temperature", dir,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
