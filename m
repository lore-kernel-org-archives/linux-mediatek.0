Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C361FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 08:17:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94CCB6103C
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 08:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 94CCB6103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCk/th5S8LXWa+Km5WD0+yocD4RN0gaL9wEtdO3biC0=; b=P4SrvSARQXRm4i
	QxxuN+Ce+xRjhbgpLqe68ZxRc+zfV3Ghkm35s6hAnqySdMtpKtYjq/bOmcNs5y6wkoXcmsOqNdhlY
	ZE17beoBlTNBgl57SYrPUfXGZu3feElVJ0B1X8kGlylsEi+FBewpfC2/kNU4uwqjegPyGQpTUNHkX
	WdxVMDPv3nmG37X4SUVik0VOJj1vFlSjX17ZwBU3L9Tx4hhJGRitNMDVnXlRxxOYdh/v86/N+In2r
	qQ5IIltFnu6wAMkttHNEhaiyDrSk9tbfChhqQvEcZEdGo0rtZ4LG7qAaT7wsc+9JxfAVaVYcmB7XC
	ZXISWTBcLNEJBM8P5i/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maZRk-00FX1M-AC; Wed, 13 Oct 2021 08:17:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maY67-00FDMC-B9
 for linux-mediatek@lists.infradead.org; Wed, 13 Oct 2021 06:50:46 +0000
X-UUID: 499783b4a2ec4ed884e9c012df918963-20211012
X-UUID: 499783b4a2ec4ed884e9c012df918963-20211012
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1887464002; Tue, 12 Oct 2021 23:50:39 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Oct 2021 23:50:37 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 13 Oct 2021 14:50:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Oct 2021 14:50:36 +0800
Message-ID: <213a93b6360e8226b409d905e518154b1eade598.camel@mediatek.com>
Subject: Re: [PATCH] MAINTAINERS: mt76: update MTK folks
From: Ryder Lee <ryder.lee@mediatek.com>
To: Kalle Valo <kvalo@codeaurora.org>
CC: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn
 Tsai <evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Date: Wed, 13 Oct 2021 14:50:36 +0800
In-Reply-To: <87y26xzbwh.fsf@tynnyri.adurom.net>
References: <5b452d209fb97be1a39a2d7775557bc8f43bd07c.1634104734.git.ryder.lee@mediatek.com>
 <87y26xzbwh.fsf@tynnyri.adurom.net>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_235043_451352_2C9DA0D2 
X-CRM114-Status: GOOD (  17.57  )
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

On Wed, 2021-10-13 at 09:17 +0300, Kalle Valo wrote:
> Ryder Lee <ryder.lee@mediatek.com> writes:
> 
> > Update entries for MTK folks.
> > 
> > Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> > ---
> >  MAINTAINERS | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index eeb4c70b3d5b..6745119b70bb 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11818,7 +11818,9 @@ F:	drivers/mmc/host/mtk-sd.c
> >  MEDIATEK MT76 WIRELESS LAN DRIVER
> >  M:	Felix Fietkau <nbd@nbd.name>
> >  M:	Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
> > -R:	Ryder Lee <ryder.lee@mediatek.com>
> > +M:	Ryder Lee <ryder.lee@mediatek.com>
> > +M:	Shayne Chen <shayne.chen@mediatek.com>
> > +M:	Sean Wang <sean.wang@mediatek.com>
> 
> I don't really like of having five maintainers for a driver, that
> just
> usually ends up that nobody takes responsibility. I would rather have
> just one, or maybe two, maintainers and no more.
> 
> Reviewers are of course another matter, having more of them is just a
> good thing.
> 
What about 3M2R? We need at least one representative from MTK for some
reasons.

Ryder


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
