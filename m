Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95937C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Dec 2021 16:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X9dlIm72IE38qLMM0v3381HxR+4IFilCrl9TNJVWntk=; b=PfubIwPxeKAual
	x2jBE1o1WYY2SYZNadmb3Ne2qz6UIRLyLt3qrcjgj1VvhA5r2vLSy3/LIT3HeWzhZKxCMijX3333Z
	k0a4Wd2zgUYmG2xNjWaT0LNKF2Dw59YubwXYCaQiH2coEH8gSiY+QVCm6Ul4iEwSBs3VORqFiYz/B
	4Rc1hdWAGlgLnvQfm61BXjgYmi2WT9js+XEiycWMtuuggn1TYVV69TqfJaSNXkopGcShfPxdVr4oz
	Fk3MXeYJ6g8CmeUquWxEGXptrdTTO3biLuu8PFUokPhsxWcVPh8/cB9oyK9hoqRcab9EfP9aztwiE
	0vG+50684X4HjaH2y/qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mw5Hr-005Fh9-3K; Sat, 11 Dec 2021 16:31:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mw5Hl-005Ffv-CF
 for linux-mediatek@lists.infradead.org; Sat, 11 Dec 2021 16:31:47 +0000
X-UUID: 3ff19105ed1f42f4b2b9e2e34b7f2a8b-20211211
X-UUID: 3ff19105ed1f42f4b2b9e2e34b7f2a8b-20211211
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 599093534; Sat, 11 Dec 2021 09:31:36 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Dec 2021 08:31:34 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sun, 12 Dec 2021 00:31:32 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 12 Dec 2021 00:31:32 +0800
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
Subject: [PATCH 1/2] mt76: mt7921s: make pm->suspended usage consistent
Date: Sun, 12 Dec 2021 00:31:29 +0800
Message-ID: <87100999ebfd6e205e655a6355a3990ff89d3945.1639239996.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211211_083145_443145_3D8E4BAD 
X-CRM114-Status: UNSURE (   9.43  )
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

Update pm->suspended usage to be consistent with mt7921e driver.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/sdio.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
index 84be229a899d..44ee9369f6bf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
@@ -278,7 +278,6 @@ static int mt7921s_resume(struct device *__dev)
 	struct mt76_dev *mdev = &dev->mt76;
 	int err;
 
-	pm->suspended = false;
 	clear_bit(MT76_STATE_SUSPEND, &mdev->phy.state);
 
 	err = mt7921_mcu_drv_pmctrl(dev);
@@ -294,7 +293,11 @@ static int mt7921s_resume(struct device *__dev)
 	if (!pm->ds_enable)
 		mt76_connac_mcu_set_deep_sleep(mdev, false);
 
-	return mt76_connac_mcu_set_hif_suspend(mdev, false);
+	err = mt76_connac_mcu_set_hif_suspend(mdev, false);
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
