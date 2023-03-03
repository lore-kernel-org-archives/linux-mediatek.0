Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0DEC678D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 08:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkXQkP4da8mUNlZce4Fs1EAaXDkAOn5QogpOZmkjTso=; b=XqAj8FnBP8At0Fh979zFxNtM8Q
	Tp5VTyG9q+2vcbSgK9DD0Fwkfz+r3vBti02ksh4cjiKH67rjWlnDzqJYHYT/HcnaP/GwYQZaSFHZM
	imZSsq1c+eJhN9Am36BEWaZKM7lrUZA+B/AVmJp+3nDt5moODMf2IFephaipAjSXf4jxIJ9PyeZLA
	qjZ/xpK28H/hj9A10CwoPP1aL2lVYxbiqXGHAvcY8RhAnXsVXoCIEErxPA5C4ifKSVu8Lu8uprZ/U
	OEAc4F59sx5J5NaerZL7KCiiP0tWq1SQxubhwWsGAdWk9UrZSf3dAKeh72r4AWKKz8ActbY2TbAUF
	T/OvLeKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0xC-005TGd-Uy; Fri, 03 Mar 2023 08:39:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0uf-005Rq6-0X
	for linux-mediatek@lists.infradead.org; Fri, 03 Mar 2023 08:37:15 +0000
X-UUID: 943b1ae2b99e11eda08d4d6090ec5a5c-20230303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IkXQkP4da8mUNlZce4Fs1EAaXDkAOn5QogpOZmkjTso=;
	b=Lx4DsVdmnERbXL3R1Nezxq7tBNnuMfP+UmlrxfaFZ28DmjRlbaByX5oKSz37/u/Bkqx6UzMJ6PLe8dzG+1EJIJIXquKrP+ZGBe8Rn8P5yIZUaqo3GhCN+nWcTI/FbKmg/tSSsJUO3rBClO/bwGI4ZTN2lLfwFf1Yd5KB4hSHVDw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:a11a03e2-e69b-4dfa-b0d4-c58ca83a5725,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:25b5999,CLOUDID:fb513b27-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 943b1ae2b99e11eda08d4d6090ec5a5c-20230303
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1419057291; Fri, 03 Mar 2023 01:37:06 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 3 Mar 2023 16:36:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 3 Mar 2023 16:36:31 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 7/7] wifi: mt76: mt7996: fix eeprom tx path bitfields
Date: Fri, 3 Mar 2023 16:35:58 +0800
Message-ID: <20230303083558.3586-7-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230303083558.3586-1-shayne.chen@mediatek.com>
References: <20230303083558.3586-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_003713_216246_93E32231 
X-CRM114-Status: UNSURE (   8.82  )
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

From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

Swap the tx path bitfields of band1 and band2 to read correct setting.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/eeprom.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.h
index 5571881f639b..0c749774f6b1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.h
@@ -31,11 +31,11 @@ enum mt7996_eeprom_field {
 #define MT_EE_WIFI_CONF2_BAND_SEL		GENMASK(2, 0)
 
 #define MT_EE_WIFI_CONF1_TX_PATH_BAND0		GENMASK(5, 3)
-#define MT_EE_WIFI_CONF2_TX_PATH_BAND1		GENMASK(5, 3)
-#define MT_EE_WIFI_CONF2_TX_PATH_BAND2		GENMASK(2, 0)
+#define MT_EE_WIFI_CONF2_TX_PATH_BAND1		GENMASK(2, 0)
+#define MT_EE_WIFI_CONF2_TX_PATH_BAND2		GENMASK(5, 3)
 #define MT_EE_WIFI_CONF4_STREAM_NUM_BAND0	GENMASK(5, 3)
-#define MT_EE_WIFI_CONF5_STREAM_NUM_BAND1	GENMASK(5, 3)
-#define MT_EE_WIFI_CONF5_STREAM_NUM_BAND2	GENMASK(2, 0)
+#define MT_EE_WIFI_CONF5_STREAM_NUM_BAND1	GENMASK(2, 0)
+#define MT_EE_WIFI_CONF5_STREAM_NUM_BAND2	GENMASK(5, 3)
 
 #define MT_EE_RATE_DELTA_MASK			GENMASK(5, 0)
 #define MT_EE_RATE_DELTA_SIGN			BIT(6)
-- 
2.39.2


