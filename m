Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148CAC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 07:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OcV/ri1cWk5AyRXC4uGMD6aG8SUiiwsIfB+VAY8/PR8=; b=kXLPHROo4xR4yi
	5ZWi+gyLHDYXV5egy+j9Q8VSG7K0Xp5ZHdx85Rg/0wph8rKcsQR8x94lCRFGulV0WPUczysL5Z5sr
	BQEZhs2cSXrdXo+QsoFZ05xdXw4oJeQGvi0gleVVPXuEhf8TebM0pGZMw2GMAUky7p3KQvrTzbKU4
	cQ8vq+p+DhtrG1hj2G8WwoHECw4379w1yaT8p4VFnYtR5IfPR9gbIExlgL9NpICCyi3mifZhr0jTk
	gwW0v5LTWMOUWOSV6yGsq3tg6CRcRQcQRnBFdlcafQ+qdnQwJ61Rxs11FxN28/LjIfSQ+AALckgbH
	aBUa8jmKGARZtph/C8Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7YGx-001Pgr-2T; Wed, 12 Jan 2022 07:42:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7YGu-001Pfv-9W
 for linux-mediatek@lists.infradead.org; Wed, 12 Jan 2022 07:42:17 +0000
X-UUID: 5de6e030c00248eabedb6b6297e5bb27-20220112
X-UUID: 5de6e030c00248eabedb6b6297e5bb27-20220112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 179596087; Wed, 12 Jan 2022 00:42:12 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Jan 2022 23:39:27 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 12 Jan 2022 15:39:26 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 12 Jan 2022 15:39:25 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <Mark-YW.Chen@mediatek.com>, <sean.wang@mediatek.com>,
 <Soul.Huang@mediatek.com>, <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <michaelfsun@google.com>,
 <mcchou@chromium.org>, <shawnku@google.com>,
 <linux-bluetooth@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/7] Bluetooth: btmtksdio: lower log level in
 btmtksdio_runtime_[resume|suspend]()
Date: Wed, 12 Jan 2022 15:39:15 +0800
Message-ID: <c355cd94eee37a15a17a0ad51e82def6c922cd89.1641972745.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <bddfacd096b6fe927d08e48ad6993c17c9954028.1641972745.git.objelf@gmail.com>
References: <bddfacd096b6fe927d08e48ad6993c17c9954028.1641972745.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_234216_380444_790F9CAE 
X-CRM114-Status: GOOD (  11.27  )
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

Lower its log level from INFO to DEBUG prior to we enable runtime pm for
mt7921s with the smaller idle time as default.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index b0aae4143037..3e8f19556e2c 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1253,7 +1253,7 @@ static int btmtksdio_runtime_suspend(struct device *dev)
 
 	err = btmtksdio_fw_pmctrl(bdev);
 
-	bt_dev_info(bdev->hdev, "status (%d) return ownership to device", err);
+	bt_dev_dbg(bdev->hdev, "status (%d) return ownership to device", err);
 
 	return err;
 }
@@ -1273,7 +1273,7 @@ static int btmtksdio_runtime_resume(struct device *dev)
 
 	err = btmtksdio_drv_pmctrl(bdev);
 
-	bt_dev_info(bdev->hdev, "status (%d) get ownership from device", err);
+	bt_dev_dbg(bdev->hdev, "status (%d) get ownership from device", err);
 
 	return err;
 }
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
