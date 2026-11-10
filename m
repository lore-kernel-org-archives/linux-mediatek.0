Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB0260A2619
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 01:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L+hbO95R;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=MoOPR5je
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=W9o2iCjAVK2c+dojBxo6HCm4QXiuhz+/nTtHq/H4yXw=; b=L+hbO95R2V8kaiyRqbMfAr1RaB
	EpZf6aAy4ywatdhQUsrAZStWyhWhVmKnSQ8tXEKK+2Wsdn1qijbyf9mrqFL4K5FpcP1qgbZM8cUns
	PwaxMtAxgRdFJpw38ixu34UvPSk8H7H3PYAXlsSI9UwrbBvmEWGfDZI6bbrYPEhQojHHHyMzfWbMr
	deaI6vbtQiQ8EpWPuF/t3uIDwFxnk+u54BC1M369fI7uuqQ+FikBTz1VeCKOf4tVJ1qVHjVffYAHO
	NKfKbhBl1+Q9baTkdChMRIYiZbiWRt2esQuXzKhYlQbpc+SIaSEdCMeVBDvzql7icZWZ5a+CcwauF
	Ljw4M9Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaaz-000000024gh-1VzD;
	Tue, 10 Nov 2026 01:24:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaax-000000024fR-2QFa
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 01:24:20 +0000
X-UUID: 6ec1ce90dca511f1acbe4559397dec65-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=W9o2iCjAVK2c+dojBxo6HCm4QXiuhz+/nTtHq/H4yXw=;
	b=MoOPR5jebWLF7fH/3Kt2pjc7rn4fEs+dLEcLdgsqgZRKzJtYaE5D39uyxxwyh2EN4GZiaY2T85A/QxsZiFggBizagJHmV4WQKTmDKJmiFwjQbmJPzpTBIymE6I+IPI/K+pvfEKpu6cImyObaFkp3BoJjDXfD9st+wuN4Zhiib+g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:5e2dba72-8edc-4eaf-8977-6b44f76445cd,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:e8337e71-18b8-474a-aee7-177e489c5e29,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6ec1ce90dca511f1acbe4559397dec65-20261109
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 695899201; Mon, 09 Nov 2026 18:24:11 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 09:24:08 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 09:24:08 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <jared.huang@mediatek.com>, <jb.tsai@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: add 5.9G channel list and last batch size for sar update
Date: Tue, 10 Nov 2026 09:24:07 +0800
Message-ID: <20261110012407.342786-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_172419_735695_17644A80 
X-CRM114-Status: GOOD (  10.12  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jared Huang <jared.huang@mediatek.com>

Use min(batch_len, n_chan - idx) so the last batch always holds the
channels that are left. Also add the missing 5.9G channel list.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Jared Huang <jared.huang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index f45b0d81fd08..80a4f395c472 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -4140,7 +4140,8 @@ mt7925_mcu_rate_txpower_band(struct mt76_phy *phy,
 		112, 114, 116, 118, 120, 122, 124,
 		126, 128, 132, 134, 136, 138, 140,
 		142, 144, 149, 151, 153, 155, 157,
-		159, 161, 165, 167
+		159, 161, 163, 165, 167, 169, 173,
+		175, 177
 	};
 	static const u8 chan_list_6ghz[] = {
 		  1,   3,   5,   7,   9,  11,  13,
@@ -4199,7 +4200,7 @@ mt7925_mcu_rate_txpower_band(struct mt76_phy *phy,
 		int j, msg_len, num_ch;
 		struct sk_buff *skb;
 
-		num_ch = i == batch_size - 1 ? n_chan % batch_len : batch_len;
+		num_ch = min(batch_len, n_chan - idx);
 		msg_len = sizeof(*tx_power_tlv) + num_ch * sku_len;
 		skb = mt76_mcu_msg_alloc(dev, NULL, msg_len);
 		if (!skb) {
-- 
2.45.2


