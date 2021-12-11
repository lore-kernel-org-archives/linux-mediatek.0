Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805D8C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Dec 2021 16:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kq3Sp4B4N5exlvHBUTSxZGm0XH0+Iyz7FvWdIHRoHTQ=; b=LynUfL1doxeU8x
	jiFxe+GG9KzDzUpwYbSbvThsFYghyVsOsDaA8xefxekZ0Vyf4xvh4/xUMoVbXOAbayuwSgqq8v1Nn
	TW0m0Wxeq25GztLWC3fyuVKWG1XAef/N0YKPtulxv3r6DX7kFfrTuttacJz/vxFXL67b16LxGhPNX
	SPBZbO6zRz0S0GJjmAbdXBiElP3yu+lQMVlO6R7ndZmJ1VMqHgaRs5etRwJNfNglsLWukXqLCzi4p
	mFn9HNwhhCa2gkGR94cpVq0gDbsXEWc9E9ODIjvKLBgQIJenG39eh9CVU34G3uWLbrfMxN9M6FIOt
	OHflbRXaWhGWs40fdtGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mw5Hr-005FhR-TU; Sat, 11 Dec 2021 16:31:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mw5Hl-005Ffs-2y
 for linux-mediatek@lists.infradead.org; Sat, 11 Dec 2021 16:31:47 +0000
X-UUID: a1c77f1e49f44ca0b0f5ac5a1eb9e380-20211211
X-UUID: a1c77f1e49f44ca0b0f5ac5a1eb9e380-20211211
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1327403037; Sat, 11 Dec 2021 09:31:39 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Dec 2021 08:31:37 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sun, 12 Dec 2021 00:31:35 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 12 Dec 2021 00:31:35 +0800
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
Subject: [PATCH 2/2] mt76: mt7921s: fix suspend error with enlarging mcu
 timeout value
Date: Sun, 12 Dec 2021 00:31:30 +0800
Message-ID: <13f6e51cd22a8a18e8f14e1213c299805ce37e14.1639239996.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <87100999ebfd6e205e655a6355a3990ff89d3945.1639239996.git.objelf@gmail.com>
References: <87100999ebfd6e205e655a6355a3990ff89d3945.1639239996.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211211_083145_158238_CC1F34B0 
X-CRM114-Status: GOOD (  10.24  )
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

Fix the false positive suspend error that may occur on mt7921s
with enlarging mcu timeout value.

The reason why we have to enlarge mcu timeout from HZ / 3 to HZ is
we should consider the additional overhead caused by running
concurrently with btmtksdio (a MT7921 bluetooth SDIO driver) that
would compete for the same SDIO bus in process context to complete
the suspend procedure.

Fixes: 48fab5bbef40 ("mt76: mt7921: introduce mt7921s support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 1227d626e9d3..be87e134216b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -239,7 +239,7 @@ int mt7921_mcu_fill_message(struct mt76_dev *mdev, struct sk_buff *skb,
 	case MCU_UNI_CMD_HIF_CTRL:
 	case MCU_UNI_CMD_SUSPEND:
 	case MCU_UNI_CMD_OFFLOAD:
-		mdev->mcu.timeout = HZ / 3;
+		mdev->mcu.timeout = HZ;
 		break;
 	default:
 		mdev->mcu.timeout = 3 * HZ;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
