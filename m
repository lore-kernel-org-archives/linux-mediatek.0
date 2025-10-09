Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65701CAC5BB
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Oct 2025 02:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aZIE8iEoWepIU4IvbJ7gGd9jnoBAtSM2nxsZWSBh934=; b=JUiirr+atKfaca0ya39ggKirOG
	WPonp7YdjiOuupBR0S8pInRjhwJjrO5ug4QHJWRwqDHu7FbN+p9wTUqmBomv90vUvR80DRWvZAMGy
	AyoS58DTR3s5Zes+sFeMsYuWR8ueVVQUeubJsN0i5NBD9lHEgur8SfM7FSwrWO9krRshVR1M11B9Y
	vElYvVOO2LyWJUHG2FZoHP57CYUQB2a0F4enW5yKAWX1uGlfBKiVZMwlRCO5qG9X9qooLlQz16Tis
	FBfKs8Ate4g5aAt0IQeC/O8ZxdeVG6pUKFKjJAbylA3S50l6+PKKrQxK6ZYtxJi+UjMzVN62VDMdN
	6pFse2tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fyv-000000051Rt-0EMn;
	Thu, 09 Oct 2025 02:02:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fys-000000051Qb-2NBW
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Oct 2025 02:02:11 +0000
X-UUID: f47e37c4a4b311f0a52f393f94899d25-20251008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=aZIE8iEoWepIU4IvbJ7gGd9jnoBAtSM2nxsZWSBh934=;
	b=DWGngXQfD5chsjPJIdgLykAiwas4ZVDDZOIwMTIDcADe2vWAMrwgLNX79azOylUzi89XOD3d1j/IP5rhFLmRcGTFPz5BMEOM9+8tGIZJwS5zj7kg07Kj2bJqXwNQn2ApkIrlUHag/OvmHISFBlSJ+MneBV5hr7aeMf6oVFt8UWw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:6396fe0a-d7fc-4e3f-bd17-caf25ff5778e,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:e70afab8-795c-4f99-91f3-c115e0d49051,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f47e37c4a4b311f0a52f393f94899d25-20251008
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1856283960; Wed, 08 Oct 2025 19:02:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 9 Oct 2025 10:01:59 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Thu, 9 Oct 2025 10:01:59 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Leon Yen <leon.yen@mediatek.com>,
	<stable@vger.kernel.org>, Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921: fix a potential clc buffer length underflow
Date: Thu, 9 Oct 2025 10:01:58 +0800
Message-ID: <20251009020158.1923429-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_190210_618595_165FCF58 
X-CRM114-Status: UNSURE (   8.91  )
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

From: Leon Yen <leon.yen@mediatek.com>

The buf_len is used to limit the iterations for retrieving the country
power setting and may underflow under certain conditions due to changes
in the power table in CLC.

This underflow leads to an almost infinite loop or an invalid power
setting resulting in driver initialization failure.

Cc: stable@vger.kernel.org
Fixes: fa6ad88e023d ("wifi: mt76: mt7921: fix country count limitation for CLC")
Signed-off-by: Leon Yen <leon.yen@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 86bd33b916a9..80ccd56409b3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1353,6 +1353,9 @@ int __mt7921_mcu_set_clc(struct mt792x_dev *dev, u8 *alpha2,
 		u16 len = le16_to_cpu(rule->len);
 		u16 offset = len + sizeof(*rule);
 
+		if (buf_len < offset)
+			break;
+
 		pos += offset;
 		buf_len -= offset;
 		if (rule->alpha2[0] != alpha2[0] ||
-- 
2.34.1


