Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96347C43460
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 02:28:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B7AE613B3
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 02:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B7AE613B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HDd443UaNtjz1GP4P0oHBj2Nooibhkt8jZunKG97/kI=; b=AS9nlfKy2vcjV77qBo+wfWtEct
	jV18COBnbW7eu1U98xkr/YvxTn5LODPjLtRVmK2Y78D823FLKyzk1BATWkvrV4wSSLnAfut4METAJ
	ewYvHEgfc5e66Bdw6xPIbiueEeRw10Kxb7LwXZbbTBlBjcIJV60Xkf/VsLtTW+MhGOvZqSpl9p+RD
	8ymXawTgCRrSg/fMfcFKITqte92ZFAT9L5yyltoLSoSsr6TnUVPU+Okzv+lC/KTTeokcp5/6e148O
	stRgLMZ619igiHXH/zOmEKgXHQmiNjDY+/MqVpZMTRwaIk3RGdAZ+eAH7qegJkyvh3c2ry9FsqtW1
	ojLHWJTA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbDSP-000THC-6K; Tue, 27 Apr 2021 02:28:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbDSK-000TGd-El
 for linux-mediatek@desiato.infradead.org; Tue, 27 Apr 2021 02:28:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Ar5RCf2exO2GUxo/X7pFPUNfN59VDt/FGNCLIPTTnWg=; b=uSXQWABgEKiPtqbtx3cdLbiiVo
 6bx8unSrySq7Kp2eQcamNfcotm+46we8al+klgdANlUPexmQy6kTvq+QSnIE+tFpv7K+oLJ+v/Vml
 L8I7U8+tbDp4RXgmmgRpejR+8pwlZAMZ+kM1wUI2veMN3X7oivnr36G/2UhpsypXnRs9Y1rmLHB3B
 8Jo+0T5PrXMQwYgKQ5NgmStMZQSkw2t6nRm0B3vxHQw40kkxLDLpvsEZn/0KcVntS4tmpkhcjA5hF
 Q821oOhwAxlVAWcRWfAT3dCh8GRy6vkR/kmXOjd8rlovgQDg2qANDkmZ6c2Mvjgkk3g2/P81Hb8uk
 5OqWk+wg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbDSH-00GO1h-At
 for linux-mediatek@lists.infradead.org; Tue, 27 Apr 2021 02:28:06 +0000
X-UUID: cc332af97c5845f9adf256253f429df9-20210426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Ar5RCf2exO2GUxo/X7pFPUNfN59VDt/FGNCLIPTTnWg=; 
 b=QvOHhrYtwhelpc7XiB7b2NxlxPwVxh+lAHmV4+8vTRlyUK3XfGOZQIzgmWl0khi1TvPeRICFHzbwEXkrJACN3Ephj4Qld35bQ+1KX++UY90+z4Gzr5iOBAcesiEyqN9LPHTYdTO3yDFit2vgcNpBPMKwxJSHobGPTRDmvvq5Twk=;
X-UUID: cc332af97c5845f9adf256253f429df9-20210426
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 940799377; Mon, 26 Apr 2021 19:28:02 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Apr 2021 19:20:27 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Apr 2021 10:20:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 27 Apr 2021 10:20:19 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Johannes Berg <johannes.berg@intel.com>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Ryder
 Lee <ryder.lee@mediatek.com>
Subject: [PATCH] mac80211: minstrel_ht: fix minstrel_aggr_check for encap
 offload
Date: Tue, 27 Apr 2021 10:20:17 +0800
Message-ID: <d5303cd9935a9a2f44b76070d191e753895da516.1619489753.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_192805_401588_6E298838 
X-CRM114-Status: UNSURE (   9.10  )
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

Avoid checking ieee80211_hdr to support encap offload.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 net/mac80211/rc80211_minstrel_ht.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/net/mac80211/rc80211_minstrel_ht.c b/net/mac80211/rc80211_minstrel_ht.c
index ecad9b10984f..02a6648aba54 100644
--- a/net/mac80211/rc80211_minstrel_ht.c
+++ b/net/mac80211/rc80211_minstrel_ht.c
@@ -1180,20 +1180,19 @@ minstrel_downgrade_rate(struct minstrel_ht_sta *mi, u16 *idx, bool primary)
 static void
 minstrel_aggr_check(struct ieee80211_sta *pubsta, struct sk_buff *skb)
 {
-	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *) skb->data;
 	struct sta_info *sta = container_of(pubsta, struct sta_info, sta);
 	u16 tid;
 
 	if (skb_get_queue_mapping(skb) == IEEE80211_AC_VO)
 		return;
 
-	if (unlikely(!ieee80211_is_data_qos(hdr->frame_control)))
+	if (unlikely(!pubsta->wme))
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
