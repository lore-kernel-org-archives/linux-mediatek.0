Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D86C27C55
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 11:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRbM1go2u6MZUEVsoScl8wXxNgQ/01QqJmmjheGQRzE=; b=HAf98G1Fg7rBsdkHRKD8J9+bVk
	M46LWWABlW4ZN9qqL/4mU1xdumJwqLlfQ8dOA0Wdme4fEr+DTxMQNaGhr6qQxsv7ZXFcddiHnssBD
	KEZ9Uwgby0LZFLO6/2PPkgufzdNmKI7eb+ltNlwsXVUi1Ahl4o83OsdJyyO/Df4qXayuUr2GsEA4g
	IFnLTgfJEMBY6hqwuAQ/7KdcCx5QT5Mb6c4mBul11NrDtT4EafXGovxlyiXMv7V4cd27VPrcaKUNu
	tY+6teSUBsVJ/LZj16CDhZHTEx9JvVWQwPgrg4tXBfgxaQIDVo3M7Na0fG/rKaxIH6q8T4EF1SYwT
	oDCZ6mGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFBWq-00000009ZgM-33uq;
	Thu, 06 Jun 2024 11:43:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFBWn-00000009ZfC-2TyC
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Jun 2024 11:43:34 +0000
X-UUID: fe9be6ac23f911efaf04eb0598667787-20240606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MRbM1go2u6MZUEVsoScl8wXxNgQ/01QqJmmjheGQRzE=;
	b=oRY3G565LU0akhW6Exz5hqo5u/SzHj5k/w53OyvSN71fbiOBEbhlIlkUThMAaQ6jwASAywlMtEg3ZNnoyx0j4GQuZjgzFN4jrQnyPFGoJVX0rn0f1WvEwJ+mn8vgTBv28oCTXk/4uGd6n9CghsyO1x0wH7q9LIlZlPnmlN7tM0Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:660ce5ae-c5c8-4003-9600-67d05c2f8ab2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:64e2b193-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: fe9be6ac23f911efaf04eb0598667787-20240606
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1617058117; Thu, 06 Jun 2024 04:43:29 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
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
Subject: [PATCH v4 1/4] Bluetooth: net: add hci_iso_hdr function for iso data
Date: Thu, 6 Jun 2024 19:43:18 +0800
Message-ID: <20240606114321.30515-2-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240606114321.30515-1-chris.lu@mediatek.com>
References: <20240606114321.30515-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.944900-8.000000
X-TMASE-MatchedRID: 6pbNFWS8cDs1vivz3L6ga7RtO1RC1Ep0Kx5ICGp/WtEXdhT0BAdFzpRr
	ve7l/C2qxiqnR+5LS88BtjkcfRMmqUDn8NFEhJAcngIgpj8eDcBpkajQR5gb3savT21DsLD/UEh
	Wy9W70AEnRE+fI6etkkroJNCGM2Se8Cz2wcr1lhTBwAKaEHfCaXzAGEEECqNaBIf9dSYxrVWS8m
	ZD0ewtoOzz1wbZMiRv8xNn7O/cul3/t0rZPZuWgICE5xpCtDRTUbJFyh4XXyqYo/TPOlMB4bCh3
	zE4wqa8DUCRr8oin+k=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.944900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 44C0343066305BB1E34FC06E99E17ABA3BDB8006A6C9FE3EA6DEEE506803DCF42000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_044333_643748_0EAE54C2 
X-CRM114-Status: UNSURE (   8.30  )
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


