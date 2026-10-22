Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EAA60A2606
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2026 03:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V8BoN66V;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=IaO23Iyw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nUCgUjmNbN6TcToRQfveewWV+E0+qBY6zOXb84C174g=; b=V8BoN66VVGEIW/KwbzWqs9bIl/
	xbRGoojFds+27uEE3JmFlhx3H5zno7MOg8RGF1YxftfDhMWkdjPEYLD86TqMLZ58Ih/+H4v8kc7xN
	BpGw5Fig1H4/QqtB6VebgLNqM9l92F4brPWD1mtypFrahUMn+K/zB8gcm4rkMA7PXsENSqKS3ltGi
	/rrKAYwDX9pVRfq5tEbJPr5AhZFwxOIpHk4lO1+a4sdpdXQkAoEeI+sqQ/9Qjjx3stPYaTmfcsCIm
	/MxtK0sX9tTjxVwbIeBmQ3CEgNC+IzjuI4AZry8lqul5t/4q0QO+y1Jm4WOR+ravZ4CyRg81bU2ml
	1+YkW3PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJjNU-0000000DGub-2Oom;
	Thu, 22 Oct 2026 03:22:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJjNP-0000000DGsi-1Get
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Oct 2026 03:22:01 +0000
X-UUID: bb5b9002cdc711f1afed4741b24580c9-20261021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=nUCgUjmNbN6TcToRQfveewWV+E0+qBY6zOXb84C174g=;
	b=IaO23Iywh1Q4mBrjJLPPezw1MWofJtNevAMTkEReh0j4Ldp6RKrW28PBvwxAKTitzGs0m0dNAY2WB2XYN8YZh3Ik48H8XH5kofGFsbxSBedUZhimUYuxetQCnzB85IbBWyHTQlFsPpyk8RqRE1rR8ZbaYei4at4NkzqKP0Evsr4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:179d2ac6-b0eb-4e63-a486-71c38b2eb916,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:64471865-e866-403f-bcf0-32cb50bc2f0b,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bb5b9002cdc711f1afed4741b24580c9-20261021
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1926618188; Wed, 21 Oct 2026 20:21:55 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 22 Oct 2026 11:21:52 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 22 Oct 2026 11:21:52 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Hao Qin <hao.qin@mediatek.com>, Wenlong Tian
	<ot_wenlong.tian@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Will Lee
	<will-cy.Lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v4 0/3] Bluetooth: btmtk: fix ISO data reception
Date: Thu, 22 Oct 2026 11:21:47 +0800
Message-ID: <20261022032150.2213479-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_202159_351541_1D6FB841 
X-CRM114-Status: UNSURE (   9.65  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

Changes in v4:
- Patch 1: check for the endpoint's zero-filled padding before starting
  to parse a new frame, rather than after assembling a 4-byte header.
  Otherwise a zero-filled remainder shorter than an ISO header (1-3
  bytes) would be held across calls as a partial header and corrupt the
  next transfer's framing. This also avoids allocating and immediately
  freeing an skb for a fully zero-filled remainder.
- Patch 2, 3: unchanged.

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


