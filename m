Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4750CCC6B2F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2026 08:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rY3D9mNBBjC7e3FDz4IfdKuwe8YGEsVKS9z7QrGZfpE=; b=VfBBgbMllOVk049lF9975R122S
	9q3htV6NY7w+ZnF/GqpSrj+Ocl2P78NY3t9ErquwaOWYltexxsgMiCUYYV5JK52XkJRDyUi9CjdJk
	aGdHemLko77hMEo2V4/u93Zr9cxdxXHJ9/XWuWFBJMnj05RHsnIsfTcaL193Ut7Z7winWkLEYEOIh
	O7kKLfsQu8J+MWSg+94Fpmtk5GNHQmF1hkDwHwHwY4ehJwBdhJk+oAeH9Jl1XeUF/2ZBRFnacT3Rw
	gYlOyXuqU/1hrxCiG3BmFN9nxOl2eJVjOyVnNX92mvW8lXL3X69u/CFjyPX63zVOXOuKZFP8bMFED
	OtO4jwQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGcP-0000000H7nw-0v3W;
	Thu, 15 Oct 2026 08:15:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGcM-0000000H7me-0381
	for linux-mediatek@bombadil.infradead.org;
	Thu, 15 Oct 2026 08:15:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rY3D9mNBBjC7e3FDz4IfdKuwe8YGEsVKS9z7QrGZfpE=; b=mZ4CZvtfNOvrM4M7wTyBaDO/WL
	tBwmdK8CMh36jLARaWHRIh9qCoMme1FVeyYAqTbBGP/T5BpRX674JFq5lvFxZwJH0k8Z3EwU8bFBi
	KjEieu+mG+LNDvJNnffz7sVx8JP6RVQnyL+/eZ/7YVdNzyW+BA5G64CllpiOEF/FmcFaD/lqJvZQE
	ObdKKnyKxo7L8ZkkmsPJrDwqT/CNokAoHsceycHiIaVTUtUbBRhlrIzO/KJ3CYQ86KJe4pEMUZVt8
	NIYlFdOOLj0C26Y8Dn/C2wUPbNEalzMuTK0Vg02E9DefLG1qEPKHuQ9GeNz5zTlagCeEHE+gFiAlm
	tnhnvq7g==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHGcI-000000005mJ-2V8y
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Oct 2026 08:15:13 +0000
X-UUID: 80d11562c87011f1afed4741b24580c9-20261015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rY3D9mNBBjC7e3FDz4IfdKuwe8YGEsVKS9z7QrGZfpE=;
	b=vGIlXLrMgzDorKLWy0QcccPGA9300yyHsqolaATEzBRZSfQ34NdSD5Ktvn+V0Dfoc+oFtUgx2y64qZkiYbur8Je8MIBasaVM4+5R5D9WX4niA2QePruj67FcWXxXOxgsyK3uhyxmr/J4RcZLzVNv6jBuzJdpryT3/HRAFTbQXiI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:1b3f9106-f77b-4578-8924-a8e9c5603baa,IP:0,U
	RL:0,TC:0,Content:50,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:50
X-CID-META: VersionHash:291e20b,CLOUDID:65348826-12a1-435b-8b95-b996f97fc72f,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:3|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 80d11562c87011f1afed4741b24580c9-20261015
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1185081820; Thu, 15 Oct 2026 01:14:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
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
Subject: [PATCH v2 1/3] Bluetooth: btmtk: drop zero-length ISO packets from endpoint padding
Date: Thu, 15 Oct 2026 16:14:48 +0800
Message-ID: <20261015081450.1241194-2-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261015081450.1241194-1-chris.lu@mediatek.com>
References: <20261015081450.1241194-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_091511_175450_4114051F 
X-CRM114-Status: GOOD (  14.14  )
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

The ISO interrupt IN endpoint delivers a fixed-size transfer that holds
one HCI ISO packet and zero-fills the remainder. That padding belongs to
the transfer rather than to the stream, so it has to be dropped instead of
reported to the host.

btmtk_recv_isopkt() keeps parsing it: the zero bytes read as an ISO header
with handle 0 and a Data_Total_Length of zero, and each one is passed to
hci_recv_frame() as a complete frame. A single transfer yields a long run
of them, which is what fills the HCI log with malformed ISO packets, and
iso_recv() drops the SDU it is reassembling whenever handle 0 belongs to a
live CIS/BIS.

A zero Data_Total_Length carries no ISO Data Load, so such a packet is
never part of the stream. The padding runs to the end of the transfer, so
stop parsing once one is seen.

This was observed on MT7925, but btmtk_recv_isopkt() is shared by every
MediaTek USB controller that supports ISO data.

Fixes: ceac1cb0259d ("Bluetooth: btusb: mediatek: add ISO data transmission functions")
Co-developed-by: Hao Qin <hao.qin@mediatek.com>
Signed-off-by: Hao Qin <hao.qin@mediatek.com>
Co-developed-by: Wenlong Tian <ot_wenlong.tian@mediatek.com>
Signed-off-by: Wenlong Tian <ot_wenlong.tian@mediatek.com>
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index bdc85147b97f..869eb2176379 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1201,6 +1201,19 @@ static int btmtk_recv_isopkt(struct hci_dev *hdev, void *buffer, int count)
 			/* Complete ISO header */
 			hci_skb_expect(skb) = __le16_to_cpu(dlen);
 
+			/* The interrupt endpoint zero-fills the remainder of
+			 * each transfer, and that padding parses as a header
+			 * with a zero Data_Total_Length. Such a packet carries
+			 * no ISO Data Load at all and is never emitted by the
+			 * controller, so stop parsing here rather than hand a
+			 * bogus handle 0 packet to the stack.
+			 */
+			if (!hci_skb_expect(skb)) {
+				kfree_skb(skb);
+				skb = NULL;
+				break;
+			}
+
 			if (skb_tailroom(skb) < hci_skb_expect(skb)) {
 				kfree_skb(skb);
 				skb = NULL;
-- 
2.45.2


