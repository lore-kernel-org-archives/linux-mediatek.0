Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7376C47089
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 01:58:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 731C0613B6
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 01:58:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 731C0613B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qaEy6iNbVt+TMI0NNR5louirHdw6uTmR09mk50B0N0c=; b=lUU7N2STWbkrZw
	kdKnfKRFszo576qWXxUtVYl0sMTT9ImbexMOg0/b/K89IkygSq5VATpFSqEyrhOQfP0ZvBNzABmkP
	kp2+uR7oE688JLyhjcyWjpbi3PIZzqyRYlfthH4ExTo9z8EEfLI+ZuCViCFy5qNvpgGCTpepyDdWO
	RoqhqjwHoA/81coqhhjBrjxuyFZLaJAiZVPsWWLU6nqO7kc+cqMb7KXll/7wBLcxWGmBvsf41rlAT
	5SOyCtSIf/mgk1ln6G/ekoppsfvR/Q2MHtxv+QqBP2KLXBZp7YTFDbsuDh7aAvfABmKTHWdm7xdT0
	RYp4Nmx/cP38gkGKI2UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmRlC-00B8jP-Qh; Fri, 28 May 2021 01:58:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmRl9-00B8hf-W3
 for linux-mediatek@lists.infradead.org; Fri, 28 May 2021 01:58:01 +0000
X-UUID: 553515ee294942f59d6daa79e49d0f99-20210527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=oGHE8PMIoslcSlajowrXXBL8ZEp8fdbfLBIkED372ag=; 
 b=h6EfcqW8yAG31QQLsx00PYvbDHo+Dt3XcAGF+9B4EJPJMiBBXMccOKi+t+ABq6OmtsTHGeCdnvaRcoHfgUDImXtG7PmqxcqFjN9OoEiIZx7d3cKNMcKkt73sgVjXcEI7N6pUSXx0CISVDlF2mtjXhj1uHIiho5q77Z4PeBdVw14=;
X-UUID: 553515ee294942f59d6daa79e49d0f99-20210527
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 531874129; Thu, 27 May 2021 18:57:57 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 May 2021 18:54:21 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 May 2021 09:54:19 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 May 2021 09:54:19 +0800
Message-ID: <1622166859.31294.2.camel@mtkswgap22>
Subject: Re: [RFC PATCH 2/4] mac80211: minstrel_ht: fix minstrel_aggr_check
 for encap offload
From: Ryder Lee <ryder.lee@mediatek.com>
To: Johannes Berg <johannes@sipsolutions.net>
CC: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>,
 "Evelyn Tsai" <evelyn.tsai@mediatek.com>, Bo Jiao <bo.jiao@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Date: Fri, 28 May 2021 09:54:19 +0800
In-Reply-To: <47f9c5c2a9c5fd666751e01799a9a167d8776a49.camel@sipsolutions.net>
References: <a959135d3fe21118f38c33fc9ffb18124c1ef7ce.1621453091.git.ryder.lee@mediatek.com>
 <4e50d38c98c407825c6897a034fee3ba6366b0ad.1621453091.git.ryder.lee@mediatek.com>
 (sfid-20210519_215642_904470_7AA3F138)
 <47f9c5c2a9c5fd666751e01799a9a167d8776a49.camel@sipsolutions.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_185800_060148_56A523D7 
X-CRM114-Status: UNSURE (   8.80  )
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

On Tue, 2021-05-25 at 15:00 +0200, Johannes Berg wrote:
> On Thu, 2021-05-20 at 03:56 +0800, Ryder Lee wrote:
> > 
> > +	if (!(info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP) &&
> > +	    unlikely(!ieee80211_is_data_qos(hdr->frame_control)))
> >  		return;
> 
> That unlikely() placement seems odd?
> 
> johannes
> 



I thought about
	if (unlikely(!(info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP) &&
	    !ieee80211_is_data_qos(hdr->frame_control)))

...until I found a similiar case in ieee80211_get_txq, so I kept it in
that way.

Ryder
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
