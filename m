Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6711CC3271F
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 06:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XZ2w6rgUW63JWu5hiwpZZVRpDZ9Lbj5AyGKEHyG2EUk=; b=ThsLp+LpK5WRTp9sxJ9OHSkTM9
	xqc7+c3wRUrGoS7YcjDF8dTkXj+QUPed0Munu0H2si1eIzbqQkNk/1VcjGTCZUGiiSGKVtnfEjv7d
	tR+UZhBkeXJUfgSFyW8WXzNZI6dBKy3JVfa7DvwKyGepvicTHRmt4kghw8YoMNvl6ibrU3XGiroXt
	3qRnbhg/3Vy6/p1ybK0jRaAEliju0b3150ys+B5YUKAcm/aP7XcINKE+u+nwgVc1n1THMSwX//Fj9
	WeuQrs3b7t32R5TiceIB4zn2LoQQ8uSiCi1hMGHZXr4ks9PJTygAzAXQfZWA1Lf/mppT2xamCNKgd
	ajyupG5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPFXa-0000000CHS1-0Jek;
	Thu, 04 Jul 2024 06:01:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPFXX-0000000CHQw-2a4M
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Jul 2024 06:01:57 +0000
X-UUID: e9470d7c39ca11efb2966dae1f787272-20240703
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=XZ2w6rgUW63JWu5hiwpZZVRpDZ9Lbj5AyGKEHyG2EUk=;
	b=S5Clwi6aBiL8tcs4QEns+h/3yY/pMSWEkrH0M5JeHCQ8br2LiPVhNRmA4e1CD6/58I64NTcVylyAmful2cwtw9/n9iJX2/6/1tMpwATdIsiGJEpKDxNk1KEILi/Jd5emv25ecC2Z7FI2ZKTqPp8qbk7qgCWb4V8R88r6BfzPl90=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:640a25eb-473f-4b38-ba34-c931aedc93f4,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:ba885a6,CLOUDID:3264f0d4-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:1,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e9470d7c39ca11efb2966dae1f787272-20240703
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 716139844; Wed, 03 Jul 2024 23:01:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Jul 2024 23:01:18 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 4 Jul 2024 14:01:18 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v7 0/8] Bluetooth: btmtk: MediaTek ISO data transmission support
Date: Thu, 4 Jul 2024 14:01:08 +0800
Message-ID: <20240704060116.16600-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_230155_662481_95DC9712 
X-CRM114-Status: UNSURE (   9.07  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Since SIG has not yet clearly defined the specification for ISO data
transmission over USB, MediaTek has adopted a method of adding an
additional interrupt endpoint for ISO data transmission. This approach
differs from the current method used in the Bluetooth upstream driver,
which utilizes existing bulk endpoints. The interrupt endpoint provides
guaranteed bandwidth, sufficient maximum data length for ISO packets
and error checking.

Driver sets up ISO interface and endpoints in btusb_mtk_setup and clears
the setup in btusb_mtk_shutdown. These flow can't move to btmtk.c due to
btusb_driver is only defined in btusb.c when claiming/relaesing interface.
Once ISO interface is claimed, driver can use specific interrupt endpoint
to send and receive iso data. ISO packet anchor stops when driver
suspending and resubmit interrupt urb for ISO data when driver resuming.

---
Change from v6 to v7:
-Change MediaTek's specific suspend/resume function naming to
btmtk_usb_suspend/resume and add comment to explain the purpose of function.
---

Chris Lu (8):
  Bluetooth: btusb: mediatek: remove the unnecessary goto tag
  Bluetooth: btusb: mediatek: return error for failed reg access
  Bluetooth: btmtk: rename btmediatek_data
  Bluetooth: btusb: add callback function in btusb suspend/resume
  Bluetooth: btmtk: move btusb_mtk_hci_wmt_sync to btmtk.c
  Bluetooth: btmtk: move btusb_mtk_[setup, shutdown] to btmtk.c
  Bluetooth: btmtk: move btusb_recv_acl_mtk to btmtk.c
  Bluetooth: btusb: mediatek: add ISO data transmission functions

 drivers/bluetooth/btmtk.c     | 1067 ++++++++++++++++++++++++++++++++-
 drivers/bluetooth/btmtk.h     |   91 ++-
 drivers/bluetooth/btmtksdio.c |    1 +
 drivers/bluetooth/btmtkuart.c |    1 +
 drivers/bluetooth/btusb.c     |  751 +++--------------------
 5 files changed, 1227 insertions(+), 684 deletions(-)

-- 
2.18.0


