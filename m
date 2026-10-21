Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC2F606A324
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 07:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pQSHbAUm;
	dkim=temperror header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Y6h6g1x2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B4w3VfD1CsFEPvf0JUg0GejZencD2dFWVaSgkTbJa0U=; b=pQSHbAUmCzFH1fUrWih9ANEmux
	kAfMBsXHHdLYYMZI/QXQS19OX6uV8HzItW6mcuKLpZUJFTPnO7tUR9Y3z6x0uTxsVR+ejGUqTQt2Y
	AioydzeTcPAOJGQx0fmYVuCodREBm0BrOjP7rU8xWcVPlYSLpCCJyZnfhVAKe5K8f/moFNO/gPKcq
	Uw31G3pAXNA73ZH/Dj2ypIRykJaYfElCbIz/OyNPzzV4bEUUi3DeWGQ1CRzm6peyAkqvVvOW8oWiI
	48IrQ4dediiMdxyXK/ypqhb1ZTHq9t9TsYvd+s5eyVkLGC8d5jtJjnqdD4IbZXYKxqG8fXwxuoRCB
	B16ZHZ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQgD-0000000BFVR-2BJl;
	Wed, 21 Oct 2026 07:24:09 +0000
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQg9-0000000BFTK-0wM6
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 07:24:06 +0000
X-UUID: 629789b4cd2011f1acbe4559397dec65-20261021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=B4w3VfD1CsFEPvf0JUg0GejZencD2dFWVaSgkTbJa0U=;
	b=Y6h6g1x2k0n4BMN8z1Ot9mPwjAaLx4FI+bSqUtJnzZXWQ7zNBWDx15MDySbODF2dDALUePxsOrGjnf2n95fbooUwu91I7HQTjmQKBhdAFbMDbQ2vbXTZjuqTYaGJZN+Hjfj/mpsAn7kyuEXRhSHtEpZgyiuAJEtHT6/sfHhPsKw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:f4cbb089-1fd2-4a31-b278-5dd5ca976299,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:9177e38a-9b15-4dfd-88b6-b4385d95ae05,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 629789b4cd2011f1acbe4559397dec65-20261021
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 613188934; Wed, 21 Oct 2026 00:24:00 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 21 Oct 2026 15:23:57 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 21 Oct 2026 15:23:57 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Hao Qin <hao.qin@mediatek.com>, Wenlong Tian
	<ot_wenlong.tian@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Will Lee
	<will-cy.Lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v3 0/3] Bluetooth: btmtk: fix ISO data reception
Date: Wed, 21 Oct 2026 15:23:52 +0800
Message-ID: <20261021072356.1449539-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_002405_265676_5FB50B37 
X-CRM114-Status: GOOD (  10.61  )
X-Spam-Score: -1.3 (-)
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


