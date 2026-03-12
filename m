Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1D6FED2FD
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 09:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLxfmK/cRatiKWu0FXZh6VM3FJyy/lEMau3hNxqvd38=; b=SzD6zB5D6KZyMorHh6+UFB6zTs
	jabHDi2++1z0RI3jG9QYXC1oZAb5wZ/TXCHbUaH5uvpcIjJO1SRf9ajSrdB1ZZzNB3nkmVHzTtjNs
	uS+HQp+91D/AzbKehjw2G70iubzgRC691DRwHawqD3y+cqf+Rgvu4Y5X+uQ9FNP/w8gp1fF+EnhAi
	nF1IaiIydd7GntwyI9ARdjOPzipDz0A3ZQgXfHvC0JgMsT2B1a1+8hXsDhe54R1+WLsOknurrR3Hl
	QRBd73REXrMKYSsOhoTWjYCVr/Ivaa1U/ChIILarDOioLgejdNxZrKSKWVVzHHgq7C6o/AbYAcbOY
	exsC3Seg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0coZ-0000000Doa9-2pPa;
	Thu, 12 Mar 2026 09:58:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0coW-0000000DoYU-3z2t
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 09:58:46 +0000
X-UUID: 0ab92e301dfa11f19e7563141e833ce8-20260312
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FLxfmK/cRatiKWu0FXZh6VM3FJyy/lEMau3hNxqvd38=;
	b=P+5kOrp28EPtmAZXctmxVkU+fpNzLCw8UQryA1dzeJSN5Ig9Gky0AbGgvEsdKCBOvsM/lsoX9B3ASCrl7sUBU64BKSfQmStGQdB7OBmVrfPHcaGp/eok3WPIcAcVDmaxm59wzIMjKB1oMxMccU5sTpoVOBvaP3Qs/48/E0U+Xmg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:bb33d4dd-3930-4557-bdf2-9d3ec012f31f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:856ea4d4-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:5,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0ab92e301dfa11f19e7563141e833ce8-20260312
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1871509825; Thu, 12 Mar 2026 02:58:38 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Mar 2026 17:58:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Mar 2026 17:58:35 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Rex Lu
	<rex.lu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76 4/6] wifi: mt76: mt7996: adjust timeout value for boot-up calibration commands
Date: Thu, 12 Mar 2026 17:57:22 +0800
Message-ID: <20260312095724.2117448-4-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260312095724.2117448-1-shayne.chen@mediatek.com>
References: <20260312095724.2117448-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_025845_021560_4E3CD29C 
X-CRM114-Status: UNSURE (   8.80  )
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

From: Rex Lu <rex.lu@mediatek.com>

Align the vendor driver by adjusting the timeout values for the
MCU_UNI_CMD_EFUSE_CTRL and MCU_UNI_CMD_EXT_EEPROM_CTRL commands.
Without this adjustment, false positive command timeout errors may occur,
especially on some iPA variants.

Signed-off-by: Rex Lu <rex.lu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index bdb9e30c54c1..2a9c59d15894 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -271,7 +271,8 @@ mt7996_mcu_set_timeout(struct mt76_dev *mdev, int cmd)
 		mdev->mcu.timeout = 2 * HZ;
 		return;
 	case MCU_UNI_CMD_EFUSE_CTRL:
-		mdev->mcu.timeout = 20 * HZ;
+	case MCU_UNI_CMD_EXT_EEPROM_CTRL:
+		mdev->mcu.timeout = 30 * HZ;
 		return;
 	default:
 		break;
-- 
2.51.0


