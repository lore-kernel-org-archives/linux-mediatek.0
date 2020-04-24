Return-Path: <SRS0=cCBG=6I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A1EC54FD0
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2020 19:43:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57783216FD
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2020 19:43:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kNR3O8bi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="j9bZVnSu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57783216FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WRlV7Ix75o4XosyEQAh257o5qP1O0kaRT83DBXJ929g=; b=kNR3O8biIg/fYi
	VEZmS6gsZ3ERvmr1y4JDqYUE8orKbdSiOUWrFdbYq1x9/6SWPDVIBCDkm4GNlIvsiF7BbZUn8otAV
	Snnm0hKT/2YVpUnRMkiWMlrrkysedQg0venD+hD/KDmjEs5ByiSlSWKxvJJRBukZApSEikJrJOpd9
	8uc6NFRyJnLT8171/aR7Zh0ZFrNrHXrcL+TUvaMWIQTC78djlGUWs05KGTMWE6qcepj3CbtJu3bjM
	XjMuV4S70Ph7e7LoHz9m+XJ5q0aoKzxX9Yuatf4ZQSPs8f0dV3miWPfVSDERnhpnxOJTIs6SdMI2v
	96eF4eTfjXuD0+hGGAyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS4EP-0006Mn-IX; Fri, 24 Apr 2020 19:43:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS4EC-000625-SI
 for linux-mediatek@lists.infradead.org; Fri, 24 Apr 2020 19:43:14 +0000
X-UUID: 1760b9b7ecf14222b782cafea2c8ea30-20200424
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6x+oFqiIGQnnKYYcf2KhwLTXjjhGL/WPlXmNOrOE1gI=; 
 b=j9bZVnSuzfVueZcpZ3rJANPJT4I6adN0adQOPAbOC77mgpL58r8Q8JWD9pJZoIaTpDL96RVxmGbr2E6rV3GMgzvSlYpokIFUDyz3en5uNRXfLkPPXzEDCkLCCbK+K9ZOHwkRpLoq9l4KJsoHJ4ewYVAg4UBrbm0KQqSW37s0pb8=;
X-UUID: 1760b9b7ecf14222b782cafea2c8ea30-20200424
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1921811953; Fri, 24 Apr 2020 11:43:06 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Apr 2020 12:33:01 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 25 Apr 2020 03:32:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 25 Apr 2020 03:32:51 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v3 07/18] mt76: mt7915: enable Rx HE rate reporting
Date: Sat, 25 Apr 2020 03:32:28 +0800
Message-ID: <2dcb775842199f2e4de1c823f2d8e048b352eebb.1587756404.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1587756404.git.ryder.lee@mediatek.com>
References: <cover.1587756404.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: BE577BE27BEE5889C9CBD23C81B0B930AFEFB468DC7B58C355744931D24A6B592000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_124312_925256_5DE3E091 
X-CRM114-Status: GOOD (  10.27  )
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
Cc: YF Luo <yf.luo@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, Sean
 Wang <sean.wang@mediatek.com>, Chih-Min Chen <chih-min.chen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enable HE rate reporting in Rx path

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  |  2 ++
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 27 +++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7915/mac.h   |  2 ++
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  1 +
 4 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index fb596afdf0be..f9384e1dab74 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -43,6 +43,8 @@ static void mt7915_mac_init(struct mt7915_dev *dev)
 
 	mt76_rmw_field(dev, MT_DMA_DCR0, MT_DMA_DCR0_MAX_RX_LEN, 1536);
 	mt76_rmw_field(dev, MT_MDP_DCR1, MT_MDP_DCR1_MAX_RX_LEN, 1536);
+	/* enable rx rate report */
+	mt76_set(dev, MT_DMA_DCR0, MT_DMA_DCR0_RXD_G5_EN);
 	/* disable hardware de-agg */
 	mt76_clear(dev, MT_MDP_DCR0, MT_MDP_DCR0_DAMSDU_EN);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index ddba360046c3..dd5b30a066b3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -347,6 +347,22 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 				if (i > 9)
 					return -EINVAL;
 				break;
+			case MT_PHY_TYPE_HE_MU:
+				/* fall through */
+			case MT_PHY_TYPE_HE_SU:
+			case MT_PHY_TYPE_HE_EXT_SU:
+			case MT_PHY_TYPE_HE_TB:
+				status->nss =
+					FIELD_GET(MT_PRXV_NSTS, rxv.v[0]) + 1;
+				status->encoding = RX_ENC_HE;
+				i &= GENMASK(3, 0);
+
+				if (gi <= NL80211_RATE_INFO_HE_GI_3_2)
+					status->he_gi = gi;
+
+				if (idx & MT_PRXV_TX_DCM)
+					status->he_dcm = true;
+				break;
 			default:
 				return -EINVAL;
 			}
@@ -356,7 +372,14 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 			case IEEE80211_STA_RX_BW_20:
 				break;
 			case IEEE80211_STA_RX_BW_40:
-				status->bw = RATE_INFO_BW_40;
+				if (rxv.phy & MT_PHY_TYPE_HE_EXT_SU &&
+				    (idx & MT_PRXV_TX_ER_SU_106T)) {
+					status->bw = RATE_INFO_BW_HE_RU;
+					status->he_ru =
+						NL80211_RATE_INFO_HE_RU_ALLOC_106;
+				} else {
+					status->bw = RATE_INFO_BW_40;
+				}
 				break;
 			case IEEE80211_STA_RX_BW_80:
 				status->bw = RATE_INFO_BW_80;
@@ -369,7 +392,7 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 			}
 
 			status->enc_flags |= RX_ENC_FLAG_STBC_MASK * stbc;
-			if (gi)
+			if (rxv.phy < MT_PHY_TYPE_HE_SU && gi)
 				status->enc_flags |= RX_ENC_FLAG_SHORT_GI;
 		}
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
index 7da7551f98e4..712753484aee 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
@@ -97,6 +97,8 @@ enum rx_pkt_type {
 
 /* P-RXV */
 #define MT_PRXV_TX_RATE			GENMASK(6, 0)
+#define MT_PRXV_TX_DCM			BIT(4)
+#define MT_PRXV_TX_ER_SU_106T		BIT(5)
 #define MT_PRXV_NSTS			GENMASK(9, 7)
 #define MT_PRXV_HT_AD_CODE		BIT(11)
 #define MT_PRXV_RCPI3			GENMASK(31, 24)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index ef87579056fe..572bdc16fb2d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -73,6 +73,7 @@
 
 #define MT_DMA_DCR0			MT_WF_DMA(0x000)
 #define MT_DMA_DCR0_MAX_RX_LEN		GENMASK(15, 3)
+#define MT_DMA_DCR0_RXD_G5_EN		BIT(23)
 
 /* MIB: band 0(0x24800), band 1(0xa4800) */
 #define MT_WF_MIB_BASE(_band)		((_band) ? 0xa4800 : 0x24800)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
