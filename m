Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262ABC25B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 03:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K7lqLTLsGSV7DHnyTmq6v65NX0/0mNc9+lxlhGDwmvI=; b=FoLGGDD13ECrQLj+9r1ryTdA9R
	cgWK8Iqj/U7FzoHNJYa/7WkKaeAYszeZT37t69V6T+QIYwwWIbhc9QNM7t95jUoR278zBMBmq7Xrb
	ognuXSaRUhuQeb2eTvTCMBzKcK1kn1RErp9ssL6neC3xvFH2Y/kGCtx24f2y99iqlaT5v3tCRCAKD
	AaovIJO61l+ripyvIH5d7zU7SrR+2+IxoPb8qQ6A3Q5dWs7L+DwQXIHIO4ct0hSsQbZ4v16hRP/gk
	JGV60uB6xi+z6QXPQK554RUbzk5hylYlNBQFEpQ2Z4HIEFOg3zZyUNOiwVocJEwpbIfxYnA3qiFBr
	r1YwRP5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCA27-00000002hUm-3KGG;
	Wed, 29 May 2024 03:31:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCA24-00000002hU4-3oMf
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 03:31:22 +0000
X-UUID: e7fdc6fc1d6b11efbf6c7d4f5c147266-20240528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=K7lqLTLsGSV7DHnyTmq6v65NX0/0mNc9+lxlhGDwmvI=;
	b=hBnK7hz3Ei5k448cdIr1zIwLmnJLwVZxJPg1hqzzTRgdNvaBkW2BG4vbvUiI9hgtrlmI1woPig3oFC9ZXKiNiqsMk10M5jtEXFJhEqFMuFdrWkBsEe7ZG19xafPuH3veFr8Dx9fcRkMXpbxbNmqjxqkCmFJWfvhphPNcN6+75+g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:186054c1-39a7-4fbd-88e9-adab58ace1f2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:e65a7184-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e7fdc6fc1d6b11efbf6c7d4f5c147266-20240528
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1622078004; Tue, 28 May 2024 20:31:16 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 29 May 2024 11:30:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 29 May 2024 11:30:40 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH 0/3] Bluetooth: btusb: MediaTek ISO data transmission support
Date: Wed, 29 May 2024 11:30:35 +0800
Message-ID: <20240529033038.28458-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_203120_954776_F8F97570 
X-CRM114-Status: UNSURE (   8.25  )
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

Since SIG hasn't clearly defined the specification about ISO data over USB 
transmission yet, MediaTek adopts a method by adding an additional interrupt
endpoint for ISO data transmission which is different from current way
on Bluetooth upstream driver using existed bulk. Interrupt endpoint has
guaranteed bandwidth, sufficient max data length for LE audio packet and
support error checking. These characteristics are similar to the use of ISO data.

Chris Lu (3):
  Bluetooth: net: add hci_iso_hdr function for iso data
  Bluetooth: btmtk: add macro to get/set/clear MediaTek defined flags
  Bluetooth: btusb: mediatek: add MediaTek ISO data transmission
    function

 drivers/bluetooth/btmtk.c   |  35 +++++
 drivers/bluetooth/btmtk.h   |  46 ++++++
 drivers/bluetooth/btusb.c   | 293 +++++++++++++++++++++++++++++++++++-
 include/net/bluetooth/hci.h |   5 +
 4 files changed, 378 insertions(+), 1 deletion(-)

-- 
2.18.0


