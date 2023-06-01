Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4F8C7EE29
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 08:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vf9TatAF6sSh3fLDSSbor/82eA6igm7hSnGjEYvZ33c=; b=OhAiP3eSWQ9OV824MxNGlm0cgm
	rUJd0XWF0tr7Lfmz4EaAH+IxCAogqUzqR7stSu8n9hmcp4SbqXnMh+IP/tmUtKFpM9xKBxaTHQ1xB
	PX4y965z78Nhh4ADB37HQi/Wy89TG5/i5Lq0jAMrbqCS9kbv4JNsqvMs+JkIjM9rFlzsd2d0dcVOT
	SOk2jHE4Z276mOF36ay4ZDKAaNRRRR0Bhv3BaTVm6ggxWOxdEyzO6OyxroFOVnWTvqY5S5yxeqYHl
	p3UUe4/rAfgpQ9YpWgED9X9Vuce7mxviu6VJ4p83RWtTd+fZq8NrjsRdKtoHKKuY+LlAH40u9jEkP
	OSKvFE2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4dlh-002aBI-1N;
	Thu, 01 Jun 2023 08:34:49 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4dle-002a8w-0z;
	Thu, 01 Jun 2023 08:34:47 +0000
Received: from pendragon.ideasonboard.com (om126205251136.34.openmobile.ne.jp [126.205.251.136])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14E272B6;
	Thu,  1 Jun 2023 10:34:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1685608460;
	bh=gjjeif7oGjHL6hoGkZVclWwy0gG6mXm12g9c6do6TMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JUUnACbDpEB6bOR3h2O5ln8qOzpTqf9VBhkZ21myMqir6gqWJBUH2lhbgPljo3AUr
	 ZLmbW7sTAYzT5ej8JCl0YnN2x2g7F+RvAmu0lgbeX4QT61LRIobNk04EA1PyP66ClH
	 YW/Xq3c4rgNzXp9p+1Ol32sfvdB3/t8nHUJEqQMg=
Date: Thu, 1 Jun 2023 11:34:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org, ming.qian@nxp.com,
	shijie.qin@nxp.com, eagle.zhou@nxp.com, bin.liu@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com, stanimir.k.varbanov@gmail.com,
	quic_vgarodia@quicinc.com, agross@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de, daniel.almeida@collabora.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 3/8] media: videobuf2: Add a module param to limit vb2
 queue buffer storage
Message-ID: <20230601083438.GE22609@pendragon.ideasonboard.com>
References: <20230321102855.346732-1-benjamin.gaignard@collabora.com>
 <20230321102855.346732-4-benjamin.gaignard@collabora.com>
 <6c4658fd-3a64-b3f8-67cd-17ed2d7d3567@xs4all.nl>
 <20230531080331.GB6496@pendragon.ideasonboard.com>
 <608ae7d6-3f3b-137d-08d2-d41a240be2c4@xs4all.nl>
 <20230531123945.GF27043@pendragon.ideasonboard.com>
 <6f53b5f6-6649-f194-1808-5f5757b449f4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f53b5f6-6649-f194-1808-5f5757b449f4@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_013446_515124_9D77F7C1 
X-CRM114-Status: GOOD (  37.90  )
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

Hi Benjamin,

On Thu, Jun 01, 2023 at 10:03:39AM +0200, Benjamin Gaignard wrote:
> Le 31/05/2023 à 14:39, Laurent Pinchart a écrit :
> > On Wed, May 31, 2023 at 10:30:36AM +0200, Hans Verkuil wrote:
> >> On 5/31/23 10:03, Laurent Pinchart wrote:
> >>> On Wed, May 31, 2023 at 08:36:59AM +0200, Hans Verkuil wrote:
> >>>> On 21/03/2023 11:28, Benjamin Gaignard wrote:
> >>>>> Add module parameter "max_vb_buffer_per_queue" to be able to limit
> >>>>> the number of vb2 buffers store in queue.
> >>>>>
> >>>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >>>>> ---
> >>>>>   drivers/media/common/videobuf2/videobuf2-core.c | 15 +++------------
> >>>>>   include/media/videobuf2-core.h                  | 11 +++++++++--
> >>>>>   2 files changed, 12 insertions(+), 14 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> >>>>> index ae9d72f4d181..f4da917ccf3f 100644
> >>>>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> >>>>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> >>>>> @@ -34,6 +34,8 @@
> >>>>>   static int debug;
> >>>>>   module_param(debug, int, 0644);
> >>>>>   
> >>>>> +module_param(max_vb_buffer_per_queue, ulong, 0644);
> >>>> There is no MODULE_PARM_DESC here? Please add. I see it is not there for
> >>>> the debug param either, it should be added for that as well.
> >>> Would this be the right time to consider resource accounting in V4L2 for
> >>> buffers ? Having a module parameter doesn't sound very useful, an
> >>> application could easily allocate more buffers by using buffer orphaning
> >>> (allocating buffers, exporting them as dmabuf objects, and freeing them,
> >>> which leaves the memory allocated). Repeating allocation cycles up to
> >>> max_vb_buffer_per_queue will allow allocating an unbounded number of
> >>> buffers, using all the available system memory. I'd rather not add a
> >>> module argument that only gives the impression of some kind of safety
> >>> without actually providing any value.
> >> Does dmabuf itself provide some accounting mechanism? Just wondering.
> >>
> >> More specific to V4L2: I'm not so sure about this module parameter either.
> >> It makes sense to have a check somewhere against ridiculous values (i.e.
> >> allocating MAXINT buffers), but that can be a define as well. But otherwise
> >> I am fine with allowing applications to allocate buffers until the memory
> >> is full.
> >>
> >> The question is really: what is this parameter supposed to do? The only
> >> thing it does is to sanitize unlikely inputs (e.g. allocating MAXINT buffers).
> >>
> >> I prefer that as a define, to be honest.
> >>
> >> I think it is perfectly fine for users to try to request more buffers than
> >> memory allows. It will just fail in that case, not a problem.
> >>
> >> And if an application is doing silly things like buffer orphaning, then so
> >> what? Is that any different than allocating memory and not freeing it?
> >> Eventually it will run out of memory and crash, which is normal.
> >
> > Linux provides APIs to account for and limit usage of resources,
> > including memory. A system administrator can prevent rogue processes
> > from starving system resources. The memory consumed by vb2 buffer isn't
> > taken into account, making V4L2 essentially unsafe for untrusted
> > processes.
> >
> > Now, to be fair, there are many reasons why allowing access to v4L2
> > devices to untrusted applications is a bad idea, and memory consumption
> > is likely not even the worst one. Still, is this something we want to
> > fix, or do we want to consider V4L2 to be priviledged API only ? Right
> > now we can't do so, but with many Linux systems moving towards pipewire,
> > we could possibly have a system daemon isolating untrusted applications
> > from the rest of the system. We may thus not need to fix this in the
> > V4L2 API.
> 
> I'm working in v3 where I'm using Xarray API.
> 
> Just to be sure to understand you well:
> I can just remove VB2_MAX_FRAME limit without adding a new one ?

As long as the code is protected against overflows (e.g. if it uses
num_buffers + 1 in some calculations and allows num_buffers to be
UINT_MAX, you'll have an issue), it should be fine for the vb2 and V4L2
core. Limiting the number of buffers doesn't really protect against
much.

-- 
Regards,

Laurent Pinchart

