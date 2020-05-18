Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 241A2C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 17:11:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0E72207FB
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 17:11:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hFaToDzn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0E72207FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBuxyC7aqoCPJKLnTqSqQ/ggrABoo5AP38kIdoURpXo=; b=hFaToDznGNXR40
	QharDWO92Aag6mynhtTRs/KAg5//nFj6KvC3Vst4rkIo7B9ze1IKy0I9+S1Dq/snHhkbabu4CH653
	SN2Vo6d0uBQcwpEE7i3iBxInCp1XfbjFlnLmgELrdSlati0nWuK+bj4GIxnuk45SJEmiTHUnKbmT5
	FePuIcn1ajN/+04W67sJ/RhCR227H6B7FwDEeLuuA0+EPOo42kRdKlUaiNyu/SilUrFRSRGE/NRrj
	u2+8OkX1qoS3iHukkFCUYWOYgho8LDaQ0jfEYNqZhSSr/MRuGU/BmGoOAAc2yBGzLZ/vd7AtjXjXQ
	xAafJwR2z6F0W4ecOkeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jajIb-0008JY-C5; Mon, 18 May 2020 17:11:33 +0000
Received: from smtprelay0251.hostedemail.com ([216.40.44.251]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jajIS-000871-GY; Mon, 18 May 2020 17:11:25 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id DDE31100E7B40;
 Mon, 18 May 2020 17:11:18 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: badge74_7fac34a359a27
X-Filterd-Recvd-Size: 2431
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Mon, 18 May 2020 17:11:17 +0000 (UTC)
Message-ID: <06434e4d5980b17a1cacee80369087cbd7a8cbe0.camel@perches.com>
Subject: Re: [PATCH][next] i2c: mediatek: fix integer overflow on an integer
 multiplication
From: Joe Perches <joe@perches.com>
To: Wolfram Sang <wsa@kernel.org>, Colin King <colin.king@canonical.com>, 
 qii.wang@mediatek.com
Date: Mon, 18 May 2020 10:11:16 -0700
In-Reply-To: <20200518165928.GA5109@ninjato>
References: <20200518165529.57821-1-colin.king@canonical.com>
 <20200518165928.GA5109@ninjato>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_101124_616124_5E1BD962 
X-CRM114-Status: GOOD (  14.72  )
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-05-18 at 18:59 +0200, Wolfram Sang wrote:
> On Mon, May 18, 2020 at 05:55:29PM +0100, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Currently the calculation of sample_ns is using a 32 bit integer
> > multiplication and can potentially overflow. Fix this by making the
> > constant a long long to use a 64 bit multiply and hence
> > avoid an overflow.
> > 
> > Addresses-Coverity: ("Unintentional integer overflow")
> > Fixes: 5f1ae73d538a ("i2c: mediatek: Add i2c ac-timing adjust support")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> CCing the patch author.
> 
> > ---
> >  drivers/i2c/busses/i2c-mt65xx.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> > index 702061805925..c93492b997ce 100644
> > --- a/drivers/i2c/busses/i2c-mt65xx.c
> > +++ b/drivers/i2c/busses/i2c-mt65xx.c
> > @@ -551,7 +551,7 @@ static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
> >  	const struct i2c_spec_values *spec;
> >  	unsigned int su_sta_cnt, low_cnt, high_cnt, max_step_cnt;
> >  	unsigned int sda_max, sda_min, clk_ns, max_sta_cnt = 0x3f;
> > -	long long sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src;
> > +	long long sample_ns = (1000000000LL * (sample_cnt + 1)) / clk_src;

unsigned long long?



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
