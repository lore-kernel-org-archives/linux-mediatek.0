Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E7EC4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 08:21:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B240207C4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 08:21:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NjBbQg7+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B240207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gy4jfRWaHNqtkL2uBlJPD5WIzL6Lx5edozFByJVWe34=; b=NjBbQg7+ioicJ/TsZVsaHwq11
	jlac9W+vDpu6sR9uxF4dxF4RAqMu2JZHiALTJSw6LEY7vF73Ak2ELGLLmVwnerEE0mGHRt4bYvgLs
	pBYJf5r25Cy3OJe8NQLzfrvPL/PtsZ9JumjoH1tU8dlSafIA6Y4aqjRNZ3yR00rV13WSwBRKI/32d
	pspxnRVh8asmGixAQAkVy04TN2ggp3KDrdHcXSSdzltHd4AYt77syicmZsJc1VztS4VD5JTb3tezS
	x6Q/PTDckpsIVYlvEiJJuPdFvoZro8Qcg9Hvdd9ljTL3DGlelFW3Kp4SYP/e/5ldXMlFXwzFLE95/
	fSiAs8+rQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLiz1-0002Gk-E0; Fri, 25 Sep 2020 08:21:35 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLiyv-0002F8-C3; Fri, 25 Sep 2020 08:21:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 9FD0E29D0E8
Subject: Re: [PATCH 11/12] soc: mediatek: pm-domains: Add support for mt8183
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20200910172826.3074357-1-enric.balletbo@collabora.com>
 <20200910172826.3074357-12-enric.balletbo@collabora.com>
 <730273b4-914a-8a7a-1583-351e6f20df5b@gmail.com>
 <5e1510f4-b0c4-2cff-b3f8-b6715d228149@gmail.com>
 <CAJMQK-jFwToRxBdVgtHT3wJ970M0NYGu3kLtkGRBDKMMNOHkJw@mail.gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <2a52c8e7-59db-9ed9-dd35-fc74738c152d@collabora.com>
Date: Fri, 25 Sep 2020 10:21:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAJMQK-jFwToRxBdVgtHT3wJ970M0NYGu3kLtkGRBDKMMNOHkJw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_042129_504416_70845B22 
X-CRM114-Status: GOOD (  18.22  )
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
 Matthias Brugger <mbrugger@suse.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Collabora Kernel ML <kernel@collabora.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hsin-Yi and Matthias,

Hsin-Yi, many thanks to provide the register names.

On 25/9/20 9:37, Hsin-Yi Wang wrote:
> On Wed, Sep 16, 2020 at 8:19 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>>
>>
>>
>> On 16/09/2020 11:46, Matthias Brugger wrote:
>>>
>>>
>>> On 10/09/2020 19:28, Enric Balletbo i Serra wrote:
>>>> From: Matthias Brugger <mbrugger@suse.com>
>>>>
>>>> Add the needed board data to support mt8183 SoC.
>>>>
>>>> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
>>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>>> ---
>>>>
>>>>   drivers/soc/mediatek/mtk-pm-domains.c | 162 ++++++++++++++++++++++++++
>>>>   include/linux/soc/mediatek/infracfg.h |  28 +++++
>>>>   2 files changed, 190 insertions(+)
>>>>
>>>> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c
>>>> b/drivers/soc/mediatek/mtk-pm-domains.c
>>>> index 29e88adc8ea6..aa434f616fee 100644
>>>> --- a/drivers/soc/mediatek/mtk-pm-domains.c
>>>> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
>>> [...]
>>>> +/*
>>>> + * MT8183 power domain support
>>>> + */
>>>> +static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
>>>> +    [MT8183_POWER_DOMAIN_AUDIO] = {
>>>> +        .sta_mask = PWR_STATUS_AUDIO,
>>>> +        .ctl_offs = 0x0314,
>>>> +        .sram_pdn_bits = GENMASK(11, 8),
>>>> +        .sram_pdn_ack_bits = GENMASK(15, 12),
>>>> +    },
>>>> +    [MT8183_POWER_DOMAIN_CONN] = {
>>>> +        .sta_mask = PWR_STATUS_CONN,
>>>> +        .ctl_offs = 0x032c,
>>>> +        .sram_pdn_bits = 0,
>>>> +        .sram_pdn_ack_bits = 0,
>>>> +        .bp_infracfg = {
>>>> +            BUS_PROT_WR(MT8183_TOP_AXI_PROT_EN_CONN, 0x2a0, 0x2a4, 0x228),
>>>
>>> We have repeating values triplets for set, clear and status register in infracfg
>>> and SMI.
>>>
>>> Weiyi can you help to get names to this registers? I wasn't able to find
>>> anything in the datasheet.
>>
>> I think for the infracfg part I figured it out:
>>
>> #define INFRA_TOPAXI_PROTECTEN_SET      0x2a0
>> #define INFRA_TOPAXI_PROTECTEN_CLR      0x2a4
>> #define INFRA_TOPAXI_PROTECTEN_STA1     0x228
>>
>> #define INFRA_TOPAXI_PROTECTEN_1_SET    0x2a8
>> #define INFRA_TOPAXI_PROTECTEN_1_CLR    0x2ac
>> #define INFRA_TOPAXI_PROTECTEN_STA1_1   0x258
>>
>> #define INFRA_TOPAXI_PROTECTEN_MCU_SET  0x2d4
>> #define INFRA_TOPAXI_PROTECTEN_MCU_CLR  0x2d8
>> #define INFRA_TOPAXI_PROTECTEN_MM_STA1  0x2ec
>>

I think this is SoC specific, right? So, I should add the MT8183_ prefix.

>> Weiyi, can you still provide the register names for the SMI?
>>
>> Thanks in advance!
>> Matthias
>>
> Hi Matthias,
> 
> SMI names are
> #define SMI_COMMON_CLAMP_EN 0x3c0
> #define SMI_COMMON_CLAMP_EN_SET 0x3c4
> #define SMI_COMMON_CLAMP_EN_CLR 0x3c8
> 

The same here, this is specific for MT8183, right?

Thanks,
  Enric

> Thanks
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
