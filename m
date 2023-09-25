Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7669CE7A89
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 09:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tB3TL/bu32gxnDkfZYOLuwCTZQc8WQc1q8/tLnJaYGA=; b=tjwLN7PVx2jpZRKB4N60IzmWLD
	oKdGmrS84X0shynRNHMgGlmyddq8i2+3lv/b9mNPToYs/BYtcTrz2qC2RILLpF3I/TROpqA1YOq1R
	49MQR0F36HjtYi1PQ1er8b7Ke+0sPi0gYZbQpwL/mJpT0ge0Fir+xe70gK91iGWhPoflTcNVA9rjM
	HKoWi9/5l88uim0vFvFnPco6hAI4+7UDlw+gOUWNi/3icUfK4gpZCvYaEBr4MRTRb0+GCeSbiR3R+
	U37jWJdrDFg8uFcRj8IgO94f8ztMVKBCgrKRymI56J5t2+1SkwuAmSO/3ZBvhu+lqFDmyi6G/m4B5
	IEj2sDVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkhSi-00DnNf-0l;
	Mon, 25 Sep 2023 09:01:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkhSc-00DnKf-1P;
	Mon, 25 Sep 2023 09:01:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D3259B80B9F;
	Mon, 25 Sep 2023 09:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478E2C433C8;
	Mon, 25 Sep 2023 09:00:53 +0000 (UTC)
Message-ID: <71cadec5-06df-4490-9b06-e3af6bb43498@xs4all.nl>
Date: Mon, 25 Sep 2023 11:00:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/14] media: medkatek: vcodec: set secure mode to decoder
 driver
To: Jeffrey Kardatzke <jkardatzke@google.com>
Cc: =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
 "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
 <3e053387-4ba6-49bc-a59a-46854e0a7c26@xs4all.nl>
 <CA+ddPcOaCKq5Nd_3eWwJ3=oAf=5t-Z+w51NqapXN8VBuvbTw3g@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CA+ddPcOaCKq5Nd_3eWwJ3=oAf=5t-Z+w51NqapXN8VBuvbTw3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_020058_761136_A19505F4 
X-CRM114-Status: GOOD (  48.13  )
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

On 22/09/2023 21:17, Jeffrey Kardatzke wrote:
> On Fri, Sep 22, 2023 at 1:44 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 22/09/2023 05:28, Yunfei Dong (董云飞) wrote:
>>> Hi Hans,
>>>
>>> Thanks for your help to give some good advice.
>>> On Wed, 2023-09-20 at 09:20 +0200, Hans Verkuil wrote:
>>>>
>>>>>>>> In any case, using a control to switch to secure mode and using
>>>> a control
>>>>>>>> to convert a dmabuf fd to a secure handle seems a poor choice to
>>>> me.
>>>>>>>>
>>>>>>>> I was wondering if it wouldn't be better to create a new
>>>> V4L2_MEMORY_ type,
>>>>>>>> e.g. V4L2_MEMORY_DMABUF_SECURE (or perhaps _DMABUF_OPTEE). That
>>>> ensures that
>>>>>>>> once you create buffers for the first time, the driver can
>>>> switch into secure
>>>>>>>> mode, and until all buffers are released again you know that the
>>>> driver will
>>>>>>>> stay in secure mode.
>>>>>>>
>>>>>>> Why do you think the control for setting secure mode is a poor
>>>> choice?
>>>>>>> There's various places in the driver code where functionality
>>>> changes
>>>>>>> based on being secure/non-secure mode, so this is very much a
>>>> 'global'
>>>>>>> setting for the driver. It could be inferred based off a new
>>>> memory
>>>>>>> type for the queues...which then sets that flag in the driver;
>>>> but
>>>>>>> that seems like it would be more fragile and would require
>>>> checking
>>>>>>> for incompatible output/capture memory types. I'm not against
>>>> another
>>>>>>> way of doing this; but didn't see why you think the proposed
>>>> method is
>>>>>>> a poor choice.
>>>>>>
>>>>>> I assume you are either decoding to secure memory all the time, or
>>>> not
>>>>>> at all. That's something you would want to select the moment you
>>>> allocate
>>>>>> the first buffer. Using the V4L2_MEMORY_ value would be the
>>>> natural place
>>>>>> for that. A control can typically be toggled at any time, and it
>>>> makes
>>>>>> no sense to do that for secure streaming.
>>>>>>
>>>>>> Related to that: if you pass a dmabuf fd you will need to check
>>>> somewhere
>>>>>> if the fd points to secure memory or not. You don't want to mix
>>>> the two
>>>>>> but you want to check that at VIDIOC_QBUF time.
>>>>>>
>>>>>> Note that the V4L2_MEMORY_ value is already checked in the v4l2
>>>> core,
>>>>>> drivers do not need to do that.
>>>>>
>>>>> Just to clarify a bit, and make sure I understand this too. You are
>>>> proposing to
>>>>> introduce something like:
>>>>>
>>>>>    V4L2_MEMORY_SECURE_DMABUF
>>>>>
>>>>> Which like V4L2_MEMORY_DMABUF is meant to import dmabuf, while
>>>> telling the
>>>>> driver that the memory is secure according to the definition of
>>>> "secure" for the
>>>>> platform its running on.
>>>>>
>>>>> This drivers also allocate secure SHM (a standard tee concept) and
>>>> have internal
>>>>> allocation for reconstruction buffer and some hw specific reference
>>>> metadata. So
>>>>> the idea would be that it would keep allocation using the dmabuf
>>>> heap internal
>>>>> APIs ? And decide which type of memory based on the memory type
>>>> found in the
>>>>> queue?
>>>>
>>>> Yes. Once you request the first buffer you basically tell the driver
>>>> whether it
>>>> will operate in secure or non-secure mode, and that stays that way
>>>> until all
>>>> buffers are freed. I think that makes sense.
>>>>
>>>
>>> According to iommu's information, the dma operation for secure and non-
>>> secure are the same, whether just need to add one memory type in v4l2
>>> framework the same as V4L2_MEMORY_DMABUF? The dma operation in
>>> videobuf2-dma-contig.c can use the same functions.
>>
>> So if I pass a non-secure dma fd to the capture queue of the codec, who
>> will check that it can't write the data to that fd? Since doing so would
>> expose the video. Presumably at some point the tee code will prevent that?
>> (I sincerely hope so!)
> 
> It is entirely the job of the TEE to prevent this. Nothing in the
> kernel should allow exploitation of what happens in the TEE no matter
> what goes on in the kernel
> 
>>
>> Having a separate V4L2_MEMORY_DMABUF_SECURE type is to indicate to the
>> driver that 1) it can expect secure dmabuf fds, 2) it can configure itself
>> for that (that avoids using a control to toggle between normal and secure mode),
>> and at VIDIOC_QBUF time it is easy for the V4L2 core to verify that the
>> fd that is passed in is for secure memory. This means that mistakes by
>> userspace are caught at QBUF time.
>>
>> Of course, this will not protect you (people can disable this check by
>> recompiling the kernel), that still has to be done by the firmware, but
>> it catches userspace errors early on.
>>
>> Also, while for this hardware the DMA operation is the same, that might
>> not be the case for other hardware.
> 
> That's a really good point. So one of the other models that is used
> for secure video decoding is to send the encrypted buffer into the
> video decoder directly (i.e. V4L2_MEMORY_MMAP) and then also send in
> all the corresponding crypto parameters (i.e. algorithm, IV,
> encryption pattern, etc.). Then the video driver internally does the
> decryption and decode in one operation.  That's not what we want to
> use here for Mediatek; but I've done other integrations that work that
> way (that was for VAAPI [1], not V4L2...but there are other ARM
> implementations that do operate that way).  So if we end up requiring
> V4L2_MEMORY_DMABUF_SECURE to indicate secure mode and enforce it on
> output+capture, that'll close off other potential solutions in the
> future.
> 
> Expanding on your point about DMA operations being different on
> various hardware, that also makes me think a general check for this in
> v4l2 code may also be limiting. There are various ways secure video
> pipelines are done, so leaving these checks up to the individual
> drivers that implement secure video decode may be more pragmatic. If
> there's a generic V4L2 _CID_SECURE_MODE control, that makes it more
> general for how drivers can handle secure video decode.

No, using a control for this is really wrong.

The reason why I want it as a separate memory type is that that is
what you use when you call VIDIOC_REQBUFS, and that ioctl is also
when things are locked down in a driver. As long as no buffers have
been allocated, you can still change formats, parameters, etc. But
once buffers are allocated, most of that can't be changed, since
changing e.g. the format would also change the buffer sizes.

It also locks down who owns the buffers by storing the file descriptor.
This prevents other processes from hijacking the I/O streaming, only
the owner can stream buffers.

So it is a natural point in the sequence for selecting secure
buffers.

If you request V4L2_MEMORY_DMABUF_SECURE for the output, then the
capture side must also use DMABUF_SECURE. Whether or not you can
use regular DMABUF for the output side and select DMABUF_SECURE
on the capture side is a driver decision. It can be useful to
support this for testing the secure capture using regular video
streams (something Nicolas discussed as well), but it depends on
the hardware whether you can use that technique.

Regards,

	Hans

> 
> [1] - https://github.com/intel/libva/blob/master/va/va.h#L2177
> 
>>
>> Regards,
>>
>>         Hans
>>
>>>
>>> Best Regards,
>>> Yunfei Dong
>>>
>>


