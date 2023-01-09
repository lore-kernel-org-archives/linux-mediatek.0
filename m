Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38978C54EBD
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 16:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZlMwvfhwoUkdzlQ3h62moM15CiXQy5uhi6PS/uNxPw=; b=QOheqzrkNo5I92ClChBbpP39ck
	vLjiTftaKc138UTneFBA5DdEt/Ogpy7URZMh3q0yKeiWEUNF7VGLEUQrQtjlMAnA2c4fBHmoIp74g
	FySEk9DoC8Jj95pTOmsrWOjzz/gMq80c1zdjMqOXH2dzFJdrvKZ1GnTbgQGlvHYVH9d86Xy58mU3V
	2zG16/nv23SBy/Sj3lFYGxbeRX8p/GMlQIAb6FAwbh3bYZNMDpM7OVUZaYWP6xvr7cdeO0uON3sr0
	RhmDJGZLZBDHoj9n8ek/+eHfhCLZrMkPkn2KoWGn7PD4PDER5U9h3dMwFUivBPTWYR04ypF71GfqO
	WT6ZFKLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvTt-002jjZ-QE; Mon, 09 Jan 2023 16:58:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvTr-002jgp-1k
	for linux-mediatek@bombadil.infradead.org; Mon, 09 Jan 2023 16:58:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sZlMwvfhwoUkdzlQ3h62moM15CiXQy5uhi6PS/uNxPw=; b=Uqykk/jFWKJDdHmVeD79bmINcZ
	eQUHiI9QM36RMA0G6dex50Fb9vTklVn7NKlXH0Mc1UwB3gH7Wh/8oewyRUrVblOLlTShRoWqgXzJ4
	vTQ9w72+RE+GyJLc7yy8MdScVAW152rMdMP7JwEwnRJYsPSaDVn7GijA7B44faRDEJTUDV4bHFGa7
	Hm7dFfHOeO1MyfjvBXLpRRtPuW6ZXdmCnhayFYlOhIy5Whzy+yFQZIMrFYTVJ7giNNd5k27Lq0G6I
	7HrRgzwLqGsY2IXu9DU5qmOIyMRHJcR5KJ1RbUvaJNXPVARirwxT3Roo8/trd10Fg5GBau2LM+QNZ
	/ZFd6Ziw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pEvTZ-002mky-0L
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Jan 2023 16:58:24 +0000
X-UUID: 1df63c4d8e964953b5cbbf245b1b64ad-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sZlMwvfhwoUkdzlQ3h62moM15CiXQy5uhi6PS/uNxPw=;
	b=Vfm/jzsSkLC7YftClLY5Nvhw9sSf/ATH8G9dpLITK66TvdDL5g0ibfzDJ9cPGyK3s4TuMPukIEuA621/z98qlEKiO7ni4EkbaCF09WxSZI473WnWuESOLqi/ZFUQgyQJ7BM2qHSvp+Bqsps8/UlpBOjAFSKxcM655NWA9cD4SFc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:d19339a5-c565-403c-b056-d671ba64748d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.17,REQID:d19339a5-c565-403c-b056-d671ba64748d,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:543e81c,CLOUDID:c3c84af5-ff42-4fb0-b929-626456a83c14,B
	ulkID:230110005808ZCIL87UO,BulkQuantity:0,Recheck:0,SF:28|17|19|48,TC:nil,
	Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0
X-CID-BVR: 0
X-UUID: 1df63c4d8e964953b5cbbf245b1b64ad-20230109
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1342868430; Mon, 09 Jan 2023 09:58:07 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 10 Jan 2023 00:58:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 00:58:04 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 01/13] wifi: mt76: add EHT phy type
Date: Tue, 10 Jan 2023 00:57:19 +0800
Message-ID: <20230109165731.682-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230109165731.682-1-shayne.chen@mediatek.com>
References: <20230109165731.682-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_165822_070097_3308F512 
X-CRM114-Status: GOOD (  10.69  )
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

Extend phy type and phymode bitfields for EHT support.
This is the preliminary patch to add EHT support for mt7996.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h            | 7 +++++--
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 4 ++++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 1037d23bc4d0..9fa8c5f63801 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -264,11 +264,14 @@ enum mt76_phy_type {
 	MT_PHY_TYPE_HE_EXT_SU,
 	MT_PHY_TYPE_HE_TB,
 	MT_PHY_TYPE_HE_MU,
-	__MT_PHY_TYPE_HE_MAX,
+	MT_PHY_TYPE_EHT_SU = 13,
+	MT_PHY_TYPE_EHT_TRIG,
+	MT_PHY_TYPE_EHT_MU,
+	__MT_PHY_TYPE_MAX,
 };
 
 struct mt76_sta_stats {
-	u64 tx_mode[__MT_PHY_TYPE_HE_MAX];
+	u64 tx_mode[__MT_PHY_TYPE_MAX];
 	u64 tx_bw[4];		/* 20, 40, 80, 160 */
 	u64 tx_nss[4];		/* 1, 2, 3, 4 */
 	u64 tx_mcs[16];		/* mcs idx */
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 82fdf6d794bc..947b0900daec 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -882,12 +882,16 @@ enum {
 #define PHY_MODE_AX_5G				BIT(7)
 
 #define PHY_MODE_AX_6G				BIT(0) /* phymode_ext */
+#define PHY_MODE_BE_24G				BIT(1)
+#define PHY_MODE_BE_5G				BIT(2)
+#define PHY_MODE_BE_6G				BIT(3)
 
 #define MODE_CCK				BIT(0)
 #define MODE_OFDM				BIT(1)
 #define MODE_HT					BIT(2)
 #define MODE_VHT				BIT(3)
 #define MODE_HE					BIT(4)
+#define MODE_EHT				BIT(5)
 
 #define STA_CAP_WMM				BIT(0)
 #define STA_CAP_SGI_20				BIT(4)
-- 
2.25.1


