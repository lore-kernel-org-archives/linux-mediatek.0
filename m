Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47289CD4F32
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 08:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAxS5aneoDADNRZ7LRGA/GWsME2RGbrvGcmrwAd/oXE=; b=lJUA7mGAwjBeZqENQ/diuQm106
	gd0nexf64U0vNzKPb2HUzBJ/wLxoH5cxXDJdNoZ6jFcn8N1TEAL66o6AOhUHeDO/BlGpt+B0CjSNf
	tCsTzxvUr+mekI5AZjT46IZWYLd0/Y6S8o9VEJvfCE8YV3gKdDU5PEZiMohwCGd9tzEqZ06uF2ZaO
	1dO2Qk6PwSThQekoCrkbzc16iAjcpXRmuPTq4TsSjBVn/n+ouwgJBe4uKOTlGhNnt9HZuaKu2YVAN
	t4HwjOUcCDnv7/k4EtCeo3ZB3VSB4692P7Pf7iPG6H0X1F2IxNEQT09cAq+EcZYKamve8bfSwb5Zt
	gKUuUE5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjblv-008RzR-0M;
	Fri, 22 Sep 2023 08:44:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjblq-008Ry5-1r;
	Fri, 22 Sep 2023 08:44:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D68C5B821EF;
	Fri, 22 Sep 2023 08:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A04C433C8;
	Fri, 22 Sep 2023 08:44:10 +0000 (UTC)
Message-ID: <3e053387-4ba6-49bc-a59a-46854e0a7c26@xs4all.nl>
Date: Fri, 22 Sep 2023 10:44:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/14] media: medkatek: vcodec: set secure mode to decoder
 driver
Content-Language: en-US, nl
To: =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
 "jkardatzke@google.com" <jkardatzke@google.com>,
 "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "frkoenig@chromium.org" <frkoenig@chromium.org>,
 "stevecho@chromium.org" <stevecho@chromium.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "nhebert@chromium.org" <nhebert@chromium.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>
References: <20230911125936.10648-1-yunfei.dong@mediatek.com>
 <20230911125936.10648-13-yunfei.dong@mediatek.com>
 <1df3e79b84933dda0313d0d9719220dbc06c9022.camel@collabora.com>
 <d4cedcb0-32ed-495d-a8cd-a635d5105824@xs4all.nl>
 <5307203d79c0d90cc742a315bb161fa796b9960f.camel@mediatek.com>
 <bafc37e8-96e8-41c0-b805-c6477f0d7c4a@xs4all.nl>
 <CA+ddPcN6EaFERC60_Z_-ZmWzqyUEwxiDCZwt_U6Y-gpaAu76tA@mail.gmail.com>
 <ff7aa575-c820-4dfa-853f-77438b8b149a@xs4all.nl>
 <b7d661637eacbda3e83d192b1126fc3970c4f50d.camel@collabora.com>
 <c3d14f64-bf04-46b9-ac7b-af7ef9014335@xs4all.nl>
 <00302ac675af858eb11d8398f100921af806bc30.camel@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <00302ac675af858eb11d8398f100921af806bc30.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_014418_916926_C56A3844 
X-CRM114-Status: GOOD (  35.79  )
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

On 22/09/2023 05:28, Yunfei Dong (董云飞) wrote:
> Hi Hans,
> 
> Thanks for your help to give some good advice.
> On Wed, 2023-09-20 at 09:20 +0200, Hans Verkuil wrote:
>>  	 
>>>>>> In any case, using a control to switch to secure mode and using
>> a control
>>>>>> to convert a dmabuf fd to a secure handle seems a poor choice to
>> me.
>>>>>>
>>>>>> I was wondering if it wouldn't be better to create a new
>> V4L2_MEMORY_ type,
>>>>>> e.g. V4L2_MEMORY_DMABUF_SECURE (or perhaps _DMABUF_OPTEE). That
>> ensures that
>>>>>> once you create buffers for the first time, the driver can
>> switch into secure
>>>>>> mode, and until all buffers are released again you know that the
>> driver will
>>>>>> stay in secure mode.
>>>>>
>>>>> Why do you think the control for setting secure mode is a poor
>> choice?
>>>>> There's various places in the driver code where functionality
>> changes
>>>>> based on being secure/non-secure mode, so this is very much a
>> 'global'
>>>>> setting for the driver. It could be inferred based off a new
>> memory
>>>>> type for the queues...which then sets that flag in the driver;
>> but
>>>>> that seems like it would be more fragile and would require
>> checking
>>>>> for incompatible output/capture memory types. I'm not against
>> another
>>>>> way of doing this; but didn't see why you think the proposed
>> method is
>>>>> a poor choice.
>>>>
>>>> I assume you are either decoding to secure memory all the time, or
>> not
>>>> at all. That's something you would want to select the moment you
>> allocate
>>>> the first buffer. Using the V4L2_MEMORY_ value would be the
>> natural place
>>>> for that. A control can typically be toggled at any time, and it
>> makes
>>>> no sense to do that for secure streaming.
>>>>
>>>> Related to that: if you pass a dmabuf fd you will need to check
>> somewhere
>>>> if the fd points to secure memory or not. You don't want to mix
>> the two
>>>> but you want to check that at VIDIOC_QBUF time.
>>>>
>>>> Note that the V4L2_MEMORY_ value is already checked in the v4l2
>> core,
>>>> drivers do not need to do that.
>>>
>>> Just to clarify a bit, and make sure I understand this too. You are
>> proposing to
>>> introduce something like:
>>>
>>>    V4L2_MEMORY_SECURE_DMABUF
>>>
>>> Which like V4L2_MEMORY_DMABUF is meant to import dmabuf, while
>> telling the
>>> driver that the memory is secure according to the definition of
>> "secure" for the
>>> platform its running on.
>>>
>>> This drivers also allocate secure SHM (a standard tee concept) and
>> have internal
>>> allocation for reconstruction buffer and some hw specific reference
>> metadata. So
>>> the idea would be that it would keep allocation using the dmabuf
>> heap internal
>>> APIs ? And decide which type of memory based on the memory type
>> found in the
>>> queue?
>>
>> Yes. Once you request the first buffer you basically tell the driver
>> whether it
>> will operate in secure or non-secure mode, and that stays that way
>> until all
>> buffers are freed. I think that makes sense.
>>
> 
> According to iommu's information, the dma operation for secure and non-
> secure are the same, whether just need to add one memory type in v4l2
> framework the same as V4L2_MEMORY_DMABUF? The dma operation in
> videobuf2-dma-contig.c can use the same functions.

So if I pass a non-secure dma fd to the capture queue of the codec, who
will check that it can't write the data to that fd? Since doing so would
expose the video. Presumably at some point the tee code will prevent that?
(I sincerely hope so!)

Having a separate V4L2_MEMORY_DMABUF_SECURE type is to indicate to the
driver that 1) it can expect secure dmabuf fds, 2) it can configure itself
for that (that avoids using a control to toggle between normal and secure mode),
and at VIDIOC_QBUF time it is easy for the V4L2 core to verify that the
fd that is passed in is for secure memory. This means that mistakes by
userspace are caught at QBUF time.

Of course, this will not protect you (people can disable this check by
recompiling the kernel), that still has to be done by the firmware, but
it catches userspace errors early on.

Also, while for this hardware the DMA operation is the same, that might
not be the case for other hardware.

Regards,

	Hans

> 
> Best Regards,
> Yunfei Dong
> 


