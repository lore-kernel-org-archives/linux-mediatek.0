Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C899C44515
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 07:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzWtVOodND0t5OxLOVyEkpgN19ad/R8me0/vvCvwE/U=; b=kNzHlJPBTpe18a3AX4vqbPFOlF
	PangcSvkmtmJzLVKtWoSm8BV14mMMVNiMFkqIyPuktYx0Q049jHZySQJ2dC5exFhIvv556+dgI0yC
	x03tHDEY0C7rLi435ODUeJe7jQa79Eu4nOAykuqBXi485j8Vz2Xr5vfkk5e4KZXINlXDk42ZqPcc6
	htyWREkQ0TwPE+9QSe4nA7KWewTCLqaWN4Dfrrz7dQePm6Wth5lcp3xjiSAG/P3Pd1+T4nUG6hfFu
	CwPEaQv/x30v0zXtxNvYmzO3ioVKRQiGHknpOM19AYdYYmLvieTbP9qsqDIuOEwvRQRTkPLof/pBV
	6EcWYtjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkctJ-00000001OP3-05Sk;
	Fri, 17 Jul 2026 07:21:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkctF-00000001OKf-0dtF
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 07:21:47 +0000
X-UUID: 263bcdec81b011f1afed4741b24580c9-20260717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NzWtVOodND0t5OxLOVyEkpgN19ad/R8me0/vvCvwE/U=;
	b=UKD6JfWy6m+fn9e6x2sQA2ooWS82UrHi9bFqcj6G9wrRRZu7ElQPDXEkuOCoqP3ORoBZXK3HrsUnBNSmCjxaD5IO6U4t6gcYjU77Rk+BmM2QoBZ3ZW0ViSqbFvGKhCAUJy2D6U88qsqWeJ6Z/970FpwTSSJapnqa06EXln9DWvo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:71124a04-154e-4d31-aeca-621e1f8e1734,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:5d28f450-9df4-4a32-98eb-0af8dcdad6c0,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99|200|213,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 263bcdec81b011f1afed4741b24580c9-20260717
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2004787886; Fri, 17 Jul 2026 00:21:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 17 Jul 2026 15:21:35 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 17 Jul 2026 15:21:35 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>, Paul Menzel
	<pmenzel@molgen.mpg.de>, linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v14 4/7] Bluetooth: btmtksdio: Remove redundant firmware filename override
Date: Fri, 17 Jul 2026 15:21:30 +0800
Message-ID: <20260717072133.2858136-5-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260717072133.2858136-1-chris.lu@mediatek.com>
References: <20260717072133.2858136-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_002145_193932_F4D4A91B 
X-CRM114-Status: UNSURE (   7.93  )
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

btmtksdio_setup() calls btmtk_fw_get_filename() to generate the correct
firmware filename based on device ID and version, then immediately
overwrites it with snprintf() using a generic legacy format.

This redundant override causes newer chips (MT6639, MT7925, MT7928) to
request incorrect firmware filenames, leading to firmware load failures.
For example, MT6639 needs "mediatek/mt7927/BT_RAM_CODE_MT6639_2_1_hdr.bin"
but snprintf() generates "mediatek/BT_RAM_CODE_MT6639_1_1_hdr.bin".

Remove the redundant snprintf() override to use the correct filename
generated by btmtk_fw_get_filename(), matching USB driver behavior.

Fixes: 7f935b21bee4 ("Bluetooth: btmtk: apply the common btmtk_fw_get_filename")
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 1fdc24545e41..d895292103bb 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1175,9 +1175,6 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 		btmtk_fw_get_filename(fwname, sizeof(fwname), dev_id,
 				      fw_version, 0);
 
-		snprintf(fwname, sizeof(fwname),
-			 "mediatek/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
-			 dev_id & 0xffff, (fw_version & 0xff) + 1);
 		err = mt79xx_setup(hdev, fwname, dev_id);
 		if (err < 0)
 			return err;
-- 
2.45.2


