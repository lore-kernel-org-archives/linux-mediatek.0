Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE60606EE81
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2026 08:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uCPVeuXu;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=fVUGvFDI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tjFsiMVo8kskclVrKY52p1ozW8t/WABGAqJnNi55a5M=; b=uCPVeuXuHQpB/Sww9xu+CBzJAL
	w+pfMY9hMnZOm+FmrNKizygLK1XU8zdi65YiYNUqFygqFVCwkXlM+KSQEtLHRc33GN1tf1bcSrgxs
	mFomPe0APD19i99MXixk/O1SmKgNh8R5aKzj/h9458r/0GubaBytfSe6UzqFmFC+ji5OJ0+u5VKjd
	J/sA8jdg3oYDJ+6w6Jbf5H4WrMLCLcTmvsKMlc/Q41SzCYzTnuTArsuKJn6ZZK1xCvRErZ4p7eyEk
	NeNnqOYjTlqOq/lOXRh8DIOJ/etr2Imf8nJ797aRMwvcBkEE29ACIvWRFfnq2rSGwyJJ1ouYQTKIR
	PtYUQN7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFL4-0000000BZOk-0JFC;
	Fri, 06 Nov 2026 08:30:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFKz-0000000BZH3-0M6e
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Nov 2026 08:30:19 +0000
X-UUID: 4826e374d9bc11f1afed4741b24580c9-20261106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=tjFsiMVo8kskclVrKY52p1ozW8t/WABGAqJnNi55a5M=;
	b=fVUGvFDI3XcoDP4WP3WRR2BruAOB5An7Q1cRz04D6eBCW0Os8aHXhvSiHmUyGz0vKI0Fy4W8pMNSx2vUwENhwnOx5cJxwYT/630+Ndi3fHPBmcuK4GlbwCmZCVFfs5VMC9wAuX/iwhogXO+Nf9DZYYmqC9uLF8uXo9BuM1fXMtc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:926619ae-1a52-4443-bc57-9fe3fe7e2632,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:0e737fae-cba0-45b9-b809-bd1d844f6e65,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4826e374d9bc11f1afed4741b24580c9-20261106
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <james-ly.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 555699057; Fri, 06 Nov 2026 01:30:11 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 6 Nov 2026 16:30:08 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 6 Nov 2026 16:30:08 +0800
From: James-LY Huang <james-ly.huang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<sean.wang@mediatek.com>, <jb.tsai@mediatek.com>, <kun.wu@mediatek.com>,
	<James-LY.Huang@mediatek.com>, mtk18285 <james-ly.huang@mediatek.com>
Subject: [PATCH v2 0/9] wifi: mt76: mt7925: make P2P operation robust off-channel
Date: Fri, 6 Nov 2026 16:29:55 +0800
Message-ID: <20261106083004.3156085-1-james-ly.huang@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_003017_187921_6E02C334 
X-CRM114-Status: GOOD (  13.39  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: mtk18285 <james-ly.huang@mediatek.com>

This series fixes a number of P2P (WiFi Direct) issues seen on mt7925
when a GO or client has to operate or answer on a channel other than
its own operating channel, or while the firmware is busy granting one.

Off-channel traffic breaks in both directions today: frames received
while P2P discovery walks the social channels can carry IEs for
another band than the one they were received on, GO probe responses
and off-channel management TX outlive the ROC window they were
admitted under, and a GO BSS gets programmed without the channel
being requested first, which the firmware rejects.

The series starts a dedicated p2p.c/p2p.h module for the P2P-only
logic, and moves through:

  - RX side: drop P2P management frames received on a foreign
    channel, drop stale GO probe responses after the BSS went away
  - TX side: bound GO probe response and off-channel management TX
    lifetime to the ROC window, send the common scan IEs and size
    the scan request for its IEs
  - ROC: harden the channel-grant handshake, describe the real
    chandef in the requests made to the firmware
  - GO bring-up: request the channel before programming a BSS,
    inject a deauth when the firmware reports an aging-timeout SAP
    event
  - give every P2P interface a BMC wcid of its own

The series has been verified to build against 7.3.0-rc5 as an
out-of-tree module for all PCI/USB chips (mt7603e, mt7615e, mt76x0e/u,
mt76x2e/u, mt7915e, mt7921e/u, mt7925e/u, mt7996e) and passes
scripts/checkpatch.pl with no errors or warnings.

Changes in v2:
  - patch 7/9 (inject the deauth): drop a redundant __packed from
    the synthesized deauth frame, which -Wpacked-not-aligned flags
    in builds that do not suppress the warning; no functional
    change, the struct layout is identical.

Jacobs Wu (1):
  wifi: mt76: mt7925: send the common scan IEs and size the request

james-ly huang (8):
  wifi: mt76: mt7925: drop P2P mgmt frames received on foreign channel
  wifi: mt76: mt7925: bound P2P off-channel mgmt TX lifetime
  wifi: mt76: mt7925: give every P2P interface a BMC wcid of its own
  wifi: mt76: mt7925: harden the ROC channel-grant handshake
  wifi: mt76: mt7925: describe the real chandef in ROC requests
  wifi: mt76: mt7925: request the channel before programming a GO BSS
  wifi: mt76: mt7925: inject the deauth for an aging-timeout SAP event
  wifi: mt76: mt7925: track BSS absence and drop stale GO probe
    responses

 drivers/net/wireless/mediatek/mt76/mt76.h     |   1 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |   3 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |   2 +
 .../wireless/mediatek/mt76/mt7925/Makefile    |   2 +-
 .../net/wireless/mediatek/mt76/mt7925/init.c  |   5 +
 .../net/wireless/mediatek/mt76/mt7925/mac.c   |  12 +
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 189 ++++-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 220 ++++--
 .../net/wireless/mediatek/mt76/mt7925/mt7925.h |   29 +-
 .../net/wireless/mediatek/mt76/mt7925/p2p.c   | 702 ++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/p2p.h   |   93 +++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  28 +
 drivers/net/wireless/mediatek/mt76/mt792x_core.c |  27 +
 13 files changed, 1256 insertions(+), 57 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/p2p.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/p2p.h

--
2.45.2


