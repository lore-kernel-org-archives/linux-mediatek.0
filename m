Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654B3CF9C5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 08:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7PfRKskVGwT9r2F1Yqlbbe6a3JQ6+g4PrqqXljQYNI=; b=o8S1YP0pkI5LD/V6D6c2AQMFqJ
	02uDYIsLJFTFx2rdYK7nSCB+Mar2IcoQVOAutfJpSKxw3rVnK4ek7HW7+z2vH+DgBU+kObNfTGJIm
	oE77jcjDJfa25aRwTPuABDC+8fEQTxVn4dL47TpOa0IFcUHM79aE7hbP1V6O7n/5P9sDr9fv1UO4g
	5yKaplv8XuW+SA+D5boXGf5n9cTXEgn3oMNtwVXVhUHioy1m1YSv1PpqhbeyhmuNio/erwkm0ECnN
	9bso8jbEmZnxgHuYE6HKIbMGaIm1fpedZg+Yj7a1wf5hO2Z26nFvB6yn5IE3x3YyBrRavgARHcYxy
	eJi2Px7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssej2-0000000Girg-1iiH;
	Mon, 23 Sep 2024 08:47:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sseix-0000000Giou-3TBc
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Sep 2024 08:47:17 +0000
X-UUID: 6cb57782798811efba0aef63c0775dbf-20240923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=R7PfRKskVGwT9r2F1Yqlbbe6a3JQ6+g4PrqqXljQYNI=;
	b=q5ZS8qjny04/H4bVbXjmYzgEygO8REWZqinpjb0HxlV2m24RUUGSUuAg4Y4m3zKOblghJLz+oGulupelvMfCUC3BgvmrmSC7XkcK36WoMTM7j/qplFcQwImKsVEzDcc91I9uZZNyCuHcJhmb/iaIhkI643juDr3b8wBrlpsF25M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:2e45e457-bf35-4655-af4e-e5c81f122318,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:71209ed0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 6cb57782798811efba0aef63c0775dbf-20240923
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1992436527; Mon, 23 Sep 2024 01:47:11 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Sep 2024 16:47:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Sep 2024 16:47:08 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v3 1/4] Bluetooth: btusb: mediatek: move Bluetooth power off command position
Date: Mon, 23 Sep 2024 16:47:02 +0800
Message-ID: <20240923084705.14123-2-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240923084705.14123-1-chris.lu@mediatek.com>
References: <20240923084705.14123-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.896600-8.000000
X-TMASE-MatchedRID: uBK5O+9wx1H9jxte3IFskCmjEOrcO6AyTJDl9FKHbrkKogmGusPLb1Rw
	2bAU6/Xp4vM1YF6AJbZhyT3WNjppUtAtbEEX0MxBxEHRux+uk8ifEzJ5hPndGWE2zAPzjeJcFYG
	LjtbYxOuAcoXqsszlIOBwlKjaWOxqIhQQ1YNJEQ6Qevzt5Pblqb/4zoQq0vAalqQnhpXEWk7KW8
	lyn96FsnmVKZusLp922v9OjYWA2uMMswg45VMfPadst5iAforfVlxr1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.896600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8494FE5B73917A51B060E8BCB5049AA4273515BDA073E1D14D47D35F19A8FAA52000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_014716_127026_9752477E 
X-CRM114-Status: GOOD (  10.29  )
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

Move MediaTek Bluetooth power off command before releasing
usb ISO interface.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btusb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 6c9c761d5b93..6cf1729a8225 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2704,11 +2704,14 @@ static int btusb_mtk_shutdown(struct hci_dev *hdev)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
 	struct btmtk_data *btmtk_data = hci_get_priv(hdev);
+	int ret;
+
+	ret = btmtk_usb_shutdown(hdev);
 
 	if (test_bit(BTMTK_ISOPKT_RUNNING, &btmtk_data->flags))
 		btusb_mtk_release_iso_intf(data);
 
-	return btmtk_usb_shutdown(hdev);
+	return ret;
 }
 
 #ifdef CONFIG_PM
-- 
2.18.0


