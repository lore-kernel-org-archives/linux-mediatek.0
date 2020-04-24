Return-Path: <SRS0=cCBG=6I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA85C55186
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2020 19:33:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 739632075A
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2020 19:33:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RAhquABu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="g70uUygv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 739632075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GbmbN0/VWSPpaQ0Hy8moE/6qJYO+5MIX0OPRyvoYeEo=; b=RAhquABuGeqjF+
	NvhVSq5cKcbw8cYw0bMa+5OFUCjEM5FFJt0IyN8oUedxAY1VZ0D2CuapM+Di3Pi21aQUR7cCpOyDb
	siSQV/jMHubbH8OqdNtAMK8Q6z8uQd4+77WerNdsqvjYeFVPXIPls7nA2775G6luLdZXBnnFKe/hl
	9wRqQxUwKtVChjf6g+cXfjKQqY86+hz3pyFxdbPgVw87c1JdY6ENlq7XRWp2jr35bqg/a1GSY8zdG
	76k/UepjhXGVQjqNNjaQUfxAcFTsAi0lZU1Rfyj+K5rz2wRM8BfUjtIe0Q7z3bQ/fUphtG2t25sSF
	1zc2FH1q14uiXeLZYs9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS44Y-0007rO-8E; Fri, 24 Apr 2020 19:33:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS44R-0007ks-26
 for linux-mediatek@lists.infradead.org; Fri, 24 Apr 2020 19:33:08 +0000
X-UUID: 7af1b89d297d4b7b83e53801707f7f14-20200424
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=yEW8X2NnaYwRxQbxBF03TWaDWQpug/aAmvpFQkebjBg=; 
 b=g70uUygvnnPEycQxlKQxqu9RPuRLWgMryzfCP/vMcoAe5zLHh9ECuwWFdj6h6CkLustSjYOnlnEDMe58hzGFp6cJk4bUXSIvnp+l2HTli5h+9oaawd7K2HcdG893uUHx2L590tpYoZqI93fxAuRpojO3VxDKzfda8SHKV8l5tPA=;
X-UUID: 7af1b89d297d4b7b83e53801707f7f14-20200424
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2016957675; Fri, 24 Apr 2020 11:33:04 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Apr 2020 12:33:00 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 25 Apr 2020 03:32:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 25 Apr 2020 03:32:49 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v3 02/18] mt76: add support for HE RX rate reporting
Date: Sat, 25 Apr 2020 03:32:23 +0800
Message-ID: <4de594b915945eef1e98c856391f25568f415fcd.1587756404.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1587756404.git.ryder.lee@mediatek.com>
References: <cover.1587756404.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_123307_109563_DBC26A67 
X-CRM114-Status: UNSURE (   8.37  )
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
Cc: YF Luo <yf.luo@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, Sean
 Wang <sean.wang@mediatek.com>, Chih-Min Chen <chih-min.chen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for encoding and reporting HE RX rates.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 4 +++-
 drivers/net/wireless/mediatek/mt76/mt76.h     | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 176c22a5319a..f13114b07b6e 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -676,7 +676,6 @@ mt76_rx_convert(struct mt76_dev *dev, struct sk_buff *skb,
 		struct ieee80211_hw **hw,
 		struct ieee80211_sta **sta)
 {
-
 	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
 	struct mt76_rx_status mstat;
 
@@ -688,6 +687,9 @@ mt76_rx_convert(struct mt76_dev *dev, struct sk_buff *skb,
 	status->enc_flags = mstat.enc_flags;
 	status->encoding = mstat.encoding;
 	status->bw = mstat.bw;
+	status->he_ru = mstat.he_ru;
+	status->he_gi = mstat.he_gi;
+	status->he_dcm = mstat.he_dcm;
 	status->rate_idx = mstat.rate_idx;
 	status->nss = mstat.nss;
 	status->band = mstat.band;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 6e1dae718602..cebef52fb685 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -460,7 +460,8 @@ struct mt76_rx_status {
 	u16 freq;
 	u32 flag;
 	u8 enc_flags;
-	u8 encoding:2, bw:3;
+	u8 encoding:2, bw:3, he_ru:3;
+	u8 he_gi:2, he_dcm:1;
 	u8 rate_idx;
 	u8 nss;
 	u8 band;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
