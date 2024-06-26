Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FADCC2BBCA
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 02:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rz5boOxsi/u+gkabvKEweLBuuQ8l1CKIHW5Q1pnKZyU=; b=BKmeUl2qTfqGyQgCjB8nJeEkoD
	yNBtYQMvUVZop9om8sEVybZt58It3O16oZlPaSVtntqGIl5RoFJU8bWhasZ5SefXtWjTx1D0z3mPQ
	0yeIRBnrvBPTKnd/t/tWVNal45/0Zn1WAhFc0YXDlLIuEEsPglfOEDkTmEZBYrVFAyA8Z+aJ3EIUU
	wIe+JUTL3DkyTj32jCHdTE5xJAIzsSHxcApW/VYEdzRGDoJS12jO6vgOUTYHLWp9KcI9+hSR4mmRv
	XE8ikbXae6PcU/iZMzLdSXXCQJEbe1uybhxWGnDV7gs8+rWI2pZeFn+YzOQhkQFdmNsfnqG00L5v3
	ChoYXGqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMIn9-000000059lm-0HHl;
	Wed, 26 Jun 2024 02:53:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMIn3-000000059k1-1uAy
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jun 2024 02:53:47 +0000
X-UUID: 4ba794a6336711ef9daba96ee3f3cc8c-20240625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rz5boOxsi/u+gkabvKEweLBuuQ8l1CKIHW5Q1pnKZyU=;
	b=Tw/h5QZSOo9UCHJC5nbcOavDAG7WX50x9rhSzV7dI9Hjp+iGkO8Iczp6fcHbCEuSzWSXxXAtJEaxTO1NTM0F3EIiSrwBfcCF34PdqTz5B4WiEXan3rbtYCP1TnO6bxn5MYECgH6PstoSR65x/z7O3Hk43DLa7B9C+6AFnJ2TDOM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:e833561e-781c-4b62-9fce-0f51e7b42dcc,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:393d96e,CLOUDID:86b08985-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 4ba794a6336711ef9daba96ee3f3cc8c-20240625
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 885083776; Tue, 25 Jun 2024 19:53:41 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 26 Jun 2024 10:53:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 26 Jun 2024 10:53:39 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v5 1/8] Bluetooth: btusb: mediatek: remove the unnecessary goto tag
Date: Wed, 26 Jun 2024 10:53:22 +0800
Message-ID: <20240626025329.26424-2-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240626025329.26424-1-chris.lu@mediatek.com>
References: <20240626025329.26424-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_195345_636586_752DD32D 
X-CRM114-Status: GOOD (  11.01  )
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

Remove the unnecessary goto tag whether there is an error or not, we have
to free the buffer at the end of the function.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btusb.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 79aefdb3324d..fcdd660add19 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2953,12 +2953,9 @@ static int btusb_mtk_uhw_reg_write(struct btusb_data *data, u32 reg, u32 val)
 			      0x5E,
 			      reg >> 16, reg & 0xffff,
 			      buf, 4, USB_CTRL_SET_TIMEOUT);
-	if (err < 0) {
+	if (err < 0)
 		bt_dev_err(hdev, "Failed to write uhw reg(%d)", err);
-		goto err_free_buf;
-	}
 
-err_free_buf:
 	kfree(buf);
 
 	return err;
-- 
2.18.0


