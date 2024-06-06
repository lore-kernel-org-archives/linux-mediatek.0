Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88656C25B75
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 09:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRbM1go2u6MZUEVsoScl8wXxNgQ/01QqJmmjheGQRzE=; b=uIV+wILadHdKuamWGQEaVCLa57
	kv7bWZhTkMsNm3ylRWxfQemUv3GhwtpGAs0N+ymbKXuPG0+Sz7kxCa+E4rBsC+qCrJKSSMxChQl3p
	peN+IV/C1SAHMhsNa7B9B2Uu5TQ8csVEZmqd1JYlNpnX5O/tglb4f8XpjbipejDPDNmMnxeChXENw
	k/vPvYWx2SjpEbzi4eSf3lVoTntXCj+V9NfU8A3yzHMlLrMw4kokF0Q+Ys+0LinFsbcAoOoNycads
	tQqdLY/GX80iSHrhrEcyfG8ywEYTD16nI4pXsH+ZrzZ9ZXmW9oSsatw6eH5ScLJPKJsAxSYB/DfcF
	HJB1a/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9M1-000000097oi-15RY;
	Thu, 06 Jun 2024 09:24:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9M0-000000097n9-2ooD
	for linux-mediatek@bombadil.infradead.org;
	Thu, 06 Jun 2024 09:24:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MRbM1go2u6MZUEVsoScl8wXxNgQ/01QqJmmjheGQRzE=; b=JBUnY9iqfG6tdyn/VQ6LDHQTUM
	e+A3E0s9Skkiv2rsq2KDeAFYilN+E4dq7qZgW0lex0dA8VOhxKVmscztGFa+k5n0+Ns07ig1mxDyc
	H5JctOsug22DDyrUb66/YTeVVvFk8gF/EBmKSiPjSlTNDW11vu87aTDz3bxbSKTscvmrWa2c2feyj
	Bt6WqNFWEvXNYNiU7fxElxp24/rSjKusGRx2Of4QzyyIDlkSXqKr/RAo2NuvrKnlwz/Ire56VG3KK
	1B8pAjCdHlXPkAsSNWKhvX1P6V/lN8RAEcGGvFHmQRwX62AtcdsEVTnI09BfpEb1q+6If76knRdZT
	QGRDxPqA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9Lw-0000000CnSC-1hSY
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Jun 2024 09:24:15 +0000
X-UUID: 80de741823e611efaf04eb0598667787-20240606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MRbM1go2u6MZUEVsoScl8wXxNgQ/01QqJmmjheGQRzE=;
	b=pbSgjZcOdZm3iM1utyS0rRQLQ3QYX0V/CftowuGNFGfiqoQGGI+Ea/UISEp2+4j/elU6XGSGuHo75dpTMGez23c6e/st2lCqoFiKuXGvsMr+BnbQB31bZfCoIC2h6xYN4KctVPu9pyN9MHzti6kNa1E4sNF6pHCB33mwhRNTo+k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:3ec22cf1-bfa4-46db-9269-11b07fb422f7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:bdd8c984-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 80de741823e611efaf04eb0598667787-20240606
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 297497365; Thu, 06 Jun 2024 02:23:58 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 6 Jun 2024 17:23:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 6 Jun 2024 17:23:44 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v3 1/4] Bluetooth: net: add hci_iso_hdr function for iso data
Date: Thu, 6 Jun 2024 17:23:37 +0800
Message-ID: <20240606092340.27675-2-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240606092340.27675-1-chris.lu@mediatek.com>
References: <20240606092340.27675-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_102413_030063_A3A67FF1 
X-CRM114-Status: UNSURE (   7.57  )
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

Add function hci_iso_hdr to get skb->data when packet type is ISO.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 include/net/bluetooth/hci.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index e372a88e8c3f..b9f8f91f6c7f 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -2898,6 +2898,11 @@ static inline struct hci_sco_hdr *hci_sco_hdr(const struct sk_buff *skb)
 	return (struct hci_sco_hdr *) skb->data;
 }
 
+static inline struct hci_iso_hdr *hci_iso_hdr(const struct sk_buff *skb)
+{
+	return (struct hci_iso_hdr *) skb->data;
+}
+
 /* Command opcode pack/unpack */
 #define hci_opcode_pack(ogf, ocf)	((__u16) ((ocf & 0x03ff)|(ogf << 10)))
 #define hci_opcode_ogf(op)		(op >> 10)
-- 
2.18.0


