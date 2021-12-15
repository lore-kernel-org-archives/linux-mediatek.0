Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F6AC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 21:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVN6XR8g94EHqhxBifQgywc2Irx4HOY0zvYySGK97zY=; b=LhglkBk9FJPa6e
	Q8Los13VNK6Kc7EFEVXL24sYXRTYeR0ffq210l1NQn+/4MTaxivjOJVEynFFYGMruJ7ZnWwqo3CjZ
	9GabkI795SBF0Kbzh5iQjJsDRP1idhyWYc0lIkO/DUdABkXkdVt3770+wqcdEsQ47XbSRzCVkn72L
	dpIx4pcbpTEgUHHQB9vhI2l0r/9wQMXGNDUiZG8o42EXVKHEaY//a1RAv75qILf8u85tiIuKJWvif
	GjHFxkoX9zcQ6UCkFizP2BXwoqnm4E3jpSyWf3qxmHYz6LFNp/3TVqpMPLSr3Etih8xKs1mYVs/uI
	AHcqGsTt8DSZzgAWlX0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxbmd-002nln-6O; Wed, 15 Dec 2021 21:25:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxbmZ-002nkf-4o
 for linux-mediatek@lists.infradead.org; Wed, 15 Dec 2021 21:25:54 +0000
X-UUID: 2dc52d01338a43d3a1110528e9ed9f98-20211215
X-UUID: 2dc52d01338a43d3a1110528e9ed9f98-20211215
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 150495091; Wed, 15 Dec 2021 14:25:45 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Dec 2021 13:25:42 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Dec 2021 05:25:41 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 16 Dec 2021 05:25:41 +0800
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
Subject: [PATCH v2 3/4] mt76: mt7921s: make pm->suspended usage consistent
Date: Thu, 16 Dec 2021 05:25:36 +0800
Message-ID: <57d752fc7ee5af393e2856d25ed701ce8fd01aed.1639602937.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <9813aaab7c86fbbdd160a8c421696a09deb559d3.1639602937.git.objelf@gmail.com>
References: <9813aaab7c86fbbdd160a8c421696a09deb559d3.1639602937.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_132551_231219_04547BA4 
X-CRM114-Status: GOOD (  10.37  )
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

Update pm->suspended usage to be consistent with mt7921e driver.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: refine the error handling path
---
 drivers/net/wireless/mediatek/mt76/mt7921/sdio.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
index 84be229a899d..65d693902c22 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
@@ -278,7 +278,6 @@ static int mt7921s_resume(struct device *__dev)
 	struct mt76_dev *mdev = &dev->mt76;
 	int err;
 
-	pm->suspended = false;
 	clear_bit(MT76_STATE_SUSPEND, &mdev->phy.state);
 
 	err = mt7921_mcu_drv_pmctrl(dev);
@@ -294,7 +293,13 @@ static int mt7921s_resume(struct device *__dev)
 	if (!pm->ds_enable)
 		mt76_connac_mcu_set_deep_sleep(mdev, false);
 
-	return mt76_connac_mcu_set_hif_suspend(mdev, false);
+	err = mt76_connac_mcu_set_hif_suspend(mdev, false);
+	if (err)
+		return err;
+
+	pm->suspended = false;
+
+	return err;
 }
 
 static const struct dev_pm_ops mt7921s_pm_ops = {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
