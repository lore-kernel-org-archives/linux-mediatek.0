Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1889DC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 21:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2SrHI01bsLoyiyx1l9LvBfTw2eMJuGduBEO80EpdacU=; b=1zMg880Nuhie+j
	F0Ou17sPWisUoMz/Ghp78trdryiJV1M4SNhND64AL0uTiidlwQn/6HYoUOrQqgNp8jFYPrnDwyGTT
	t3lyTRGhYZGKs6AKnfruottNp72Cxq58C3S1Y7HI/OzmHYTY2kiysOmUnxLdfgAID4B6sJPFWge3W
	axzmbD6vuHzV83FY4k2QWEaLaXnGe7uezNVVlt4gmlOmTqnmIVEiS7TVG5ynl+9n5STg0fhTcG82r
	OsdxDxSd+Fx8SMVIDDfosZowWiQf1GFxum5SmZalje1wuXD0M5n7euk8BkNXmoRPR/tpESZw0AAwb
	9TIVuL7TKt1lo7FP0z3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npGfb-00DftJ-QD; Thu, 12 May 2022 21:48:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npGfY-00DfsM-MT
 for linux-mediatek@lists.infradead.org; Thu, 12 May 2022 21:48:26 +0000
X-UUID: ec5cfd78f6814f62a5785c0f23365a8d-20220512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:707d3896-463e-4ed5-9e70-0abf28d6771f, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-15
X-CID-META: VersionHash:faefae9, CLOUDID:d7961aa7-eab7-4b74-a74d-5359964535a9,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: ec5cfd78f6814f62a5785c0f23365a8d-20220512
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 115448184; Thu, 12 May 2022 14:48:18 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 14:38:17 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 13 May 2022 05:38:15 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 13 May 2022 05:38:15 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <abhishekpandit@google.com>, <michaelfsun@google.com>, <mcchou@chromium.org>, 
 <shawnku@google.com>, <linux-bluetooth@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Yake
 Yang" <yake.yang@mediatek.com>
Subject: [PATCH 2/2] Bluetooth: btmtksdio: fix possible FW initialization
 failure
Date: Fri, 13 May 2022 05:38:12 +0800
Message-ID: <8ff7aed526e70f8cd05a019e94976d48992b4445.1652390894.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <e26167a3fcefdeae1151162e8676c9a467a8100d.1652390894.git.objelf@gmail.com>
References: <e26167a3fcefdeae1151162e8676c9a467a8100d.1652390894.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_144824_789187_C58E7132 
X-CRM114-Status: GOOD (  12.07  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

According to FW advised sequence, mt7921s need to re-acquire privilege
immediately after the firmware download is complete before normal running.
Otherwise, it is still possible the bus may be stuck in an abnormal status
that causes FW initialization failure in the current driver.

Fixes: 752aea58489f ("Bluetooth: mt7921s: fix bus hang with wrong privilege")
Co-developed-by: Yake Yang <yake.yang@mediatek.com>
Signed-off-by: Yake Yang <yake.yang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 26e27fd79a21..d6700efcfe8c 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -864,6 +864,14 @@ static int mt79xx_setup(struct hci_dev *hdev, const char *fwname)
 		return err;
 	}
 
+	err = btmtksdio_fw_pmctrl(bdev);
+	if (err < 0)
+		return err;
+
+	err = btmtksdio_drv_pmctrl(bdev);
+	if (err < 0)
+		return err;
+
 	/* Enable Bluetooth protocol */
 	wmt_params.op = BTMTK_WMT_FUNC_CTRL;
 	wmt_params.flag = 0;
@@ -1109,14 +1117,6 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 		if (err < 0)
 			return err;
 
-		err = btmtksdio_fw_pmctrl(bdev);
-		if (err < 0)
-			return err;
-
-		err = btmtksdio_drv_pmctrl(bdev);
-		if (err < 0)
-			return err;
-
 		/* Enable SCO over I2S/PCM */
 		err = btmtksdio_sco_setting(hdev);
 		if (err < 0) {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
