Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8A7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 16:29:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7280861266
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 16:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7280861266
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5NFtgtCmKRqqQTmvlYhMliEBWBwaoXrILk1D+KE0PV8=; b=4fXO7ihBuO5IoH
	RQo0Fcovg0sAqZU4lMxIGKcy2hY6CXFHz87zmZPfVZS5g9u5NJjjKN/dIipqGU6GVJxSGrkkm49zM
	+ClsaZlPkkhlMJcxGHglPUQTCBRl+wE9AzYEn3TiX+VN9ioArjChS2cSuVr0Ek4+YYrWW70RCeLvY
	sgziv4uuVeIrKLaVnaMAyAY2FGtd1wKkvme28hQONJB9flv87zjcZk1YkdKzGEGd0OkfCmqF5cNkw
	d6gkmUC+UPFjBg6Sd7wu/xYPEy0ZvCI01DNulPpkpL9Lu0APl36+BOXhd6EvmPP3aNSdNZmkBMXlE
	osz0c1/NrSSi/syl/Gvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn1L5-002KqM-KD; Tue, 16 Nov 2021 16:29:43 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn1L1-002Koc-1q
 for linux-mediatek@lists.infradead.org; Tue, 16 Nov 2021 16:29:40 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so2708847pjc.4
 for <linux-mediatek@lists.infradead.org>; Tue, 16 Nov 2021 08:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dphYgpIFf0rnfxxApXcaDzX6iKxIk2pRdbaTqHCVXRQ=;
 b=PmThZsEUqMY7qdCDMfNLyXiaxisDMPo6jKmOfYyGgBQ2DTm7GoJthIXRl9FdC2ezGU
 OuYwc8SuytJsQbU44keukL3A6+PKqb6Y2/5qdTFFtYlH4+3KPsSKP73l3ecIN/dXRTgw
 b0PT53igfJJXLJQy9WvG6srIyw/uySkwOnhtwmc/gmAMo7PcI0yEzCJwF+ke4ywuloOV
 zm3bpXUWWk30KgajeRdiOE/dlCqi/ITgDtQ1598NzCAQ9XsrgfIIZGg49YJHSdamuAY8
 GIQCzqM4/iQhbUyln+9l38Y9a71xnozyqTdxGaGBLXY7JCW7G8jG5xLYZ+CJzU3e7Rzz
 bZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dphYgpIFf0rnfxxApXcaDzX6iKxIk2pRdbaTqHCVXRQ=;
 b=ecVf1ixQLMn0N9fuzhYbvhpB/PQcGUEj0e5m8YmJFT6Gos2+TbCH4JUP9vrcy9tfeY
 PGO3uhbhvlVPcN04WufXdHZOaQ4JXpaI7OasJsM/sls0a9VpvAgoQNXn17Cak6TCeRNx
 AfGgkCQQAhb/zSv6b6JdtmhrdbqfDzqxYaIdJb84u6wE4F4VdCORSbsV1Ah9zwDfOU+c
 Ds4cSA2Xdt/ocGtdyNuzjgUORCnJGwvdaZQy7JjgWm1psKsYWLiBFYCHJGnJetk7i5km
 gNgltOwxBhYfEw7rZzBf2Yz6V9J3qara0sdXq2Iw4IunZI9Ow8agOAYRkOvNwTGgDKVG
 z5DQ==
X-Gm-Message-State: AOAM532WVf5+BKvajaGz8g0TVbLR8Bih1bFaHfG/1rdh7oRFVr1wAGl4
 G1zh93R+T84eZ6eYcqGQ2qmBTA==
X-Google-Smtp-Source: ABdhPJzNhkmZsE2FtYjflTIfgzGr118ZC041cPjft4yj7PUlFeURqWKuWYM+CAB3hsODsn/7lztJsA==
X-Received: by 2002:a17:90a:8815:: with SMTP id
 s21mr382032pjn.82.1637080177122; 
 Tue, 16 Nov 2021 08:29:37 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id h8sm21276476pfh.10.2021.11.16.08.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 08:29:36 -0800 (PST)
Date: Tue, 16 Nov 2021 09:29:33 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
 ohad@wizery.com, yj.chiang@mediatek.com
Subject: Re: [PATCH v2] remoteproc: use %pe format string to print return
 error code
Message-ID: <20211116162933.GA2318486@p14s>
References: <CANLsYkzsoXw8vCC-OBqHyQv216Rbjf9ZR7FuFK-zxC7gMzt9Kg@mail.gmail.com>
 <20211116135703.19432-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211116135703.19432-1-mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_082939_121418_A455818B 
X-CRM114-Status: GOOD (  28.28  )
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

Good day,

On Tue, Nov 16, 2021 at 09:57:03PM +0800, Mark-PK Tsai wrote:
> > > > > Use %pe format string to print return error code which
> > > > > make the error message easier to understand.
> > > > >
> > > > > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > > > > ---
> > > > >  drivers/remoteproc/remoteproc_core.c | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > > > index 502b6604b757..2242da320368 100644
> > > > > --- a/drivers/remoteproc/remoteproc_core.c
> > > > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > > > @@ -575,8 +575,8 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > > > >                                            dma_get_mask(rproc->dev.parent));
> > > > >         if (ret) {
> > > > >                 dev_warn(dev,
> > > > > -                        "Failed to set DMA mask %llx. Trying to continue... %x\n",
> > > > > -                        dma_get_mask(rproc->dev.parent), ret);
> > > > > +                        "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
> > > > > +                        dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
> > > >
> > > > Macro ERR_PTR() is used to convert error codes to pointer type when
> > > > returning from a function - I fail to see how doing so in a dev_warn()
> > > > context can make the message easier to understand.  Can you provide an
> > > > example?
> > >
> > > Hi,
> > >
> > > When dma_coerce_mask_and_coherent() fail, the output log will be as following.
> > >
> > > format          log
> > > %x              Trying to continue... fffffffb
> > > %d              Trying to continue... -5
> > > %pe             Trying to continue... -5        (if CONFIG_SYMBOLIC_ERRNAME is not set)
> > > %pe             Trying to continue... -EIO      (if CONFIG_SYMBOLIC_ERRNAME=y)
> >
> > When failing, functions dma_coerce_mask_and_coherent() returns -EIO.
> > Casting that to a (void *) with ERR_PTR() does not change that value.
> > Since variable @ret is already declared as "int" the real fix is to
> > change "%x" to "%d".
> 
> There're some other drivers do the same thing in the recent kernel, so I think
> it's fine to casting the `ret` to a (void *) for more user friendly.
> But I suppose it would depend on the maintainer's opinion.
> 
> So how about previous patch I sent, which also fix this issue by using %d.
> 
> https://lore.kernel.org/lkml/20211102120805.27137-1-mark-pk.tsai@mediatek.com/

I had not seen Russell's reply in the link you posted above.  I am not
completely sure about his solution but his insight and guidance in kernel
programming have precedence over mine.

I will take this patch.

Thanks,
Mathieu


> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
