Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A09EC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 05:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P0loCbJaB6p0S+BZ8eTN8ukOrE5cY2tVdvnTr7C2FeA=; b=mWeR4kBIR01YIQ
	UZ+KUAyVOUNq05AFsSjtnWGlJbOtq+Sz3vzh/fjDqFZKwvYH8zvrlqkHRHhMib+2Bcf6/j5JBGlKl
	2WPC/9OmQjUbnSQyNvsHDTNLfpHgXDrKGQRs8RDbeS3qqfnbIsYN8zJz/AZlCnuuQxn/DqwGUNd2n
	kSj4E9svFtb+Ca/expyOHNl/FnKN+HR27yT3yFC2Y6tfwf50u/YXYYfOFFYCp0sDOzRRmA9JHI4JJ
	od+2bFoW+81BVeIX4ZOaPHmxxzZcFp6yNnxlfLNd0m9Owkkgu+C/vZtmE6iZiW7MPZDsBmBAzYX0N
	o/o0B19SmqAgDmFz1mDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzucN-009Hcq-I4; Wed, 22 Dec 2021 05:56:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzucJ-009HaP-HU
 for linux-mediatek@lists.infradead.org; Wed, 22 Dec 2021 05:56:50 +0000
X-UUID: aec95ac5bf674282afd8760fd19143a7-20211221
X-UUID: aec95ac5bf674282afd8760fd19143a7-20211221
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 80037411; Tue, 21 Dec 2021 22:56:44 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Dec 2021 21:56:43 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 22 Dec 2021 13:56:29 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 22 Dec 2021 13:56:28 +0800
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
Subject: [PATCH] mt76: sdio: lock sdio when it is needed
Date: Wed, 22 Dec 2021 13:56:28 +0800
Message-ID: <7aaf68bc8073c4f1cef063d1e0989e5402ac358c.1640151426.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_215647_633242_4E62D3D5 
X-CRM114-Status: GOOD (  13.19  )
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

Acquire the SDIO as needed as possible because either MT7663S or MT7921S
is a multiple-function device that always includes Bluetooth that would
share with the same SDIO bus. So not to avoid breaking Bluetooth pairing,
audio, and HID such kind of time critical application on that, we only
lock sdio bus when it is necessary in WiFi driver.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/sdio.c | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7921/sdio.c | 3 +++
 drivers/net/wireless/mediatek/mt76/sdio_txrx.c   | 8 ++++++++
 3 files changed, 14 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
index 31c4a76b7f91..71162befdae8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
@@ -56,7 +56,10 @@ static int mt7663s_parse_intr(struct mt76_dev *dev, struct mt76s_intr *intr)
 	struct mt7663s_intr *irq_data = sdio->intr_data;
 	int i, err;
 
+	sdio_claim_host(sdio->func);
 	err = sdio_readsb(sdio->func, irq_data, MCR_WHISR, sizeof(*irq_data));
+	sdio_release_host(sdio->func);
+
 	if (err)
 		return err;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
index 65d693902c22..743b63f66efa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
@@ -58,7 +58,10 @@ static int mt7921s_parse_intr(struct mt76_dev *dev, struct mt76s_intr *intr)
 	struct mt7921_sdio_intr *irq_data = sdio->intr_data;
 	int i, err;
 
+	sdio_claim_host(sdio->func);
 	err = sdio_readsb(sdio->func, irq_data, MCR_WHISR, sizeof(*irq_data));
+	sdio_release_host(sdio->func);
+
 	if (err < 0)
 		return err;
 
diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
index 801590a0a334..f2b46975d831 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
@@ -102,7 +102,10 @@ mt76s_rx_run_queue(struct mt76_dev *dev, enum mt76_rxq_id qid,
 
 	buf = page_address(page);
 
+	sdio_claim_host(sdio->func);
 	err = sdio_readsb(sdio->func, buf, MCR_WRDR(qid), len);
+	sdio_release_host(sdio->func);
+
 	if (err < 0) {
 		dev_err(dev->dev, "sdio read data failed:%d\n", err);
 		put_page(page);
@@ -214,7 +217,10 @@ static int __mt76s_xmit_queue(struct mt76_dev *dev, u8 *data, int len)
 	if (len > sdio->func->cur_blksize)
 		len = roundup(len, sdio->func->cur_blksize);
 
+	sdio_claim_host(sdio->func);
 	err = sdio_writesb(sdio->func, MCR_WTDR1, data, len);
+	sdio_release_host(sdio->func);
+
 	if (err)
 		dev_err(dev->dev, "sdio write failed: %d\n", err);
 
@@ -298,6 +304,7 @@ void mt76s_txrx_worker(struct mt76_sdio *sdio)
 	/* disable interrupt */
 	sdio_claim_host(sdio->func);
 	sdio_writel(sdio->func, WHLPCR_INT_EN_CLR, MCR_WHLPCR, NULL);
+	sdio_release_host(sdio->func);
 
 	do {
 		nframes = 0;
@@ -327,6 +334,7 @@ void mt76s_txrx_worker(struct mt76_sdio *sdio)
 	} while (nframes > 0);
 
 	/* enable interrupt */
+	sdio_claim_host(sdio->func);
 	sdio_writel(sdio->func, WHLPCR_INT_EN_SET, MCR_WHLPCR, NULL);
 	sdio_release_host(sdio->func);
 }
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
