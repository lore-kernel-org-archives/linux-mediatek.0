Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02D3C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 16:26:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 877836102A
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 16:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 877836102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4XBiwPUJav5+hpjRww4Km29+vg4nbZSMw/xKfO0XEmg=; b=0ycsiOHDKc47Nw
	NMfJP0IZ5d47bupr6NvpDZXAZz0c5m1cc0kOPeS5f/CQh6ai1lUqw7SAz+h1jXQzFC//GNujwvHjr
	DuVxTANeXWN1PMkSqkFL5KZPU12RElcjFLzv1SH3J9LGdWD1Y6NqnFJZT7l6uB53ccX3twF16MU7P
	UVMiXOg/wRwm8ONDYMpr6gGMq7aEJiEt8x4RUMt0TFZOONpxCgM+Fmv//xrzPWyOFzFvL9E2CujSi
	rSC8Yiy3mdo/dBCIaVVyCAMWRsru1SLa1xBYRkdNuCGO0SXxkXbvdUsoyAr2c2TREA8xu+mGnwde6
	bzBjBBE7u+dLNwRMW41w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlZNO-00BE8C-2K; Fri, 12 Nov 2021 16:26:06 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlZNB-00BE6N-Jk
 for linux-mediatek@lists.infradead.org; Fri, 12 Nov 2021 16:25:56 +0000
Received: by mail-ed1-x529.google.com with SMTP id t18so20432471edd.8
 for <linux-mediatek@lists.infradead.org>; Fri, 12 Nov 2021 08:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zc6/D8A6OoLGTLG3Ag9ZYYK98oobJ6U25ZjJVPaE7hk=;
 b=ym7pDYzINzPaw+6DFwJNWPgLAwRziuTF2jyD/pXq+pSaRrfvDmz0G6i24u2a+UV3ue
 S6au1GsDBK5IVcb8AMfTMBu73SIVvhfnAXtppqaGP/9/+fBRqCRwt2CA5AwjnOwjUu2t
 6iyKmY6YkS4EOiFH3SNjSWaRNe6PjUrFJnIau2DVOIpRh2eJRaK/nD+NZ+6Qr1edRJGQ
 McskVpqt+TS1VXLreJQ7DjlEM0ob5LbxY70a3j/MHX+bPiChoQD4BMlb2ATwyG8QbShj
 Iledyiik0aSffP/fa+oWhNgD5IEJ7VRZVEbv5Sozr9LQjEjOJxnnhsxxw0XCkAz/quRu
 Nb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zc6/D8A6OoLGTLG3Ag9ZYYK98oobJ6U25ZjJVPaE7hk=;
 b=dc+f/3JZskCeSGMTbTYQfJi5HNN5zrz1QhYH7ejDe06qL3PzHM0FaL9rhWUENgXH21
 BDtXlcJDO69gv6M0mCLogpQIHrPulgGDCzPPrw5a20vLyVNaHfg3G34v0Df9WQ50b4t2
 27M0FoB6v+2i4t96k6jZSCTkjX0HbvReOwhMJmXnmUGfi+LgjufyW9SFerojKJzbHdEc
 A0CtiZGG3W0Alq2azp6lOmjD7hZWApwX799WXFlYe0PQjzrkQvRVEUF+fwXO/Hw/wl16
 ZeO54+uxXYzJRs5K3ckw/ay8VTiloWTeL37PJ6lxjlKSON2BzZ3Syj43o7q2BclFbrdu
 hxpw==
X-Gm-Message-State: AOAM532q/tmcQ/sPzNT0UNbiCVBxb8L6lSL/2CbKYzYwQlMLYzoQnJJm
 PIGOKmCpNQ3JzI93u78e7WZzuU5iknCA2ICqw0Kn5A==
X-Google-Smtp-Source: ABdhPJwmu3YcoRsdUIppax2O91mtfKxqppW0ZPZAUeXLuXIkM5iVXwX2MhmgOplDi9CK4zgmpKO41DsXZ0SIePRTWZs=
X-Received: by 2002:a17:906:3056:: with SMTP id
 d22mr14297972ejd.548.1636734351915; 
 Fri, 12 Nov 2021 08:25:51 -0800 (PST)
MIME-Version: 1.0
References: <CANLsYkyLgvMDx-CMLZPEdJ8rUuGX-=QgB++5fz_h_ordm_q1aA@mail.gmail.com>
 <20211112021310.19493-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20211112021310.19493-1-mark-pk.tsai@mediatek.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 12 Nov 2021 09:25:40 -0700
Message-ID: <CANLsYkzsoXw8vCC-OBqHyQv216Rbjf9ZR7FuFK-zxC7gMzt9Kg@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: use %pe format string to print return
 error code
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com, ohad@wizery.com, 
 yj.chiang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_082553_662505_37AE930F 
X-CRM114-Status: GOOD (  20.40  )
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

On Thu, 11 Nov 2021 at 19:13, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
>
> > Hi Mark,
> >
> >
> > >
> > > Use %pe format string to print return error code which
> > > make the error message easier to understand.
> > >
> > > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > > ---
> > >  drivers/remoteproc/remoteproc_core.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index 502b6604b757..2242da320368 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -575,8 +575,8 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > >                                            dma_get_mask(rproc->dev.parent));
> > >         if (ret) {
> > >                 dev_warn(dev,
> > > -                        "Failed to set DMA mask %llx. Trying to continue... %x\n",
> > > -                        dma_get_mask(rproc->dev.parent), ret);
> > > +                        "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
> > > +                        dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
> >
> > Macro ERR_PTR() is used to convert error codes to pointer type when
> > returning from a function - I fail to see how doing so in a dev_warn()
> > context can make the message easier to understand.  Can you provide an
> > example?
>
> Hi,
>
> When dma_coerce_mask_and_coherent() fail, the output log will be as following.
>
> format          log
> %x              Trying to continue... fffffffb
> %d              Trying to continue... -5
> %pe             Trying to continue... -5        (if CONFIG_SYMBOLIC_ERRNAME is not set)
> %pe             Trying to continue... -EIO      (if CONFIG_SYMBOLIC_ERRNAME=y)

When failing, functions dma_coerce_mask_and_coherent() returns -EIO.
Casting that to a (void *) with ERR_PTR() does not change that value.
Since variable @ret is already declared as "int" the real fix is to
change "%x" to "%d".

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
