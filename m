Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE38C4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 09:07:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2916F2073A
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 09:07:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CXcHOba8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.b="fzNzs77m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2916F2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/XhF3vef7ov9eLiTe7z4upoAdCWE9txbXpKb0RqDIEk=; b=CXcHOba8um5oJIdsKZCQ7T0h7
	mVu1N4MSMpnT8BubU+T5eUDaPzWoO64fWc7CmclNniFEGwxUc4sdkyb50ZAbat+8KVc7bMMhd032Q
	gUVt5yqg6UX8E0ttRKEYC2ximYzGCEWMolpVie4Lir7Lf9/xAECWF4LH9sn6xdoY8eMFz74eQyFMu
	Z9TJbvmpfrjqX44ytVAUAGsslJK9rNj/B+5eYOM3az+OdlbVMuLnOuMZXi4mxM8rNKJPeTwKB/V53
	VtN33Dg50odyIuWcfDlQNYV0J7rZz/VgXiB0FRkpeRbRdU7EgBFkJF14TvtCzeoja3SI798BqXDzi
	Le/2sO+VQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLjhg-0000T1-HV; Fri, 25 Sep 2020 09:07:44 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLjhc-0000S7-7j; Fri, 25 Sep 2020 09:07:41 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601024857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vEET4i5ndN9Qo2VdO+IEK6AEPymnv69TyumxEU3g6CY=;
 b=fzNzs77muEuQq3vGTbPVJUhTnRg8AWAH+C7kFD/DLnpf5UMFx7euzsOUxOz56JWOOFtiAp
 eFxX+Kw/8K1XNrq1gJQ/rqDjclV32hMRq2uLWQ36rsoiXgVn5ru7RUCK9zjWiwpmkKmv/W
 IvIlvdyiKciVU0RgJ3vWZVv6Ymtn8+k=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3AD4EADC5;
 Fri, 25 Sep 2020 09:07:37 +0000 (UTC)
Subject: Re: [PATCH 11/12] soc: mediatek: pm-domains: Add support for mt8183
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20200910172826.3074357-1-enric.balletbo@collabora.com>
 <20200910172826.3074357-12-enric.balletbo@collabora.com>
 <730273b4-914a-8a7a-1583-351e6f20df5b@gmail.com>
 <5e1510f4-b0c4-2cff-b3f8-b6715d228149@gmail.com>
 <CAJMQK-jFwToRxBdVgtHT3wJ970M0NYGu3kLtkGRBDKMMNOHkJw@mail.gmail.com>
 <2a52c8e7-59db-9ed9-dd35-fc74738c152d@collabora.com>
From: Matthias Brugger <mbrugger@suse.com>
Message-ID: <dc90ec9a-ec19-39af-a170-85147d1d96c9@suse.com>
Date: Fri, 25 Sep 2020 11:07:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2a52c8e7-59db-9ed9-dd35-fc74738c152d@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_050740_494055_8C3BA453 
X-CRM114-Status: GOOD (  22.89  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Nicolas Boichat <drinkcat@chromium.org>, weiyi.lu@mediatek.com,
 lkml <linux-kernel@vger.kernel.org>, Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Collabora Kernel ML <kernel@collabora.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 25/09/2020 10:21, Enric Balletbo i Serra wrote:
> Hi Hsin-Yi and Matthias,
> 
> Hsin-Yi, many thanks to provide the register names.
> 
> On 25/9/20 9:37, Hsin-Yi Wang wrote:
>> On Wed, Sep 16, 2020 at 8:19 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>>>
>>>
>>>
>>> On 16/09/2020 11:46, Matthias Brugger wrote:
>>>>
>>>>
>>>> On 10/09/2020 19:28, Enric Balletbo i Serra wrote:
>>>>> From: Matthias Brugger <mbrugger@suse.com>
>>>>>
>>>>> Add the needed board data to support mt8183 SoC.
>>>>>
>>>>> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
>>>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>>>> ---
>>>>>
>>>>>    drivers/soc/mediatek/mtk-pm-domains.c | 162 ++++++++++++++++++++++++++
>>>>>    include/linux/soc/mediatek/infracfg.h |  28 +++++
>>>>>    2 files changed, 190 insertions(+)
>>>>>
>>>>> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c
>>>>> b/drivers/soc/mediatek/mtk-pm-domains.c
>>>>> index 29e88adc8ea6..aa434f616fee 100644
>>>>> --- a/drivers/soc/mediatek/mtk-pm-domains.c
>>>>> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
>>>> [...]
>>>>> +/*
>>>>> + * MT8183 power domain support
>>>>> + */
>>>>> +static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
>>>>> +    [MT8183_POWER_DOMAIN_AUDIO] = {
>>>>> +        .sta_mask = PWR_STATUS_AUDIO,
>>>>> +        .ctl_offs = 0x0314,
>>>>> +        .sram_pdn_bits = GENMASK(11, 8),
>>>>> +        .sram_pdn_ack_bits = GENMASK(15, 12),
>>>>> +    },
>>>>> +    [MT8183_POWER_DOMAIN_CONN] = {
>>>>> +        .sta_mask = PWR_STATUS_CONN,
>>>>> +        .ctl_offs = 0x032c,
>>>>> +        .sram_pdn_bits = 0,
>>>>> +        .sram_pdn_ack_bits = 0,
>>>>> +        .bp_infracfg = {
>>>>> +            BUS_PROT_WR(MT8183_TOP_AXI_PROT_EN_CONN, 0x2a0, 0x2a4, 0x228),
>>>>
>>>> We have repeating values triplets for set, clear and status register in infracfg
>>>> and SMI.
>>>>
>>>> Weiyi can you help to get names to this registers? I wasn't able to find
>>>> anything in the datasheet.
>>>
>>> I think for the infracfg part I figured it out:
>>>
>>> #define INFRA_TOPAXI_PROTECTEN_SET      0x2a0
>>> #define INFRA_TOPAXI_PROTECTEN_CLR      0x2a4
>>> #define INFRA_TOPAXI_PROTECTEN_STA1     0x228
>>>
>>> #define INFRA_TOPAXI_PROTECTEN_1_SET    0x2a8
>>> #define INFRA_TOPAXI_PROTECTEN_1_CLR    0x2ac
>>> #define INFRA_TOPAXI_PROTECTEN_STA1_1   0x258
>>>
>>> #define INFRA_TOPAXI_PROTECTEN_MCU_SET  0x2d4
>>> #define INFRA_TOPAXI_PROTECTEN_MCU_CLR  0x2d8
>>> #define INFRA_TOPAXI_PROTECTEN_MM_STA1  0x2ec

These three should be:
INFRA_TOPAXI_PROTECTEN_MM_SET 0x2d4
INFRA_TOPAXI_PROTECTEN_MM_CLR 0x2d8
INFRA_TOPAXI_PROTECTEN_MM_STA1 0x2ec

>>>
> 
> I think this is SoC specific, right? So, I should add the MT8183_ prefix.
> 

It seems like in newer SoCs infracfg register map has changed the layout for 
INFRA_TOPAXI_PROTECTEN_SET and INFRA_TOPAXI_PROTECTEN_CLR registers. Apart from 
that it got expanded to be able to use bus protection on more HW blocks.

So not sure if MT8183_ is the right prefix. Maybe we should just rename 
INFRA_TOPAXI_PROTECTEN_SET to something like INFRA_TOPAXI_PROTECTEN_SET_V2 and 
do the same for INFRA_TOPAXI_PROTECTEN_CLR

Regards,
Matthias

>>> Weiyi, can you still provide the register names for the SMI?
>>>
>>> Thanks in advance!
>>> Matthias
>>>
>> Hi Matthias,
>>
>> SMI names are
>> #define SMI_COMMON_CLAMP_EN 0x3c0
>> #define SMI_COMMON_CLAMP_EN_SET 0x3c4
>> #define SMI_COMMON_CLAMP_EN_CLR 0x3c8
>>
> 
> The same here, this is specific for MT8183, right?
> 
> Thanks,
>    Enric
> 
>> Thanks
>>
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
