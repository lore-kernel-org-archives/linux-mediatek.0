Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99A7C433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 16:21:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A05D2080A
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 16:21:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mpRFmHsm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sMg9/8q2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A05D2080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bEVxuXkHJsZGLHbhX5S9Cked1lW78hHFg0hOGargpfQ=; b=mpRFmHsmtPnylynfDRxLCYC96m
	J33vkmKsq/r8OGZkb0ANToQPz6Q8IeSwsJ1PrpfWrbb+yUiX9DMpd79RowiPC4tvwbXFtbcEVxisg
	RE6nZqgI70JGGmNzr6cts8DQMkjCK2EaLVVis18NHJnUyLI2mp02SuFEkP1sV7+lL20aliWn6oG1+
	+IPblqJua/huJbFcc5wHQmWKAQW8Vwyx7VNyN/t5uOQ/n7eOvVQFVAr2IWAJdEOspEubXde6upoya
	17Z3LrUqunTD1sJiO9wN22+ldZU2Hlex7XYZByzMQKRAaDc+EW1bKom7R7iYX/xbo/pbOiFI0y3fx
	U2Zj15Dw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kS0Zu-00015Y-60; Mon, 12 Oct 2020 16:21:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kS0Zq-000144-Tz
 for linux-mediatek@lists.infradead.org; Mon, 12 Oct 2020 16:21:36 +0000
X-UUID: 759353695ceb4ef9899fb8fbcf221c8c-20201012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=waJ1Cl7TmNEDBI+o8ifx+7GweQsvOZGboSlY0FOCwaY=; 
 b=sMg9/8q2/vuSQXz9nw8eO2u27/svQ8kop974j2b+NTy2JphMvCcYNAtigGPGSzL/eiMIbPzeV+GJE8FS8N8Xg9HuxLHIZ5iJ21rdIzi0DwiCPynF0d+CZBpVrBbpKjIFjzHP+WR69S37A5y3NmM2exypN0jzmk2s41MS6anVATQ=;
X-UUID: 759353695ceb4ef9899fb8fbcf221c8c-20201012
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 62249246; Mon, 12 Oct 2020 08:21:27 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Oct 2020 09:21:25 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 00:21:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 13 Oct 2020 00:21:22 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: mt7915: fix sparse warning cast from restricted __le16
Date: Tue, 13 Oct 2020 00:21:21 +0800
Message-ID: <bdd848a347b7c5b037c76b2617f1825402895f2c.1602519389.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: D012C46E0D2F8B7A1F5C40D17353E05C647CCE7B7507DB6FE6A8C4E4F47006402000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_122135_158222_336725E2 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

drivers/net/wireless/mediatek/mt76/mt7915/init.c:339:26: sparse:
sparse: cast from restricted __le16

Fixes: 00b2e16 ("mt76: mt7915: add TxBF capabilities")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 51eeb78ca077..2457126fc823 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -351,7 +351,7 @@ mt7915_set_stream_he_txbf_caps(struct ieee80211_sta_he_cap *he_cap,
 	elem->phy_cap_info[4] |= IEEE80211_HE_PHY_CAP4_MU_BEAMFORMER;
 
 	/* num_snd_dim */
-	c = (nss - 1) | (max_t(int, mcs->tx_mcs_160, 1) << 3);
+	c = (nss - 1) | (max_t(int, le16_to_cpu(mcs->tx_mcs_160), 1) << 3);
 	elem->phy_cap_info[5] |= c;
 
 	c = IEEE80211_HE_PHY_CAP6_TRIG_SU_BEAMFORMER_FB |
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
