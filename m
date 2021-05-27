Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02E5C4707F
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 18:35:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C452613DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 18:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C452613DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=txf2o/MNleU87oZonBgW25vXTUJth8+QPSvLE6SpYbg=; b=2+6HESc70oXSxo
	z6MxAqmDTidLyHoyJMF4ukmElGZfN9rzcpDvblPWH40IAOqYAfdXeCElS09i/n9OJIg+qTQR3Qa+Y
	yAcyTBtUvU8BgEXS7xuT7U30HOi0llLnCCjdMY3RDQ/RmUheKiBwYsPv3ccohbIvU3GpMCD/O3OJ/
	GjjAjGovTdvHT2ppVylowvGhedoyF4mzgfsi/Zkeq7VsOcaSwifrcnljTmZ9OVJS3ckqxebNWq/NW
	xC4vbFYCS4kckU7/n/zHrBzzFUCE25xfK2rkHszALbHydfhdw39hMfE55Q3P2m2c4cb6daoXITz7I
	//xkjPWu2ZKbM8GfJ7Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmKqm-008X2c-8S; Thu, 27 May 2021 18:35:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmJSQ-007vBM-HK
 for linux-mediatek@lists.infradead.org; Thu, 27 May 2021 17:06:09 +0000
X-UUID: 2c0a4bf491844cd1a4690041fbc090ff-20210527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=YyTBjChf6b+mfXI6jndnxJFZ/nJHKtsgfH7MHYAtA8Q=; 
 b=qcuIM0JNP4De/m1BE3euwSnYro8JgvX9ZtFnqFaOKntWJM5JwHdfXZfuJzNKn03gK1PiAgDm3JjBBYM449pcskBbsjqY+hqCaDWiBmPAdzUsCQlN12NfLzlo1aZ+UF7UZdNkuGcDVPyLaAnPKUunngvQiA2GrcMGAlnlZn8zaCY=;
X-UUID: 2c0a4bf491844cd1a4690041fbc090ff-20210527
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 892636800; Thu, 27 May 2021 10:06:00 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 May 2021 10:05:58 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 May 2021 01:05:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 28 May 2021 01:05:56 +0800
From: <Deren.Wu@mediatek.com>
To: <Deren.Wu@mediatek.com>, <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] mt76: mt7921: update statistic in active mode only
Date: Fri, 28 May 2021 01:05:33 +0800
Message-ID: <9337f7947e1f0921ffb6b4af541d29af9a0a9394.1622112237.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_100608_031345_450AAC38 
X-CRM114-Status: GOOD (  10.97  )
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

From: Deren Wu <deren.wu@mediatek.com>

wakeup chip every 250ms may cause huge power consumption

try to update statistic counter only if in active status only,
and it would lead fewer power cost

Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index e29d4fdab572..212832b34674 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -1459,13 +1459,15 @@ void mt7921_pm_power_save_work(struct work_struct *work)
 {
 	struct mt7921_dev *dev;
 	unsigned long delta;
+	struct mt76_phy *mphy;
 
 	dev = (struct mt7921_dev *)container_of(work, struct mt7921_dev,
 						pm.ps_work.work);
+	mphy = dev->phy.mt76;
 
 	delta = dev->pm.idle_timeout;
-	if (test_bit(MT76_HW_SCANNING, &dev->mphy.state) ||
-	    test_bit(MT76_HW_SCHED_SCANNING, &dev->mphy.state))
+	if (test_bit(MT76_HW_SCANNING, &mphy->state) ||
+	    test_bit(MT76_HW_SCHED_SCANNING, &mphy->state))
 		goto out;
 
 	if (time_is_after_jiffies(dev->pm.last_activity + delta)) {
@@ -1473,8 +1475,10 @@ void mt7921_pm_power_save_work(struct work_struct *work)
 		goto out;
 	}
 
-	if (!mt7921_mcu_fw_pmctrl(dev))
+	if (!mt7921_mcu_fw_pmctrl(dev)) {
+		cancel_delayed_work_sync(&mphy->mac_work);
 		return;
+	}
 out:
 	queue_delayed_work(dev->mt76.wq, &dev->pm.ps_work, delta);
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
