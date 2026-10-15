Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9BECC6B34
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2026 08:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dtGFljm52cyuIn+hi7p/IuJvrI5isfxkKWbhMEgIJIk=; b=31/By/rls1LGPGMENRAcb9sWA9
	WuacdmCmFKN7ZtxBnkKEeMBecGIHraKj2yhMDeK5sKkSF/AxSLb9mg+3EUvvJ2ZjNdzsJHABUQggn
	VC6ZE57G70VjOKD4YXolhTBytsylOzwJy3MIP520YAQ+j2+Eb1eDZZTgYvlm5/DP51btw6cJv8a/4
	EVrYapMkJKOzVpYdAizUjaoMzmJWAm7qaR7WPtJWMLgbgx/bIPzLn0+/1p4eIa3brbbJtfdpNpob8
	sEQpctaJNfBtNU81/K6rxAUWgKMd6LrsG5lBbGWOGFjpbzHFJBXGBkTk7MQB6jeIaHaSOquaJZvDC
	ji21yfbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGcJ-0000000H7ll-3uGK;
	Thu, 15 Oct 2026 08:15:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGcI-0000000H7lF-1fmg
	for linux-mediatek@bombadil.infradead.org;
	Thu, 15 Oct 2026 08:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=dtGFljm52cyuIn+hi7p/IuJvrI5isfxkKWbhMEgIJIk=; b=G9jrpLx+lD4rR+/y1u33nPGk0x
	PTIK4I1AnSO5in2NZacx2ssh3NuX+aS58tzJUFu3E7b4aCsZH3On3s2/e4zry4z0l/joZvH80kLra
	uPIv2oHyuPlIYrgEEwbE7BX+75cLBll54lniD3FWdPeT1CyGsVL4nFTHNo3P6PTm5NtNIT4356Srh
	zVMOpqE35GWXYRry2hZY3cISg7x+TZchFsbteHW7XU35vzRM+iZXhnTXVLrH+LNHZJHMBzk3fpMgm
	EimNAcSEBYPj6/2O9oPNrvx+Ycaq5+csdLE6NdSkHGA3FhlF7VXpXIW25PNbkIEVWKkZ3kREz8lvM
	4KvyZ74w==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHGcE-000000005mL-2cuy
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Oct 2026 08:15:09 +0000
X-UUID: 80c8b246c87011f1afed4741b24580c9-20261015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=dtGFljm52cyuIn+hi7p/IuJvrI5isfxkKWbhMEgIJIk=;
	b=ZzUqmt9SnQv6fzU3ZuNiohVhxwaO9YMFE1NBjSvxiy9y+O+te0jWa9E2lewl7zGgMirXV/QYTHlPsGwgQoxg7VXcVNPfVBBgObf6a3RygdplyHJfI5CFFa4iTOtKVQm5qlQUNFSfHYH2a22W17YE0y5R/s4wCxkJd/7HqtrVrNQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:43634d41-d47c-41a9-9ab0-4e1f09ba00a8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:1a6ae3fc-d852-4ec7-93a7-9872a6d9e58d,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 80c8b246c87011f1afed4741b24580c9-20261015
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 655837005; Thu, 15 Oct 2026 01:14:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Oct 2026 16:14:52 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 15 Oct 2026 16:14:52 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Hao Qin <hao.qin@mediatek.com>, Wenlong Tian
	<ot_wenlong.tian@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Will Lee
	<will-cy.Lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v2 0/3] Bluetooth: btmtk: fix ISO data reception
Date: Thu, 15 Oct 2026 16:14:47 +0800
Message-ID: <20261015081450.1241194-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_091507_352181_80530331 
X-CRM114-Status: GOOD (  11.20  )
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

Three fixes for ISO data handling in btmtk, found while debugging LE Audio
on MT7925. The code is shared by every MediaTek USB controller that
supports ISO data, so none of this is specific to that part.

Patch 1 drops the zero padding that the ISO interrupt IN endpoint appends
to each transfer instead of parsing it as ISO packets. The driver turns
that padding into handle 0 packets with a Data_Total_Length of zero and
hands them to the stack, which is what fills the HCI log with malformed
ISO frames, and a valid SDU is lost whenever handle 0 belongs to a live
CIS/BIS.

Patch 2 bounds Data_Total_Length by hdev->iso_mtu. The existing
skb_tailroom() test enforces no protocol limit, because the skb head
allocation is rounded up to a kmalloc bucket and skb_tailroom() reports
the bucket size rather than what was requested.

Patch 3 updates the mt79xx ISO data transmission setting.

The three hunks do not overlap, so any prefix of the series applies on its
own.

Changes in v2:
- Patch 2 reworked and retitled. v1 only enlarged the receive skb, which
  turned out to be a no-op, and added no bound at all. v2 bounds
  Data_Total_Length by hdev->iso_mtu and sizes the skb from the same
  value.
- Patch 3 added.
- Patch 1 unchanged.

Based on bluetooth-next.

Chris Lu (3):
  Bluetooth: btmtk: drop zero-length ISO packets from endpoint padding
  Bluetooth: btmtk: bound the ISO payload length by the controller's MTU
  Bluetooth: btmtk: derive the firmware ISO setting from
    MTK_ISO_THRESHOLD

 drivers/bluetooth/btmtk.c | 37 ++++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

-- 
2.45.2


