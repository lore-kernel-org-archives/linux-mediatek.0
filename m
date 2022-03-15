Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACCEC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 18:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXhYyk/fCEholTJzSWdtDlLMAqF9s6hB/usHUZRkvaQ=; b=ZrUjH+fA8TdnV7
	g2MqBQunbp8OedMxE1bTmBA1ACSyzVLwki4cteYA3ENdWkQcKBQcskOTxAy2h64LirBiC9e+pB1Qg
	Y/e119gTWFAyomZPJ5S/klJeVwkBKAwFLs5ZA79ERhifWSMch7+ObsrgS7QfIpkxiyH0pXMFoR+XN
	pzJ5Zjh8BipM2CceMnJrT6o0A+CZ/kcdmqbv1HWA+WOo2CWmQMFZnpOPjgcn60J4+5xPP4YbyjVcu
	klBxesVxuCGWfMRlMP2ndjDyxFqHnCExcqMOd9fyGtfXt/J2lB7baZQY8bi3Z4FpqCAyO5iYMGq3N
	b7w2imiH3cKMk5kmkcGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUBcq-00AApw-HZ; Tue, 15 Mar 2022 18:10:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUBcn-00AApD-UC
 for linux-mediatek@lists.infradead.org; Tue, 15 Mar 2022 18:10:27 +0000
X-UUID: b849a391b3f14bafa58395f68aa0f186-20220315
X-UUID: b849a391b3f14bafa58395f68aa0f186-20220315
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 366960394; Tue, 15 Mar 2022 11:10:16 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Mar 2022 11:00:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 16 Mar 2022 02:00:07 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Mar 2022 02:00:07 +0800
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
Subject: [PATCH RESEND 2/5] Bluetooth: mt7921s: Set HCI_QUIRK_VALID_LE_STATES
Date: Wed, 16 Mar 2022 02:00:01 +0800
Message-ID: <9318ce1b76f8ed9b2c726362d3202310a54ae758.1647367024.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <7b4627d5017be2c26ded9daf7fd297bed6614852.1647367024.git.objelf@gmail.com>
References: <7b4627d5017be2c26ded9daf7fd297bed6614852.1647367024.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_111025_991106_1D773266 
X-CRM114-Status: UNSURE (   9.19  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yake Yang <yake.yang@mediatek.com>

The patch set HCI_QUIRK_VALID_LE_STATES to be consistent with the btusb for
MT7921 and is required for the likes of experimental LE simultaneous roles.

Reviewed-by: Mark Chen <markyawenchen@gmail.com>
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Yake Yang <yake.yang@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 9644069cecbb..034e55278c56 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1070,6 +1070,9 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 			}
 		}
 
+		/* Valid LE States quirk for MediaTek 7921 */
+		set_bit(HCI_QUIRK_VALID_LE_STATES, &hdev->quirks);
+
 		break;
 	case 0x7663:
 	case 0x7668:
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
