Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0734AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 23:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wAgA9aljaSVkWQtvO6bU1O4ylG0jXswBvZ9IdZFZ4Ow=; b=lPoNQyO5NTKVWT
	evr1kVScZFTWEoVy51EnZQxOcsmq47xR+0XMns7YhP7bnpdXoco61WR2/wdFfa7bGb7RonIK7vRic
	y2HmoQcuviuEVQO0HeJoYJH95+hEqJ64xLwfN6F6xW+RGf8utcnaOL82DQspACakXTqHJtgUMcRon
	IJXS8koAuRGkEjAMBCrN58+nih8Z+t1rCq7fNKeX0dzYRV33G0XhX5Z+qdMiTsfeQqhQROfHofghN
	2rPdREoHGa5O73Z0F6bMJlLWN5eo/BuPeo1iBtthqBqkjrp83XU405PBacA7LmQW/5y/4hE/+iwEE
	I+hbLsHhbQ6IkP22KQQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8WR9-00ATQg-CC; Fri, 14 Jan 2022 23:56:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8WR5-00ATOg-0m
 for linux-mediatek@lists.infradead.org; Fri, 14 Jan 2022 23:56:49 +0000
X-UUID: 9dbb297f94cb45ce9bdc2c2f453fc49a-20220114
X-UUID: 9dbb297f94cb45ce9bdc2c2f453fc49a-20220114
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 420635412; Fri, 14 Jan 2022 16:56:40 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Jan 2022 15:56:38 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 15 Jan 2022 07:56:36 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 15 Jan 2022 07:56:36 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Mark-YW.Chen@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <jenhao.yang@mediatek.com>,
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 2/2] mt76: mt7921s: run sleep mode by default
Date: Sat, 15 Jan 2022 07:56:33 +0800
Message-ID: <ddbc5499b76989c7d67fcbc31eb19ff535156dfa.1642204233.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <c09673a115c39f7af692efb984a5dc0c75238a64.1642204233.git.objelf@gmail.com>
References: <c09673a115c39f7af692efb984a5dc0c75238a64.1642204233.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_155647_098750_B8AE6812 
X-CRM114-Status: UNSURE (   9.69  )
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

From: Sean Wang <sean.wang@mediatek.com>

Apply sleep mode by default to reduce power consumption as possible.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v1 -> v2: rebase on the top of
	  ("mt76: mt7921: toggle runtime-pm adding a monitor vif")
---
 drivers/net/wireless/mediatek/mt76/mt7921/init.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 6059d8a0f227..fa6af85bba7b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -226,14 +226,10 @@ int mt7921_register_device(struct mt7921_dev *dev)
 	dev->pm.idle_timeout = MT7921_PM_TIMEOUT;
 	dev->pm.stats.last_wake_event = jiffies;
 	dev->pm.stats.last_doze_event = jiffies;
-
-	/* TODO: mt7921s run sleep mode on default  */
-	if (mt76_is_mmio(&dev->mt76)) {
-		dev->pm.enable_user = true;
-		dev->pm.enable = true;
-		dev->pm.ds_enable_user = true;
-		dev->pm.ds_enable = true;
-	}
+	dev->pm.enable_user = true;
+	dev->pm.enable = true;
+	dev->pm.ds_enable_user = true;
+	dev->pm.ds_enable = true;
 
 	if (mt76_is_sdio(&dev->mt76))
 		hw->extra_tx_headroom += MT_SDIO_TXD_SIZE + MT_SDIO_HDR_SIZE;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
