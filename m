Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AEFC47073
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 08:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1ntSDYdIqiXGmKDUk14VC4eoZWflbnSsw+b9rVVPPs=; b=tpyqkeE1HsTwnOtBLU/6eo/ucd
	m+iAxXTySeP1oF/Uv71Y7zhZeK6CLUqm6ciTVQgOuegaQXjxFJacEoFtHr1agaJa5oO6cbW+VqAXo
	NcCdV1lOlQdM3LhNEf9N/prPeALg7KFuwGzM5tVxW/LV6Mx9xCei2+wjWm2gCxxzRf4hHqzb0bTNo
	qMDG/In1WrsljdGl0COivodaCD9/KEuFWR23duN09MbQwxLC5XdUP7daW/NrrUCz42agEOHB4Iy0L
	AU8ZXXJ2syv9l5FhxlPZPX/AvtBMBnDuzEzsXDNSUjTp5BbBlqSs9cEWo3j+2f7xZdIzJMJxGEQct
	Oha/7YoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMl1B-004JhL-1g;
	Mon, 08 Jan 2024 08:29:57 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMl17-004Jg3-1R;
	Mon, 08 Jan 2024 08:29:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 45B0FB80C76;
	Mon,  8 Jan 2024 08:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28AFC433C7;
	Mon,  8 Jan 2024 08:29:45 +0000 (UTC)
Message-ID: <545138cc-2cc1-4da0-9b26-7ebe4241c8df@xs4all.nl>
Date: Mon, 8 Jan 2024 09:29:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3,04/21] v4l: add documentation for secure memory flag
To: Jeffrey Kardatzke <jkardatzke@google.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Yong Wu <yong.wu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20231206081538.17056-1-yunfei.dong@mediatek.com>
 <20231206081538.17056-5-yunfei.dong@mediatek.com>
 <ce2110bf-a16a-45ae-979b-7e41be2896cd@xs4all.nl>
 <CA+ddPcM6nz0ufF5NXUq7E_vF6HnFKrEEag5iUDAknT6=hWTCNQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CA+ddPcM6nz0ufF5NXUq7E_vF6HnFKrEEag5iUDAknT6=hWTCNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_002953_828964_75D65BC5 
X-CRM114-Status: GOOD (  18.05  )
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

On 04/01/2024 21:05, Jeffrey Kardatzke wrote:
> On Mon, Dec 11, 2023 at 3:05 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 06/12/2023 09:15, Yunfei Dong wrote:
>>> From: Jeffrey Kardatzke <jkardatzke@google.com>
>>>
>>> Adds documentation for V4L2_MEMORY_FLAG_SECURE.
>>>
>>> Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
>>> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>>> ---
>>>  Documentation/userspace-api/media/v4l/buffer.rst | 8 +++++++-
>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
>>> index 52bbee81c080..a5a7d1c72d53 100644
>>> --- a/Documentation/userspace-api/media/v4l/buffer.rst
>>> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
>>> @@ -696,7 +696,7 @@ enum v4l2_memory
>>>
>>>  .. _memory-flags:
>>>
>>> -Memory Consistency Flags
>>> +Memory Flags
>>>  ------------------------
>>>
>>>  .. raw:: latex
>>> @@ -728,6 +728,12 @@ Memory Consistency Flags
>>>       only if the buffer is used for :ref:`memory mapping <mmap>` I/O and the
>>>       queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
>>>       <V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
>>> +    * .. _`V4L2-MEMORY-FLAG-SECURE`:
>>> +
>>> +      - ``V4L2_MEMORY_FLAG_SECURE``
>>> +      - 0x00000002
>>> +      - DMA bufs passed into the queue will be validated to ensure they were
>>> +     allocated from a secure dma-heap.
>>
>> Hmm, that needs a bit more work. How about:
>>
>> - The queued buffers are expected to be in secure memory. If not, an error will be
>>   returned. This flag can only be used with ``V4L2_MEMORY_DMABUF``. Typically
>>   secure buffers are allocated using a secure dma-heap. This flag can only be
>>   specified if the ``V4L2_BUF_CAP_SUPPORTS_SECURE_MEM`` is set.
>>
> 
> Thanks Hans. Yunfei, can you integrate this change into the patch please?
> 
>> In addition, the title of this table is currently "Memory Consistency Flags": that
>> should be renamed to "Memory Flags".
> 
> Hans, the patch is already renaming the table as you suggested. :)
> (unless there's some other spot I'm missing)

Sorry for the noise, I missed that change.

Regards,

	Hans

>>
>> Regards,
>>
>>         Hans
>>
>>>
>>>  .. raw:: latex
>>>
>>


