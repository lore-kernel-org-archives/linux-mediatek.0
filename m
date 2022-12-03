Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2F7C4321E
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Dec 2022 03:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNWSJ4pI2IkcKyFFE7f5GycSoRpgFBoM3xfG53SHE8M=; b=iod4g7rDQpW/hapRHGICQKrO02
	gnDvIewqnpcNuTatxiqBxm8frd4ETo7B5/7QfADlLIjPG5gK6wF9shxhkgGsjXeEXy7ZE41hOJk44
	Ep2J9nJgU9nXd6x1/+/ZI7OiP6HwOelaWZ7GcEVmrPkbnBGOMewMIFObdCQ1O+5VG1F8VxBOSU2G8
	rku3iLS8GKYRi1HU89hVrED25XbiuGCaP70wohjfGOdgwg7YI4SKkWuMIWw6y40JAkBxT4S7zTPSR
	67BjryFwYTdM8qsxLKsR/fIJcH71Z0RVLszWuY1HVx2uqBOGNefKDqvfsjPKjAY9NPElQGwGpTHbL
	zwheGtwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1J7T-002EQb-05; Sat, 03 Dec 2022 03:23:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1J7Q-002EQ7-33
	for linux-mediatek@lists.infradead.org; Sat, 03 Dec 2022 03:23:13 +0000
X-UUID: 98a27dbf22e1457f9a6e111c87656223-20221202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PNWSJ4pI2IkcKyFFE7f5GycSoRpgFBoM3xfG53SHE8M=;
	b=UKzcy7ydkLpu4gn2P83SY895TKu+Cr5GUo4xqJTQAz1klYut+SrWjg1yzKlii1oDANQ6a6+X1y4ze6Q6IdRv5cDOITp9eMbF6ljT+uMcGY6Fi9EEmMjit1fAYSPdc36xXQIKjMvh07aynDEqvJMabEj/bl+26jZDju+DhJ3vSUc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:15f931a9-e99b-434d-bdc5-51baccbb66c5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.14,REQID:15f931a9-e99b-434d-bdc5-51baccbb66c5,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:dcaaed0,CLOUDID:94dd061f-5e1d-4ab5-ab8e-3e04efc02b30,B
	ulkID:221203112249S6B2YXT7,BulkQuantity:2,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 98a27dbf22e1457f9a6e111c87656223-20221202
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 402154963; Fri, 02 Dec 2022 20:22:59 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 3 Dec 2022 11:22:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sat, 3 Dec 2022 11:22:26 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 2/4] wifi: mt76: mt7996: fix insecure data handling of mt7996_mcu_ie_countdown()
Date: Sat, 3 Dec 2022 11:22:23 +0800
Message-ID: <e8b579782304fcb92b462abb8874ae4d309aa6aa.1670037462.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <ce05914d5a4d73cea21ef2c359f3a5bb7c61a86e.1670037462.git.ryder.lee@mediatek.com>
References: <ce05914d5a4d73cea21ef2c359f3a5bb7c61a86e.1670037462.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_192312_165557_BB917BE6 
X-CRM114-Status: UNSURE (   7.94  )
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

Coverity message:
using tainted "hdr->band" variable as an index into an array "(*dev).mt76.phys".

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527797 ("Insecure data handling")
Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 04e1d10bbd21..a90b7ca2df63 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -412,6 +412,9 @@ mt7996_mcu_ie_countdown(struct mt7996_dev *dev, struct sk_buff *skb)
 	struct header *hdr = (struct header *)data;
 	struct tlv *tlv = (struct tlv *)(data + 4);
 
+	if (hdr->band >= ARRAY_SIZE(dev->mt76.phys))
+		return;
+
 	if (hdr->band && dev->mt76.phys[hdr->band])
 		mphy = dev->mt76.phys[hdr->band];
 
-- 
2.18.0


