Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38764C5DF9C
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2026 03:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8iN+sJuf9qZpCW4bDkdt8mpJpBz2Tzn+okDLJqUG/k=; b=fsgPzOlY7YhXeUQHMrcV42LAhO
	UI58FawsLDdLlvsJWRL21c22iGWKRojulpN/wd6AykyaGzLdL2FPMKuOcfyybPE9DdL2TJXlkPakt
	4r/KTBuDEFT/9PdlhZYq/vMuJvxCjhrKMchxGw7L7cfnqeEf9ZKAgQJ8nKo6dEbDDNsvAzcMY30ez
	uMD4XKAxBtFqsIvRkFLlkvNjxO+vyDE1JBlRd+8pXa8oORoE3S3+TOABdcQzdTc2ClqxCz7bg8bOV
	KDxDGWC30hEkSk8ri3YcHwk6bUelnZvXGKJSrp+drRilNvGfRYDRUYJUmkK3G9eNjjVLgr3ZpquJU
	kEda5r6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyhy1-000000006Jf-3NkW;
	Tue, 25 Aug 2026 03:36:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyhxw-000000006HN-0B3d
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Aug 2026 03:36:49 +0000
X-UUID: 2e3d3234a03611f1acbe4559397dec65-20260824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+8iN+sJuf9qZpCW4bDkdt8mpJpBz2Tzn+okDLJqUG/k=;
	b=bNDXBo2IuO82VCk6OHPYNl89XgjQRMAcL88lNWgdXOoCWanTlfvsksLYP/osfEKESv8kKMnLGxc33i575OrdaYpjF0KdTDXO+c7aBAwbmrqTwXSqSvnGxcf5guP0bnDdqiYYQOkgDRNrm5jpnydjBCq1HpVybScScnfetqehQmE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:4a81c146-56d6-488c-a9eb-d417f0c1bd6c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:9a1725c3-610e-480f-b463-9bb53aa0aeaf,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2e3d3234a03611f1acbe4559397dec65-20260824
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 54755654; Mon, 24 Aug 2026 20:36:38 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Aug 2026 11:36:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 25 Aug 2026 11:36:36 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH 1/2] Bluetooth: btmtksdio: Remove redundant firmware filename override
Date: Tue, 25 Aug 2026 11:36:33 +0800
Message-ID: <20260825033634.499118-2-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260825033634.499118-1-chris.lu@mediatek.com>
References: <20260825033634.499118-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_203648_092677_1D7B971D 
X-CRM114-Status: UNSURE (   9.99  )
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

btmtksdio_setup() derives the firmware filename with
btmtk_fw_get_filename() and then overwrites it with an snprintf() that
open-codes that helper's fallback format. Commit 7f935b21bee4 ("Bluetooth:
btmtk: apply the common btmtk_fw_get_filename") added the helper call
without removing the snprintf() it was meant to replace.

None of the device ids the helper special-cases can appear here: 0x6639,
0x7925 and the flavored 0x7961 belong to parts with no SDIO interface, and
btmtksdio_setup() passes a flavor of 0 accordingly. The helper always falls
through to the snprintf()'s own format, so both produce the same string and
removing it is a no-op.

Remove it anyway, since it silently defeats the helper for any device id
the helper special-cases.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/bluetooth/btmtksdio.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index b7f0be7fc42a..a5709cecd4b5 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1162,9 +1162,6 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 		btmtk_fw_get_filename(fwname, sizeof(fwname), dev_id,
 				      fw_version, 0);
 
-		snprintf(fwname, sizeof(fwname),
-			 "mediatek/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
-			 dev_id & 0xffff, (fw_version & 0xff) + 1);
 		err = mt79xx_setup(hdev, fwname);
 		if (err < 0)
 			return err;
-- 
2.45.2


