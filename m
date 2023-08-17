Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2D6EB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 07:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYIubR0vsbL2I01y4mt2tVH+hnp889Ebe7bA8SyGOuw=; b=eyzphoDk5ICWw68vf3mJcYlNGZ
	8eR33a1YEyyjlEPt3rAq5ARGidctMCMBzPTl6hBlmQMeSzcPI8MCaFEM/RHsC6BH/AW00dlfmlyej
	77OdDCCUOGgWUTb0skwmNikxWfW74UetLPRC6R0xrOUlLpy9ZzqjF6UrGIn83aJ+O8uJ9tSAxMLX2
	9B6PAUyYC+ouTgyH/LxbKH/bA1yzFbBxUrtz7AEp8Vw55uE4II3nVzkYtZ3mFL3NDw10hsq3g9IRJ
	yJcjRPrrrMGRVT2ETlKo0bbPhnre/b3xV1wQVMo7acZHrX1eeOImCgkWXtPekCm/pIekjcIYQ/fxF
	9fLU1nNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXAY-005gyQ-2d;
	Thu, 17 Aug 2023 07:11:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXAU-005gxu-1L
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Aug 2023 07:11:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6BAD760F59;
	Thu, 17 Aug 2023 07:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26F1C433C9;
	Thu, 17 Aug 2023 07:11:38 +0000 (UTC)
Message-ID: <532a4f36-ad81-50fb-24d2-1f31f93cc714@xs4all.nl>
Date: Thu, 17 Aug 2023 09:11:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] media: videobuf2-core.c: check if all buffers have the
 same number of planes
To: Sakari Ailus <sakari.ailus@iki.fi>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-mediatek@lists.infradead.org, Wei Chen <harperchen1110@gmail.com>,
 tiffany.lin@mediatek.com, Nicolas Dufresne <nicolas@ndufresne.ca>
References: <e75ff985-2499-9a16-21fe-ee2e81547e6f@xs4all.nl>
 <20230816143432.GA4436@pendragon.ideasonboard.com>
 <ZN0L6SAWlr+KZTVK@valkosipuli.retiisi.eu>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <ZN0L6SAWlr+KZTVK@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_001142_526442_5F7617E0 
X-CRM114-Status: GOOD (  25.21  )
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

On 16/08/2023 19:48, Sakari Ailus wrote:
> Hi Hans, Laurent,
> 
> On Wed, Aug 16, 2023 at 05:34:32PM +0300, Laurent Pinchart wrote:
>> Hi Hans,
>>
>> Thank you for the patch.
>>
>> On Wed, Aug 16, 2023 at 02:47:33PM +0200, Hans Verkuil wrote:
>>> Currently if VIDIOC_CREATE_BUFS is called to add new buffers, then the requested
>>> number of planes per buffer might be different from the already allocated buffers.
>>>
>>> However, this does not make a lot of sense and there are no drivers that allow
>>> for variable number of planes in the allocated buffers.
>>>
>>> While it is possible do this today, when such a buffer is queued it will fail
>>> in the buf_prepare() callback where the plane sizes are checked if those are
>>> large enough. If fewer planes were allocated, then the size for the missing
>>> planes are 0 and the check will return -EINVAL.
>>>
>>> But it is much better to do this check in VIDIOC_CREATE_BUFS.
>>
>> I don't think this is a good idea. One important use case for
>> VIDIOC_CREATE_BUFS is to allocate buffers for a different format than
>> the one currently configured for the device, to prepare for a future
>> capture (or output) session with a different configuration. This patch
>> would prevent that.
> 
> I'd prefer to keep this capability in videobuf2, too. Although... one way
> achieve that could be to add a flag (or an integer field) in struct
> vb2_queue to tell vb2 core that the driver wants to do the num_planes
> checks by itself.

Having a flag for this was something I intended to do once we have a
driver that actually supports this feature. I'm not aware of any driver
that needs this today. But I'll make a v2 adding this flag, it is simple
to do and doesn't hurt.

> 
> It'd be also nicer, considering the end result, to configure this when
> setting up the queue, rather than based on the first buffer created. This
> would involve changing a large number of drivers though.
> 

"to configure this": what is "this"? The new flag? Or the number of planes?
And with "setting up the queue" do you mean the queue_setup callback or
when the vb2_queue is initialized?

Regards,

	Hans

