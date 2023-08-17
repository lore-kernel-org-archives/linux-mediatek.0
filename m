Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46654EB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 09:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDIfyL6uo0rhSI/IOjyS+HTnrfbD8wJgWAbS7CJi6Jc=; b=KogU9Lr4V1z3qeyY5SMruPQxFd
	iOqlQrznhLlrHIPtRD+rKumti6LPYa4GPE5pgAbMmbZXdxZHawE91TkUK0EnzO72f8DJ8bSnJmyN9
	jUh65z1N9btyMWsO8cJV71EW8hZZhp4sfBdA9MqyasQYKdD3RZvIwV1MCHaLTUWvoLiHjVkLmNuOd
	W6BmJP1opor0G7Ck5bMVjtNUlt3QpJnQyyQ8m3+etIXRZUcj62vkSkNn0rVcf7wJBP7WgFfbpzBD7
	LHM2CuZZaFYuSm5Ep+GUHNkiqTJnZhQWxMcvoWhEorpr+Es5Zw+GuHh97ZPGsrPdQSXfxc234d+mM
	0KmjK2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWYzi-005tZd-2W;
	Thu, 17 Aug 2023 09:08:42 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWYzf-005tYr-2G
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Aug 2023 09:08:41 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CB21497;
	Thu, 17 Aug 2023 11:07:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1692263241;
	bh=o/RWrhvXzH4L7KfJpmuQ449tR+afPShbWF5OBRBumwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AA7KO/uNRc5nwpCEE43ZSiRn729/r+PgTG6rIYIK9CVsp4B2K5U8+rRUKcTAdaGxV
	 Qq517kJpNpuR9OiN/NImhzTFG9KpZKQkO/ZwyJJwmhmq0gopFVO726z4M8TUJVq63j
	 Yx+Y/18E60AsiPL4IPrl2X31Z7D3zUfdylVlrLUE=
Date: Thu, 17 Aug 2023 12:08:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	Wei Chen <harperchen1110@gmail.com>, tiffany.lin@mediatek.com,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCH] media: videobuf2-core.c: check if all buffers have the
 same number of planes
Message-ID: <20230817090840.GD21668@pendragon.ideasonboard.com>
References: <e75ff985-2499-9a16-21fe-ee2e81547e6f@xs4all.nl>
 <20230816143432.GA4436@pendragon.ideasonboard.com>
 <ZN0L6SAWlr+KZTVK@valkosipuli.retiisi.eu>
 <532a4f36-ad81-50fb-24d2-1f31f93cc714@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <532a4f36-ad81-50fb-24d2-1f31f93cc714@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_020839_908602_2CFADF5D 
X-CRM114-Status: GOOD (  31.53  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello,

On Thu, Aug 17, 2023 at 09:11:36AM +0200, Hans Verkuil wrote:
> On 16/08/2023 19:48, Sakari Ailus wrote:
> > On Wed, Aug 16, 2023 at 05:34:32PM +0300, Laurent Pinchart wrote:
> >> On Wed, Aug 16, 2023 at 02:47:33PM +0200, Hans Verkuil wrote:
> >>> Currently if VIDIOC_CREATE_BUFS is called to add new buffers, then the requested
> >>> number of planes per buffer might be different from the already allocated buffers.
> >>>
> >>> However, this does not make a lot of sense and there are no drivers that allow
> >>> for variable number of planes in the allocated buffers.
> >>>
> >>> While it is possible do this today, when such a buffer is queued it will fail
> >>> in the buf_prepare() callback where the plane sizes are checked if those are
> >>> large enough. If fewer planes were allocated, then the size for the missing
> >>> planes are 0 and the check will return -EINVAL.
> >>>
> >>> But it is much better to do this check in VIDIOC_CREATE_BUFS.
> >>
> >> I don't think this is a good idea. One important use case for
> >> VIDIOC_CREATE_BUFS is to allocate buffers for a different format than
> >> the one currently configured for the device, to prepare for a future
> >> capture (or output) session with a different configuration. This patch
> >> would prevent that.
> > 
> > I'd prefer to keep this capability in videobuf2, too. Although... one way
> > achieve that could be to add a flag (or an integer field) in struct
> > vb2_queue to tell vb2 core that the driver wants to do the num_planes
> > checks by itself.
> 
> Having a flag for this was something I intended to do once we have a
> driver that actually supports this feature. I'm not aware of any driver
> that needs this today. But I'll make a v2 adding this flag, it is simple
> to do and doesn't hurt.

I don't think it should be a driver decision, as it's a question of
userspace usage. We shouldn't couple buffer allocation and buffer usage,
VIDIOC_CREATE_BUFS needs to allow allocation of any buffer suitable for
the hardware *in any configuration*, not just the active configuration.
It's only at buffer prepare time that the fitness of a particular buffer
for the active configuration of the device can be checked.

> > It'd be also nicer, considering the end result, to configure this when
> > setting up the queue, rather than based on the first buffer created. This
> > would involve changing a large number of drivers though.
> 
> "to configure this": what is "this"? The new flag? Or the number of planes?
> And with "setting up the queue" do you mean the queue_setup callback or
> when the vb2_queue is initialized?

-- 
Regards,

Laurent Pinchart

