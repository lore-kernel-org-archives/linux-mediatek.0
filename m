Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8CAC7618A
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Mar 2023 23:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0pA86/X7kYR9pvXcUWfmbz5VnARBPSuzJ0OANCoHvk=; b=RpLMXfz/k35R0+3S/ltq5c3ocU
	1+GfioMrb4a/fc37UC+ssPDqnnzVJahYHo943xz7+5reX2+HWfHCjEzm0K1OL8WUObOz4rxfADH/x
	RdTyqLwQ2uP+fpy0xJ9aVKiehzmJBlJZ9zee7qw3t3OfdQPkfu/O4roLYbUCog4pb5RvdBA1AMgHR
	4XZBoo9RE23nGkQULFojnmXL9u4QXsGZekdANhiAiUT+Vq5u/1ZTgks57pT4d7YmslXQaZEMyzLr9
	Ki8CJk7OKbo5zO43I3yUE7XP3glCPKlqbA8jkbZF06yEqDq12mRI0DMZ4lBfUfp6Ghjk1dVKWucxJ
	o8G/32Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe2XC-007eHA-25;
	Sun, 19 Mar 2023 23:33:54 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe2X9-007eFD-0b;
	Sun, 19 Mar 2023 23:33:52 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 261C41373;
	Mon, 20 Mar 2023 00:33:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1679268826;
	bh=rfehHzT0nNC1C/6Q8HysuOgzvRnx3AnZ/cu68zcvIDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AbjSS6ayXnuqLhNWp/mlyDEibEroimNo5524LDllyl+5l8OTzNL+N19fuRaa8JOkQ
	 /hMzNTpPDQoaW3ugi1qphNNqEpCX2hp2/Y5dXcqu1UBXKiQrXaiUGLpXnhZwk/4asE
	 cZfZf5l6VdSz+htrDT2WABZRId7PHRBwC2VQMVbw=
Date: Mon, 20 Mar 2023 01:33:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org, ming.qian@nxp.com,
	shijie.qin@nxp.com, eagle.zhou@nxp.com, bin.liu@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com, stanimir.k.varbanov@gmail.com,
	quic_vgarodia@quicinc.com, agross@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de, daniel.almeida@collabora.com,
	hverkuil-cisco@xs4all.nl, jerbel@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [RFC 2/4] media: videobuf2: Replace bufs array by a list
Message-ID: <20230319233352.GC20234@pendragon.ideasonboard.com>
References: <20230313135916.862852-1-benjamin.gaignard@collabora.com>
 <20230313135916.862852-3-benjamin.gaignard@collabora.com>
 <20230313181155.GC22646@pendragon.ideasonboard.com>
 <bdade438cd93230daa47ee48eafab60f65cd4224.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bdade438cd93230daa47ee48eafab60f65cd4224.camel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_163351_378212_7DF1F0EF 
X-CRM114-Status: GOOD (  21.82  )
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

On Wed, Mar 15, 2023 at 09:57:51AM -0400, Nicolas Dufresne wrote:
> Le lundi 13 mars 2023 à 20:11 +0200, Laurent Pinchart a écrit :
> > > -	/* Ensure that q->num_buffers+num_buffers is below VB2_MAX_FRAME */
> > > -	num_buffers = min_t(unsigned int, num_buffers,
> > > -			    VB2_MAX_FRAME - q->num_buffers);
> > > -
> > 
> > We can indeed drop this check now, but shouldn't we introduce some kind
> > of resource accounting and limitation ? Otherwise any unpriviledged
> > userspace will be able to starve system memory. This could be
> > implemented on top, as the problem largely exists today already, but I'd
> > like to at least record this in a TODO comment.
> 
> The current limit already isn't work for resource accounting and limitation for
> m2m drivers. You can open a device, allocate 32 buffers, and close that device
> keeping the memory around. And redo this process as many times as you want.

I know, that's why I mentioned that the problem largely exists today
already.

> A TODO is most appropriate, but I would prefer to see this done at a memory
> layer level (rather then v4l2 specific), so that limits and accounting works
> with containers and other sandboxes.

I haven't thought about how this could be implemented, all I know is
that it's about time to tackle this issue, so I would like to at least
record it.

> > I also wonder if we should still limit the number of allocated buffers.
> > The limit could be large, for instance 1024 buffers, and it would be an
> > in-kernel limit that could be increased later if needed. I'm concerned
> > that dropping the limit completely will allow userspace to request
> > UINT_MAX buffers, which may cause integer overflows somewhere. Limiting
> > the number of buffers would avoid extensive review of all the code that
> > deals with counting buffers.
> 

-- 
Regards,

Laurent Pinchart

