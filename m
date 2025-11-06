Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B51CCFA03
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 09:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxQ4EBlLVGsH54w7tQewn8mC8La79rxIFtNU2KHXfYE=; b=JvDRnchi5I3rDekMSOkbg2/1ZA
	rpqzy3YRB3QhDlAZCDH58TyFRyhs5YH/JQw9Bs4W0ctJ7h8sbTYZkJ5CEL6E8TsUOKbN4g0Jm5tkW
	kfuZUIQsUWEUBYIL20d6xQ0EztZ3NqFQP9jX+qRQYVnhvIKuraenvLtaVwSkUSRWbp3ew0tYH6w9l
	w1N/nB/eJrp8RNZoHmx67mLzwmkAPMMlsp58zUJC7gl/pDiyTWbC2tCpSItWiTeXLUFf7LLq2X6cJ
	l3cYMcEhWI9dC+2lQrp+WQw8P90q5gY603x5s80SHRre2kjtVsY7daXyAB6kbDoBPxfMCf3rJRao9
	W8tSUjIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvqx-0000000F7AV-26Dt;
	Thu, 06 Nov 2025 09:00:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvqu-0000000F7AA-1jDf
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 09:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762419616;
	bh=dDyHvtX05p1WbayGiNH5360z2meP1cpRfl9zSAmCDQM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QPXnUDcLPa0qRTSblPIwFChQTByXlh5eKkZ1xMoI7Wf/kfRrGSl3Joeb0HDUlK6Iw
	 bDvhN6ZIwnWJODJ+lJHjPf3F13eRtDHwYOgOe1uylSardsA5m/qHoSnhRcoFyYNfGZ
	 0u4xYuDrjXC4XfciO/UYuis3ZxhCedroAqK4HBdjEWacA9EHn2/T92VMKtfbRNlIYU
	 7fcHagvJTpwyVeYxJlffF5owE3Vq93nwQCoCkPv0ch6CM29VlsEIkrBp3MTN/4etjZ
	 6nb2EKpFnGsgtMmqDIOA+kbKNl67LSVxIQhJ2dHjAUIZKNOE6stebJTGWHo0HVkFcR
	 mZ1OoXE6qqE8Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DE6A317E1345;
	Thu,  6 Nov 2025 10:00:15 +0100 (CET)
Message-ID: <c760da37-1d13-4440-9457-afef83649db8@collabora.com>
Date: Thu, 6 Nov 2025 10:00:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: mediatek-gen3: Ignore link up timeout
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251105062815.966716-1-wenst@chromium.org>
 <7250ae04-866f-489c-b1b6-b8a3d8200529@collabora.com>
 <CAGXv+5EwiL_-ozRARH2UBm5znHi1egBoCjmELN=17hvFF_oeoQ@mail.gmail.com>
 <3e1ffe72-b6a4-45cc-a053-190077818f19@collabora.com>
 <CAGXv+5GAyt6U710En_k=fq-CPrq_H6rmc=kpBNw4yXjj8qL2cw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5GAyt6U710En_k=fq-CPrq_H6rmc=kpBNw4yXjj8qL2cw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_010020_608369_BAEDAA82 
X-CRM114-Status: GOOD (  25.83  )
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

Il 06/11/25 06:52, Chen-Yu Tsai ha scritto:
> On Wed, Nov 5, 2025 at 7:32 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 05/11/25 10:21, Chen-Yu Tsai ha scritto:
>>> On Wed, Nov 5, 2025 at 4:45 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>
>>>> Il 05/11/25 07:28, Chen-Yu Tsai ha scritto:
>>>>> As mentioned in commit 886a9c134755 ("PCI: dwc: Move link handling into
>>>>> common code") come up later" in the code, it is possible for link up to
>>>>> occur later:
>>>>>
>>>>>      Let's standardize this to succeed as there are usecases where devices
>>>>>      (and the link) appear later even without hotplug. For example, a
>>>>>      reconfigured FPGA device.
>>>>>
>>>>> Another case for this is the new PCIe power control stuff. The power
>>>>> control mechanism only gets triggered in the PCI core after the driver
>>>>> calls into pci_host_probe(). The power control framework then triggers
>>>>> a bus rescan. In most driver implementations, this sequence happens
>>>>> after link training. If the driver errors out when link training times
>>>>> out, it will never get to the point where the device gets turned on.
>>>>>
>>>>> Ignore the link up timeout, and lower the error message down to a
>>>>> warning.
>>>>>
>>>>> This makes PCIe devices that have not-always-on power rails work.
>>>>> However there may be some reversal of PCIe power sequencing, since now
>>>>> the PERST# and clocks are enabled in the driver, while the power is
>>>>> applied afterwards.
>>>>>
>>>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>>>
>>>> Ok, that's sensible.
>>>>
>>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>>
>>>>> ---
>>>>> The change works to get my PCIe WiFi device working, but I wonder if
>>>>> the driver should expose more fine grained controls for the link clock
>>>>> and PERST# (when it is owned by the controller and not just a GPIO) to
>>>>> the power control framework. This applies not just to this driver.
>>>>>
>>>>> The PCI standard says that PERST# should hold the device in reset until
>>>>> the power rails are valid or stable, i.e. at their designated voltages.
>>>>
>>>> I completely agree with all of the above - and I can imagine multiple PCI-Express
>>>> controller drivers doing the same as what's being done in MTK Gen3.
>>>>
>>>> This means that the boot process may get slowed down by the port startup sequence
>>>> on multiple PCI-Express controllers (again not just MediaTek) and it's something
>>>> that must be resolved in some way... with the fastest course of action imo being
>>>> giving controller drivers knowledge of whether there's any device that is expected
>>>> to be powered off at that time (in order to at least avoid all those waits that
>>>> are expected to fail).
>>>
>>> That also requires some refactoring, since all the drivers _wait_ for link
>>> up before going into the PCI core, which does the actual child node parsing.
>>>
>>> I would like some input from Bartosz, who introduced the PCI power control
>>> framework, and Manivannan, who added slot power control.
>>>
>>>> P.S.: Chen-Yu, did you check if the same applies to the MTK previous gen driver?
>>>>          Could you please check and eventually send a commit to do the same there?
>>>
>>> My quick survey last week indicated that all the drivers except for the
>>> dwc family error out if link up timed out.
>>>
>>> I don't have any hardware for the older generation though. And it looks
>>> like for the previous gen, the driver performs even worse, since it can
>>> support multiple slots, and each slot is brought up sequentially. A slot
>>> is discarded if link up times out. And the whole driver errors out if no
>>> slots are working.
>>>
>>
>> Hey, that's bold.
>>
>> If only one driver (DWC) is working okay, there's something wrong that must be
>> fixed before that behavior change goes upstream (which it already did, ugh).
> 
> To be fair one only runs into it if they convert over to the PCI slot power
> description in the device tree, and their hardware isn't DWC based. This
> is pretty new.
> 

That changes a lot of things then - I thought it was a regression, but it's not.

>> This needs attention from both Bartosz and Mani really-right-now.
>>
>> I'm not sure about possible good solutions, and unfortunately I don't really have
>> any time to explore, so I'm not spitting any words on that - leaving this to both
>> Bartosz and Mani as that's also the right thing to do anyway.
> 
> Mani mentioned [1] that work towards moving the pwrctrl stuff into drivers
> is almost complete. So I think we're covered.
> 

We're covered. Yes.

Cheers,
Angelo

> ChenYu
> 
> [1] https://lore.kernel.org/all/rz6ajnl7l25hfl2u7lloywtw7sq7smhb63hg76wjslyuwyjb7a@fhuafuino5kv/



