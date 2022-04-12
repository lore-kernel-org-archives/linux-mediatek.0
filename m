Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1231C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 09:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MuRFN6VRvUNH/+WBmd6B2Xxcip7fV6H6lItQrg+RMpM=; b=cCa3LpKn39ylIt
	RgunWQekH6x8KOo4IbTtklgOCnd4L8RpQ5qbePP6QP6of2XkPsOXoA/OmZYEYtofpUg4Whg3IYWRs
	1otuyQMbwwwmlw5HmHJZ6E33yw8jSSa45n8yFSny2mu/J8M412T7l2Gw1uX/dsu/bL0iM1Xq44Gel
	CEWQfhriLD1t6t3W8iebrNytCBK100FO09DFjnHumDJqoluUgjiEAPM8cGnuTeir1uSzfZEiJzDdx
	mziUtjsXXuVoFIW6w6lwMcXG8Edbc9DUTgidxTw+ZaVSIEIOKoTlLsqHC5QaB4dRVOhXFzQ4LLBw+
	TdTqDR5PikhRCxE7GxSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neCSz-00CmYa-CO; Tue, 12 Apr 2022 09:05:41 +0000
Received: from mxout012.mail.hostpoint.ch ([2a00:d70:0:e::312])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neCSj-00CmQ3-82; Tue, 12 Apr 2022 09:05:27 +0000
Received: from [10.0.2.44] (helo=asmtp014.mail.hostpoint.ch)
 by mxout012.mail.hostpoint.ch with esmtps (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95 (FreeBSD)) (envelope-from <dev@pschenker.ch>)
 id 1neCSD-000OOB-IK; Tue, 12 Apr 2022 11:04:53 +0200
Received: from 31-10-206-124.static.upc.ch ([31.10.206.124]
 helo=localhost.localdomain)
 by asmtp014.mail.hostpoint.ch with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95 (FreeBSD)) (envelope-from <dev@pschenker.ch>)
 id 1neCSD-000CGw-Ce; Tue, 12 Apr 2022 11:04:53 +0200
X-Authenticated-Sender-Id: dev@pschenker.ch
From: Philippe Schenker <dev@pschenker.ch>
To: linux-wireless@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>
Cc: linux@leemhuis.info, Philippe Schenker <dev@pschenker.ch>,
 "David S. Miller" <davem@davemloft.net>, Deren Wu <deren.wu@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, YN Chen <YN.Chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: [PATCH] Revert "mt76: mt7921: enable aspm by default"
Date: Tue, 12 Apr 2022 11:04:14 +0200
Message-Id: <20220412090415.17541-1-dev@pschenker.ch>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_020525_309919_7CD7DA5C 
X-CRM114-Status: UNSURE (   9.50  )
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

This reverts commit bf3747ae2e25dda6a9e6c464a717c66118c588c8.

This commit introduces a regression on some systems where the kernel is
crashing in different locations after a reboot was issued.

This issue was bisected on a Thinkpad P14s Gen2 (AMD) with latest firmware.

Link: https://lore.kernel.org/linux-wireless/5077a953487275837e81bdf1808ded00b9676f9f.camel@pschenker.ch/
Signed-off-by: Philippe Schenker <dev@pschenker.ch>
---

 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 1a01d025bbe5..59f9ee089389 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -20,10 +20,6 @@ static const struct pci_device_id mt7921_pci_device_table[] = {
 	{ },
 };
 
-static bool mt7921_disable_aspm;
-module_param_named(disable_aspm, mt7921_disable_aspm, bool, 0644);
-MODULE_PARM_DESC(disable_aspm, "disable PCI ASPM support");
-
 static void
 mt7921_rx_poll_complete(struct mt76_dev *mdev, enum mt76_rxq_id q)
 {
@@ -280,8 +276,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_free_pci_vec;
 
-	if (mt7921_disable_aspm)
-		mt76_pci_disable_aspm(pdev);
+	mt76_pci_disable_aspm(pdev);
 
 	mdev = mt76_alloc_device(&pdev->dev, sizeof(*dev), &mt7921_ops,
 				 &drv_ops);
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
