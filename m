Return-Path: <SRS0=znLv=M6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E19FC4320A
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Aug 2021 03:14:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12DB960F22
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Aug 2021 03:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12DB960F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=flUyrMI3prgPvG8enRUf/LZAHDl5NXEm+IVOP8VieBQ=; b=dvPPtUSLCbbMUa
	zFi+zugx5lSoo5GE+nOLz7brtD6T0Vs7FrI0qVpGFDjaepZkzcx6TBrR1tl8FWXhHHm6DsSa8cCM2
	dtzotzDPorjg7cTnr9Nu1NARqTHuWPD2hfwBKC4SFG3VEZQdx2lWJAVCrfsFnvJ4X9B89x9v7x+eS
	PfobIJwrquioxlW4f+sLhhylrlx3vgfmttGN08+RzwxfVjrylWLIbFSND8pRNNCmJ2P22Qg4G0iri
	aob1Ty1PhDEnlrbPy7bA4BIQut2+DHWIoDemS3dScRE/oKUY9qkOu41eRyDurwzSdMPCiTlJ/6S3k
	JD9EgC57XPrkKBcvGwyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCCnL-00E4Yg-Hk; Sat, 07 Aug 2021 03:14:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCCnF-00E4XS-TT
 for linux-mediatek@lists.infradead.org; Sat, 07 Aug 2021 03:14:41 +0000
X-UUID: b5ed3328b3b940b8a60dce22eb66b0cc-20210806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=dBvG3P7/fwLo4FxjSOzCExj+Fv2g9A5C1Bk0PdXn9x8=; 
 b=A12/VBga9n/Gz8VKoNNotBQvZB6Qxjxxb3lERYkMu5ULYZHs0QmnKeL+e6INJeuiAKPEaG7YjC5aziiZgABue2m9yvMH91ZE7vy9639iIXmJaAKhIufWvPP/AGEombqU4i/bnY1KdHSKLprBcTH8nrRlA6nuVDOKw+n/PoY3yFM=;
X-UUID: b5ed3328b3b940b8a60dce22eb66b0cc-20210806
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2098991272; Fri, 06 Aug 2021 20:14:30 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Aug 2021 20:14:29 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 7 Aug 2021 11:14:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 7 Aug 2021 11:14:28 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH 3/4] mt76: mt7915: add HE-LTF into fixed rate command
Date: Sat, 7 Aug 2021 11:14:23 +0800
Message-ID: <c3fd9c4ea692f28e2eb78073fd8da7753199ba60.1628301616.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <77372f644903053e09d671325c0cd44cf75e14ac.1628301615.git.ryder.lee@mediatek.com>
References: <77372f644903053e09d671325c0cd44cf75e14ac.1628301615.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_201437_997301_EE1DE851 
X-CRM114-Status: GOOD (  11.34  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add HE-LTF control.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c |  4 +++-
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c     | 13 +++++++------
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.h     |  1 +
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 1a48b09d0cb7..d9d18f662039 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -365,12 +365,14 @@ int mt7915_init_debugfs(struct mt7915_dev *dev)
 #ifdef CONFIG_MAC80211_DEBUGFS
 /** per-station debugfs **/
 
-/* usage: <tx mode> <ldpc> <stbc> <bw> <gi> <nss> <mcs> */
 static int mt7915_sta_fixed_rate_set(void *data, u64 rate)
 {
 	struct ieee80211_sta *sta = data;
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
 
+	/* usage: <he ltf> <tx mode> <ldpc> <stbc> <bw> <gi> <nss> <mcs>
+	 * <tx mode>: see enum mt76_phy_type
+	 */
 	return mt7915_mcu_set_fixed_rate(msta->vif->phy->dev, sta, rate);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 8ece8bf907cc..59731c1831ea 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2312,10 +2312,9 @@ int mt7915_mcu_set_fixed_rate(struct mt7915_dev *dev,
 	if (!rate) {
 		ra->field = cpu_to_le32(RATE_PARAM_AUTO);
 		goto out;
-	} else {
-		ra->field = cpu_to_le32(RATE_PARAM_FIXED);
 	}
 
+	ra->field = cpu_to_le32(RATE_PARAM_FIXED);
 	ra->phy.type = FIELD_GET(RATE_CFG_PHY_TYPE, rate);
 	ra->phy.bw = FIELD_GET(RATE_CFG_BW, rate);
 	ra->phy.nss = FIELD_GET(RATE_CFG_NSS, rate);
@@ -2328,10 +2327,12 @@ int mt7915_mcu_set_fixed_rate(struct mt7915_dev *dev,
 		ra->phy.ldpc = FIELD_GET(RATE_CFG_LDPC, rate) * 7;
 
 	/* HT/VHT - SGI: 1, LGI: 0; HE - SGI: 0, MGI: 1, LGI: 2 */
-	if (ra->phy.type > MT_PHY_TYPE_VHT)
-		ra->phy.sgi = ra->phy.mcs * 85;
-	else
-		ra->phy.sgi = ra->phy.mcs * 15;
+	if (ra->phy.type > MT_PHY_TYPE_VHT) {
+		ra->phy.he_ltf = FIELD_GET(RATE_CFG_HE_LTF, rate) * 85;
+		ra->phy.sgi = FIELD_GET(RATE_CFG_GI, rate) * 85;
+	} else {
+		ra->phy.sgi = FIELD_GET(RATE_CFG_GI, rate) * 15;
+	}
 
 out:
 	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index d109548994cf..2b47cdf0fd17 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -945,6 +945,7 @@ struct sta_rec_ra_fixed {
 #define RATE_CFG_STBC			GENMASK(19, 16)
 #define RATE_CFG_LDPC			GENMASK(23, 20)
 #define RATE_CFG_PHY_TYPE		GENMASK(27, 24)
+#define RATE_CFG_HE_LTF			GENMASK(31, 28)
 
 struct sta_rec_bf {
 	__le16 tag;
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
