Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B24C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 08:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfl+wlLFHwlaMXpIMIdFKWw2vPASYSm+VKmoYkZ4zsk=; b=J2FgTrTTS9XlF98vTynnlqcWjJ
	aYrJ5YeOpfXQduqOd7nFIj9cdWJzNrl2KIzlNGIeAhnuliKrtZPf3Hed2M0i1hdXkWRMiwLjy3dtA
	AFvhuAX+uqU/KzhHZMF4KIHSVRgEHwJOmoumAbjrecm39pmF9INy0h20m8GJOT8d300J6eXTHWOd+
	32vGXd1nuFIWwrjXcviZOGMURnJ8SdQNDFp1//gS29ixhzL4TWBJSnW6TtbKI5X0sltR0VQxCBGUl
	sNgZKgekXvMKuqY23BU07vtxS2ep/c3ER9F7Hpr0dXlkMHmTLDWBXwcV+k5qwIs+kDIq/TbYIroHT
	rs9BtYxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0wv-005T5g-If; Fri, 03 Mar 2023 08:39:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0uc-005RoR-Tq
	for linux-mediatek@lists.infradead.org; Fri, 03 Mar 2023 08:37:13 +0000
X-UUID: 93ebcb40b99e11eda08d4d6090ec5a5c-20230303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wfl+wlLFHwlaMXpIMIdFKWw2vPASYSm+VKmoYkZ4zsk=;
	b=GwTHxVVkImwGT3otIPETFdgtF6/uZFIMdnPjr75PT5g33cVfq6TpUJe5lP9G1V6m9p6aqp0X7whZLqDw6EGXC0qem21K8GbhDz1xnfSZ9ing6FlSoaJv7+7gwYBnenTYYDdhqan1+VDSKsDvoAYgEQdsRzlgF4OdqVupdsdzKF8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:35c3d427-92ad-4044-b54f-e8bb70f287f7,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:25b5999,CLOUDID:fe513b27-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 93ebcb40b99e11eda08d4d6090ec5a5c-20230303
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1121468090; Fri, 03 Mar 2023 01:37:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 3 Mar 2023 16:36:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 3 Mar 2023 16:36:30 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 3/7] wifi: mt76: mt7996: remove unused eeprom band selection
Date: Fri, 3 Mar 2023 16:35:54 +0800
Message-ID: <20230303083558.3586-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230303083558.3586-1-shayne.chen@mediatek.com>
References: <20230303083558.3586-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_003711_058656_E8E6A598 
X-CRM114-Status: UNSURE (   8.87  )
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

Tri-band chipsets support one band on each a-die, so remove the unused
definition of eeprom band selection.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c | 4 ----
 drivers/net/wireless/mediatek/mt76/mt7996/eeprom.h | 1 -
 2 files changed, 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
index 2e48c5a40f81..544b6c6f1ea3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
@@ -138,10 +138,6 @@ static int mt7996_eeprom_parse_band_config(struct mt7996_phy *phy)
 	case MT_EE_BAND_SEL_6GHZ:
 		phy->mt76->cap.has_6ghz = true;
 		break;
-	case MT_EE_BAND_SEL_5GHZ_6GHZ:
-		phy->mt76->cap.has_5ghz = true;
-		phy->mt76->cap.has_6ghz = true;
-		break;
 	default:
 		ret = -EINVAL;
 		break;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.h
index 8da599e0abea..5571881f639b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.h
@@ -46,7 +46,6 @@ enum mt7996_eeprom_band {
 	MT_EE_BAND_SEL_2GHZ,
 	MT_EE_BAND_SEL_5GHZ,
 	MT_EE_BAND_SEL_6GHZ,
-	MT_EE_BAND_SEL_5GHZ_6GHZ,
 };
 
 static inline int
-- 
2.39.2


