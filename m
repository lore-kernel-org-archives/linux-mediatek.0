Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A915FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 10:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ms7jIAqojH4D1dXIYlT+bJQhAwUOnUdnWsepbYhD+RA=; b=PATisFa+pJ/Bhq
	YrqUPiDQiLPLRdqDnhSNN1VyRF34xap7FfwV2uuf+0YWfDWKCnu/cVDSS0lgcz+R8kpNEp9vIReDv
	1iIZA/OXiWbIvtBNCWXbwxof3fmtgM2mFHDIudHDTCbHC6MnWGAuK1SsLcLlvCDtQyIqTpDiRAXuB
	5Yw58LEVfTIejNeo/fi7n2NZiFr6DcHH1mDgYc5POvy2L/P/xkuC23Q5vY2eVI3zYm+oekw3wWrE2
	weWwJgtHHXTa/lP6oLRxfxojmiXnGUzNY7BVst3uQD8atjEEMFWmfoXBaqZnzZSCAajbWJ7Kq3xCe
	HQIUYzCtlDOSUvMMCp6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7x46-005OQ2-Vn; Thu, 13 Jan 2022 10:10:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7x44-005ONF-QZ
 for linux-mediatek@lists.infradead.org; Thu, 13 Jan 2022 10:10:42 +0000
X-UUID: 7173af9a8b1745daba67db3a75efc8e1-20220113
X-UUID: 7173af9a8b1745daba67db3a75efc8e1-20220113
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chui-hao.chiu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1036401180; Thu, 13 Jan 2022 03:10:32 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 02:10:31 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 13 Jan 2022 18:10:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Jan 2022 18:10:29 +0800
Message-ID: <2ab2731dc44494dbfe89363638cdcaf49351afbe.camel@mediatek.com>
Subject: Re: [PATCH v2 3/5] mt76: mt7915: add support for MT7986
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, linux-wireless
 <linux-wireless@vger.kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, "Xing
 Song" <xing.song@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
 <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <bo.jiao@mediatek.com>
Date: Thu, 13 Jan 2022 18:10:29 +0800
In-Reply-To: <Yd7ZKb7Qsh4lGA5E@lore-desk>
References: <cover.1641901681.git.Bo.Jiao@mediatek.com>
 <8b2098132192c0381e41ac78a47b7318d5c28b04.1641901681.git.Bo.Jiao@mediatek.com>
 <Yd7ZKb7Qsh4lGA5E@lore-desk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_021040_897646_63C6D0A3 
X-CRM114-Status: GOOD (  14.21  )
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

On Wed, 2022-01-12 at 14:35 +0100, Lorenzo Bianconi wrote:
> > 
> > @@ -302,6 +316,15 @@ struct mt7915_dev {
> >  		u8 table_mask;
> >  		u8 n_agrt;
> >  	} twt;
> > +
> > +	struct reset_control *rstc;
> > +	void __iomem *dcm;
> > +	void __iomem *sku;
> > +
> > +	struct {
> > +		bool is_7975;
> > +		bool is_7976;
> > +	} adie[MT7986_MAX_ADIE_NUM];
> 
> do we really need it? Can we just read data from chip when necessary?
> it is not
> access in the hot-path, right?
> I think it is easier and more readable.

Adie registers are inaccessible after wfsys power on so we need some
places to store chip configuration.
We will modify it to make it more readable.
+ u32 adie;

thanks,
Peter


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
