Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E30EC43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 09:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/DbPEVJLeqWxXeZW+eO/pHHIYIquir08fIC3tmI1b7M=; b=y6dBhB+S/oKLh75XcHV7vHH5vL
	Rnmxxjq1U9kesW41fpJFEVtd5uVZ0NrBOKYD9GkSdRTSAMxsJYm9ReC5z9ptRe9rLTJ3z+Qf+VqKG
	FnHOObewiZcmIBNzrgovTDpImu9Zxc2j0qVMyd9qfTcsFBCs7TFojKqLf6mf28QhLQTHbQFWq68wN
	7iJ/Z3it3ckLqxfxQL0HLdbHss4m1v1q0PlMV4NPLVoQbUBH/C21V/PekRPrqOd1xblh+vpa4gJno
	7IFOc6Uo7LP10CR3zIqU9IouNI+zY+C4BKcrq0DjQBkDMGXWcCzSX+Z8qt+8ovPDfAwxFLVwl3IpR
	nsH/po1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUND-0000000GKkH-24CF;
	Tue, 30 Jun 2026 09:03:19 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUNA-0000000GKfr-0mcY
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 09:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1782810168;
	bh=/DbPEVJLeqWxXeZW+eO/pHHIYIquir08fIC3tmI1b7M=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=V3t2l2rSvEC8oCCgQ8qRin+jI2w+vTULqPNxGN86aMOD0F/siwmBNj8HKmaGTHB4W
	 0aVbNVDFjtmvBifotYwB7wZAxWggOZ6sODEfRYGQlKNHSFmIo/hJj1c38ZmP93IYil
	 37E5JRqsfURSf4x5UdzUkvs1JYQtxkfQJaZ5/jOs=
X-QQ-mid: esmtpsz10t1782810147t6bfd4277
X-QQ-Originating-IP: /V+MfEC+CGaw+MBecW7/C8hr9iS2fpHB2cqKH+c4jjw=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 Jun 2026 17:02:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12524413929417674271
EX-QQ-RecipientCnt: 10
From: Wentao Guan <guanwentao@uniontech.com>
To: lorenzo@kernel.org,
	sean.wang@mediatek.com,
	mingyen.hsieh@mediatek.com
Cc: quan.zhou@mediatek.com,
	nbd@nbd.name,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Wentao Guan <guanwentao@uniontech.com>,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mt76: mt7925: cancel pending mlo_pm_work
Date: Tue, 30 Jun 2026 17:02:18 +0800
Message-Id: <20260630090218.3202029-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OBlCTbN6oDZ0VdIAHy6dMxzAyHEqJJlB3e5dBwYIrhQNV0VcIkMvkzdY
	P+1joB5M1AhKbzSz1nZ+Hqlx22mhJqsaGOeqb5G4cWupbVIYMa34OVm/sKadi25HitACbZy
	4D3XfS/cGjMmZmm3ia+OS1DGQmsHuAjzu1LOUbE8Vo+kDyQDLdQppRFo9EfpH3ZhXQc45Ma
	BajW4RnmiZzE7gluKb5C7HzAK4HZMlF8AhUYquftthr3t4XZRr5ggwW+70knI/U4hXA0tg/
	NCdyqZdyJ7OCTJS86XgQ1oWYB0HNmkMG3GwfHNdAAq2bFuH78ugD+segjtjEbDBNnDgkqj4
	bNv2U8l3e5rswbymlCu+mDU7Bp7jZHoZWhu72eUfIn+FfOyDgkEVs1HvaAnbKduErHykLKS
	0ZR+P8xBFnaA3cCe9p2NdqqvTgh+86oxKvrZbw3os8a0gRZ6cLFYpWtY3tPDlz2PzpdaIpv
	Gbzrl4LOjN+/yxNNJ9431pngQAyRCOKedi3WslPnmQoKFXgFvBAReGKH2fbOPFg2VrWz0IC
	x/gAO4hkDmPny3Xkv8p5LHdGQoPWeRNkg1Zrt8ZxhMwQ0xT5GcNm/Atj8rPGkJAVv3r+5Tq
	Fbe/sCFzKGjP9Jx3d2wm5qERWMbKISgdjMbZ2z9/cqkbppIhcbKP9XD8ljNtgL1LWaIDavL
	DJRBdronBwgPtu8Gr3Stxh/0m3VVgmyQyqGOeNXaFdc1xBifLkK2gN7uKSSxS27D3bCh7Hg
	v66dU+Xy2VMC+WIlndMMGUOZCyvPkWu78TTmZkzKEtOF9U3MujAUJwN7RKqUbvNX7vXAHg0
	wKOhAUBFCaWqEigP0AYaWBQIU8t43dC4IgaC+wuK7SJCo85hoHKWdroio7Ku02pyUuLHDxr
	RuF0UsNlPmszDjXB6ORiKnDGvU0fF8P3FVDthV3mRLoa1CzoOv0FchIRmU++Cvv6hoQfXGc
	uKdHZ6IAMAZe3gj5sFHaATmU7A3Dep44xveUHwWO9ME3XgoJq523bJ3EuTNRc5XKM73GXJk
	o9/Vwe9e3MnZURkwGN32gFvGuX6AWAg/R6DYxotJ/g85icsRre/U5eE1zYoadGklAcyOojV
	g==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_020316_687940_2D77BD56 
X-CRM114-Status: GOOD (  10.05  )
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

If the device is reset, suspended or unregistered within that window,
the pending work can still run and access vif/bss data that may already
be freed, or send MCU commands while the firmware is not available.

Add cancel_delayed_work_sync(&dev->mlo_pm_work) in all relevant teardown
and suspend paths:

 - mt7925_mac_reset_work()        (chip reset recovery)
 - mt7925e_unregister_device()    (PCIe unbind)
 - mt7925_pci_suspend()           (PCIe bus suspend)
 - mt7925_suspend()               (mac80211 suspend)
 - mt7925u_suspend()              (USB bus / runtime suspend)

This ensures the work is stopped before the device state becomes
invalid.

Assisted-by: kimi-cli:kimi-k2.7 code
Assisted-by: atomcode:glm-5.2 #Reported-by

Fixes: 276a568832577 ("wifi: mt76: mt7925: update the power-saving flow")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c  | 1 +
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 1 +
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c  | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7925/usb.c  | 1 +
 4 files changed, 5 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index c47bd812b66b9..d56a846dec53e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1307,6 +1307,7 @@ void mt7925_mac_reset_work(struct work_struct *work)
 
 	cancel_delayed_work_sync(&dev->mphy.mac_work);
 	cancel_delayed_work_sync(&pm->ps_work);
+	cancel_delayed_work_sync(&dev->mlo_pm_work);
 	cancel_work_sync(&pm->wake_work);
 
 	for (i = 0; i < 10; i++) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 73d3722739d0a..ab6c6565ca0f7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1602,6 +1602,7 @@ static int mt7925_suspend(struct ieee80211_hw *hw,
 	cancel_delayed_work_sync(&phy->mt76->mac_work);
 
 	cancel_delayed_work_sync(&dev->pm.ps_work);
+	cancel_delayed_work_sync(&dev->mlo_pm_work);
 	mt76_connac_free_pending_tx_skbs(&dev->pm, NULL);
 
 	mt792x_mutex_acquire(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index c4161754c01df..cfa91af065b78 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -42,6 +42,7 @@ static void mt7925e_unregister_device(struct mt792x_dev *dev)
 	mt76_for_each_q_rx(&dev->mt76, i)
 		napi_disable(&dev->mt76.napi[i]);
 	cancel_delayed_work_sync(&pm->ps_work);
+	cancel_delayed_work_sync(&dev->mlo_pm_work);
 	cancel_work_sync(&pm->wake_work);
 	cancel_work_sync(&dev->reset_work);
 
@@ -453,6 +454,7 @@ static int mt7925_pci_suspend(struct device *device)
 	dev->hif_resumed = false;
 	flush_work(&dev->reset_work);
 	cancel_delayed_work_sync(&pm->ps_work);
+	cancel_delayed_work_sync(&dev->mlo_pm_work);
 	cancel_work_sync(&pm->wake_work);
 
 	mt7925_roc_abort_sync(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
index d9968f03856d8..7ba50c33cd32c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
@@ -251,6 +251,7 @@ static int mt7925u_suspend(struct usb_interface *intf, pm_message_t state)
 	pm->suspended = true;
 	dev->hif_resumed = false;
 	flush_work(&dev->reset_work);
+	cancel_delayed_work_sync(&dev->mlo_pm_work);
 
 	mt76_connac_mcu_set_hif_suspend(&dev->mt76, true, false);
 	ret = wait_event_timeout(dev->wait,
-- 
2.30.2


