Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABB9C3ABB2
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Sep 2024 11:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=38IMJE5WIH2ScTHkA+IUKdspIObV4usS2GG6oZTIqTY=; b=CLT9Ro5yhXTPKkyuiTy+SM9lrL
	YdIHY7GKxfgKzyAy5H44SnEoW88GAqQjwJBdScWryzQtoPKGYrZzpfEsAmslpstWOx3Trj5LWTlGn
	4NpAdDAMvvhNPurOxriH9GUe3c8caX4n3HUricdwjU0gmmQuKAb2vaYBaQ3aSEt1BsKdfvDYSWvNN
	dG0CqROGc7VdeCv45vgTzwXqTg1bvNwKfEVttIUEPvmZWDd8S8eLWQOhQHJnHaktJ3j/Ev8rfOPyz
	+b/OprBMRsHwxZVq3HVg5IHtq36nWrxrI65JkUEgLEAtNUdpZ94w7H178QbjTgApk350RKPxMThkL
	52y1KVSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqA5B-00000003tYV-0sQd;
	Mon, 16 Sep 2024 11:39:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqA58-00000003tXr-33nC
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Sep 2024 11:39:52 +0000
X-UUID: 5e5e10c6742011efb3adad29d29602c1-20240916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=38IMJE5WIH2ScTHkA+IUKdspIObV4usS2GG6oZTIqTY=;
	b=jhxDCcUQfj8x1AKi4hfzAODBlr8VP2hVuJ/6phat2W4ZkOQMQ5eYNpqQrTUULMLD3K8f55nmec3VfvdqAKHuRbhtl82MumcyCuOQag8bP966h52AMdMXNZoXyaSObwlv0AHBA2MkiedNQlzAG/hNpubbeqWga7anHYDOO//1h9g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:21296158-1ec0-45a7-b8d5-1d4e861780ea,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:f2fa48d0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5e5e10c6742011efb3adad29d29602c1-20240916
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2117794428; Mon, 16 Sep 2024 04:39:44 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 16 Sep 2024 19:39:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 16 Sep 2024 19:39:41 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH 0/4] Bluetooth: btusb: Mediatek ISO interface cliam/release adjustment
Date: Mon, 16 Sep 2024 19:39:34 +0800
Message-ID: <20240916113938.30285-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_043950_800953_037196FC 
X-CRM114-Status: UNSURE (   7.76  )
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

MediaTek performs some test on the platform which can support LE audio and
ISO data transmission with kernel driver. We found the additional interface
claim and release flow issue need some adjustment.

These patches mainly add a callback function within the usb_disconnect function
to prevent a kernel panic caused by interfaces not being released when the BT USB
dongle is physically removed. Additionally, the condition for claiming/releasing
ISO usb interface have also been adjusted to make driver works as expected.

Chris Lu (4):
  Bluetooth: btusb: mediatek: move Bluetooth power off in
    btusb_mtk_shutdown
  Bluetooth: btusb: add callback function in btusb_disconnect
  Bluetooth: btusb: mediatek: add intf release flow in usb disconnect
  Bluetooth: btusb: mediatek: change the conditions for
    claiming/releasing iso interface

 drivers/bluetooth/btusb.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

-- 
2.18.0


