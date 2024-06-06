Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59398C25B75
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 09:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XQ9ak821eXByMY+QdSWsGgzwxrORtfb3fHozOaAo82o=; b=l4GyQXWojqJc0ux0jIsA1yiQAW
	9jryZlUB9GVURzS9QD5lum822Ox5QREIjfyi5Ll6xETevavQmpqXaLMyUrtOfR3Zfm8mAnORWGB/0
	BRt/KMjR5Tz2AdwPdsuQ8S0+I7UAPgunRsVCc/yaJ/E9HJOpk877EgtBzfU2kzDyeZCekU2Vk7uY9
	lZ/1TGH+K70LvaETNtw6fny2hCaPbDKgAH6IhktYZwo/M0V/snVn9CqtRWvN4LEfNh+HS0YoT5Lmi
	y+ytZ8z99GwjbsiP1Bm26w+jt5QAsgkvJsKiGQtqJ/RDHIFCvD/5H/WhJw8EF9M9cvAp2xfD3t2Sg
	FZtjlUiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9aM-00000009ELY-3iBJ;
	Thu, 06 Jun 2024 09:39:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9aJ-00000009EK4-43QW
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Jun 2024 09:39:05 +0000
X-UUID: 79d5494423e611efaf04eb0598667787-20240606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=XQ9ak821eXByMY+QdSWsGgzwxrORtfb3fHozOaAo82o=;
	b=OwR9xt3YPKMXqIzfxN5ForQ9TefvaOAYfWgSfg5qRCDC8GixaLr2DMYmFGmv1NnfmYgdYGKHjcbVhhfI1TGDg9hA38QQK5fTGOCHoOzHMukqiBz01K9zuntjHOYe6yyoSXWlF2DeEdWSI+eFDImfI2D5g5HM6EIh0nbfMns20/c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:d4d2d9e6-abe3-4308-a8d5-c4efbde08ce6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:7d324744-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 79d5494423e611efaf04eb0598667787-20240606
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1758322359; Thu, 06 Jun 2024 02:23:46 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 6 Jun 2024 17:23:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 6 Jun 2024 17:23:42 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v3 0/4] Bluetooth: btusb: MediaTek ISO data transmission
Date: Thu, 6 Jun 2024 17:23:36 +0800
Message-ID: <20240606092340.27675-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.321600-8.000000
X-TMASE-MatchedRID: Xmc9pn+G6/3aYQdwXEMf70j2sPWKvtn0DRi0jfY6gL1oNGY/OdYkWWAI
	1go6d1sNmMN+S0FpW+8dHzBmTYIGm/Iejw19Z0aTuIwLnB3Aqp1A8I/PJy4EU70rWM4nIpJrA4e
	V6z+cHCdlEs7ay6jM0o8X8tv4W+1B5JVxYapKMGA0JY9d6s3vaRQK/sD1nu4xq8z7POX8FJNdpM
	SiKlvaL+LzNWBegCW2wgn7iDBesS15zdAzex5xZnyYiUbOQn1QobgMoGjAF6AlHeB0Vcx6dQHeq
	RoPqTlD98lGCtircYmUTGVAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.321600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 86E486E2C6DC60E90F5EAA27F591247998E9FC8835B962B9047EC150F0EBA8742000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_023904_014524_8AAC1688 
X-CRM114-Status: UNSURE (   6.29  )
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

Chris Lu (4):
  Bluetooth: net: add hci_iso_hdr function for iso data
  Bluetooth: btusb: add callback function in btusb suspend/resume
  Bluetooth: btmtk: add macro to get/set/clear MediaTek defined flags
  Bluetooth: btusb: mediatek: add ISO data transmission functions

 drivers/bluetooth/btmtk.c   |  92 ++++++++++++
 drivers/bluetooth/btmtk.h   |  61 ++++++++
 drivers/bluetooth/btusb.c   | 276 ++++++++++++++++++++++++++++++++++++
 include/net/bluetooth/hci.h |   5 +
 4 files changed, 434 insertions(+)

-- 
2.18.0


