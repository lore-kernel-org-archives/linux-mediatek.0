Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07148C5CFDB
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2026 08:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYOnRr3mn+TrX0E7QTTOqKUlGuBSIH8SKZRatU/uMlg=; b=nZ7+vqdbu2CucPxrJQyvwAYR8E
	R8/8lRDyd1MDncoLql+u2wV31AejW3IPQthmU8Otqwd/GBlu1AM+xhkxRDr42hTnbLbzHv3LcWMAn
	n4bVZd6DNbg0S7Qe70KME0GAGPUTlw0RCj/w/l9x7qRuVU1ae0ngaGget43wSSO8ChiyVhG7fVk0T
	R0MWyUpbAuFlTBWIeDy5qgOesgF9azYanyNCZMTmKy1OkV/ellaHPouDpJL+gGN7xFPMhy32ErZgL
	eRXIgd6Hyvn9F7sAApS46j7xgvqmpfnd6L/jNAu3DY11J2qjckmZSyhX0wYq9tL9eSGWtQo7aCuWO
	9jcl54Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuR8g-00000000DAF-2wyl;
	Thu, 13 Aug 2026 08:50:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuR8d-00000000D97-1akX
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Aug 2026 08:50:12 +0000
X-UUID: fbeda1f696f311f1acbe4559397dec65-20260813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=eYOnRr3mn+TrX0E7QTTOqKUlGuBSIH8SKZRatU/uMlg=;
	b=VfbAV+yr69nhjVJlFFYorLw6GkHP+aSrFKbHPr4OZhn1ldWdyGTyOM6rrASqmiZo/So+vLPTcaIvZuTSok7riFXL7+qFvTQPA4cEqtUIlY+UxeJSYQ5jSDNSwth532V3iHDb+c4N2QhX9lZRl7lAcNIGChZF44Snj7qsfKSEw1k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:b9e91c5f-f755-40ad-bc5f-0f0ea31491f0,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:ef61f6a7-8a7b-4c49-a0c0-42d13e7adac0,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fbeda1f696f311f1acbe4559397dec65-20260813
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1939292124; Thu, 13 Aug 2026 01:50:07 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 13 Aug 2026 16:50:05 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 13 Aug 2026 16:50:05 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<litien.chang@mediatek.com>, <Tony-TC.Lee@mediatek.com>,
	<jb.tsai@mediatek.com>, Tony-TC Lee <tony-tc.lee@mediatek.com>
Subject: [PATCH 3/3] wifi: mt76: mt7925: accept testmode replies shorter than the buffer
Date: Thu, 13 Aug 2026 16:50:01 +0800
Message-ID: <20260813085001.1927426-3-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260813085001.1927426-1-jb.tsai@mediatek.com>
References: <20260813085001.1927426-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_015011_428038_7FF6BEF3 
X-CRM114-Status: GOOD (  14.46  )
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

From: Tony-TC Lee <tony-tc.lee@mediatek.com>

The length check guarding the memcpy requires every event to carry a
full MT7925_EVT_RSP_LEN (512) byte payload. That suits
MCU_UNI_QUERY(TESTMODE_RX_STAT), whose reply is described by
union testmode_evt, but a MCU_UNI_QUERY(TESTMODE_CTRL) reply - an AT
command read - is laid out as struct uni_cmd_testmode_ctrl: an 8 byte
header followed by a union testmode_data of 84 bytes, 92 in total.
Measured on MT7925, cid 0x0046 answers with skb->len = 92, so every RF
test read fails with -EINVAL even though the firmware answered
correctly. The failure is invisible from userspace: a dump ending in an
error carries it in the NLMSG_DONE payload, which netlink libraries
routinely discard, so it looks like an empty reply.

Keep the over-read fixed, but step over the header with skb_pull() so
the bounds check and the advance are one operation and the offset comes
from offsetof() rather than a literal, then copy whatever payload did
arrive. Zero evt_resp at its declaration in the caller, which owns it
and hands it to userspace at full MT7925_EVT_RSP_LEN however much the
firmware sent, so the part left unfilled cannot leak stack content.

Fixes: c7369a00860a ("wifi: mt76: mt7925: validate skb length in testmode query")
Signed-off-by: Tony-TC Lee <tony-tc.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/testmode.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7925/testmode.c
index bf9516bc7bd1..dbf1159effeb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/testmode.c
@@ -87,6 +87,7 @@ static int
 mt7925_tm_query(struct mt792x_dev *dev, struct mt7925_tm_cmd *req,
 		char *evt_resp)
 {
+	const unsigned int hdr = offsetof(struct uni_cmd_testmode_ctrl, data);
 	struct mt7925_rftest_cmd cmd;
 	struct mt7925_rftest_cmd *pcmd = &cmd;
 	struct sk_buff *skb = NULL;
@@ -107,12 +108,12 @@ mt7925_tm_query(struct mt792x_dev *dev, struct mt7925_tm_cmd *req,
 	if (ret)
 		goto out;
 
-	if (skb->len < MT7925_EVT_RSP_LEN + 8) {
+	if (!skb_pull(skb, hdr)) {
 		ret = -EINVAL;
 		goto out;
 	}
 
-	memcpy((char *)evt_resp, (char *)skb->data + 8, MT7925_EVT_RSP_LEN);
+	memcpy(evt_resp, skb->data, min_t(u32, skb->len, MT7925_EVT_RSP_LEN));
 
 out:
 	dev_kfree_skb(skb);
@@ -192,7 +193,7 @@ int mt7925_testmode_dump(struct ieee80211_hw *hw, struct sk_buff *msg,
 
 		data = drv_tb[MT7925_TM_ATTR_QUERY];
 		if (data) {
-			char evt_resp[MT7925_EVT_RSP_LEN];
+			char evt_resp[MT7925_EVT_RSP_LEN] = {};
 
 			err = mt7925_tm_query(phy->dev, nla_data(data),
 					      evt_resp);
-- 
2.45.2


