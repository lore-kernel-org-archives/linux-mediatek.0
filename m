Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266AFC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Dec 2021 23:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+J6ycedY28uOTg6cJ8ZPiDiBEqe+2lMyHRPleSzjBss=; b=PQX/SY+HqooiHg
	qj2iF+A4icfVuVCz5wmIbyzvNvOhWGKkmsRAh2uezDDGbexJJZeLhhrsCRTLKvTds+IFqHkP3P7Bc
	jgpoousvYGHLYQLA0+oKcnjBcJzH5yeWdGopQ0fHs9xYUxPbqFs62ByON5D0TVdFUkUeyTlQCyxEp
	PxYiZNqQOwoLyYhHTZn3hBRKS+ivhOXwvpRBHAMaUF1rS9Lnew1XOohGjuYevIZNpbiug8gPTnma3
	9YWBHi0sIN4K4X+C3IRLVbsC6nUgpGPtdzdVpFlyBWGLqXyZ2FVRXzBmdsJlczb26tWOTryRt21zF
	MQA/Jtq3+6KnAN1fm3KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0XrG-00DYqu-K5; Thu, 23 Dec 2021 23:50:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0XrD-00DYqW-3R
 for linux-mediatek@lists.infradead.org; Thu, 23 Dec 2021 23:50:49 +0000
X-UUID: 3bb9714f748d4e18be947451fef99d7d-20211223
X-UUID: 3bb9714f748d4e18be947451fef99d7d-20211223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1524866605; Thu, 23 Dec 2021 16:50:39 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Dec 2021 15:50:37 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 24 Dec 2021 07:50:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Dec 2021 07:50:36 +0800
Message-ID: <6d3a52918457d4fedf91a6a224cf35eaf940f22c.camel@mediatek.com>
Subject: Re: [PATCH 1/1] mt76: add mt7916 to set wlan_idx_hi
From: Ryder Lee <ryder.lee@mediatek.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Bo Jiao <bo.jiao@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>, linux-wireless
 <linux-wireless@vger.kernel.org>, Xing Song <xing.song@mediatek.com>, "Sujuan
 Chen" <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Fri, 24 Dec 2021 07:50:36 +0800
In-Reply-To: <YcTwP6Hu5VoTMHEq@lore-desk>
References: <cover.1640175865.git.Bo.Jiao@mediatek.com>
 <5b82d68ee7c879591e22da51bfdb4af2e5fad228.1640175865.git.Bo.Jiao@mediatek.com>
 <YcTwP6Hu5VoTMHEq@lore-desk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_155047_187609_0F8ADA18 
X-CRM114-Status: GOOD (  17.92  )
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

On Thu, 2021-12-23 at 22:55 +0100, Lorenzo Bianconi wrote:
> > From: Bo Jiao <Bo.Jiao@mediatek.com>
> > 
> > since mt7916 support up to 544 wcid entries,
> > add it to set wlan_idx_hi.
> > 
> > Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> > Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> > ---
> >  drivers/net/wireless/mediatek/mt76/mt76_connac.h     | 5 +++++
> >  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 2 +-
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> > b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> > index e999d71..8701f04 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> > @@ -110,6 +110,11 @@ static inline bool is_mt7915(struct mt76_dev
> > *dev)
> >  	return mt76_chip(dev) == 0x7915;
> >  }
> >  
> > +static inline bool is_mt7916(struct mt76_dev *dev)
> > +{
> > +	return mt76_chip(dev) == 0x7906;
> > +}
> > +
> >  static inline u8 mt76_connac_chan_bw(struct cfg80211_chan_def
> > *chandef)
> >  {
> >  	static const u8 width_to_bw[] = {
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > index edad583..fc9a084 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > @@ -1464,7 +1464,7 @@ mt76_connac_mcu_get_wlan_idx(struct mt76_dev
> > *dev, struct mt76_wcid *wcid,
> >  {
> >  	*wlan_idx_hi = 0;
> >  
> > -	if (is_mt7921(dev) || is_mt7915(dev)) {
> > +	if (is_mt7921(dev) || is_mt7915(dev) || is_mt7916(dev)) {
> >  		*wlan_idx_lo = wcid ? to_wcid_lo(wcid->idx) : 0;
> >  		*wlan_idx_hi = wcid ? to_wcid_hi(wcid->idx) : 0;
> 
> I guess I have already included the fix here:
> 
https://patchwork.kernel.org/project/linux-wireless/patch/df4d462f1ef4cfc1ae4f6482051a28a10c78262b.1640260901.git.lorenzo@kernel.org/
> 
> Regards,
> Lorenzo
> 

I think we can fold these patches together and use !is_connac_v1
instead so that we can avoid endless is_mtxxxx || ... || ...

Ryder



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
