Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F270C79FAD
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2026 12:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddDa8Pcac/66Av7vO+vyv+NZ+Btz97Nekx/77mfvno0=; b=KrjYi/pvaZyAdv482bj8Q1NRg0
	i+QRsmo9Byz1bjpYb6Zv9FGWPchgzMukoAyEItudJwASjuD812IMsBsWKqW6+uggFF5W5TEsqEqy/
	cs4W0HLnbQ3sLE5LeOtpb4ZYB39PTY7TnABAkWkRBvvASjRmzK/vH88Vngw+rZhvoA8C3xsLQGgwK
	Ev6HylNbESexjGAafjh9ubAsQW1vYI/VWE4RDzz8wAMkuEyGs3AS2eXpJc5YS3Bg4u9pSKlfYoCpj
	WZzGZA/0OQcbZPSNMv/cuA+mH1mfXr/1lCnR6fQ3okfXitRPMpLs6G18x18UCvbDNedOZvOGIyqCT
	F9tWpomQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Gz3-0000000BdRM-26eL;
	Wed, 09 Sep 2026 12:00:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Gz2-0000000BdQz-1lCG
	for linux-mediatek@bombadil.infradead.org;
	Wed, 09 Sep 2026 12:00:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ddDa8Pcac/66Av7vO+vyv+NZ+Btz97Nekx/77mfvno0=; b=B/EoykdgTc3m3A2GPLWc90csXQ
	PHLZIzQ/3qreVKDGX3tnyF+02U+wdDN4m/uN/2lm4U0zno8wiCbRk0MbAFg1q1frEzGk+K3zo8REY
	nOJqyv5cElQxANEI08KtjCaVHj9A2c5NtYwfWZ4FV7bloyt197QhhvpEChmFVCO0g/fY6/ico7TD0
	08wcb55szmSYZaheZ5Ll/xDKyuK0IH1O4F4RcWRxzrgWvkhm6yPVx3+xFjkl95wiMpECeIRj8GxVY
	e6zkkh/lg4bMmAkB+8XoKVwijY+bYfmTB7v1gBWfr+auLQWIVw3w5GodHv0CD/cgxxw5ZzxbesGKm
	0NzEl7jg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Gyx-000000019Cb-2goV
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Sep 2026 12:00:54 +0000
X-UUID: 0c37da42ac4611f1acbe4559397dec65-20260909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ddDa8Pcac/66Av7vO+vyv+NZ+Btz97Nekx/77mfvno0=;
	b=XLnIsUNrYb7pI49IJxpUdEBLCD96jjXaLUI8SCJUY4uJnggYmqv8G4FJ00tqBIfYVleeTiEVgIxvrCv3Gq2WRzCR8XpuQ3dttLvIQbOyYhBIIWdUsP/dz+s92Jps8gi8TqhSeOZ2dToUakwle4FDBcYRfIHhc/3cHWVQ7iyF8no=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:913b2ded-8117-4ab2-9f06-9737ef53a864,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:5bcb1728-9ebf-4787-bb42-3cd26eee85aa,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0c37da42ac4611f1acbe4559397dec65-20260909
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1259950618; Wed, 09 Sep 2026 05:00:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 9 Sep 2026 20:00:25 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 9 Sep 2026 20:00:25 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>, Paul
 Menzel <pmenzel@molgen.mpg.de>
Subject: [PATCH 3/3] Bluetooth: btmtk: Replace magic numbers with WMT packet flag enum
Date: Wed, 9 Sep 2026 20:00:11 +0800
Message-ID: <20260909120011.1198001-4-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260909120011.1198001-1-chris.lu@mediatek.com>
References: <20260909120011.1198001-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_130052_702158_03A5A873 
X-CRM114-Status: GOOD (  13.89  )
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

The flag field of a BTMTK_WMT_PATCH_DWNLD packet tells the device where
the packet sits in the download sequence, but both download loops write
the bare values 1, 2 and 3, so the reader has to infer the meaning from
the surrounding conditionals.

Add enum btmtk_wmt_pkt_flag and use it in btmtk_setup_firmware_79xx()
and btmtk_setup_firmware(). No functional change.

The other bare flag values in this driver belong to different WMT
opcodes (BTMTK_WMT_FUNC_CTRL, BTMTK_WMT_RST, BTMTK_WMT_SEMAPHORE and so
on), where the field means something else entirely, so they are left
alone.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
Assisted-by: Claude:claude-opus-5
---
 drivers/bluetooth/btmtk.c | 12 ++++++------
 drivers/bluetooth/btmtk.h |  9 +++++++++
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index cf4f40349afa..660ed5b02841 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -300,12 +300,12 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 			while (dl_size > 0) {
 				dlen = min_t(int, 250, dl_size);
 				if (first_block == 1) {
-					flag = 1;
+					flag = BTMTK_WMT_PKT_START;
 					first_block = 0;
 				} else if (dl_size - dlen <= 0) {
-					flag = 3;
+					flag = BTMTK_WMT_PKT_END;
 				} else {
-					flag = 2;
+					flag = BTMTK_WMT_PKT_CONTINUE;
 				}
 
 				wmt_params.flag = flag;
@@ -384,7 +384,7 @@ int btmtk_setup_firmware(struct hci_dev *hdev, const char *fwname,
 
 	fw_size -= 30;
 	fw_ptr += 30;
-	flag = 1;
+	flag = BTMTK_WMT_PKT_START;
 
 	wmt_params.op = BTMTK_WMT_PATCH_DWNLD;
 	wmt_params.status = NULL;
@@ -394,9 +394,9 @@ int btmtk_setup_firmware(struct hci_dev *hdev, const char *fwname,
 
 		/* Tell device the position in sequence */
 		if (fw_size - dlen <= 0)
-			flag = 3;
+			flag = BTMTK_WMT_PKT_END;
 		else if (fw_size < fw->size - 30)
-			flag = 2;
+			flag = BTMTK_WMT_PKT_CONTINUE;
 
 		wmt_params.flag = flag;
 		wmt_params.dlen = dlen;
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index bc26148ec544..e8ad281a93a0 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -67,6 +67,15 @@ enum {
 	BTMTK_WMT_ON_PROGRESS,
 };
 
+/* Position of a BTMTK_WMT_PATCH_DWNLD packet within a download sequence,
+ * carried in struct btmtk_wmt_hdr's flag field.
+ */
+enum btmtk_wmt_pkt_flag {
+	BTMTK_WMT_PKT_START = 1,
+	BTMTK_WMT_PKT_CONTINUE = 2,
+	BTMTK_WMT_PKT_END = 3,
+};
+
 struct btmtk_wmt_hdr {
 	u8	dir;
 	u8	op;
-- 
2.45.2


