Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F379BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 21:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gacn3geDOXtRTWn0JP82P4hc9KlS0+YVKlDls3d+W64=; b=eKd3LlcIWyEk1r
	Fc/wgQaunKsRgwcsor3TgKOxomf9Pv1beOrpzL7MDIlx6fHw0Co9ljLv9XSH7/TPO5CEONRo+A5ET
	rn7JgTB6KphS+MjTggzNwYKgJzq/a/xNFTsjQGDU6X+WMi9Oi2Drsvn1ZAzKnGzvB2/vN5EbGoX8I
	Xj88PWpNttMBuPbrKBCno5xG9hvnkt5zozO2LBXnNDxTFG29FL9iKrJxrJrV0pRdIQVU9qDBFuvM1
	honHsorb6KkBbxFSdeFA+QTEGuzM7mL860T9UpVSPvucNQqkLFMjy3gE3FccbavseNh05nf08awsj
	CPM8zg59cUQgfvBWk3EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxbmZ-002nlI-Bk; Wed, 15 Dec 2021 21:25:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxbmV-002nkM-An
 for linux-mediatek@lists.infradead.org; Wed, 15 Dec 2021 21:25:50 +0000
X-UUID: 96552e0112e5484d88ea00b39cb50012-20211215
X-UUID: 96552e0112e5484d88ea00b39cb50012-20211215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1032508238; Wed, 15 Dec 2021 14:25:43 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Dec 2021 13:25:41 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Dec 2021 05:25:40 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 16 Dec 2021 05:25:40 +0800
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
Subject: [PATCH v2 2/4] mt76: mt7921: fix possible resume failure
Date: Thu, 16 Dec 2021 05:25:35 +0800
Message-ID: <0c6a784deb679d9eb113ea3d5a36716ad9166312.1639602937.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <9813aaab7c86fbbdd160a8c421696a09deb559d3.1639602937.git.objelf@gmail.com>
References: <9813aaab7c86fbbdd160a8c421696a09deb559d3.1639602937.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_132547_404010_F8222DFA 
X-CRM114-Status: GOOD (  12.60  )
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

Fix the possible resume failure due to mt76_connac_mcu_set_hif_suspend
timeout.

That is because clearing the flag pm->suspended too early opened up a race
window, where mt7921_poll_tx/rx scheduled a ps_work to put the device in
doze mode, that is unexpected for the device is being resumed from the
suspend state and would make the remaining MCU comamnds in resume handler
failed to execute.

Fixes: ffa1bf97425b ("mt76: mt7921: introduce PM support")
Co-developed-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: refine the error handling path
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 5635de3c80b1..1212b803b1c8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -315,7 +315,6 @@ static int mt7921_pci_resume(struct pci_dev *pdev)
 	struct mt76_connac_pm *pm = &dev->pm;
 	int i, err;
 
-	pm->suspended = false;
 	err = pci_set_power_state(pdev, PCI_D0);
 	if (err)
 		return err;
@@ -353,7 +352,13 @@ static int mt7921_pci_resume(struct pci_dev *pdev)
 	if (!pm->ds_enable)
 		mt76_connac_mcu_set_deep_sleep(&dev->mt76, false);
 
-	return mt76_connac_mcu_set_hif_suspend(mdev, false);
+	err = mt76_connac_mcu_set_hif_suspend(mdev, false);
+	if (err)
+		return err;
+
+	pm->suspended = false;
+
+	return err;
 }
 #endif /* CONFIG_PM */
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
