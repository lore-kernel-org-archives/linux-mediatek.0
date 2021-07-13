Return-Path: <SRS0=Rt7e=MF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C03B6C07E95
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 20:16:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85C9A61360
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 20:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85C9A61360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k0Jpwz7HOVTGlDj18WpVm4OYrWxx4XO7RnIfNIyUhc4=; b=u6UDy7iPgUePha
	dG3juBcOjyBKhJHt+CmzmJ/pXFTsjiv6MRkSYtB0Vb8OSTTvw5tJ9E8lq1g/J4kOKrV8Ra+6Ksdvu
	6HbGJ5Tk3GNLujg4ADf67biky4E1bLihGfsflYJEdFNcxHG/ILR6zb8KTSHycyaHYAXBtSch/wiFv
	1cypKsVhA+OKBYCcX8SxZ3AsDe3Qj0HMfQN/UcqAN21Xz3ZQzTG0zBKQko2Q+zZoyZ4r49dbIStao
	/bCJ189l526GuNCMvNr1eh420/KOgcpiyl3mtjdFlPCdY89v+xXfZhOKh44McH5WiqfmRrf9DNaT8
	YWq0D4qL4xxXqgmxRbJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3OpE-00BI6N-Lz; Tue, 13 Jul 2021 20:16:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3OpA-00BI5A-FN
 for linux-mediatek@lists.infradead.org; Tue, 13 Jul 2021 20:16:15 +0000
X-UUID: 7888eeb7a20940cb8f6c9c365e63ee21-20210713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=hzNcWn68U4UfJzk4pKLOsUiGSNeHyLTbDgJVrc/a55g=; 
 b=FWQyY10b6EuZFv8Fh2LjwzeKvhtVmwhT1vwaHyGJmT5rNbCPpuYZ3BvuD42V0amQnyEKtFK/z3Zg6q6H9Jt2AMzK/IuErAbjigi7BWOuofQYmj7MSUgpJemtopjjZC1N1jssKdq7/NgfX2XKfXILn1/ajGFXBrgpYYGq5JrHQxk=;
X-UUID: 7888eeb7a20940cb8f6c9c365e63ee21-20210713
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2080234158; Tue, 13 Jul 2021 13:16:09 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Jul 2021 13:16:07 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 04:16:06 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 14 Jul 2021 04:16:06 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 3/4] mt76: mt7921: fix mgmt frame using unexpected bitrate
Date: Wed, 14 Jul 2021 04:16:00 +0800
Message-ID: <3d68ff612bacf2c8d2b7b414f2b3cf14daf443f8.1626207204.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <92a8ecfdf198b34f98d5c1489a83adf151657760.1626207204.git.objelf@gmail.com>
References: <92a8ecfdf198b34f98d5c1489a83adf151657760.1626207204.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_131613_970877_5DCF42D9 
X-CRM114-Status: GOOD (  13.32  )
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

From: Sean Wang <sean.wang@mediatek.com>

Fix the current driver mgmt frame is not respecting the basic rates field
provided by the AP and then unconditionally is using the lowest (1 or 6
Mbps) rate.

For example, if the AP only supported basic rate {24, 36, 48, 54} Mbps,
mt7921 cannot send mgmt frame with the rate not in the group. So,
instead, we pick up the lowest basic rate the AP can support to send.

Fixes: 163f4d22c118 ("mt76: mt7921: add MAC support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2:  1. introduce another patch ("mt76: fix mt76_rates for the multiple devices")
	for those devices which have the same issue.
     2. drop the own mt7921_rates, the unused macro and variable.
v3:  1. introduce and rely on another patch
	("mt76: add mt76_default_basic_rate more devices can rely on").
     2. add Fixes tag.
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c    | 5 +----
 drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h | 2 --
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 7fe2e3a50428..a4ce362286eb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -815,10 +815,7 @@ void mt7921_mac_write_txwi(struct mt7921_dev *dev, __le32 *txwi,
 		/* hardware won't add HTC for mgmt/ctrl frame */
 		txwi[2] |= cpu_to_le32(MT_TXD2_HTC_VLD);
 
-		if (mphy->chandef.chan->band == NL80211_BAND_5GHZ)
-			rate = MT7921_5G_RATE_DEFAULT;
-		else
-			rate = MT7921_2G_RATE_DEFAULT;
+		rate = mt76_default_basic_rate(mphy, vif);
 
 		val = MT_TXD6_FIXED_BW |
 		      FIELD_PREP(MT_TXD6_TX_RATE, rate);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 2d8bd6bfc820..be16d528a923 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -38,8 +38,6 @@
 
 #define MT7921_CFEND_RATE_DEFAULT	0x49	/* OFDM 24M */
 #define MT7921_CFEND_RATE_11B		0x03	/* 11B LP, 11M */
-#define MT7921_5G_RATE_DEFAULT		0x4b	/* OFDM 6M */
-#define MT7921_2G_RATE_DEFAULT		0x0	/* CCK 1M */
 
 #define MT7921_SKU_RATE_NUM		161
 #define MT7921_SKU_MAX_DELTA_IDX	MT7921_SKU_RATE_NUM
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
