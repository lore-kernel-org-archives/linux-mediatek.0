Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79B2C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 19:57:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 285DE611C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 19:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 285DE611C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5cYQhS9+lAFNpJsNDlcgJoz35XbOEGRc2r9PzVlYEwc=; b=OED4dV63LXzsXxR8mqtJ/+U6O
	xZRKxyyUe1tw405Na2okU4f9FB45pqBPZAmgTEAw/MjypTipl52R/1kKuXV3ex05DqHwdBQWUocop
	xb4tVe0vZqrj97/J/EtQHV5gB2KuuM4SKIbXuSyGKmvSKqMx22A9o45xm4bWqULZLOaIaSDdATc6p
	ivMd9HoeMkEuuiMGN5o4UEmrCd1OpdMLDvcGpciCs11/T8eDXPCtW97JUqsax70yk1Dtj4UStifaR
	ARg5TeV4vrdZ8fZrhR+NxAaNWAH5S56aEHNH38X5+CbVvPYMxK/NbQ1g9g5ewNb+xaJBKmVi7OL5y
	LBnsbWOfw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljSJI-004xWW-6l; Wed, 19 May 2021 19:56:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljSJD-004xTk-RF
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 19:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=QWt4y0Prspqwseq17BFV/hKHvu072YPMYoLn10GWIno=; b=STeYE3mSfxWGDGbW7F2SMD7XWU
 AKcJssEfOq1hpoK7ro5llMaVBoreyaU1PJ4VoABkK4XN8QtBRzkbSiF2ivXG/gvxMprluwPskJuzf
 bv7W+XMH4bAuKoZOwFan87ubUPpPForfPgeA5+BAno59W/EWQpBxfROqhjyaVwCs6YcmF+Q2gmGdy
 5wpii+rCA0zeNYz8EEp3JWW00sYcmovmUtfTarQnALHNCObejXIn4OghQkPtlmKtxO/O0SaDgwLBu
 qpWr8OG06ryDDW6dvmySeDro+g6tYB8KqZzjZHPrGJzCfL96ed9JY2gYHzTi6Rw2NweBfCnvMZ5BG
 2eThVSiA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljSJA-00FkgD-S3
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 19:56:46 +0000
X-UUID: d283d9db617e4dcfb75e375de177fba0-20210519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=QWt4y0Prspqwseq17BFV/hKHvu072YPMYoLn10GWIno=; 
 b=Pi0r5h17oFYCSSqeKsFfmqoJ36wli/CIvtm90molXPT2AeT2fOboJjx6OwfsBKxhtnnYEm2GTlzBWzXER9inDdQOo9W3NXick57KkFjxEhsEQGmzAtYZrfV03docQD70rjNV3bDm3/lGiqzqUgRSXzygBkWw3XGBD5mrGMohmVU=;
X-UUID: d283d9db617e4dcfb75e375de177fba0-20210519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 107767945; Wed, 19 May 2021 12:56:41 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 May 2021 12:56:39 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 May 2021 03:56:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 20 May 2021 03:56:26 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Bo Jiao
 <bo.jiao@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [RFC PATCH 2/4] mac80211: minstrel_ht: fix minstrel_aggr_check for
 encap offload
Date: Thu, 20 May 2021 03:56:22 +0800
Message-ID: <4e50d38c98c407825c6897a034fee3ba6366b0ad.1621453091.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <a959135d3fe21118f38c33fc9ffb18124c1ef7ce.1621453091.git.ryder.lee@mediatek.com>
References: <a959135d3fe21118f38c33fc9ffb18124c1ef7ce.1621453091.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_125644_937894_082994B2 
X-CRM114-Status: GOOD (  11.28  )
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

Avoid checking ieee80211_hdr to support encap offload.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 net/mac80211/rc80211_minstrel_ht.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/rc80211_minstrel_ht.c b/net/mac80211/rc80211_minstrel_ht.c
index 6487b05da6fa..55ff93c803ac 100644
--- a/net/mac80211/rc80211_minstrel_ht.c
+++ b/net/mac80211/rc80211_minstrel_ht.c
@@ -1179,19 +1179,24 @@ static void
 minstrel_aggr_check(struct ieee80211_sta *pubsta, struct sk_buff *skb)
 {
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *) skb->data;
+	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct sta_info *sta = container_of(pubsta, struct sta_info, sta);
 	u16 tid;
 
 	if (skb_get_queue_mapping(skb) == IEEE80211_AC_VO)
 		return;
 
-	if (unlikely(!ieee80211_is_data_qos(hdr->frame_control)))
+	if (unlikely(!pubsta->wme))
+		return;
+
+	if (!(info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP) &&
+	    unlikely(!ieee80211_is_data_qos(hdr->frame_control)))
 		return;
 
 	if (unlikely(skb->protocol == cpu_to_be16(ETH_P_PAE)))
 		return;
 
-	tid = ieee80211_get_tid(hdr);
+	tid = skb->priority & IEEE80211_QOS_CTL_TID_MASK;
 	if (likely(sta->ampdu_mlme.tid_tx[tid]))
 		return;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
