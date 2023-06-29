Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B75EB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jun 2023 11:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuRgflA7W+GB2OzUJcPWqnf9eFGcWgW+fc96i17TXMs=; b=OxnumkOmV++8IBaxcsAgohDRvI
	pKGedymGp11e4qgR25OwnUywEW0wnNbNid+tRH555g9Oq0WswckDSa3xQG7eNfSyc2oqPet1ud7H2
	igkYyUqTD608OutrR12WSoJuS38GUJuxBiEY1Q0u733OEvcsaBOis8b/QCnB35nTOr33MfDS9Xn0r
	rPRig4x4Xu8bTIhvcB5ZRg9ilxL1n4pTHnRfeyA/hpnngCh0R2smhOU9kZz1veFyHcMIhSN3k1dJD
	kjfR1Ab9fdxAxEvq+5xIi22kf+jedj/qdzUC5NHwG6NrzMEMpqRPI14pqq4pavwRdySJHeOj47h58
	sFYNWANQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEq0Y-000ynb-0Z;
	Thu, 29 Jun 2023 11:40:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEq0U-000ymc-0l;
	Thu, 29 Jun 2023 11:40:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D592C14;
	Thu, 29 Jun 2023 04:40:56 -0700 (PDT)
Received: from [10.57.33.98] (unknown [10.57.33.98])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD5BB3F64C;
	Thu, 29 Jun 2023 04:40:10 -0700 (PDT)
Message-ID: <11d40d12-bb6c-25b3-ef44-43f4ded0e628@arm.com>
Date: Thu, 29 Jun 2023 12:40:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] usb: xhci-mtk: set the dma max_seg_size
Content-Language: en-GB
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Zubin Mithra <zsm@chromium.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230628-mtk-usb-v1-1-3c5b2ea3d6b9@chromium.org>
 <CANiDSCsAgD33gMk9-CTGHuUv_b4KfRnO02ETEt6jFtQvw+6cag@mail.gmail.com>
 <ZJystxdl0jVoe5b6@google.com>
 <CANiDSCu3WOqK9wdLDXmW+zbckq15gmxKjtFA4Aghv6uoidO_3Q@mail.gmail.com>
 <2023062942-thumb-giddily-f0e0@gregkh>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <2023062942-thumb-giddily-f0e0@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_044014_325841_8A15F78E 
X-CRM114-Status: GOOD (  13.95  )
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

On 2023-06-29 09:40, Greg Kroah-Hartman wrote:
> On Thu, Jun 29, 2023 at 09:13:23AM +0200, Ricardo Ribalda wrote:
>> Hi Zubin
>>
>> On Wed, 28 Jun 2023 at 23:57, Zubin Mithra <zsm@chromium.org> wrote:
>>>
>>> On Wed, Jun 28, 2023 at 11:04:20PM +0200, Ricardo Ribalda wrote:
>>>> On Wed, 28 Jun 2023 at 23:00, Ricardo Ribalda <ribalda@chromium.org> wrote:
>>>>>
>>>>> Allow devices to have dma operations beyond 64K, and avoid warnings such
>>>>> as:
>>>>>
>>>>> DMA-API: xhci-mtk 11200000.usb: mapping sg segment longer than device claims to support [len=98304] [max=65536]
>>>>>
>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>> Reported-by: Zubin Mithra <zsm@chromium.org>
>>>
>>> Should this be cc'd to stable@ as well?
>>
>> Not sure, in most of the cases this is "just" a warning fix. Let the
>> maintainer decide:
> 
> Warnings can cause reboots as the majority of the linux systems in the
> world run panic-on-warn, so yes, it should be backported.

Although in this particular case, running DMA_API_DEBUG=y on production 
systems is a pretty inadvisable thing to do anyway ;)

However I'm glad I looked, since I think this also points to a bug in 
dma_alloc_noncontiguous() - it's one thing to blame a driver for trying 
to map a malformed scatterlist of its own, but if the DMA API is 
generating one internally without respecting the device's (claimed) 
parameters, then that's on us. I'll have a look into it...

Thanks,
Robin.

