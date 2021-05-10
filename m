Return-Path: <SRS0=zzne=KF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 574D7C4363E
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 15:15:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B85F06023E
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 15:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B85F06023E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UkRFByyOr+wsGwIBV4fzhK8TLGvfUV/G4qvJw551hY4=; b=bd/+iomGyR4GBWshFwQpUKPtG
	wU3X+JA+bdDPVW/i8HAO4UJ3PYKF9woKqB4SVFBAZzsUK6tp12eWBCDi2DRKwZQJXa68iuRSYFAVx
	Hpnsxi02EiRyI0LxZIrxToKKiwjfo1YreGD0DpZNC2KQHg8v+vP1onRiR1XVWX60WIhZubJXa9hsK
	HzHTIUCn0f+tj/Y4TWqYbVkc91rSwtEriSFkRScDkbjG5pNZXTZOIPZSE6xkplTMZ+PEDn87pYWcx
	OjsbaypisNDFiHq12Iydj9GHBzzU1km+pmNql7kQMDxADDwdZE7EWRAvetUehcHUHSd36xjiStrux
	IKGzZ/dMg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg7ct-00ElP7-Kf; Mon, 10 May 2021 15:15:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg7cm-00ElMG-GN
 for linux-mediatek@desiato.infradead.org; Mon, 10 May 2021 15:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=tDvCbom4XPPk+ke1f1jTWA3Kwkl581/IlqYmpvLAEPo=; b=XoavanEaCjkb5xzMtpIvN/lk1z
 ebJA3AHmtR+HBq+J14QzQ7eXA0JFVyk1cMrGK66VaMukc/mdOPi9RH8xnWwI1tGNoiY2E0nUsHjoB
 2X6LC7KndHx64Pba9VtLkvpeJGT/ZOCChk3N5tlblT7+shNAcnULoLPeMrDdr/utQ6Es9G6gbWAbM
 1cymCz+d+Rifxh+0OuwBWcULom7mIwYBYIrzP87aZC0PCwq1FTg/tgp1MiRX86MxRKTJLwwSpCDoA
 j+v+3XNS26lsBVqATXwubCiTE+EuQc8s8b8sRLvz5J/UBm/cU7XSxLaCSGYhCMMBsTTZ8WItZz1Z7
 JL8K2tpg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg7cj-008rIR-O4
 for linux-mediatek@lists.infradead.org; Mon, 10 May 2021 15:15:11 +0000
X-UUID: ac42fae3fc1a4279806db48cbce11acc-20210510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tDvCbom4XPPk+ke1f1jTWA3Kwkl581/IlqYmpvLAEPo=; 
 b=lKtAr/QPIkOCFnEdXUB994nV08jl0HEW+xr4niIvhyUiJ7qivDY7WKAS7Aa6P5IVCpM1X3/26u9WOvOvdKDwhJwcmO+1QTocDyfhqrOtEd9q45hN3Gh1QdSTHOXDjl6LeN5GFzT0Sf3HIe+B60wi8sUFqVnWZ6ZDC+z4ft5tntw=;
X-UUID: ac42fae3fc1a4279806db48cbce11acc-20210510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 97087803; Mon, 10 May 2021 08:15:02 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 May 2021 08:15:01 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 May 2021 23:14:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 May 2021 23:14:58 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 2/9] mt76: mt7921: Don't alter Rx path classifier
Date: Mon, 10 May 2021 23:14:50 +0800
Message-ID: <1620659697-12048-2-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1620659697-12048-1-git-send-email-sean.wang@mediatek.com>
References: <1620659697-12048-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3886F8F6554AC4F76625E046C0B15BE9936678AC567C95A67B719FE920DD7D132000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_081509_819299_F8AE365A 
X-CRM114-Status: UNSURE (   6.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Keep Rx path classifier the mt7921 firmware prefers to allow frames pass
through MCU.

Fixes: 5c14a5f944b9 ("mt76: mt7921: introduce mt7921e support")
Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/init.c   | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 1d4ba5d0166a..6947d98287c0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -118,30 +118,12 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
 static void
 mt7921_mac_init_band(struct mt7921_dev *dev, u8 band)
 {
-	u32 mask, set;
-
 	mt76_rmw_field(dev, MT_TMAC_CTCR0(band),
 		       MT_TMAC_CTCR0_INS_DDLMT_REFTIME, 0x3f);
 	mt76_set(dev, MT_TMAC_CTCR0(band),
 		 MT_TMAC_CTCR0_INS_DDLMT_VHT_SMPDU_EN |
 		 MT_TMAC_CTCR0_INS_DDLMT_EN);
 
-	mask = MT_MDP_RCFR0_MCU_RX_MGMT |
-	       MT_MDP_RCFR0_MCU_RX_CTL_NON_BAR |
-	       MT_MDP_RCFR0_MCU_RX_CTL_BAR;
-	set = FIELD_PREP(MT_MDP_RCFR0_MCU_RX_MGMT, MT_MDP_TO_HIF) |
-	      FIELD_PREP(MT_MDP_RCFR0_MCU_RX_CTL_NON_BAR, MT_MDP_TO_HIF) |
-	      FIELD_PREP(MT_MDP_RCFR0_MCU_RX_CTL_BAR, MT_MDP_TO_HIF);
-	mt76_rmw(dev, MT_MDP_BNRCFR0(band), mask, set);
-
-	mask = MT_MDP_RCFR1_MCU_RX_BYPASS |
-	       MT_MDP_RCFR1_RX_DROPPED_UCAST |
-	       MT_MDP_RCFR1_RX_DROPPED_MCAST;
-	set = FIELD_PREP(MT_MDP_RCFR1_MCU_RX_BYPASS, MT_MDP_TO_HIF) |
-	      FIELD_PREP(MT_MDP_RCFR1_RX_DROPPED_UCAST, MT_MDP_TO_HIF) |
-	      FIELD_PREP(MT_MDP_RCFR1_RX_DROPPED_MCAST, MT_MDP_TO_HIF);
-	mt76_rmw(dev, MT_MDP_BNRCFR1(band), mask, set);
-
 	mt76_set(dev, MT_WF_RMAC_MIB_TIME0(band), MT_WF_RMAC_MIB_RXTIME_EN);
 	mt76_set(dev, MT_WF_RMAC_MIB_AIRTIME0(band), MT_WF_RMAC_MIB_RXTIME_EN);
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
