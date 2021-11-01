Return-Path: <SRS0=DXFh=PU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89AF4C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 02:02:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5597260F24
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 02:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5597260F24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W3FInt/1th1jIVqgGAySllDscvzt2cD4hjSB+K6cGv8=; b=NLJ6O3Mq+hPQtZ
	BKCkiuFKQR25t6t0zrW7mLpybmzwAXVgiPwv/wWnibuo46XtkgCfykqwfpA46wNNm7I3pzCDtztYA
	B+jiZ9OwOK1fvvM8One3TN6B9+nxnaP+RVRwOjZxVX9xx8QkERnoxOrSWxCpJNO/LK6Y75Kj9UPGf
	SfCLelrn7K8fxQ7wnBlkXojz71zf4s+ZKYXspeU1lsLDoiP+6OLxU+Oi74wHGP/x0FyYZPmS0bez+
	DIQuziGLVtOzywYoOrOENipAlEyuO1ga6dfZmCQsKC5wsHeM4VR3O5SOiadlcC81kQH7wbqYDnZAR
	iywR0/4j8lN4tX0Xxw6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhMe2-00F4WJ-NL; Mon, 01 Nov 2021 02:01:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhMdy-00F4Va-MW
 for linux-mediatek@lists.infradead.org; Mon, 01 Nov 2021 02:01:53 +0000
X-UUID: 5f3590ae7ee24d248642c01e7dae8d9f-20211031
X-UUID: 5f3590ae7ee24d248642c01e7dae8d9f-20211031
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chui-hao.chiu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 682491022; Sun, 31 Oct 2021 19:01:45 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 31 Oct 2021 19:01:43 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Nov 2021 10:01:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 1 Nov 2021 10:01:41 +0800
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
 <evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH] mt76: mt7615: fix possible deadlock while
 mt7615_register_ext_phy()
Date: Mon, 1 Nov 2021 10:01:13 +0800
Message-ID: <20211101020113.6199-1-chui-hao.chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211031_190150_760454_EA3488C8 
X-CRM114-Status: GOOD (  10.62  )
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

ieee80211_register_hw() is called with rtnl_lock held, and this could be
caused lockdep from a work item that's on a workqueue that is flushed
with the rtnl held.

Move mt7615_register_ext_phy() outside the init_work().

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
index a2465b49..87b4aa52 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
@@ -28,8 +28,6 @@ static void mt7615_pci_init_work(struct work_struct *work)
 		return;
 
 	mt7615_init_work(dev);
-	if (dev->dbdc_support)
-		mt7615_register_ext_phy(dev);
 }
 
 static int mt7615_init_hardware(struct mt7615_dev *dev)
@@ -160,6 +158,12 @@ int mt7615_register_device(struct mt7615_dev *dev)
 	mt7615_init_txpower(dev, &dev->mphy.sband_2g.sband);
 	mt7615_init_txpower(dev, &dev->mphy.sband_5g.sband);
 
+	if (dev->dbdc_support) {
+		ret = mt7615_register_ext_phy(dev);
+		if (ret)
+			return ret;
+	}
+
 	return mt7615_init_debugfs(dev);
 }
 
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
