Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A284AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 02:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRG+H1+Cj7cCu+8GqDWSBPcUR7fZsuHzacWWE7/FNlw=; b=eW6Uey2G73bhGx
	NWDIjStTb1aXTfH6iR550sDSICM7KC/XgJUpzgCx2EYcl9zVcmpUZQf/3lR0KqoszT9AW7tIlPd8P
	yz50O1UDHck8yE6aivZsIYn2N8fAY8cEZYADYXaTnPH5GAAv8qcBWrlGLTSfUMX9wPkg0xtesqqjk
	tKefYcrS75Q2xZkQ035qYQW+eMU4zuXGVvmWTHKtfjnK79xNKA7PjqvjcgJbNZI9jPO9efgse7ZIt
	8j7pq55YdRVQMveI6cBln+o9OleMmhSQkfsmaZ76hwaJpYxOJH0qzBulba2WhAWwI1gA17WKoDb7b
	iu6hD2M+2Vd87AqtByaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8CEG-007VD0-7X; Fri, 14 Jan 2022 02:22:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8CEB-007VCI-N0
 for linux-mediatek@lists.infradead.org; Fri, 14 Jan 2022 02:22:10 +0000
X-UUID: 4d8c127785864ee795600d0b223af7ce-20220113
X-UUID: 4d8c127785864ee795600d0b223af7ce-20220113
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chui-hao.chiu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1686781301; Thu, 13 Jan 2022 19:22:00 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 18:21:59 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Jan 2022 10:21:57 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Jan 2022 10:21:58 +0800
Message-ID: <57feb4a99c835e6a70496e8e935501bb12a393b3.camel@mediatek.com>
Subject: Re: [PATCH v2 3/5] mt76: mt7915: add support for MT7986
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, linux-wireless
 <linux-wireless@vger.kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, "Xing
 Song" <xing.song@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
 <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <bo.jiao@mediatek.com>
Date: Fri, 14 Jan 2022 10:21:58 +0800
In-Reply-To: <YeAvXzG6ueZWxoGa@lore-desk>
References: <cover.1641901681.git.Bo.Jiao@mediatek.com>
 <8b2098132192c0381e41ac78a47b7318d5c28b04.1641901681.git.Bo.Jiao@mediatek.com>
 <Yd7ZKb7Qsh4lGA5E@lore-desk>
 <2ab2731dc44494dbfe89363638cdcaf49351afbe.camel@mediatek.com>
 <Yd/8mXumr25iESux@lore-desk> <YeAvXzG6ueZWxoGa@lore-desk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_182207_795546_F0243C73 
X-CRM114-Status: GOOD (  25.75  )
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

On Thu, 2022-01-13 at 14:55 +0100, Lorenzo Bianconi wrote:
> > > On Wed, 2022-01-12 at 14:35 +0100, Lorenzo Bianconi wrote:
> > > > > 
> > > > > @@ -302,6 +316,15 @@ struct mt7915_dev {
> > > > >  		u8 table_mask;
> > > > >  		u8 n_agrt;
> > > > >  	} twt;
> > > > > +
> > > > > +	struct reset_control *rstc;
> > > > > +	void __iomem *dcm;
> > > > > +	void __iomem *sku;
> > > > > +
> > > > > +	struct {
> > > > > +		bool is_7975;
> > > > > +		bool is_7976;
> > > > > +	} adie[MT7986_MAX_ADIE_NUM];
> > > > 
> > > > do we really need it? Can we just read data from chip when
> > > > necessary?
> > > > it is not
> > > > access in the hot-path, right?
> > > > I think it is easier and more readable.
> > > 
> > > Adie registers are inaccessible after wfsys power on so we need
> > > some
> > > places to store chip configuration.
> > > We will modify it to make it more readable.
> > > + u32 adie;
> > 
> > what I mean is just continue reading these values after the first
> > time (that is
> > in common for both approaches).
> 
> ok, sorry I misread your reply. Anyway it seems to me we need these
> values just
> in mt7986_wmac_enable() (or in routines called by
> mt7986_wmac_enable). Right?
> If so maybe we can just store them in a local struct in
> mt7986_wmac_enable().
> What do you think?
> 
OK, I will fix it in the next patch.

thanks,
Peter
> Regards,
> Lorenzo
> 
> > 
> > Regards,
> > Lorenzo
> > 
> > > 
> > > thanks,
> > > Peter
> > > 
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
