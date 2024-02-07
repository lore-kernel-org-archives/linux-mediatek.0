Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05CCC4828F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 12:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFgPrE3Thwr3HoBLi9vLhUpfrYpRYmqYSC/PfoBg37s=; b=PHcKbpTntKMhgGcvVzSCpjdrRl
	i2C5BVAJW74gJ3pjkrFC4O+ETsXoCnD4EiXo+gCOcONdrTZCr2MoGqcp9cn4esxy41wZU+Uapc655
	YIDYuhH1Oam2W+xYwMISXV2kMk/igE9iAeQQ1B3oeVuqzE7icUOs8bOjwGCgqcvcDmRu6hMa8v2tP
	Cm/ElBuCikKlEljdl69AdmEb4KMIMcNnXH2GFAboNFTFthSp5w9pBwAvNc9xTszra/DLuiXpTFmrU
	OLl61i5oZLv8EvNE0xubGWCPmP5SIhYVjCVSehyZP3srBozJKjamvzH1hnmJzuXUA4mxRtdv/rNpb
	Q0dbmsVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXhK8-0000000Afjj-3cq5;
	Wed, 07 Feb 2024 12:46:44 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXhK5-0000000Afj4-2u3K;
	Wed, 07 Feb 2024 12:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707310000;
	bh=iTpYch75tcd9ZP7LW6ilopgE85q/9ga/hzmsirOsblg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VQGTaYAO4UXkiE0SOdaExAt58ciEwIUI3p9ZgpZEu+eCNSJxgbpxPs2NOIfFTeiR7
	 Ejg7EiYSdzzI7FECNLfqmcv/vDBRoa6nYNtgdrqgiAiurXxYo16CKpsK30eiU5OGIE
	 1azFEDU2fWDxFLpi35B9jYhbGZjIQ+navGvU6rIG+6e6KL13IVN3C/BNIJtEP22Ydh
	 PmVnuxsbLojV6DqTRizND8lKy+tTq4Y6EXiLCkIwy3HBsAINd3sb8TRnv+apYRwDG/
	 Nntuj2uPQfgUbo/DRbXnW43pjmZUE8B+61OjrxN9RGSPsIw3GPMKYmrxuTEBiqbLrZ
	 JxSBt4tZRxDQw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 933E337809D0;
	Wed,  7 Feb 2024 12:46:39 +0000 (UTC)
Message-ID: <b4018932-2fcb-4a15-9ec4-e29e5761d3e0@collabora.com>
Date: Wed, 7 Feb 2024 13:46:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] spmi: Add support for multi-master
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org>
 <20240207-spmi-multi-master-support-v1-1-ce57f301c7fd@linaro.org>
 <CAA8EJpqsJmv36=o1aTjVH6eMHXMg8BHNpiDvs+Q8YB23ezVGtQ@mail.gmail.com>
 <ZcMvFtAwQQjAZhk6@linaro.org>
 <CAA8EJprqWLX7_yWZzKp3FAKFGkSkk041f9hj1uXuRBrbH5APyQ@mail.gmail.com>
 <ZcNIddeG6VHxBEOQ@linaro.org>
 <CAA8EJpo-16u34Yc6MLmHSqFrQ0VrZAq6TwGeVc5WFwMmhruqoA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAA8EJpo-16u34Yc6MLmHSqFrQ0VrZAq6TwGeVc5WFwMmhruqoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_044641_907376_2B0CF412 
X-CRM114-Status: GOOD (  20.27  )
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

Il 07/02/24 12:45, Dmitry Baryshkov ha scritto:
> On Wed, 7 Feb 2024 at 11:08, Abel Vesa <abel.vesa@linaro.org> wrote:
>>
>> On 24-02-07 09:23:09, Dmitry Baryshkov wrote:
>>> On Wed, 7 Feb 2024 at 09:19, Abel Vesa <abel.vesa@linaro.org> wrote:
>>>>
>>>> On 24-02-07 01:55:39, Dmitry Baryshkov wrote:
>>>>> On Wed, 7 Feb 2024 at 01:34, Abel Vesa <abel.vesa@linaro.org> wrote:
>>>>>>
>>>>>> Some newer SPMI controllers support multiple bus masters.
>>>>>> Such a master can control multiple slave devices. The generic
>>>>>> framework needs to be able to pass on the master id to the
>>>>>> controller-specific driver. So do that. The framework will
>>>>>> check if the devicetree child nodes are actually bus masters
>>>>>> and will register the devices for each master. The legacy
>>>>>> approach will still be supported for backwards compatibility.
>>>>>
>>>>> Please remind me, are those two actual bus musters driving a single
>>>>> bus in parallel or two SPMI buses being handled by a single device? In
>>>>> the latter case this implementation is incorrect. There should be
>>>>> multiple spmi_controller instances, one for each bus. Allocate them in
>>>>> a loop and set ctrl->dev.of_node after allocating.
>>>>
>>>> It's two SPMI buses (two sets of wires) handled by the same controller,
>>>> HW-wise.
>>>>
>>>> If we register two spmi controllers with the kernel framework, it will
>>>> be HW inaccurate, because there is just one controller which has
>>>> multiple masters.
>>>
>>> struct spmi_controller is a controller for a single bus. Inside your
>>> device you have two SPMI buses, each can be controlled by its own
>>> struct spmi_controller. Just like devices that control multiple I2C,
>>> SPI or USB busses register a separate instance of the bus controller.
>>
>> Well, this is what this patchset is trying to do in the generic part.
>> The SPMI controller supports multiple buses (HW-wise) and therefore SW
>> implementation shouldn't be tied to single bus requirement.
> 
> So, after the off-line discussion:
> - add new compatible string for sm8450+
> - register two spmi controller instances

Well, I don't know about the actual hardware that you're trying to implement
but, in my opinion, the "idea" of this series does actually make sense.

The SPMI specification says that SPMI supports up to 4 masters, and up to
16 slaves.

Just my two cents.

Cheers,
Angelo

> - drop the master-id from the SPMI interface
> - optionally: think about having a new separate driver for v7 SPMI.
> 
>>
>>>
>>>>
>>>> I'm not saying it might not work. But, to me, it looks more like a hack.
>>>>
>>>> Basically, we would be mapping HW bus masters to kernel controllers.
>>>
>>> Buses, not just masters.
>>>
>>>>
>>>>>
>>>>>>
>>>>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>>>>> ---
>>>>>>   drivers/spmi/spmi-mtk-pmif.c |  6 ++--
>>>>>>   drivers/spmi/spmi-pmic-arb.c | 10 +++---
>>>>>>   drivers/spmi/spmi.c          | 76 ++++++++++++++++++++++++++++++--------------
>>>>>>   include/linux/spmi.h         | 10 +++---
>>>>>>   4 files changed, 67 insertions(+), 35 deletions(-)
>>>>>
>>>>> --
>>>>> With best wishes
>>>>> Dmitry
>>>
>>>
>>>
>>> --
>>> With best wishes
>>> Dmitry
> 
> 
> 



