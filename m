Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6E1C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 20:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKyc0EEVpAOHwGQI9XZsb3G7/aMJBcZHBfRBc52XVIo=; b=vodyVxMJ497ZwmnGPCXrUnOIkZ
	arQ7SKALVhQg1da56jq+6qce+KVnkoMi3iDcMXqNAHD+tRAIwiSavGIPJqXhT8Zu4SywpFgIxk/HK
	8V+u/SnxBGeOkciqs7hrn4dkt+9D3YAqe4YQlcOQI4Z6dqQimCW8iChLjcfffB2Ib6agkbogZ0zmn
	ZJugT7G9qfgG8miSUpppsZWW+HHeKpt5hr+bQenrlBKVSitdEAOJ3/tE/7XbcE36X66Sp1d+AgfHl
	ipYU5Uz6xpqO8cGt0bx4kBloynUETJe6Fjk5r7THSgb5Tck6i1sUiMKG9gGsrnwuzAkZOLrhBFJoP
	nebxGFZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDXjp-0018qO-AH; Mon, 18 Jul 2022 20:53:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDXjl-0018RM-J1
	for linux-mediatek@lists.infradead.org; Mon, 18 Jul 2022 20:53:07 +0000
X-UUID: a216005d32be4bef8851dd00f3c85c0c-20220718
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:66b212c1-76a4-48c7-a2e0-888f379806b8,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:b24e9e64-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: a216005d32be4bef8851dd00f3c85c0c-20220718
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1398668478; Mon, 18 Jul 2022 13:52:55 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 19 Jul 2022 04:52:17 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 19 Jul 2022 04:52:17 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
	<jenhao.yang@mediatek.com>, <robin.chiu@mediatek.com>,
	<Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<ted.huang@mediatek.com>, <Stella.Chang@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
	<frankgor@google.com>, <kuabhs@google.com>, <druth@google.com>,
	<abhishekpandit@google.com>, <shawnku@google.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 3/3] mt76: mt7663s: fix the deadlock caused by sdio->stat_work
Date: Tue, 19 Jul 2022 04:52:15 +0800
Message-ID: <106a510630a27440b49170e9586f9dfbe831848e.1658176763.git.sean.wang@kernel.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <aa7d7ed8f3a817525ab8c7b736f1ce52490a835e.1658176763.git.sean.wang@kernel.org>
References: <aa7d7ed8f3a817525ab8c7b736f1ce52490a835e.1658176763.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_135305_654492_39B937D4 
X-CRM114-Status: GOOD (  12.24  )
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

From: Sean Wang <sean.wang@mediatek.com>

Because wake_work and sdio->stat_work share the same workqueue mt76->wq,
if sdio->stat_work cannot acquire the mutex lock such as that was possibly
held up by mt7615_mutex_acquire, we should exit immediately and schedule
another stat_work to avoid blocking the mt7615_mutex_acquire.

Also, if mt7615_mutex_acquire was called by sdio->stat_work self, the wake
would be blocked by itself, so we have to changing into an unblocking wake
(directly wakeup via mt7615_mcu_drv_pmctrl, not via the wake_work) in the
context.

Fixes: a66cbdd6573d ("mt76: mt7615: introduce mt7663s support")
Co-developed-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7615/usb_sdio.c  | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
index 0052d103e276..5991b23e0d13 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
@@ -157,10 +157,29 @@ bool mt7663_usb_sdio_tx_status_data(struct mt76_dev *mdev, u8 *update)
 {
 	struct mt7615_dev *dev = container_of(mdev, struct mt7615_dev, mt76);
 
-	mt7615_mutex_acquire(dev);
+	if (!mutex_trylock(&mdev->mutex)) {
+		/* Because wake_work and stat_work share the same workqueue
+		 * mt76->wq, if sdio->stat_work cannot acquire the mutex lock,
+		 * we should exit immediately and schedule another stat_work
+		 * to avoid blocking the wake_work.
+		 */
+		struct work_struct *stat_work;
+
+		stat_work = mt76_is_sdio(mdev) ? &mdev->sdio.stat_work :
+			    &mdev->usb.stat_work;
+		queue_work(dev->mt76.wq, stat_work);
+
+		goto out;
+	}
+
+	mt7615_mcu_set_drv_ctrl(dev);
+
 	mt7615_mac_sta_poll(dev);
-	mt7615_mutex_release(dev);
 
+	mt76_connac_power_save_sched(&mdev->phy, &dev->pm);
+	mutex_unlock(&mdev->mutex);
+
+out:
 	return false;
 }
 EXPORT_SYMBOL_GPL(mt7663_usb_sdio_tx_status_data);
-- 
2.25.1


