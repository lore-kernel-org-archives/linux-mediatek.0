Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF70606A328
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 08:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sPQsUklU;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ueo2ON0R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DfR6r0jQYKv4ohBiQ+/IkPgThMUgQanf2jGLMzUddBo=; b=sPQsUklUYuuZ+Otu9nCcytGSXl
	pjxfK8eab3nJyTcsf7d8tz6iEadThSFrbk//k1w8HiH1Gre5P5LHSr22QvPEFHsZAI4iGJ0g6oO/B
	q0Fri462kI9KGGuF4VV7c9/+BHSIs3JCZ4hkohjOw6zXlthDVeZXRgJ0o2OG0YBaswEdnnb2p3GIB
	TRwDOVY5t03uZcZ0GONQzilffEN/daGupkzurd8bf3jkAGQeRwbwPho6pWmwXA1abhGgUlkBiYm3a
	gd/FFwSSxOV6Gz4oN9BOdhPgn6v2IloGF0x+ZhTwtn1ishewrf96JSG9FbBW3PX5G8aIXjt48QmCL
	HIsVIhCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRvJ-0000000BP97-0NHs;
	Wed, 21 Oct 2026 08:43:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRvE-0000000BP6u-1nau
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 08:43:46 +0000
X-UUID: 8450db7ccd2b11f1afed4741b24580c9-20261021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=DfR6r0jQYKv4ohBiQ+/IkPgThMUgQanf2jGLMzUddBo=;
	b=ueo2ON0R15e8z9bU+nhKaHmHqWJuUQpXwBLc1YPiih6VMokQ09F9pSXqDi8dT/FbhOu2pYIrgepqPjp/pYbt4M4iaFfiV/FfL/5zlpAfaBwrxEpcGp+i/VQNPnkbWnG23lr09BDg0thFHMO3krE7j//nsSnF2t4rqpMZCFbdA54=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:7b3b50e8-89b0-4960-b8bb-ea027cce9f76,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:c9f69114-9982-4283-b34a-0e8f357169f3,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8450db7ccd2b11f1afed4741b24580c9-20261021
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1997739162; Wed, 21 Oct 2026 01:43:41 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 21 Oct 2026 16:43:38 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 21 Oct 2026 16:43:38 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Hao Qin <hao.qin@mediatek.com>, Wenlong Tian
	<ot_wenlong.tian@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Will Lee
	<will-cy.Lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v3 RESEND 0/3] Bluetooth: btmtk: fix ISO data reception
Date: Wed, 21 Oct 2026 16:43:34 +0800
Message-ID: <20261021084337.1515468-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_014344_496380_A0911542 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Resend due to rebase: the base this series was previously posted against
no longer exists in bluetooth-next's history, which is why it failed to
apply. Rebased onto current bluetooth-next; no content changes from v3.

Two fixes for btmtk_recv_isopkt(), found while debugging LE Audio on
MT7925, plus an update to the ISO data transmission setting. The function
is shared by every MediaTek USB controller that supports ISO data, so none
of this is specific to that part.

Patch 1 drops the zero padding that the ISO interrupt IN endpoint appends
to each transfer instead of parsing it as ISO packets.

Patch 2 bounds Data_Total_Length by hdev->iso_mtu.

Patch 3 updates the mt79xx ISO data transmission setting.

The three hunks do not overlap, so any prefix of the series applies on its
own.

Changes in v3 RESEND:
- Resend due to rebase. No content changes.

Changes in v3:
- Patch 1: instead of dropping a packet solely because Data_Total_Length
  is zero, also confirm that the rest of the transfer is zero-filled
  before treating it as padding.
- Patch 2, 3: unchanged.

Changes in v2:
- Patch 2 reworked and retitled.
- Patch 3 added.

Based on bluetooth-next.

Chris Lu (3):
  Bluetooth: btmtk: drop zero-length ISO packets from endpoint padding
  Bluetooth: btmtk: bound the ISO payload length by the controller's MTU
  Bluetooth: btmtk: derive the firmware ISO setting from
    MTK_ISO_THRESHOLD

 drivers/bluetooth/btmtk.c | 44 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 5 deletions(-)

-- 
2.45.2


