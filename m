Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DDBC4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 10:30:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99B1F20704
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 10:30:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RxF+Ux78"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99B1F20704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NX8JV9hyHe7wYWWn8Somt4+Ks7KSMimlvkXfJIWDC2k=; b=RxF+Ux78xoYLqgQdOmX1ya2L1
	Sy+c0RZhJQaaX0IkbqrcazgK4J6o+WNBd5GsGf3zP3ROUNYWwc79PzJyWZgstZbuFR7modLavPD1W
	FtWanoG4MjRKPalBsWbCyv0V8aCjGbRZs9/H8xquuUnv12ZKwyGpg4yQGx18en40KO8qchnXdiQ8D
	8p66qDJTs6nfHa8yZhhoGXS89y52Awnuqw4Js38kdo99nfjuWK6C6SEQzKdSYNXsCpBcFA+zUxP3c
	pg21rR/6O1+DvzbTc2H4QYZsKpbIRTQEE2dZzOjEe+jubS5dPFW5XV9KI3A84G5995jo2zrI013OX
	FUtrGifuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYRfe-0006cn-AM; Fri, 30 Oct 2020 10:30:10 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYRfZ-0006bM-1b; Fri, 30 Oct 2020 10:30:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 57E141F45E58
Subject: Re: [PATCH v2 02/12] soc: mediatek: Add MediaTek SCPSYS power domains
To: Nicolas Boichat <drinkcat@chromium.org>
References: <20201001160154.3587848-1-enric.balletbo@collabora.com>
 <20201001160154.3587848-3-enric.balletbo@collabora.com>
 <CANMq1KDSsfX3r1440qbmWggqbD7pU_iM4S36LUF8rsS2jVGqOg@mail.gmail.com>
 <ebba9def-e394-c183-dd80-6dc3716a7bd1@collabora.com>
 <CANMq1KBfKK9-RfMK89hRCGzhqZVqs6+YRdw8o2K+jA+3VN1_gw@mail.gmail.com>
 <2e6def0a-400c-836f-ef8b-c4fe6ac6c26e@collabora.com>
 <CANMq1KDJPqiyXJKyeER7rSVbu7VxAcvrcV8rxDLMV+VEyx-Xmg@mail.gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <72dca621-ceb4-72ae-f340-c01474cb5b8d@collabora.com>
Date: Fri, 30 Oct 2020 11:29:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CANMq1KDJPqiyXJKyeER7rSVbu7VxAcvrcV8rxDLMV+VEyx-Xmg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_063005_294434_8726BDD9 
X-CRM114-Status: GOOD (  28.92  )
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
Cc: Matthias Brugger <mbrugger@suse.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Nicolas,

On 28/10/20 2:13, Nicolas Boichat wrote:
> On Wed, Oct 28, 2020 at 12:25 AM Enric Balletbo i Serra
> <enric.balletbo@collabora.com> wrote:
>>
>> Hi Nicolas,
>>
>> On 27/10/20 1:19, Nicolas Boichat wrote:
>>> Hi Enric,
>>>
>>> On Mon, Oct 26, 2020 at 11:17 PM Enric Balletbo i Serra
>>> <enric.balletbo@collabora.com> wrote:
>>>>
>>>> Hi Nicolas,
>>>>
>>>> Many thanks for looking at this.
>>>
>>> Thanks to you ,-)
>>>
>>> [snip]
>>>>>> +       if (id >= scpsys->soc_data->num_domains) {
>>>>>> +               dev_err_probe(scpsys->dev, -EINVAL, "%pOFn: invalid domain id %d\n", node, id);
>>>>>> +               return -EINVAL;
>>>>>> +       }
>>>>>> +
>>>>>> +       domain_data = &scpsys->soc_data->domains[id];
>>>>>> +       if (!domain_data) {
>>>>>
>>>>> Is that even possible at all? I mean, even if
>>>>> scpsys->soc_data->domains is NULL, as long as id != 0, this will no
>>>>> happen.
>>>>>
>>>>
>>>> I think could happen with a bad DT definition. I.e if for the definition of the
>>>> MT8173 domains you use a wrong value for the reg property, a value that is not
>>>> present in the SoC data. It is unlikely if you use the defines but could happen
>>>> if you hardcore the value. We cannot check this with the DT json-schema.
>>>
>>> I wasn't clear in my explanation, and looking further there is more
>>> that looks wrong.
>>>
>>> This expression &scpsys->soc_data->domains[id] is a pointer to element
>>> "id" of the array domains. So if you convert to integer arithmetic,
>>> it'll be something like `(long)scpsys->soc_data->domains +
>>> (sizeof(struct generic_pm_domain *)) * id`. The only way this can be
>>> NULL is if scpsys->soc_data->domains pointer is NULL, which, actually,
>>> can't really happen as it's the 5th element of a struct scpsys
>>> structure `(long)scpsys->soc_data + offset_of(domains, struct scpsys)
>>> + (sizeof(struct generic_pm_domain *)) * id`.
>>>
>>> I think what you mean is either:
>>> domain_data = &scpsys->soc_data->domains[id];
>>> if (!*domain_data)
>>> [but then domain_data type should be `struct generic_pm_domain **`?
>>
>> I think you're confusing the field `struct generic_pm_domain *domains[]`from the
>> `struct scpsys` with `const struct scpsys_domain_data *domains` from `struct
>> scpsys_soc_data`. My bad they have the same name, I should probably rename the
>> second one as domain_info or domain_data to avoid that confusion.
> 
> Oh, okay, get it, thanks for clarifying, I got myself confused indeed ,-P
> 
> But, still, part of my integer arithmetics still holds...
> 
> &scpsys->soc_data->domains[id] = (long)scpsys->soc_data->domains +
> (sizeof(struct generic_pm_domain *)) * id. The only way domain_data
> can be NULL is if scpsys->soc_data->domains pointer is NULL (it can't
> be, really, assuming scpsys_soc_data structures are well defined) AND
> id is 0.
> 
> Now, if I understand what you want to check here. If a domain id is
> not specified in scpsys_domain_data (e.g. if there is a gap in
> MT8XXX_POWER_DOMAIN_YYY indices and if `id` points at one of those
> gaps), you'll get an all-zero entry in domain_data. So maybe you can
> just check that domain_data->sta_mask != 0? Would that be enough? (I
> expect that sta_mask would always need to be set?)
> 

Yes, that would be enough. I'll change for the next version.

> But then again, are there ever gaps in MT8XXX_POWER_DOMAIN_YYY indices?
> 

AFAIK, there is no gaps, but one could make gaps when filling that info.  I
still think is worth have this check although is "unlikely" to happen due an
human error :-). I'll maintain for the next version, but I don't really care to
remove it if all you prefer I remove it.

Thanks,
  Enric


>>
>>
>> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h
>> b/drivers/soc/mediatek/mtk-pm-domains.h
>> index 7c8efcb3cef2..6ff095db8a27 100644
>> --- a/drivers/soc/mediatek/mtk-pm-domains.h
>> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
>> @@ -56,7 +56,7 @@ struct scpsys_domain_data {
>>  };
>>
>>  struct scpsys_soc_data {
>> -       const struct scpsys_domain_data *domains;
>> +       const struct scpsys_domain_data *domain_data;
>>         int num_domains;
>>         int pwr_sta_offs;
>>         int pwr_sta2nd_offs;
>>
>> ---
>>
>> struct scpsys {
>>     ...
>>     const struct scpsys_soc_data *soc_data;
>>     ...
>>     struct generic_pm_domain *domains[];
>> }
>>
>>
>> domain_data = &scpsys->soc_data->domain_data[id];
>> if (!domain_data)
>>
>> Thanks,
>>   Enric
>>
>>
>>> Does your code compile with warnings enabled?]
>>> or:
>>> domain_data = scpsys->soc_data->domains[id];
>>> if (!domain_data)
>>> [then the test makes sense]
>>>
>>> [snip]
>>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
