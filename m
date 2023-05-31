Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9291AC77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 08:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bi/zwW1dF0baBHFGLa1Ol2YY+ghL4hKqNhiswnod4IY=; b=dDFE/qsIDURwScsZjTXYd7ZJXX
	QYPJPnqRjkQqXBfyEm1o7FI50HHctTJr4/K8xpkniTVdG2gw348wdQfQi/r8jCUx+9uGAHhmiUhSc
	IA35mz5W0JrTZjSzEuZ3vDVecmasUfPNK3+ZZB7IlxUAza8P35ZqkbiMRlJbYOxPbOe4PveC4uc8G
	u/YzTh57KTNNKStr0KNW1ShPBSMZrWg/hQgB9WgmfmjlK6nSriwUpHCpjH7BreQUsLA1RWeE2IaK7
	DZtl3yTfVBTp2O43X1nQm4cSQnF4J+C0Lqw/8MwKj2jVJTEzTfaaH8ht1jfrpl8DkqmBx3LLhVa3M
	wdOBdd2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4HEG-00GcgG-2a;
	Wed, 31 May 2023 08:30:48 +0000
Received: from ewsoutbound.kpnmail.nl ([195.121.94.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4HEA-00Gcdt-33
	for linux-mediatek@lists.infradead.org;
	Wed, 31 May 2023 08:30:46 +0000
X-KPN-MessageId: 6b6a2c64-ff8d-11ed-b139-005056ab378f
Received: from smtp.kpnmail.nl (unknown [10.31.155.38])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 6b6a2c64-ff8d-11ed-b139-005056ab378f;
	Wed, 31 May 2023 10:30:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:from:to:subject:mime-version:date:message-id;
	bh=bi/zwW1dF0baBHFGLa1Ol2YY+ghL4hKqNhiswnod4IY=;
	b=Cbx2lnBI939OqQlwn2LgA2WtjioUKZjZDqNO54cgoWQaDD9mMT75o3zz4hySA8tRKu/u6KChttcwC
	 XziBcYpFDtwzd+rVXRRr9KDDX4K2+VtaE7//Mog3QLgp8PG8TW3urucSmi+PQ1+govLxt64R3SYwDb
	 RTpfsmVGvxNahUXSAhKnnX+5sPH+O/W/1vtVq8y+n+vBPYHV6ekR60QRAFge2gzNNJmajAcBuza0BP
	 bwcW1ukpQPaOs0Mu1NNJe3rQ5tVnbj+AesMLe8j38mo4oFHHZZ2QOoHx4HYUx3rLAfAQyn3ukFaoV5
	 oMer0XYvZHUuPxpRQppi/EzjwaEBUkg==
X-KPN-MID: 33|Fcd5oOhZ044j3uOQbeA2h3AjFJJJbejqxfpkqOfmqYParZA1prin+rv5J38icqA
 3vHUOx6g9HA1xlyqcjCnfdbicA2a9kyRyk3ej0hpbsbk=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|3YKdBL7gafLa96P8ALjF+44XrQH3OeXh6KixQi1/qKwG3bLPylcZA9xSJT+Plbx
 sCBzYiEGKS2jF5n8a2fWIBQ==
X-Originating-IP: 173.38.220.44
Received: from [10.47.77.214] (unknown [173.38.220.44])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 6b437bb6-ff8d-11ed-a898-005056abf0db;
	Wed, 31 May 2023 10:30:38 +0200 (CEST)
Message-ID: <608ae7d6-3f3b-137d-08d2-d41a240be2c4@xs4all.nl>
Date: Wed, 31 May 2023 10:30:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/8] media: videobuf2: Add a module param to limit vb2
 queue buffer storage
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, tfiga@chromium.org,
 m.szyprowski@samsung.com, mchehab@kernel.org, ming.qian@nxp.com,
 shijie.qin@nxp.com, eagle.zhou@nxp.com, bin.liu@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 yunfei.dong@mediatek.com, stanimir.k.varbanov@gmail.com,
 quic_vgarodia@quicinc.com, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, ezequiel@vanguardiasur.com.ar,
 p.zabel@pengutronix.de, daniel.almeida@collabora.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com
References: <20230321102855.346732-1-benjamin.gaignard@collabora.com>
 <20230321102855.346732-4-benjamin.gaignard@collabora.com>
 <6c4658fd-3a64-b3f8-67cd-17ed2d7d3567@xs4all.nl>
 <20230531080331.GB6496@pendragon.ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230531080331.GB6496@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_013043_415755_9A7AF31A 
X-CRM114-Status: GOOD (  21.83  )
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

On 5/31/23 10:03, Laurent Pinchart wrote:
> On Wed, May 31, 2023 at 08:36:59AM +0200, Hans Verkuil wrote:
>> On 21/03/2023 11:28, Benjamin Gaignard wrote:
>>> Add module parameter "max_vb_buffer_per_queue" to be able to limit
>>> the number of vb2 buffers store in queue.
>>>
>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>> ---
>>>  drivers/media/common/videobuf2/videobuf2-core.c | 15 +++------------
>>>  include/media/videobuf2-core.h                  | 11 +++++++++--
>>>  2 files changed, 12 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
>>> index ae9d72f4d181..f4da917ccf3f 100644
>>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>>> @@ -34,6 +34,8 @@
>>>  static int debug;
>>>  module_param(debug, int, 0644);
>>>  
>>> +module_param(max_vb_buffer_per_queue, ulong, 0644);
>>
>> There is no MODULE_PARM_DESC here? Please add. I see it is not there for
>> the debug param either, it should be added for that as well.
> 
> Would this be the right time to consider resource accounting in V4L2 for
> buffers ? Having a module parameter doesn't sound very useful, an
> application could easily allocate more buffers by using buffer orphaning
> (allocating buffers, exporting them as dmabuf objects, and freeing them,
> which leaves the memory allocated). Repeating allocation cycles up to
> max_vb_buffer_per_queue will allow allocating an unbounded number of
> buffers, using all the available system memory. I'd rather not add a
> module argument that only gives the impression of some kind of safety
> without actually providing any value.

Does dmabuf itself provide some accounting mechanism? Just wondering.

More specific to V4L2: I'm not so sure about this module parameter either.
It makes sense to have a check somewhere against ridiculous values (i.e.
allocating MAXINT buffers), but that can be a define as well. But otherwise
I am fine with allowing applications to allocate buffers until the memory
is full.

The question is really: what is this parameter supposed to do? The only
thing it does is to sanitize unlikely inputs (e.g. allocating MAXINT buffers).

I prefer that as a define, to be honest.

I think it is perfectly fine for users to try to request more buffers than
memory allows. It will just fail in that case, not a problem.

And if an application is doing silly things like buffer orphaning, then so
what? Is that any different than allocating memory and not freeing it?
Eventually it will run out of memory and crash, which is normal.

Regards,

	Hans

