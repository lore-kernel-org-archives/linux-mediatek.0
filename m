Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD4DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 21:11:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52FED60E9B
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 21:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52FED60E9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqQsn8uS1tqNvK8CSLHM8JAoFhMB0tqWL/odJfLqQcY=; b=Uq9sNNRvXBdfED
	vXKjLyehmU1Ss9ISCtjj5tIWRshJbl60buhvPMXoEGqe7eMza2/Y5qbGEd9v8veh2x2B9lYpwHJMH
	8urJyk7hRhytAGV8lQoAs/2BMJNDv4R8mW+1ldkhqRFP9cZaBf7G86kBRfB8CvFFAJ0hLmufiagiE
	OxaCbGqt0l0i4fBF4gja8f5pIaUpG/3i/ZEpydveYHzuuXcKvtWFuSoVqGcottATpE+XhfwXLyB+4
	FK0hU+7gD5tazyE0GC2U1qNbOyo5PCMmDqxKstSHFoYTUMEy1Lg7SepCaUNKDizpQfri50aQHFa9l
	Po6uJaADbnBylzEnbMZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcwOf-002eY1-BJ; Tue, 19 Oct 2021 21:11:45 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcwOc-002eWe-3I
 for linux-mediatek@lists.infradead.org; Tue, 19 Oct 2021 21:11:43 +0000
Received: by mail-ed1-x52b.google.com with SMTP id g10so17631741edj.1
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Oct 2021 14:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=OwyRLUcszsyadBr824dsTniinvYZj7Tk0bJGgvItSRM=;
 b=UuFOxeYnA6bmCHsx6C3eM8RhW7dy8MiborwVIsDzXcWw30k69JKWDiVtNm6tzfQYNS
 jKiqu/iSWMz34Bs26vA6cuq5v9Mmweone0oANMssKmhBtWARTGXALWfHR+h8jbZ8pvcy
 0krFAiUyPTdfBf/P4H/lPhWeu8aOt+4rtcYRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=OwyRLUcszsyadBr824dsTniinvYZj7Tk0bJGgvItSRM=;
 b=mgSnsCymdLBDCwAQMld+v2S3+yf/Yb2/atYqUI7WBpXArh9aVwPOZs5gRxMMnPXf2C
 5zSpSsHRjEWS73EOLNJEC5CzAUWcOgCyZS5H5La5jo4U/PDhCNAJzqSXGSVcyi1cLOFk
 XpOBV1pqbHGw/ANWWNaT+wn7BWjCrtkOd2YRuW6l3O9Bjyw5/gHNp96MYV1DfU3FewOU
 TCCBciztBzP6OtzrMF9G45bPDr9H1bzKnp4d2l7ulweuR0eVahjEX+lUusMVKvFwh7oL
 V7VBGcbhCL9jePiJf6BZOhs7LRcxomZjL8YaMlHiSdh/E33z7JUM9IkzxOryMUSNtDW8
 8wfg==
X-Gm-Message-State: AOAM531oHfJ+xcMsX1adRUSG7pvOtgi3KKB/E1NVn534e17fB7d7/vU3
 MfMLI54cUkK62AzbqzuxM6fWCg==
X-Google-Smtp-Source: ABdhPJxVcAFeCcFJ0BV5iO1FeaZa+XJFmc7PEYU7imdaPNyCQNJYbrUDecQv4qxDFiRydF4XQvCUaw==
X-Received: by 2002:a05:6402:2787:: with SMTP id
 b7mr56873542ede.159.1634677899626; 
 Tue, 19 Oct 2021 14:11:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q14sm92905edj.42.2021.10.19.14.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 14:11:39 -0700 (PDT)
Date: Tue, 19 Oct 2021 23:11:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: guangming.cao@mediatek.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 wsd_upstream@mediatek.com
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf: add attachments empty check for
 dma_buf_release
Message-ID: <YW80iakRm5jWjIUp@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, 
 guangming.cao@mediatek.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 wsd_upstream@mediatek.com
References: <20211019122345.160555-1-guangming.cao@mediatek.com>
 <YW686sIZie4xRUQO@phenom.ffwll.local>
 <8cca7188-6484-d3a5-2b87-400f6500e742@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8cca7188-6484-d3a5-2b87-400f6500e742@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_141142_176078_211D9178 
X-CRM114-Status: GOOD (  38.52  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 19, 2021 at 05:37:27PM +0200, Christian K=F6nig wrote:
> =

> =

> Am 19.10.21 um 14:41 schrieb Daniel Vetter:
> > On Tue, Oct 19, 2021 at 08:23:45PM +0800, guangming.cao@mediatek.com wr=
ote:
> > > From: Guangming Cao <Guangming.Cao@mediatek.com>
> > > =

> > > Since there is no mandatory inspection for attachments in dma_buf_rel=
ease.
> > > There will be a case that dma_buf already released but attachment is =
still
> > > in use, which can points to the dmabuf, and it maybe cause
> > > some unexpected issues.
> > > =

> > > With IOMMU, when this cases occurs, there will have IOMMU address
> > > translation fault(s) followed by this warning,
> > > I think it's useful for dma devices to debug issue.
> > > =

> > > Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> > This feels a lot like hand-rolling kobject debugging. If you want to do
> > this then I think adding kobject debug support to
> > dma_buf/dma_buf_attachment would be better than hand-rolling something
> > bespoke here.
> =

> Well I would call that overkill.

I think if done right the object debug stuff should be able to give you a
backtrace. Which might be useful if you have a dma-buf heaps design where
you really have no clue why a buffer was allocated/attached without some
hints.

> > Also on the patch itself: You don't need the trylock. For correctly
> > working code non one else can get at the dma-buf, so no locking needed =
to
> > iterate through the attachment list. For incorrect code the kernel will=
 be
> > on fire pretty soon anyway, trying to do locking won't help :-) And
> > without the trylock we can catch more bugs (e.g. if you also forgot to
> > unlock and not just forgot to detach).
> =

> You also don't need the WARN(!list_empty...) because a few line below we
> already have a "WARN_ON(!list_empty(&dmabuf->attachments));".

Yeah this patch here alone isn't really that useful I think. Maybe we
could add the dmabuf->exp_name or so to that warning, but otherwise the
info printed here isn't all that useful for debugging. Grabbing a
backtrace of the allocator or attacher otoh should fairly immedialy point
at the buggy code.
-Daniel

> =

> Christian.
> =

> > -Daniel
> > =

> > > ---
> > >   drivers/dma-buf/dma-buf.c | 23 +++++++++++++++++++++++
> > >   1 file changed, 23 insertions(+)
> > > =

> > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > index 511fe0d217a0..672404857d6a 100644
> > > --- a/drivers/dma-buf/dma-buf.c
> > > +++ b/drivers/dma-buf/dma-buf.c
> > > @@ -74,6 +74,29 @@ static void dma_buf_release(struct dentry *dentry)
> > >   	 */
> > >   	BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
> > > +	/* attachment check */
> > > +	if (dma_resv_trylock(dmabuf->resv) && WARN(!list_empty(&dmabuf->att=
achments),
> > > +	    "%s err, inode:%08lu size:%08zu name:%s exp_name:%s flags:0x%08=
x mode:0x%08x, %s\n",
> > > +	    __func__, file_inode(dmabuf->file)->i_ino, dmabuf->size,
> > > +	    dmabuf->name, dmabuf->exp_name,
> > > +	    dmabuf->file->f_flags, dmabuf->file->f_mode,
> > > +	    "Release dmabuf before detach all attachments, dump attach:\n")=
) {
> > > +		int attach_cnt =3D 0;
> > > +		dma_addr_t dma_addr;
> > > +		struct dma_buf_attachment *attach_obj;
> > > +		/* dump all attachment info */
> > > +		list_for_each_entry(attach_obj, &dmabuf->attachments, node) {
> > > +			dma_addr =3D (dma_addr_t)0;
> > > +			if (attach_obj->sgt)
> > > +				dma_addr =3D sg_dma_address(attach_obj->sgt->sgl);
> > > +			pr_err("attach[%d]: dev:%s dma_addr:0x%-12lx\n",
> > > +			       attach_cnt, dev_name(attach_obj->dev), dma_addr);
> > > +			attach_cnt++;
> > > +		}
> > > +		pr_err("Total %d devices attached\n\n", attach_cnt);
> > > +		dma_resv_unlock(dmabuf->resv);
> > > +	}
> > > +
> > >   	dmabuf->ops->release(dmabuf);
> > >   	if (dmabuf->resv =3D=3D (struct dma_resv *)&dmabuf[1])
> > > -- =

> > > 2.17.1
> > > =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
