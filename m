Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6B3CD54AF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 11:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xI9Ro/dcYfmZ4WfWfwrC6nV0MYpSUZlU9Eh900mwqOU=; b=h55OHMEYclZ69JuY4eN/HOXVYE
	Zv/yqelkWwtOhaitSy7cf1o5j+OiF1wF4Nh2i6M2p6SynKWJGdCjAeFn2ksiOQQPvDZP0O5ekkWQ5
	LHojUi4+ZAqIenftfJOYqMcd7ZE5xB9mZ7jInlgRPhUmxlfRNjaa2ty+hFqFai5VJ4Y29ZHTzc6WG
	n1v++bI/2M8ZhMEeCkIgiFJRzKrJZ1tUCOfaaUuvgMh5z+sfF+kan3H2fW3hKIb64fYWpqOySDG2R
	hX+OAQ1gkxYFRQaz+QiuW27zsX3nuayqYOvdwhFPB6J5qGN2rSN9xK7XhvtLaBvpVU2iHItTD0qbu
	rIfppBSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYmz-000H0s-0Y;
	Tue, 19 Sep 2023 11:21:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYmw-000GzV-1I;
	Tue, 19 Sep 2023 11:21:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id B85E4CE12FA;
	Tue, 19 Sep 2023 11:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98BAAC433C8;
	Tue, 19 Sep 2023 11:20:59 +0000 (UTC)
Message-ID: <b7b98f37-f9f0-46ef-8ee2-610e2990dfef@xs4all.nl>
Date: Tue, 19 Sep 2023 13:20:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/49] media: sti: hva: Use vb2_get_buffer() instead of
 directly access to buffers array
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
 <20230914133323.198857-8-benjamin.gaignard@collabora.com>
 <93e9b143-664c-4fbb-8722-0beabd5b2c0c@xs4all.nl>
 <ecfd1641-3cce-dfa4-b88c-3619fb12d710@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <ecfd1641-3cce-dfa4-b88c-3619fb12d710@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_042106_604264_ED68A124 
X-CRM114-Status: GOOD (  15.67  )
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

On 19/09/2023 12:26, Benjamin Gaignard wrote:
> 
> Le 19/09/2023 à 11:31, Hans Verkuil a écrit :
>> On 14/09/2023 15:32, Benjamin Gaignard wrote:
>>> Use vb2_get_buffer() instead of directly access to vb2_buffer buffer array.
>>> This could allow to change the type bufs[] field of vb2_buffer structure if
>>> needed.
>>> After each call to vb2_get_buffer() we need to be sure that we get
>>> a valid pointer so check the return value of all of them.
>>>
>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>> ---
>>>   drivers/media/platform/st/sti/hva/hva-v4l2.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/st/sti/hva/hva-v4l2.c b/drivers/media/platform/st/sti/hva/hva-v4l2.c
>>> index 3a848ca32a0e..326be09bdb55 100644
>>> --- a/drivers/media/platform/st/sti/hva/hva-v4l2.c
>>> +++ b/drivers/media/platform/st/sti/hva/hva-v4l2.c
>>> @@ -577,6 +577,10 @@ static int hva_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
>>>           }
>> Above this line there is a buf->index check...
>>
>>>             vb2_buf = vb2_get_buffer(vq, buf->index);
>>> +        if (!vb2_buf) {
>>> +            dev_dbg(dev, "%s buffer index %d not found\n", ctx->name, buf->index);
>>> +            return -EINVAL;
>>> +        }
>> ...I think that check can be dropped since vb2_get_buffer checks that already.
> 
> No because in "media: sti: hva: Stop direct calls to queue num_buffers field" patch
> I remove the above check since it use queue num_buffers field.

Why not do that here? And drop that later patch? It doesn't make sense to
split it up, and also the commit log of patch 33/49 doesn't match that patch.

Regards,

	Hans

> 
> Regards,
> Benjamin
> 
>>
>> Regards,
>>
>>     Hans
>>
>>>           stream = to_hva_stream(to_vb2_v4l2_buffer(vb2_buf));
>>>           stream->bytesused = buf->bytesused;
>>>       }
>>


