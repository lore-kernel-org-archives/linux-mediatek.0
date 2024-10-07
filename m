Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5D6CFB43F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 13:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ATimxhLnDANYMNPMxpqt7QVT0xGNiTFBMcTp6ckVdHA=; b=cC9
	6ak8HbK8ZGkKyl/N0cl/TtB9DrsnbN6ZDuVaPzB1d9Xk5KxUJAPWNKQ5wkToHTFdRMadtFzbcqiin
	yNG7DZR78XBZoAxjQxIy/Yl403JmJykyzWcJsQVA8G7dvSI3Vykf48OCpDGCosJnCjrEBKxfttCJa
	6rIDO/ID1u6qikvTuOQ6BRFbFjLpjsL/P3EOy1ncAxjyduDiV7BJ3raXR87ibLlQF66+aJx1tmqns
	dIY4hA3N/sRIXea0PdqJhnjMKhZ/hVK8SXTfQUkdFhllI4MT4oomm/2nlq8xIcb9vaNvd4/i+pfjk
	AAAbU6yditNZItFlwY6HuU1iE+mhgKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoAw-00000002aU4-0SEV;
	Mon, 07 Oct 2024 13:53:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxo9b-00000002aGt-0H5o
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Oct 2024 13:52:22 +0000
X-UUID: 5104211a84b311efb3adad29d29602c1-20241007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ATimxhLnDANYMNPMxpqt7QVT0xGNiTFBMcTp6ckVdHA=;
	b=PTx7hlffCNtt4AYJpa6fv4WAw2QEm7XvOrj9vltfuD3sY6HpYRZ/Sb4Fe3g0Fxeay8JRU+00DtKwlzvo1esr3i0dR+3ArdYv3GuAwC6/2dew4RVnF/EFXzhqdRfLb6+JXE+WstPCg7SU2+vH07rao+EUQl+gxgyoQPfVNh3jr3I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:8cc548d8-dbf8-428a-aafc-9eb765b813d0,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:01916a26-5902-4533-af4f-d0904aa89b3c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5104211a84b311efb3adad29d29602c1-20241007
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 15927473; Mon, 07 Oct 2024 06:51:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 7 Oct 2024 21:51:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 7 Oct 2024 21:51:53 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
Subject: [PATCH wireless] wifi: mt76: mt7996: fix invalid interface combinations
Date: Mon, 7 Oct 2024 21:51:33 +0800
Message-ID: <20241007135133.5336-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.690600-8.000000
X-TMASE-MatchedRID: Tck8wxuMuYzAHHHFQcj2dge06kQGFaIW75oFMklhrngG2HMvWEJenuml
	/E2CK49bwhRO9036tr8uug82vqq5s8ot60/Xh7AB+YXwgWdSaC8raL2mh8ZVK/+am84b5ALE+Vi
	hXqn9xLHLlfTm7xmbgoAy6p60ZV62fJ5/bZ6npdjKayT/BQTiGgmYwOHxlFtLpTNQm6sBpj6T2G
	yja3Qu86U3gJLi1iNP2cVbp8HJAFvAvpLE+mvX8g==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.690600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 42C26800CFBBCB87A1219E76D155024E8DA548A6DE27E62152D2AAC8652A88ED2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_065203_141582_784A683F 
X-CRM114-Status: UNSURE (   7.90  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-mediatek <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Setting beacon_int_min_gcd and NL80211_IFTYPE_ADHOC in the same interface
combination is invalid, which will trigger the following warning trace
and get error returned from wiphy_register().

[   10.080325] Call trace:
[   10.082761]  wiphy_register+0xc4/0x76c [cfg80211]
[   10.087465]  ieee80211_register_hw+0x800/0xac4 [mac80211]
[   10.092868]  mt76_register_device+0x16c/0x2c0 [mt76]
[   10.097829]  mt7996_register_device+0x740/0x844 [mt7996e]

Fix this by removing unused adhoc iftype.

Fixes: 948f65249868 ("wifi: mt76: mt7996: advertize beacon_int_min_gcd")
Reported-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index f6a010b61a8a..2d36c7325137 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -16,9 +16,6 @@
 
 static const struct ieee80211_iface_limit if_limits[] = {
 	{
-		.max = 1,
-		.types = BIT(NL80211_IFTYPE_ADHOC)
-	}, {
 		.max = 16,
 		.types = BIT(NL80211_IFTYPE_AP)
 #ifdef CONFIG_MAC80211_MESH
-- 
2.39.2


