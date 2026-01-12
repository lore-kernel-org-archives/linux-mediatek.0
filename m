Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815DDC9EC79
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 11:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=561wSHnrgmKBR1P+hEk/MhPgUl4Ghix6Fy0zn2eRhEw=; b=xK6/mscP5cqcscgA6HcgqwtbB8
	Cg/36BoUTtC4nxZfwu7fT5IOSigBmlAnEV3jr2aPrzUXR/xtoU0MlxsN3gclaYYmyoYEM26vq8KRf
	AVAezcn0gA8od5taCmWXoahr9O0f9Psqr9rlnMOHW2mJWzbWh9saGOJpRnuo9/0TS4+PdQU3e7Pta
	ugM6/++b5V12P/pvrTbg9/OwsWZuGlc6W5cYnC0HJOZWg9q2swVkEk4veT1c0EfVwxi4EUhVAfnaz
	MW6a1UpRI++lV1NZbXZHQvhtUB2G7tg8vwb4100zZ/YObFaktuSCNpjw6Fw6AfKOroeYznX2Uppzc
	h7xGyOsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGHY-00000005Gfe-0VJg;
	Mon, 12 Jan 2026 11:40:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGHV-00000005GfH-3FEC
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Jan 2026 11:40:22 +0000
X-UUID: 77a40fecefab11f09f706fa2197c6ceb-20260112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=561wSHnrgmKBR1P+hEk/MhPgUl4Ghix6Fy0zn2eRhEw=;
	b=mbSIhAcBmH0w1GIKyLMrpFgpl8z+KPLA71cJgnwl76DVauN0yI4iyKD0DMECss5X7q3OuiWBcpmTx+mksRVTAnYp7t8S/clStVan4NDnrLrq8M2iZgkot7QVV3BeRd2RnzyuRRbsUeRFmvmv3l2qav75mbTwBTdYJEEFZXACh5c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:6f06e2ab-cf96-4a60-b4b6-c3f1bf2a90de,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:5047765,CLOUDID:2834b179-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 77a40fecefab11f09f706fa2197c6ceb-20260112
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <leon.yen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 828106622; Mon, 12 Jan 2026 04:40:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 19:40:15 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 19:40:14 +0800
From: Leon Yen <leon.yen@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<mingyen.hsieh@mediatek.com>, <michael.lo@mediatek.com>,
	<allan.wang@mediatek.com>, <quan.zhou@mediatek.com>,
	<sarick.jiang@mediatek.com>, <ryder.lee@mediatek.com>,
	<shayne.chen@mediatek.com>, <leon.yen@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: Skip scan process during suspend.
Date: Mon, 12 Jan 2026 19:40:07 +0800
Message-ID: <20260112114007.2115873-1-leon.yen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_034021_848621_588D2397 
X-CRM114-Status: UNSURE (   8.69  )
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

From: Michael Lo <michael.lo@mediatek.com>

We are experiencing command timeouts because an upper layer triggers
an unexpected scan while the system/device is in suspend.
The upper layer should not initiate scans until the NIC has fully resumed.
We want to prevent scans during suspend and avoid timeouts without harming
power management or user experience.

Signed-off-by: Michael Lo <michael.lo@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 2d358a96640c..38474cd2c38d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1323,10 +1323,18 @@ void mt7925_mlo_pm_work(struct work_struct *work)
 void mt7925_scan_work(struct work_struct *work)
 {
 	struct mt792x_phy *phy;
+	struct mt792x_dev *dev;
+	struct mt76_connac_pm *pm;
 
 	phy = (struct mt792x_phy *)container_of(work, struct mt792x_phy,
 						scan_work.work);
 
+	dev = phy->dev;
+	pm = &dev->pm;
+
+	if (pm->suspended)
+		return;
+
 	while (true) {
 		struct sk_buff *skb;
 		struct tlv *tlv;
-- 
2.45.2


