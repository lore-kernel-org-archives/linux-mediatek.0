Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BF9C001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 17:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uAzcc6JtZWWir62VQppfsDrI6LB9msLvExd+Vrj0NkE=; b=IRQ8sqqUHgHBzyu8ddPvoPqm47
	GcF6PhrFD7YK0gxk3ey+hquwIJoYo3fBW5SHJqceB+7Dhvr0VD7bOPUgL34xqjJp0g2/DMiMayke6
	DhsluLmpbiiElzOPOj1dndMfDRUc0gX/gpPwumkPu+oLO8PBzoM208YdjqAvXco00IeaitPhrBQfF
	oXWG60y7duSbMfh2VxPKdh3AKMnEkAc8GqgI5RjPKxMnV3lkUYOUkhORa0XqfkwGrMjJLNEgMvz+n
	aEvfXbWvl3O+mf7eekuKCJHWr/RCVGZ76/eVm5VYT8aJJqXc77yB0Yi3pYHddNQp7D6RSKDaTeAfT
	WJOTRAuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWKdU-004jhV-39;
	Wed, 16 Aug 2023 17:48:48 +0000
Received: from meesny.iki.fi ([195.140.195.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWKdS-004jgb-1h
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Aug 2023 17:48:48 +0000
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4RQwbZ46xfzyks;
	Wed, 16 Aug 2023 20:48:26 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1692208110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uAzcc6JtZWWir62VQppfsDrI6LB9msLvExd+Vrj0NkE=;
	b=ik9BvtZgVvYQKpz+DPWg8e90mIMelckLYxixu63WVpM4eLRdtV4Cm9buftZES1cwVhgIYV
	qKO4INr+50SnmUDj65q7evw/y2IQgJbG0NGCKK9w26BTnVhWb7NpM/pKOelHfS3kfGCFIF
	mGNmpL/nhGjcVSKp9Q2tK3r0gUG15B0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1692208110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uAzcc6JtZWWir62VQppfsDrI6LB9msLvExd+Vrj0NkE=;
	b=g3AZeJAV2OK6+XkzS9JK6bG6oLpe0c5hol91oNaO92Fk4W9SwXK/oYYCpDs51Ec56OG3fd
	5B1iaStP9AsJ0JVPMsNImEtV+N6LrVJbLS3WK+CsO1Di13wgwTq4xZv7VS+NGpqUsMXGvc
	YYLPxwSNr2QtIObqCONNnKx89RoAFZc=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1692208110; a=rsa-sha256; cv=none;
	b=Q/rpJGfDua7E/93eYHsVrjvY5RviHxzBdYJbmunvROjilaiyM8kqIhfNfECJgUZFVAVSIH
	u/bIMuMtlMvRcq2nOxkcoT3ma0wY8RdLditewq+/PU7eJyqT58nwC/dCeN+kA2nOAMEqdF
	QZsjfz11RFy0V6bMDhOwGhY0OyudO/0=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C5AEF634C95;
	Wed, 16 Aug 2023 20:48:25 +0300 (EEST)
Date: Wed, 16 Aug 2023 17:48:25 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	Wei Chen <harperchen1110@gmail.com>, tiffany.lin@mediatek.com,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCH] media: videobuf2-core.c: check if all buffers have the
 same number of planes
Message-ID: <ZN0L6SAWlr+KZTVK@valkosipuli.retiisi.eu>
References: <e75ff985-2499-9a16-21fe-ee2e81547e6f@xs4all.nl>
 <20230816143432.GA4436@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816143432.GA4436@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_104846_773455_8AFC0AF1 
X-CRM114-Status: GOOD (  25.31  )
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

Hi Hans, Laurent,

On Wed, Aug 16, 2023 at 05:34:32PM +0300, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Wed, Aug 16, 2023 at 02:47:33PM +0200, Hans Verkuil wrote:
> > Currently if VIDIOC_CREATE_BUFS is called to add new buffers, then the requested
> > number of planes per buffer might be different from the already allocated buffers.
> > 
> > However, this does not make a lot of sense and there are no drivers that allow
> > for variable number of planes in the allocated buffers.
> > 
> > While it is possible do this today, when such a buffer is queued it will fail
> > in the buf_prepare() callback where the plane sizes are checked if those are
> > large enough. If fewer planes were allocated, then the size for the missing
> > planes are 0 and the check will return -EINVAL.
> > 
> > But it is much better to do this check in VIDIOC_CREATE_BUFS.
> 
> I don't think this is a good idea. One important use case for
> VIDIOC_CREATE_BUFS is to allocate buffers for a different format than
> the one currently configured for the device, to prepare for a future
> capture (or output) session with a different configuration. This patch
> would prevent that.

I'd prefer to keep this capability in videobuf2, too. Although... one way
achieve that could be to add a flag (or an integer field) in struct
vb2_queue to tell vb2 core that the driver wants to do the num_planes
checks by itself.

It'd be also nicer, considering the end result, to configure this when
setting up the queue, rather than based on the first buffer created. This
would involve changing a large number of drivers though.

-- 
Regards,

Sakari Ailus

