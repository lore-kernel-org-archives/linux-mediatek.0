Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674F4C27C54
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 12:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L3Crh55HpJgMsbpemIUlyV71/GIWueUo5x4/xsk0kZ0=; b=1afGLbHcMherJk0MqHeGi6Kep8
	Ka8S+UA8144/T4oSdmTKwqip3hDScS0bjxDrYIeoYq9w9pUnkyoYzMc91Rs3P/pe9JJTFgUl2gUxq
	ePCrcTnDUl61xaGpCzBAPgg6VFOkAFvB5IJPHKpXJJwFNniGzukDEvtm/ILkKdwX+OXNheQb+y8um
	42PLQCkfibULJt3FIP3SJtL9bSqs1kQte1bZqla1DDh/R5pZmj2cHhJ1KKk9NGmpU0xA54XcR2oUO
	OIBPiUbMf56GdxqA4E3zMo/ZG7pe/np2/dcKZvJ6Gw7OorE9kamKFj8/VWr869w2VqHYfRfRfWo1H
	6JFxJefA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFBqD-00000009cUC-33ct;
	Thu, 06 Jun 2024 12:03:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFBqA-00000009cTN-1fpZ
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Jun 2024 12:03:35 +0000
X-UUID: ca81367623fc11efaf04eb0598667787-20240606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=L3Crh55HpJgMsbpemIUlyV71/GIWueUo5x4/xsk0kZ0=;
	b=MS2T/TYUhNm6B6Trl9jyDu5vEI5d7XdLuhrrhg/3byPDFFnLSb8L02I86qbV57tBGUN3bgWch3W5cr2fQfWwq28smOw4gnU78aQxMPNIKbwIMEpfVn/VOuB6MCnTUOezZ4K4Mkt/cc8d71jRerADoEgIN4PjeVORv68v2CTTK5k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:4a7fbd42-6a28-4cb3-aefa-e65571c7b97f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:c51e4b88-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ca81367623fc11efaf04eb0598667787-20240606
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 430160389; Thu, 06 Jun 2024 05:03:30 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 6 Jun 2024 19:43:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 6 Jun 2024 19:43:25 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v4 0/4] Bluetooth: btusb: MediaTek ISO data transmission
Date: Thu, 6 Jun 2024 19:43:17 +0800
Message-ID: <20240606114321.30515-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.764200-8.000000
X-TMASE-MatchedRID: cjXKuyuuhFvaYQdwXEMf70j2sPWKvtn0DRi0jfY6gL1oNGY/OdYkWWAI
	1go6d1sNmMN+S0FpW+8dHzBmTYIGm/Iejw19Z0aTuIwLnB3Aqp1A8I/PJy4EU70rWM4nIpJrqbD
	mzbecxFu6ecT5yQFR4KKT+xko6AZvfDPEC/yQgPRDmVmiQbM5qlrhZu06i+HhgrAXgr/AjP3jgE
	Ok7iIqjBT6+KIPEGWdHFxA3IUbfplu/4kI/vPqmG095hplj6TXNACnndLvXwedohxAwFG9tKPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8Krfnm12b+L5a/urQJ9XZkSaeEFtG8SsxZdpqpmNAT74h6d/b6
	R7yBaPhDDKa3G4nrLQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.764200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4B0F7AB31589667B9A4E6B797403A6C4246EF00A638FC613BF15D88E693767FF2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_050334_450369_B60BF2AA 
X-CRM114-Status: UNSURE (   6.71  )
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

Certain new functions related to USB transportation, such as urb
allocation and submission, are implemented in btusb.c to leverage
existing functions and data structures defined therein. Meanwhile,
vendor-specific functions unrelated to transportation have been moved
to btmtk.c to streamline btusb.c.

---
Change in v4:
-Fix warning report from bluez.test.bot in btmtk.c.

Change in v3:
-Refactor ISO data transmission flow, keeping the parts related to USB
transmission in btusb.c and moving the rest to btmtk.c

Change in v2:
-Fix warning report from bluez.test.bot in btusb.c, align with other
packet type to parsing dlen when getting iso data.
---

Chris Lu (4):
  Bluetooth: net: add hci_iso_hdr function for iso data
  Bluetooth: btusb: add callback function in btusb suspend/resume
  Bluetooth: btmtk: add macro to get/set/clear MediaTek defined flags
  Bluetooth: btusb: mediatek: add ISO data transmission functions

 drivers/bluetooth/btmtk.c   |  94 ++++++++++++
 drivers/bluetooth/btmtk.h   |  61 ++++++++
 drivers/bluetooth/btusb.c   | 276 ++++++++++++++++++++++++++++++++++++
 include/net/bluetooth/hci.h |   5 +
 4 files changed, 436 insertions(+)

-- 
2.18.0


