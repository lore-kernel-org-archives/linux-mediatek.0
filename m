Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C85C04FF8
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 14:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Empahh1LA4kKLGwNXsY1+G441qGIr7QQTJKxvE2AOa0=; b=0pNpxctJrFnUW+oSK7IgNpkyKR
	P99qC1PDOLzbgMq9QUnuYEX9scXRAKuBKkbPENfvMKO31dTYnpR3T7oMaDgCYmw+Ch3LL/B8ob83Q
	PEusLqdbIic1FoYm12ErV8n2mrZRbuwSLMTFrtHqKdIDff94fho/Sz1HHCcoOlOFVw4wQlsgLGQTD
	jz5mNtR1aj8464i/lf7KiWv7fX/xPoeN+oVVafV3OSsP6vQ4hbrmWLbY2WFDBkV9l717aZ0qzHznc
	pryFpJXUTHESqt+9Qsv/GViXzSc2OXQsIYkK5ZrDQED6sw7e+HsyCh4Y5riACc73qR1wBulCta03T
	X/0325YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwNBT-00000008f7z-0Jgp;
	Mon, 15 Apr 2024 14:19:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwNBJ-00000008f2q-0ts0
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 14:19:46 +0000
X-UUID: 2c50c0b2fb3311eeac1957ae9f99f617-20240415
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Empahh1LA4kKLGwNXsY1+G441qGIr7QQTJKxvE2AOa0=;
	b=XXk9K6/F9TNxWCe5lcF2GvfW3T4IQymZSgM+i0uy8shpwjBE7g/OZkoVymoAo8GHuBBnSLliVOjEj34ugH8qHg2CSkeaGvDSextCNgPeWTu+c1Si3uqnUCA3wWvqM4bggxAHLQCkNovmh+hDdGNC8sHBJlu4WWuHdsMbM1IeY8o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:68b968bf-4518-46e3-a363-fdc9ceb45f99,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:82c5f88,CLOUDID:9754effa-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2c50c0b2fb3311eeac1957ae9f99f617-20240415
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <peter.tsao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1426922767; Mon, 15 Apr 2024 07:19:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 15 Apr 2024 22:19:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 15 Apr 2024 22:19:25 +0800
From: Peter Tsao <peter.tsao@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
	Chris Lu <chris.lu@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>, "Steve
 Lee" <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Tsao <peter.tsao@mediatek.com>
Subject: [PATCH] Bluetooth: btusb: Fix the patch for MT7920 the affected to MT7921
Date: Mon, 15 Apr 2024 22:19:22 +0800
Message-ID: <20240415141922.25055-1-peter.tsao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.318700-8.000000
X-TMASE-MatchedRID: v7/5pfRSD0mMkVxV9HfBrn49ofOf/kXdfiuvKi9huabXkQ/lfMrtA43q
	EYKsEnZOThbvLLI8RvOlEtDJyVR88h8TzIzimOwP0C1sQRfQzEHEQdG7H66TyND1NE3SaFLXMZb
	Uwr5BAc5L7aBQFdB+zLynh3zZcnrwMqQFpJEodmPzkbDo0dNc/VcswP2Un2zCoFzllQMzIvI5Q8
	yRDdtoFB9acifWZ5LsjofsMjQaxVwyYjbiqIQ3CsykhtyXcigD6rVdgBjDT2r1nXJavJVNag==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.318700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8E8907C081CAA517D0C61E6880FDC5FEA471B3C8955E2CE2DD78F57A438CD6722000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_071937_289923_3257A0D7 
X-CRM114-Status: UNSURE (   8.83  )
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

Because both MT7920 and MT7921 use the same chip ID.
We use the 8th bit of fw_flavor to distingush MT7920.
The original patch made a mistake to check whole fw_flavor,
that makes the condition both true (dev_id == 0x7961 && fw_flavor),
and makes MT7921 flow wrong.

In this patch, we correct the flow to get the 8th bit value for MT7920.
And the patch is verified pass with both MT7920 and MT7921.

Signed-off-by: Peter Tsao <peter.tsao@mediatek.com>
---
 drivers/bluetooth/btusb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 4c0cc13adb47..8bede0a33566 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3123,6 +3123,7 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 			bt_dev_err(hdev, "Failed to get fw flavor (%d)", err);
 			return err;
 		}
+		fw_flavor = (fw_flavor & 0x00000080) >> 7;
 	}
 
 	mediatek = hci_get_priv(hdev);
-- 
2.18.0


