Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5ED9C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 12:57:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8732120B1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 12:57:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R0auwFEI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EIYB4/3v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8732120B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2/QDAPm+M+prTExB8Z0/Ugdg2W9hcoIDJphq3U4738Q=; b=R0auwFEI+yqHBX
	4VoelNvEX88+qYKU2tdcx6Hh9XbGSYsrGnWisXtlXEEE4b8oMM0IEGzcghQJmshsmh/6JHdBLZDAx
	5gxLNcvOdHVoFsayAnRa6ruOSuNdY9LNRzpfbS/e/LGZPEv+m3GhFIMIIvNqYNpOjtTMLZY7qZ5wi
	uAzFlOHuZOC+lUcbF3K4DiDHSYuc9uawQPKlDo46j8yu+5jvdwTvr8LZUv673COP/xOvJLq9NODb6
	tsX1RUMXB5AQ7KfCSdtQDEpssQx8D5yjagcBsHCLs0Ph61JEbJkB1b4zd26FzHehdVbGagQOaM4Gz
	KQV5W03+EO5gfF1OEemw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlB9R-0005Cw-Tf; Tue, 16 Jun 2020 12:57:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlB9E-0004yO-3N
 for linux-mediatek@lists.infradead.org; Tue, 16 Jun 2020 12:57:06 +0000
X-UUID: b0c39a04d95a43bda17ad42a4aae2da8-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=EHgc6usT4G4/hgz5NXvICcMpwnoY3iXu64idsp5U1Jk=; 
 b=EIYB4/3vD7Ztr5GShYgQpCfwCH/+CrO1rW9aHe5l6dMI3WaPyvksPVPAGC1qhy2K4Z/h/+uGsGgR17DPOXrG10dqQXnzhIdqJtG+hJGvf+wPqFjNPl3C1uyjOOpB35tlCTaWKUgQArzBOUIvDTGPwmS/zt+8Eq63z3vU9NGWUcE=;
X-UUID: b0c39a04d95a43bda17ad42a4aae2da8-20200616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2118819590; Tue, 16 Jun 2020 04:56:49 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 05:47:06 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 20:46:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Jun 2020 20:46:58 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 3/4] mt76: mt7915: add support for DT rate power limits
Date: Tue, 16 Jun 2020 20:46:12 +0800
Message-ID: <279b29408c742c4b043e7af11217dcd5eeb7b8c2.1592276165.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <9ae2b6233284b60206e3513f7bf2eb03d2fbd724.1592276165.git.ryder.lee@mediatek.com>
References: <9ae2b6233284b60206e3513f7bf2eb03d2fbd724.1592276165.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 24678ACB82BEA57D358342FF229A7D0922D92586A8DF5F8F21FBBA311760836D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_055704_152161_74476E0F 
X-CRM114-Status: GOOD (  10.62  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support to limit per-rate max txpower from DT.

Tested-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/eeprom.h    |  2 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 38 +++++++++++++++++--
 2 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
index 4e31d6ab4fa6..284de8b4e0a4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
@@ -120,6 +120,6 @@ mt7915_tssi_enabled(struct mt7915_dev *dev, enum nl80211_band band)
 		return eep[MT_EE_WIFI_CONF + 7] & MT_EE_WIFI_CONF_TSSI0_2G;
 }
 
-extern const struct sku_group mt7915_sku_groups[];
+extern const struct sku_group mt7915_sku_groups[MAX_SKU_RATE_GROUP_NUM];
 
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 349163d0b7f2..c5e9893cbd87 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3171,15 +3171,45 @@ int mt7915_mcu_set_sku(struct mt7915_phy *phy)
 		.format_id = 4,
 		.dbdc_idx = phy != &dev->phy,
 	};
-	int i;
-	s8 *delta;
+	struct mt76_power_limits limits_array;
+	s8 *delta, *la = (s8 *)&limits_array;
+	int i, idx;
 
 	delta = dev->rate_power[mphy->chandef.chan->band];
 	mphy->txpower_cur = hw->conf.power_level * 2 +
 			    delta[MT7915_SKU_MAX_DELTA_IDX];
 
-	for (i = 0; i < MT7915_SKU_RATE_NUM; i++)
-		req.val[i] = hw->conf.power_level * 2 + delta[i];
+	mt76_get_rate_power_limits(mphy, mphy->chandef.chan,
+				   &limits_array, mphy->txpower_cur);
+
+	for (i = 0, idx = 0; i < ARRAY_SIZE(mt7915_sku_groups); i++) {
+		const struct sku_group *sku = &mt7915_sku_groups[i];
+		u32 offset = sku->offset[mphy->chandef.chan->band];
+		u8 mcs_num = sku->len;
+		int j;
+
+		if (i >= SKU_HT_BW20 && i <= SKU_VHT_BW160) {
+			mcs_num = 10;
+
+			if (i == SKU_HT_BW20 || i == SKU_VHT_BW20)
+				la = (s8 *)&limits_array + 12;
+		}
+
+		if (!offset) {
+			idx += sku->len;
+			la += mcs_num;
+			continue;
+		}
+
+		for (j = 0; j < min_t(u8, mcs_num, sku->len); j++) {
+			s8 rate_power;
+
+			rate_power = hw->conf.power_level * 2 + delta[idx + j];
+			req.val[idx + j] = min_t(s8, la[j], rate_power);
+		}
+		la += mcs_num;
+		idx += sku->len;
+	}
 
 	return __mt76_mcu_send_msg(&dev->mt76,
 				   MCU_EXT_CMD_TX_POWER_FEATURE_CTRL,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
