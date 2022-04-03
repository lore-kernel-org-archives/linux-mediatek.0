Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B6AC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Apr 2022 15:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9hj5WdAGbX7eu+vur670pm1S5xcXEIosG9JSVZCfPW8=; b=KjS/p//E3THqpo
	Ryp0FBpwnD1lhtsge+QvVz7tthn4pzE3Bf4UcQxYS/RYTqy6lP9KLkR0+tD4wj++5nSaBrArXYPW4
	PGRbrwOlPFNkWRIOEVlXtA3/ixG1G8MNNC6lpSDxn+Jflw/RfFq2EB0cpNYT1gGGZ/CzcwoRpRbgD
	7j7+szWvdEref7UP/+zusDut8Ic4ijN1/N8AasvYc8P+ocLmQDREVIRH/XCOlYHJvXRd+hcM+fDW8
	fHC86GkaXBZFkFrN/qG0h+UEKfyYGCGIWKpEolNfScEwUxxadnJF9L4WK0GkVNr0Dmpl4qgdVwcF5
	SIcMJQGo+q7f9o+WV4Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nb2LP-00BjVt-4I; Sun, 03 Apr 2022 15:40:47 +0000
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nb2LK-00BjS2-VC
 for linux-mediatek@lists.infradead.org; Sun, 03 Apr 2022 15:40:45 +0000
Received: from pop-os.home ([90.126.236.122]) by smtp.orange.fr with ESMTPA
 id b2LBnqhuvxsSgb2LCnvlQt; Sun, 03 Apr 2022 17:40:38 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 03 Apr 2022 17:40:38 +0200
X-ME-IP: 90.126.236.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Deren Wu <deren.wu@mediatek.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] mt76: mt7921: Fix the error handling path of
 mt7921_pci_probe()
Date: Sun,  3 Apr 2022 17:40:33 +0200
Message-Id: <ca5003e9c6fd2293d7a14ec693e15cc3d6e849a6.1649000427.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_084043_197046_DC83D465 
X-CRM114-Status: GOOD (  12.48  )
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

In case of error, some resources must be freed, as already done above and
below the devm_kmemdup() and __mt7921e_mcu_drv_pmctrl() calls added in the
commit in Fixes:.

Fixes: 602cc0c9618a ("mt76: mt7921e: fix possible probe failure after reboot")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This is more or less a blind fix.
Review with care.
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 1a01d025bbe5..062e2b422478 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -302,8 +302,10 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	dev->bus_ops = dev->mt76.bus;
 	bus_ops = devm_kmemdup(dev->mt76.dev, dev->bus_ops, sizeof(*bus_ops),
 			       GFP_KERNEL);
-	if (!bus_ops)
-		return -ENOMEM;
+	if (!bus_ops) {
+		ret = -ENOMEM;
+		goto err_free_dev;
+	}
 
 	bus_ops->rr = mt7921_rr;
 	bus_ops->wr = mt7921_wr;
@@ -312,7 +314,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 
 	ret = __mt7921e_mcu_drv_pmctrl(dev);
 	if (ret)
-		return ret;
+		goto err_free_dev;
 
 	mdev->rev = (mt7921_l1_rr(dev, MT_HW_CHIPID) << 16) |
 		    (mt7921_l1_rr(dev, MT_HW_REV) & 0xff);
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
