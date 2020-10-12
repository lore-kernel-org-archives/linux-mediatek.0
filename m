Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 721BFC433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 12:56:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD7A821BE5
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 12:56:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NbQQCs/o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cZgcmUM7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD7A821BE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9LLAik5uCVkX6R04GuvnlTZZDWuzJHSUtje2jowlswU=; b=NbQQCs/oMNu44wTcEpkI7s+0E
	5YOFL8II5L2SUD07WgpPm9agblQnG2+zssv/U13wgir7eNrttdA7+fzONQwBTsUjTYokmemN6iNGH
	krUZDZnWMa3kDxqxQb4zQQLbtNFU7tQJ4vmcfBPHHkKsEZjeIGhT8n4SoY3PfV5Ih/pnfPWaiKUJD
	8tplpEnt9i/VtIlBu7G3q6FKiwVS5S2944zYtfKcuZULQgxSfIkaMYHaoIdhpuVlMEY82l2KYjBCO
	hSGSOcXGCQUFBxcNe+0HyEQASfbtLOGC4otViHvlqh3SZpSYOeJFpPcWb7zQnLuEBsnYtIXeqk1FW
	F2CZ5WGoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRxNE-0000Qc-SN; Mon, 12 Oct 2020 12:56:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRxN3-0000II-AZ
 for linux-mediatek@lists.infradead.org; Mon, 12 Oct 2020 12:56:13 +0000
X-UUID: 846c8afc96424284b0fd564c0ba03253-20201012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1C3zflfx2s+KzWYaoiZsMJZCys0IJqzAQ1/HIbiKSH4=; 
 b=cZgcmUM7OpJ0KbxL+86SzimiajFdHm4UCVIQbBZCTZDteP4qQLTg2p9TR8s1it8jXd0UXLPt5XvHGeVq6RayZEEL7zaycOj1bm1MIIy1ip+CWHpBSJXw+c/l2GTg4S5ICxRRkEI9LfdAEMzb39Qdq9AJDmsrHUn8oWdcu5WN6kE=;
X-UUID: 846c8afc96424284b0fd564c0ba03253-20201012
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1976274255; Mon, 12 Oct 2020 04:56:06 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Oct 2020 05:56:04 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Oct 2020 20:55:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 12 Oct 2020 20:55:56 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH v3 06/10] mt76: testmode: add support for HE rate modes
Date: Mon, 12 Oct 2020 20:53:59 +0800
Message-ID: <20201012125403.8608-6-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201012125403.8608-1-shayne.chen@mediatek.com>
References: <20201012125403.8608-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_085609_551904_06EEF60A 
X-CRM114-Status: GOOD (  11.76  )
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

Extend enum mt76_testmode_tx_mode to support various HE rate modes.

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/testmode.c | 6 +++++-
 drivers/net/wireless/mediatek/mt76/testmode.h | 8 ++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/testmode.c b/drivers/net/wireless/mediatek/mt76/testmode.c
index f37a460..d1b1716 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/testmode.c
@@ -84,6 +84,10 @@ mt76_testmode_tx_init(struct mt76_dev *dev)
 	info->flags = IEEE80211_TX_CTL_INJECTED |
 		      IEEE80211_TX_CTL_NO_ACK |
 		      IEEE80211_TX_CTL_NO_PS_BUFFER;
+
+	if (td->tx_rate_mode > MT76_TM_TX_MODE_VHT)
+		goto out;
+
 	rate = &info->control.rates[0];
 	rate->count = 1;
 	rate->idx = td->tx_rate_idx;
@@ -152,7 +156,7 @@ mt76_testmode_tx_init(struct mt76_dev *dev)
 			break;
 		}
 	}
-
+out:
 	skb_set_queue_mapping(skb, IEEE80211_AC_BE);
 
 	return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/testmode.h b/drivers/net/wireless/mediatek/mt76/testmode.h
index 3c09aa5..7efad68 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/testmode.h
@@ -147,12 +147,20 @@ enum mt76_testmode_state {
  * @MT76_TM_TX_MODE_OFDM: legacy OFDM mode
  * @MT76_TM_TX_MODE_HT: 802.11n MCS
  * @MT76_TM_TX_MODE_VHT: 802.11ac MCS
+ * @MT76_TM_TX_MODE_HE_SU: 802.11ax single-user MIMO
+ * @MT76_TM_TX_MODE_HE_EXT_SU: 802.11ax extended-range SU
+ * @MT76_TM_TX_MODE_HE_TB: 802.11ax trigger-based
+ * @MT76_TM_TX_MODE_HE_MU: 802.11ax multi-user MIMO
  */
 enum mt76_testmode_tx_mode {
 	MT76_TM_TX_MODE_CCK,
 	MT76_TM_TX_MODE_OFDM,
 	MT76_TM_TX_MODE_HT,
 	MT76_TM_TX_MODE_VHT,
+	MT76_TM_TX_MODE_HE_SU,
+	MT76_TM_TX_MODE_HE_EXT_SU,
+	MT76_TM_TX_MODE_HE_TB,
+	MT76_TM_TX_MODE_HE_MU,
 
 	/* keep last */
 	NUM_MT76_TM_TX_MODES,
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
