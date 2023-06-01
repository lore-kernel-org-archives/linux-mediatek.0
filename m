Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F89C77B7E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 08:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SoRscBBBxchFp+ppevHrPaNBjOAg1SsZaLkLAwmq+Mo=; b=NbDZeLoz3ops+qtIIBm3pftYgD
	TeOPJCfsGer4tl6zhq0nu+6SZtrxnV++x9UlAr/zO+ysXychod2NXYK7tgkxlC7YvK7Z2HVf7LMo6
	aVExss50eVyibuMRzLNf5ggJLXvENXXyf/GKiG2lx58r5OhUZ/zJS7Svj8JuTeTsBsMjZqR/2z+Ba
	dwNW/A8yNpp7gr+dUe2HVLCPw74q5yQow9C3luymfPovj4qgGCN+yY5NsHhAslzDjIPJPmKQe3OEd
	DPoVRtOc6fItp2eORyIJqoA8KO7D4nJAj/WaagDKoS97XFu8sQmp2Rsu4j/YA/CxCIaCyGLOwAOt6
	hLHN4i6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4dHh-002TZg-0i;
	Thu, 01 Jun 2023 08:03:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4dHd-002TXi-2M;
	Thu, 01 Jun 2023 08:03:47 +0000
Received: from [IPV6:2a01:e0a:120:3210:7d6d:c387:79e6:807d] (unknown [IPv6:2a01:e0a:120:3210:7d6d:c387:79e6:807d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7B7B06606ECE;
	Thu,  1 Jun 2023 09:03:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685606622;
	bh=vPNmJuzIG5LIGX1QupTZo+d2rc1g3ZOc8ocjPfDkdis=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ivmwB1xugtA/DX4q4/kiYM/kIk+j9+L4NiQmrVIcwcdV6gg0U+iWYiU0xZ1AXopEi
	 QheNpVN0eNxmBFxGffDQk0HPSGK/BDVfBuBAWXnJ1JFTtl227w2Hulv2hqk09hySHi
	 eAFn8Orzpi+coXcr33KbBKxxFPexw+BaEWjSINhuiNEyLrePTmMQ4+scsGdVKzHSSw
	 5Tp+GfUY2JmKI8Vi5xZvnUhIhilFbsJy9ChG9HgzYMW0XBmvNz+nY9VbqEt9FpaZYH
	 vEUTki+ViM+K8uodCrfLjt1ZwnVxmGLgkYDiNQd1S2pw6Jx+IZ5H/yzfXHmfz9xcEO
	 S4h+TMa/sWBhQ==
Message-ID: <6f53b5f6-6649-f194-1808-5f5757b449f4@collabora.com>
Date: Thu, 1 Jun 2023 10:03:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/8] media: videobuf2: Add a module param to limit vb2
 queue buffer storage
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
 ming.qian@nxp.com, shijie.qin@nxp.com, eagle.zhou@nxp.com,
 bin.liu@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, tiffany.lin@mediatek.com,
 andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
 stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 daniel.almeida@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20230321102855.346732-1-benjamin.gaignard@collabora.com>
 <20230321102855.346732-4-benjamin.gaignard@collabora.com>
 <6c4658fd-3a64-b3f8-67cd-17ed2d7d3567@xs4all.nl>
 <20230531080331.GB6496@pendragon.ideasonboard.com>
 <608ae7d6-3f3b-137d-08d2-d41a240be2c4@xs4all.nl>
 <20230531123945.GF27043@pendragon.ideasonboard.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20230531123945.GF27043@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_010346_067706_D234E812 
X-CRM114-Status: GOOD (  27.85  )
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


Le 31/05/2023 à 14:39, Laurent Pinchart a écrit :
> On Wed, May 31, 2023 at 10:30:36AM +0200, Hans Verkuil wrote:
>> On 5/31/23 10:03, Laurent Pinchart wrote:
>>> On Wed, May 31, 2023 at 08:36:59AM +0200, Hans Verkuil wrote:
>>>> On 21/03/2023 11:28, Benjamin Gaignard wrote:
>>>>> Add module parameter "max_vb_buffer_per_queue" to be able to limit
>>>>> the number of vb2 buffers store in queue.
>>>>>
>>>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>>>> ---
>>>>>   drivers/media/common/videobuf2/videobuf2-core.c | 15 +++------------
>>>>>   include/media/videobuf2-core.h                  | 11 +++++++++--
>>>>>   2 files changed, 12 insertions(+), 14 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
>>>>> index ae9d72f4d181..f4da917ccf3f 100644
>>>>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>>>>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>>>>> @@ -34,6 +34,8 @@
>>>>>   static int debug;
>>>>>   module_param(debug, int, 0644);
>>>>>   
>>>>> +module_param(max_vb_buffer_per_queue, ulong, 0644);
>>>> There is no MODULE_PARM_DESC here? Please add. I see it is not there for
>>>> the debug param either, it should be added for that as well.
>>> Would this be the right time to consider resource accounting in V4L2 for
>>> buffers ? Having a module parameter doesn't sound very useful, an
>>> application could easily allocate more buffers by using buffer orphaning
>>> (allocating buffers, exporting them as dmabuf objects, and freeing them,
>>> which leaves the memory allocated). Repeating allocation cycles up to
>>> max_vb_buffer_per_queue will allow allocating an unbounded number of
>>> buffers, using all the available system memory. I'd rather not add a
>>> module argument that only gives the impression of some kind of safety
>>> without actually providing any value.
>> Does dmabuf itself provide some accounting mechanism? Just wondering.
>>
>> More specific to V4L2: I'm not so sure about this module parameter either.
>> It makes sense to have a check somewhere against ridiculous values (i.e.
>> allocating MAXINT buffers), but that can be a define as well. But otherwise
>> I am fine with allowing applications to allocate buffers until the memory
>> is full.
>>
>> The question is really: what is this parameter supposed to do? The only
>> thing it does is to sanitize unlikely inputs (e.g. allocating MAXINT buffers).
>>
>> I prefer that as a define, to be honest.
>>
>> I think it is perfectly fine for users to try to request more buffers than
>> memory allows. It will just fail in that case, not a problem.
>>
>> And if an application is doing silly things like buffer orphaning, then so
>> what? Is that any different than allocating memory and not freeing it?
>> Eventually it will run out of memory and crash, which is normal.
> Linux provides APIs to account for and limit usage of resources,
> including memory. A system administrator can prevent rogue processes
> from starving system resources. The memory consumed by vb2 buffer isn't
> taken into account, making V4L2 essentially unsafe for untrusted
> processes.
>
> Now, to be fair, there are many reasons why allowing access to v4L2
> devices to untrusted applications is a bad idea, and memory consumption
> is likely not even the worst one. Still, is this something we want to
> fix, or do we want to consider V4L2 to be priviledged API only ? Right
> now we can't do so, but with many Linux systems moving towards pipewire,
> we could possibly have a system daemon isolating untrusted applications
> from the rest of the system. We may thus not need to fix this in the
> V4L2 API.

I'm working in v3 where I'm using Xarray API.

Just to be sure to understand you well:
I can just remove VB2_MAX_FRAME limit without adding a new one ?

>

