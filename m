Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F688C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 01:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PSZF8+/5ybgud5lldjZ46IqHfCX4w1fRkXk3dDlWif0=; b=nkFvbQcYQK7/3z
	7MT2kN7d9ZYLEgVfB/uPCzO9v6epoODOxFoUbayapq8B3ULRU7R627MXnQdKOAvu6YCg/S0r180ua
	q2mArQYZ/Y6T6c09p/dtryytlXxzwL5m53fH8BkCb1WQjh7IFwKAUtDycvSrQmhqw4dQy5Mh73OOf
	s36mGEmGXoxaW6K6YoL7QT3Lk1/dQtfXcJzse5sAJzLjaXoyGgZD7yeUXcmqbUWLHTR0tYcWZ/gWp
	yz3U0RM70lAfExOHILw56AP4EaeSbXZNaCbcCxkwCKE7gvXAOlt7aWBc9JK9oPoIPmapyrtuJEkgb
	wFLoRH+FqTf0i64Kz7Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhLsY-00B3dz-HE; Thu, 21 Apr 2022 01:45:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhLsV-00B3cc-61
 for linux-mediatek@lists.infradead.org; Thu, 21 Apr 2022 01:45:05 +0000
X-UUID: a5e61fffabc94ea1ae5846ac71be2a61-20220420
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uXsNepzluNDlrW8X7k2UcWAYlpHoER1mD0h6SOjSvsM=; 
 b=A9rgjtBPWJMGTkFLfZ6AI6tYyOtgAbVKkD9K37bEVXbgL3Jfta+W0v3mVWO89QY5P5pzirCPFK825iSXMDX3id2Rda0rNKUaDWfnY8h05X4PswQebJnGrfAa04tP2yaPRtzq4qwPBWjk/5KFnelY2A//+fwfOPsRJ+Jg/y5Mh3I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:2c2d0fb9-bdb1-4557-ba54-a56556879953, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-12
X-CID-META: VersionHash:faefae9, CLOUDID:b4ed68f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: a5e61fffabc94ea1ae5846ac71be2a61-20220420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 474402052; Wed, 20 Apr 2022 18:44:56 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 18:44:55 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 21 Apr 2022 09:44:53 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 21 Apr 2022 09:44:52 +0800
Message-ID: <5b0f28fa67b27151a59ea42d9f60e29919f36f36.camel@mediatek.com>
Subject: Re: [PATCH] mt76: mt7915: disable RX_HDR_TRANS_SHORT
From: bo.jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>, "lian .
 chen" <lian.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Thu, 21 Apr 2022 09:44:52 +0800
In-Reply-To: <46f14357-d02b-cad3-9fa8-7e1962305251@nbd.name>
References: <20220420071144.14573-1-bo.jiao@mediatek.com>
 <46f14357-d02b-cad3-9fa8-7e1962305251@nbd.name>
X-Mailer: Evolution 3.28.1-2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_184503_278323_060DC4F7 
X-CRM114-Status: GOOD (  21.18  )
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

hi felix:

mt7915_mac_fill_rx:
	......

	if (!status->wcid || !ieee80211_is_data_qos(fc))
		return 0;

	status->aggr = unicast &&
		       !ieee80211_is_qos_nullfunc(fc);
	status->qos_ctl = qos_ctl;
	status->seqno = IEEE80211_SEQ_TO_SN(seq_ctrl);

	return 0;

it will be returned by the condition !ieee80211_is_data_qos(fc) when
receive non-Qos (null) data, and the status->aggr/status-
>qos_ctl/status->seqno keep the default value 0.

mt76_rx_aggr_reorder:
	....

	sta = wcid_to_sta(wcid);
	if (!sta)
		return;

	if (!status->aggr && !(status->flag & RX_FLAG_8023)) {
		mt76_rx_aggr_check_ctl(skb, frames);
		return;
	}

	....

those packet will be forced to do rx reorder and may incorrectly update
tid->head.
https://patchwork.kernel.org/project/linux-wireless/patch/2022042010503
8.36443-1-nbd@nbd.name/
Your replacement patch did not include this change.
+	if (!status->aggr)
+		return;
+

Thanks.


On Wed, 2022-04-20 at 13:25 +0200, Felix Fietkau wrote:
> On 20.04.22 09:11, Bo Jiao wrote:
> > From: Bo Jiao <Bo.Jiao@mediatek.com>
> > 
> > This patch disables RX_TRANS_SHORT to make MDP to do header
> > translation
> > when payload less than 8 bytes, hence the (QoS) null data can be
> > encapsulated
> > to 802.3 format. However, WDS requires (QoS) null data in 802.11
> > format
> > to created vlan AP interfaces.
> > 
> > Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> > Signed-off-by: lian.chen <lian.chen@mediatek.com>
> > Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
> > Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> > ---
> >   drivers/net/wireless/mediatek/mt76/agg-rx.c      | 3 +++
> >   drivers/net/wireless/mediatek/mt76/mt7915/init.c | 3 +++
> >   drivers/net/wireless/mediatek/mt76/mt7915/mac.c  | 4 ----
> >   drivers/net/wireless/mediatek/mt76/mt7915/regs.h | 3 +++
> >   4 files changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/mediatek/mt76/agg-rx.c
> > b/drivers/net/wireless/mediatek/mt76/agg-rx.c
> > index 7262222..efd1a85 100644
> > --- a/drivers/net/wireless/mediatek/mt76/agg-rx.c
> > +++ b/drivers/net/wireless/mediatek/mt76/agg-rx.c
> > @@ -167,6 +167,9 @@ void mt76_rx_aggr_reorder(struct sk_buff *skb,
> > struct sk_buff_head *frames)
> >   		return;
> >   	}
> >   
> > +	if (!status->aggr)
> > +		return;
> > +
> >   	/* not part of a BA session */
> >   	ackp = status->qos_ctl &
> > IEEE80211_QOS_CTL_ACK_POLICY_MASK;
> >   	if (ackp != IEEE80211_QOS_CTL_ACK_POLICY_BLOCKACK &&
> 
> This is an unrelated change, for which I've just sent a replacement 
> patch. The rest is applied.
> 
> Thanks,
> 
> - Felix
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
