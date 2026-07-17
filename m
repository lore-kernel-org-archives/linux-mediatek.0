Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDD8C4451C
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 08:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZvX+Jrk0JM9sPSncpL0G6WL8OflxweBDdq5w6TaXy8=; b=o/FdwUqKyReEQPr0pMvyp0waMh
	DshYXNww+UgCUX6rx38HkR48O5anARjr1XyOKGL6qo/Sy28oj4vBoR+7xF1KAArZycWJ9/a9CDQdY
	M72LlVwyX6FqasZvQIJvvtqfb4GnokqiwNkdgIJZeaKcmzfygH8/rrHlDmntrFY77CZoHxZsdcexN
	e0S9FokRq/56saJnV03pkF1NORz0cmNSj0KHbtVMEvwyWJEkfdhgvTLbmYiYvAbPSFnRLtpQteQ/G
	Xefoyw75aQNcG0FI34UclF5zjEl3fRYJ2ZnXTYsThdu0QOh2qx/H64VbLrrWzTzcXO/5wwZxTDgOS
	8aInrKCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke6p-00000001hR0-33Cd;
	Fri, 17 Jul 2026 08:39:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke6k-00000001hNf-0vBc
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 08:39:50 +0000
X-UUID: 0daf9b4081bb11f1acbe4559397dec65-20260717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qZvX+Jrk0JM9sPSncpL0G6WL8OflxweBDdq5w6TaXy8=;
	b=g8cr8+K1DNfYSGspehngzdikK7JSmsrV1pXYmnLaCIO7T3by8UMbdTqYFjRiD1CZzvmCxrJJwoMp2aTfKefYXNa9+CdyEfxvNiIYOY51xKFi5wREMWAutLQJk8im6lJ9oj+2MvR38okHWPkcBG/f8m1nM7SHnDUdKAEKeXZpKxY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:d90518f7-8de2-4c30-97ee-aa4210ff4b59,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:dfc2965f-762a-4584-baab-4eebe609beea,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99|200|213,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0daf9b4081bb11f1acbe4559397dec65-20260717
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 956073855; Fri, 17 Jul 2026 01:39:41 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 17 Jul 2026 16:39:38 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 17 Jul 2026 16:39:38 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>, Paul Menzel
	<pmenzel@molgen.mpg.de>, linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v16 4/7] Bluetooth: btmtksdio: Remove redundant firmware filename override
Date: Fri, 17 Jul 2026 16:39:33 +0800
Message-ID: <20260717083936.2923891-5-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260717083936.2923891-1-chris.lu@mediatek.com>
References: <20260717083936.2923891-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_013947_839654_7D7BB36A 
X-CRM114-Status: UNSURE (   8.22  )
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
index ea6fefffef0f..491a61b43b3d 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1184,9 +1184,6 @@ static int btmtksdio_setup(struct hci_dev *hdev)
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


