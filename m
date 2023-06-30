Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3C6EB64DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jun 2023 11:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JetY4VDcugUvY6S925AnOauCj9WcanjTWm8moK75Kv8=; b=PVp6a+9FRJA1Tex+EPy3VIUPhi
	e+t6T8rBjw7IRxZmnQXhxZqYtxzS780iWLNPlpqzaHOJ9wXkuGS2+2HHHun7m6nCc/oyf95PfXBYN
	cw8ZOytAOTOud/sBkegtSHf3rdsCUmEFGD8OuSNo88tl+PmmZQeEmfwCbl+vk/9Rbl7ggQx0YSH2j
	JB6eXE5DrObuHuhKhauZmPIaXxllDk5CDtW9A473xHN4tllNgHEtw51VIM2EvMco7atgJGMaw98cy
	mFRv76PmX+KexnGylDHG+KAemuZoRvTGkwt6DBdqpc4iDEUUiDrYA4mURCRMUgzbeXVVL654of+bs
	S2v4Yu4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFCEg-003aVj-2m;
	Fri, 30 Jun 2023 11:24:22 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFCEd-003aTr-1V;
	Fri, 30 Jun 2023 11:24:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688124259; x=1719660259;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=52Q2a5Ke+JYzT2oX03f31y1WvSO9qWB2m9pRaooy7VI=;
  b=TWfhgzIpopRPHMvcvJnZva8dzbB2ANk7YEiOKMn8XwBW5K9/jcFYl2gR
   2wrkaO8GcjE+MXrhFH9d4M62XMKDA0JSdjItNcYDYVOez25cDlYRloWBt
   6gv4PY66KQqDsZ60oZg0E9fd2RWIB9DTu+7L3QcpYdY1+94ZnOixom8Vy
   xerjLcyF3UfPVEZst7gb48elKOvNctWSVQW+SwomMbgusNGxaYd+Qbivn
   r6eU6ZvBMjaYh8d8Bk5ggZR+lQuiAN0qjYEYVB1pC5JwbBs3NPq1+cyKQ
   eMGiPYAv009srmOwcaDrGa0Ktqbrc6o85f71JJscXkKcMtuF1AnYM+Tjs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="347154125"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="347154125"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 04:24:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="783050506"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="783050506"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 30 Jun 2023 04:24:13 -0700
Message-ID: <11d23da6-af10-7533-cf6c-98f6b836100f@linux.intel.com>
Date: Fri, 30 Jun 2023 14:25:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230628-mtk-usb-v1-1-3c5b2ea3d6b9@chromium.org>
 <0efd9388-4cbc-d27c-f82f-d14291580150@arm.com>
 <CANiDSCvvtdtS2E1a5qyOERG=DKzcTX2oLGWSecRz2gCi-Oo1tw@mail.gmail.com>
 <c412681d-c845-c8a9-01ed-aafb14a0381a@arm.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] usb: xhci-mtk: set the dma max_seg_size
In-Reply-To: <c412681d-c845-c8a9-01ed-aafb14a0381a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_042419_545622_570D7535 
X-CRM114-Status: GOOD (  26.79  )
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

On 29.6.2023 22.19, Robin Murphy wrote:
> On 2023-06-29 19:29, Ricardo Ribalda wrote:
>> Hi Robin
>>
>> On Thu, 29 Jun 2023 at 20:11, Robin Murphy <robin.murphy@arm.com> wrote:
>>>
>>> On 2023-06-28 22:00, Ricardo Ribalda wrote:
>>>> Allow devices to have dma operations beyond 64K, and avoid warnings such
>>>> as:
>>>
>>> Hang on, is this actually correct? I just had a vague memory of XHCI
>>> having some restrictions, and sure enough according to the spec it
>>> *does* require buffers to be split at 64KB boundaries, since that's the
>>> maximum length a single TRB can encode - that's exactly the kind of
>>> constraint that the max_seg_size abstraction is intended to represent,
>>> so it seems a bit odd to be explicitly claiming a very different value.
>>>
>>> Thanks,
>>> Robin.
>>
>> I think we had a similar discussion for  93915a4170e9 ("xhci-pci: set
>> the dma max_seg_size")
>> on
>> https://lore.kernel.org/all/1fe8f8a7-c88f-0c91-e74f-4d3f2f885c89@linux.intel.com/
>>
>> ```
>> Preferred max segment size of sg list would be 64k as xHC hardware has
>> 64k TRB payload size
>> limit, but xhci driver will take care of larger segments, splitting
>> them into 64k chunks.
>> ```
> 
> OK, but it still seems off to me to claim to support something that the hardware doesn't support, and the driver has to fake, especially when it's only to paper over a warning which isn't even the driver's fault in the first place.

xHC Hardware has odd alignments and size restrictions that the driver anyway need to sort out.
The 64K is already fake, it's the most common max supported size for TRBs, but not always true.
Varies depending on TRB location in TRB ring.

xhci driver can handle any size.

> 
> The aim of the DMA_API_DEBUG_SG warnings wasn't to go round blindly adding dma_set_max_seg_size(UINT_MAX) all over the place, it was always to consider whether the dma_map_sg() call and/or the scatterlist itself are right, just as much as whether the driver may have forgotten to set an appropriate parameter. As I've already raised, in this particular case I think it's actually the debug check that's misplaced, since it's not dma_map_sg() anyway, but as it stands, the implementations of dma_alloc_noncontiguous() are definitely doing the wrong thing with respect to what it is then asking to validate.

Agree that this seems to be an issue in the DMA debugging side.
Would it need to take into account cases where device driver can support different sizes than the host controller?

> 
> Unless there is some known reason to make this change to any USB host controller *other* than that someone sees UVC allocate a >64KB buffer via this path on a system which happens to have that particular HCD, it is not the right change to make.

This would be all USB 3.x hosts, from all vendors.

keeping the 64K max seg size, and fixing the dma debug side would be optimal, but until that gets done I think
we can take this oneliner as it resolves a real world issue where USB isn't working.

Thanks
-Mathias


