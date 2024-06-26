Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C472C3064D
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 02:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xrJjjex+pryUYcuqmpL7n9xnY0OIkC6OfRPDoOD75a4=; b=zPjFWleYpWN/9g5YQ1VrEo2fGr
	hf2aZUWEvaomZsMavmugh9o9bZ+UjmrQDWf7o+zL86qalj/5Q1k2XTTpBC1B4HDj0hfWKzIRvQqzb
	DMv67iBKOHEtDJB0mlo0NCOfV3ZBMk0Joi/Uhc6yDZ2jLxQ71UJswTgpC/hdTtJkgrMbs7DYCHNF/
	CGEP8xPupyXHrCmonqLFH9fNNmzcJYT6ygSgdXCy7RCLHVhGdKG7leXK8evSQyUTFM77Wanq69V1D
	X8ZPhcbbuhypRx6JMHjQTMjVtvhJpHh4cqaYEm11QAZ1LYv5j6xgdI8PfBlvB57jWXDZKILDPDEa0
	BDqglc+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMIn6-000000059l7-1WRx;
	Wed, 26 Jun 2024 02:53:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMIn3-000000059jn-1566
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jun 2024 02:53:46 +0000
X-UUID: 4a7ffabe336711ef9daba96ee3f3cc8c-20240625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=xrJjjex+pryUYcuqmpL7n9xnY0OIkC6OfRPDoOD75a4=;
	b=on4FJmcAK8UfFLr4Z0OySR1g8mrTgXm4bX66B5jNtbBbkWfSc0NeBAJN8CuJ27dRp4f5RkAWeQiDn+B8v7bVh/kwbQ88nVoCMiAgTX0ASyjk8t0F8J18F5f/jVwwPxNsjShLSYraUr6X0SUe0/GQPL+t7UjSkllFg2TBY7hixc4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:43eb535e-101e-4a75-945c-e67f6571756b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:f9e90645-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4a7ffabe336711ef9daba96ee3f3cc8c-20240625
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 878937202; Tue, 25 Jun 2024 19:53:39 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 26 Jun 2024 10:53:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 26 Jun 2024 10:53:36 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v5 0/8] Bluetooth: btmtk: MediaTek ISO data transmission support
Date: Wed, 26 Jun 2024 10:53:21 +0800
Message-ID: <20240626025329.26424-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.948900-8.000000
X-TMASE-MatchedRID: cjXKuyuuhFvaYQdwXEMf70j2sPWKvtn0DRi0jfY6gL1oNGY/OdYkWWAI
	1go6d1sNmMN+S0FpW+8dHzBmTYIGm/Iejw19Z0aTQpxiLlDD9FUTdZ2aR9/IIMA5YKm8dwM65iW
	++W4offuhgX3ZJWxx+ebscccSLJTlMkaIaLbJ6ufISPeZE8elXnN3sLsG0mhuR2YNIFh+clGdvq
	NEU7XXSK9TdAKl5NW53/0OX7sbFJq2ILqdj6sZoJciNJzaqUX1ftnnpG0AB3WdohxAwFG9tKPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8Kre1QnRQ5v628yJPOovzJLNdhUoDdzioa4qH4ldHLhRgbcGLq
	LRUkZt5DDKa3G4nrLQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.948900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 15C7CBCC36B7D4F50908B845C25BFD85F7EA021A19AF33C3DB8295A3D7DA76782000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_195345_337392_4596A1D5 
X-CRM114-Status: UNSURE (   8.96  )
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
Change v5:
-Add two patch MediaTek submit previusly
-Remove v4,1/4 & v4,3/4 , becasue it's not necessary
-Add patch to move most function from btusb.c to btmtk.c to make btusb.c more simple
-refactor MediaTek ISO transmission function and implement in btmtk.c

---

Chris Lu (8):
  Bluetooth: btusb: mediatek: remove the unnecessary goto tag
  Bluetooth: btusb: mediatek: return error code for failed register access
  Bluetooth: btmtk: rename btmediatek_data
  Bluetooth: btusb: add callback function in btusb suspend/resume
  Bluetooth: btmtk: move btusb_mtk_hci_wmt_sync to btmtk.c
  Bluetooth: btmtk: move btusb_mtk_[setup, shutdown] to btmtk.c
  Bluetooth: btmtk: move btusb_recv_acl_mtk to btmtk.c
  Bluetooth: btusb: mediatek: add ISO data transmission functions

 drivers/bluetooth/btmtk.c | 1058 ++++++++++++++++++++++++++++++++++++-
 drivers/bluetooth/btmtk.h |   93 +++-
 drivers/bluetooth/btusb.c |  751 +++-----------------------
 3 files changed, 1218 insertions(+), 684 deletions(-)

-- 
2.18.0


