Return-Path: <SRS0=7lD3=ED=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50656C388F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 02:26:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C86722283
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 02:26:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j54Ej0+d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZlfUyj/w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C86722283
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B1Nbp7cNIHyPfwXfRIE74JUue025YWII1JXNnIhMkEY=; b=j54Ej0+dCQlxF1fquQ7c5FI4o
	C17GAqWRTywL/tOX+B8F9VwDGmQa+pE9zo5SS9PDiHuvc/gB8iojetp4Ls7TJV4ljD/XHKeVmMhm7
	zJFETMX4lUfXWTU5PEAv+4wHBMTxjsK8f7v/GlxR8kp3j9J0VDrAhronQ0zuwW1N5WPlr4JidVBY2
	/MOR/feFBfzP9R2a9LbW+7WPCa6on+gvDfAjAsA42QEZwB+sRiincUXEv50p4I4wZXaeLmbWvwnDL
	LJY8UbDFvcIegzIJRPyEqPDXiQq6kC2qXJEqwpVFzZiSwL9Rkn2MfYX6fp7uW+QsrTt07dW5IQuR9
	JathAmfzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXbAK-0006tQ-Dy; Wed, 28 Oct 2020 02:26:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXbAH-0006st-Q9
 for linux-mediatek@lists.infradead.org; Wed, 28 Oct 2020 02:26:18 +0000
X-UUID: a4d7fe032b094bf0ac77ad81bfb8f245-20201027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JkugRJeKy2/Hrcd9iL5Ifee/WNeQ4+/HGaw55rdaxEA=; 
 b=ZlfUyj/wUhy9YGFQD5og8uB4CRfXlgtS+l8wR3nmsqONd+v2F64Zh3SiVYHadbK1ut9qwYpwbhRWdGFR0D/gj4bO/VQtSBbG5p/0FWIUC59Us0Sr2DoxeaEsvfEoXpdYeyUXDtnw2AuG3SRSNl/nLchwTqLXRu4SOcYI0M8xCd4=;
X-UUID: a4d7fe032b094bf0ac77ad81bfb8f245-20201027
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 286379177; Tue, 27 Oct 2020 18:26:02 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Oct 2020 19:20:24 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Oct 2020 10:20:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 28 Oct 2020 10:20:22 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 2/2] mt76: mt7915: remove unused mt7915_mcu_bss_sync_tlv()
Date: Wed, 28 Oct 2020 10:20:21 +0800
Message-ID: <d4bad9e858de1f0f81951d1783c759f1b1e8179c.1603850919.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <879705a8af8fa44c711feb3aa0351c1138aeef6c.1603850919.git.ryder.lee@mediatek.com>
References: <879705a8af8fa44c711feb3aa0351c1138aeef6c.1603850919.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 59E9319954A9A32B902E4B116D53967F2EDCE26671AD6AF65EBC524CB4E5D1D32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_222618_061465_EA87EC98 
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
index 18383dcdaf35..b08d71996e55 100644
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
+		if (mvif->omac_idx > EXT_BSSID_START &&
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
