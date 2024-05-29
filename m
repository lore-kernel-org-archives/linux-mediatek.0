Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E4DC25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 06:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hcavv1HUZOV2kpbFyPSmjWELv5BZ8Lp1wgJMCPBS5Og=; b=vauYxSoTeUJ097ks2jHKkV9N3x
	TE4aSH/1IvZND/JS/gYtllZDmvPOdv8tMNWF8XDnGgZ5iVdTf9s7WmJWCx514GnKajRoRTYKBs7SX
	NxTgYzp2lc8mzLUQ5sLoObT7bN9aZYAhPDIcL6kIrLEHGDdCBJuBq5jltUePg/+1s+JMYT+j5nhsL
	wr4vXkxxo/Fo9dpZyYx/kOPT4jjDuMxqcdCOLfY0JdFCvM3a16iySd4c+y8/+boYOrHkDnRxZ8QUf
	BllO0Vqf0+CEL6ImUJstmT4Y1MB98JSbrYwbn6/Uva0P4ljNXorXWTVNXHDmqWhda2/2PZBzL57FU
	hxxsxJgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCCp1-000000030qZ-1fHa;
	Wed, 29 May 2024 06:30:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCCou-000000030nI-3zFE
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 06:29:58 +0000
X-UUID: db55c26a1d8411efbf6c7d4f5c147266-20240528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=hcavv1HUZOV2kpbFyPSmjWELv5BZ8Lp1wgJMCPBS5Og=;
	b=lIyriiu/9avvEGCB6E6Dg6Va18+yOVhK2mwdcFbipSrmLlcDs+34aSROWc/DsUBP+mC2CPiXtQvn/FCxuzKoGD4rp5TcyZCSs9dutw2/Qnlu0biOz9zGEr6y50MGsJbkaSiiX4aC/IosqBDHlewclfePlJgne3fOge2IMKH4Fbw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:7b3a13d7-538b-4693-96ed-a7ef23602344,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:b3487384-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: db55c26a1d8411efbf6c7d4f5c147266-20240528
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1119128997; Tue, 28 May 2024 23:29:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 29 May 2024 14:29:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 29 May 2024 14:29:48 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v2 0/3] Bluetooth: btusb: MediaTek ISO data transmission support
Date: Wed, 29 May 2024 14:29:43 +0800
Message-ID: <20240529062946.5655-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.018000-8.000000
X-TMASE-MatchedRID: nzUT9qf9ruiopRmPeyAwLqMVgdN9w+TCjzwigoyOACRV1D0dmUzw/HBy
	D++CQ+qklGAD91lyLGe/W5EIysmFeG8f0ErdfVpsMJoQm3jo+mmENvZav9mwIXv3ioAd9KrS9Gb
	SSaq0f4NlEs7ay6jM0o8X8tv4W+1B5JVxYapKMGCWLCkl1lq7BytovaaHxlUrukphpDG2sc6jxY
	yRBa/qJcFwgTvxipFa9xS3mVzWUuCMx6OO8+QGviNDRblz//Syvq6Lo4Zo2hOKkyNgFcVMNKEq1
	CRF2XMzaQKqTUL7aor3Tv2Rn9W+/Xl2LFQeBovDI9tLypyWnhcSx1TcvNihU3mVKZusLp922v9O
	jYWA2uMMswg45VMfPadst5iAforfVlxr1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.018000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2CE555D1B8F43AB53DD8199D70524341E05A4676D3B9DB65AC2F429F4B069C272000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_232957_018655_CA213033 
X-CRM114-Status: UNSURE (   8.57  )
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

---
Change in v2:
-Fix warning report from bluez.test.bot in btusb.c, align with other
packet type to parsing dlen when getting iso data.
---
Chris Lu (3):
  Bluetooth: net: add hci_iso_hdr function for iso data
  Bluetooth: btmtk: add macro to get/set/clear MediaTek defined flags
  Bluetooth: btusb: mediatek: add MediaTek ISO data transmission
    function

 drivers/bluetooth/btmtk.c   |  35 +++++
 drivers/bluetooth/btmtk.h   |  46 ++++++
 drivers/bluetooth/btusb.c   | 295 +++++++++++++++++++++++++++++++++++-
 include/net/bluetooth/hci.h |   5 +
 4 files changed, 380 insertions(+), 1 deletion(-)

-- 
2.18.0


