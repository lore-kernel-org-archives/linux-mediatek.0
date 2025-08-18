Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39C1CA0EDC
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Aug 2025 02:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YkZHmregPQROpYq8q9E+uWoRTz/1D56haXN9OBQbttM=; b=LeJdwlpFsFJ87yK+aKzXAeS9TE
	Qilx+rd3qmuat0o5j2qdlT/CI2azGwwuRU4bZ4z/C2jg9CdjuS+mAptZ39IkA2UbzO9DZIqBPov0t
	Ei0/xQ+wBnj4LMx6G+HewLLGO+9pVwaclsSs8hv/Gg85Cg8rXA0gomN1l1JTtYXzaQyKuQvJ8Y4Z5
	9b2OaUeIAUCOmnaCTmod0ZpDV+WolbV8WIHbE6rFccd7K3Zh+NQ6fH+OhWwjh46rWI++XufNvsiOG
	1+JAeEXxIai4VNZFC4S8cD1vSokoN3q1SQFP7RieMLxyZL+hUhbQO7vkGVOPh3hV0U7VpCDUMdDsg
	S8dI6/kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unpEu-00000006Ikm-3s0t;
	Mon, 18 Aug 2025 02:04:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unpCS-00000006INu-0LQ1
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Aug 2025 02:02:17 +0000
X-UUID: 58810eb47bd711f09f706fa2197c6ceb-20250817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=YkZHmregPQROpYq8q9E+uWoRTz/1D56haXN9OBQbttM=;
	b=XEn+tF/Wpqmyf9mS/Ffdzk3Q3JQdqYoug3FPu7dOK/MTGOq4ULbO27HCirhEhi5+JIqJqEXlk3tXIIiceKlQ1rrdl3uMBJCuv6BvrinznjgDtAD0q/L38CtVbxsKgbNBk1+JiMg2fn3dEgKvTVtgV4d4w7T4aV/YYMwIHa9d37w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:004548ad-6724-4d1e-98ec-659c27403669,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:abcd06f4-66cd-4ff9-9728-6a6f64661009,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 58810eb47bd711f09f706fa2197c6ceb-20250817
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 909950462; Sun, 17 Aug 2025 19:02:08 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 18 Aug 2025 10:01:58 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 18 Aug 2025 10:02:04 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>, <stable@vger.kernel.org>, Nick Morrow
	<morrownr@gmail.com>
Subject: [PATCH] wifi: mt76: mt7925u: use connac3 tx aggr check in tx complete
Date: Mon, 18 Aug 2025 10:02:03 +0800
Message-ID: <20250818020203.992338-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_190216_130018_28F1A152 
X-CRM114-Status: UNSURE (   9.22  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

MT7925 is a connac3 device; using the connac2 helper mis-parses
TXWI and breaks AMPDU/BA accounting. Use the connac3-specific
helper mt7925_tx_check_aggr() instead,

Cc: stable@vger.kernel.org
Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Reported-by: Nick Morrow <morrownr@gmail.com>
Tested-by: Nick Morrow <morrownr@gmail.com>
Tested-on: Netgear A9000 USB WiFi adapter
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 7854d0a796ea..173a23d01b27 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1463,7 +1463,7 @@ void mt7925_usb_sdio_tx_complete_skb(struct mt76_dev *mdev,
 	sta = wcid_to_sta(wcid);
 
 	if (sta && likely(e->skb->protocol != cpu_to_be16(ETH_P_PAE)))
-		mt76_connac2_tx_check_aggr(sta, txwi);
+		mt7925_tx_check_aggr(sta, e->skb, wcid);
 
 	skb_pull(e->skb, headroom);
 	mt76_tx_complete_skb(mdev, e->wcid, e->skb);
-- 
2.34.1


