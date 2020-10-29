Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD88C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 17:11:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5E4D20759
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 17:11:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TGETVg7a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MPcge86V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5E4D20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=33BGFs7J3TpsbcZpYF+xyoB4H3Etss8cAtYVn2JUA6A=; b=TGETVg7aEXDR0QrDwU8Wu5zoh
	t4sPmzXg/DQ0eUUu8g6c3GibmEWO7L4CdQUKotxsT3n9ttaY1GEDjjGFV3tptvWSwmlnMgN/dm3X0
	69U6uHTeYOJrSCb6vlHHXlGKT3vmbE/2TzwrrZnlsisTQsdpdwLhhjeW1EbaGjNhcGDOET1fS3Jg8
	9v3N/FeKwt9FxtQ/EcWoVkt45E4omPlJjkY+5b5zRZmZKiFFsHnt+xrVP+x+k12c8mMIijyRZf3nS
	krCyaY5HGnAqr2eNWGY0mlPU7NnseTM/7ZvRTTTOiJ5if+BbgvcFIe24cqYktt0R511uZwYQzwnDI
	x0hoaqXYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYBSU-0004WS-Ok; Thu, 29 Oct 2020 17:11:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYBSS-0004VG-Pp
 for linux-mediatek@lists.infradead.org; Thu, 29 Oct 2020 17:11:29 +0000
X-UUID: 3d404e608b594968aa92a5196d8d76d0-20201029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1Y/zeZh6Q1NIhynx9eUjorVoZ+repOhjvcxYnJbNTQs=; 
 b=MPcge86VybdKEUiqo58ZdLv/3lUMa+n5F/KK/qK6dt3k4Qu5grUI5nV/Ivw0BG4jIq/UM3QY0Rh5aSFXttlt2xol16/U33Ooltj54I7pXuiwzSfBmZFQkgmPtc94U9gnblwp7sxvdqXokJ8PkGg88vOVJQlZkzYzX3oTQoJTJBw=;
X-UUID: 3d404e608b594968aa92a5196d8d76d0-20201029
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 959597055; Thu, 29 Oct 2020 09:11:22 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 10:11:20 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Oct 2020 01:11:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 30 Oct 2020 01:11:18 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 2/3] mt76: mt7915: remove unused mt7915_mcu_bss_sync_tlv()
Date: Fri, 30 Oct 2020 01:11:16 +0800
Message-ID: <4e10985307260de60fea3fae0b6f41985136082c.1603988327.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <879705a8af8fa44c711feb3aa0351c1138aeef6c.1603988327.git.ryder.lee@mediatek.com>
References: <879705a8af8fa44c711feb3aa0351c1138aeef6c.1603988327.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_131128_983491_8854CC56 
X-CRM114-Status: GOOD (  10.56  )
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
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mt7915_mcu_bss_sync_tlv() is no longer used, so remove it.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 19 ++-----------------
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   | 11 +----------
 2 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 18383dcdaf35..ed767b28aa86 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -938,20 +938,6 @@ mt7915_mcu_bss_bmc_tlv(struct sk_buff *skb, struct mt7915_phy *phy)
 	}
 }
 
-static void
-mt7915_mcu_bss_sync_tlv(struct sk_buff *skb, struct ieee80211_vif *vif)
-{
-	struct bss_info_sync_mode *sync;
-	struct tlv *tlv;
-
-	tlv = mt7915_mcu_add_tlv(skb, BSS_INFO_SYNC_MODE, sizeof(*sync));
-
-	sync = (struct bss_info_sync_mode *)tlv;
-	sync->bcn_interval = cpu_to_le16(vif->bss_conf.beacon_int);
-	sync->dtim_period = vif->bss_conf.dtim_period;
-	sync->enable = true;
-}
-
 static int
 mt7915_mcu_muar_config(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 		       bool bssid, bool enable)
@@ -1019,9 +1005,8 @@ int mt7915_mcu_add_bss_info(struct mt7915_phy *phy,
 		if (vif->bss_conf.he_support)
 			mt7915_mcu_bss_he_tlv(skb, vif, phy);
 
-		if (mvif->omac_idx < EXT_BSSID_START)
-			mt7915_mcu_bss_sync_tlv(skb, vif);
-		else if (mvif->omac_idx < REPEATER_BSSID_START)
+		if (mvif->omac_idx >= EXT_BSSID_START &&
+		    mvif->omac_idx < REPEATER_BSSID_START)
 			mt7915_mcu_bss_ext_tlv(skb, mvif);
 	}
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 57446cd11c40..3e04a1f986cc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -387,15 +387,6 @@ struct bss_info_ext_bss {
 	u8 rsv[8];
 } __packed;
 
-struct bss_info_sync_mode {
-	__le16 tag;
-	__le16 len;
-	__le16 bcn_interval;
-	u8 enable;
-	u8 dtim_period;
-	u8 rsv[8];
-} __packed;
-
 struct bss_info_bmc_rate {
 	__le16 tag;
 	__le16 len;
@@ -513,7 +504,7 @@ enum {
 	BSS_INFO_LQ_RM,		/* obsoleted */
 	BSS_INFO_EXT_BSS,
 	BSS_INFO_BMC_RATE,	/* for bmc rate control in CR4 */
-	BSS_INFO_SYNC_MODE,
+	BSS_INFO_SYNC_MODE,	/* obsoleted */
 	BSS_INFO_RA,
 	BSS_INFO_HW_AMSDU,
 	BSS_INFO_BSS_COLOR,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
