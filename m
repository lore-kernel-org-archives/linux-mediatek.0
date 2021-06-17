Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 206E6C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 19:03:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB7E4613BA
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 19:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB7E4613BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQU6ApNUuwtJuOLjr7p0/pkWIxmpGgoS8zFR3pY5xgY=; b=pgFx8xcytlB4Yr
	D/j0BW1zfsuiSDnWgDLqqdBz1OjpK/0oWmOWu9VzUsD3XmpEamsj2F5vyg7xUihauiSk6n6f/WvGz
	S4kgO82dPfdFliffMHRkLAfTgAuhNFEDheGbFDz/icfURvsrvE05meP2sGfJxdtCe4megiDVsz3N2
	6YndRU4f7am/WK65554l9wmLz39hJrjn6jep+3jBN8Y+d9cpHPrFokl6y27Z/V70TRcJ+pGC5N6FS
	UrSbJHsHaYIc/MfwP/MrdDNipT73IzoDUreG2gPSZ/reBSfFciq7F2dh31OblAS9CUDeTGMLb9LN4
	DYVtLHZsM1tAYzJ4XNNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltxIO-00BT8s-My; Thu, 17 Jun 2021 19:03:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltxIK-00BT8B-7W
 for linux-mediatek@lists.infradead.org; Thu, 17 Jun 2021 19:03:19 +0000
X-UUID: 01198b14784c4eeeaafef1d1d502ae46-20210617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=OCGN/o8RqknXtCo6vCWXvRT9V7TOaSqHJkV18A6mMRo=; 
 b=LrdJhfIh1cxYwhTOVeoSk+RbSfrq+EDXQ6aBXE+GSCJY39Zo/rpAE0S7cAeZoaVWiDivHubbWXgSztXd0grAUsY4ctTjEh4QtYPF/iu3x0lwtYVSmyRN50pZvjROZuICMmR5dwMF+8Ib1o+4TJoDFWq6KTDy2QuBRP3iNrQ/D9g=;
X-UUID: 01198b14784c4eeeaafef1d1d502ae46-20210617
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1567709478; Thu, 17 Jun 2021 12:03:11 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 11:53:09 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Jun 2021 02:53:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Jun 2021 02:53:08 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH 3/4] mt76: connac: explicitly check vif->offload_flags
Date: Fri, 18 Jun 2021 02:53:04 +0800
Message-ID: <61c1bc26142c8ed62d5d8a59d3f1d50dad89ffc0.1623955182.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <4718d8041f908cb3249ec68c59a6854919f00752.1623955182.git.ryder.lee@mediatek.com>
References: <4718d8041f908cb3249ec68c59a6854919f00752.1623955182.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_120317_733937_B112B547 
X-CRM114-Status: UNSURE (   9.62  )
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

Check vif->offload_flags for encap offload in case of unsupported interfaces.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index b155e7b8d89d..e56713425860 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -406,10 +406,12 @@ void mt76_connac_mcu_wtbl_hdr_trans_tlv(struct sk_buff *skb,
 	htr = (struct wtbl_hdr_trans *)tlv;
 	htr->no_rx_trans = !test_bit(MT_WCID_FLAG_HDR_TRANS, &wcid->flags);
 
-	if (vif->type == NL80211_IFTYPE_STATION)
-		htr->to_ds = true;
-	else
-		htr->from_ds = true;
+	if (vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED) {
+		if (vif->type == NL80211_IFTYPE_STATION)
+			htr->to_ds = true;
+		else
+			htr->from_ds = true;
+	}
 
 	if (test_bit(MT_WCID_FLAG_4ADDR, &wcid->flags)) {
 		htr->to_ds = true;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
