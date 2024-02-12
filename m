Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3EBC48297
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 16:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TN1i4r7AT4NTHS/cqs4Lebur5DhSNWFg6+vsiT9DZoU=; b=odTc8925X1zLXj6HxvpeMIrfaV
	Hwyd/HiB0NEtbGQg/nlYKtpn+AtVYbVdv6GVlyrLYvazKJQhcw0ZhWaUZyKsO1OhMLm3qPAuWV4MN
	64scHXyoHaeb7dOCN3V6uDF0ESN4sfyenpgRvghtBmVimxAmraDsNpIxA2r6yG3BF0CjbPI7rmJJX
	sHNYoD2gRa5lvJXbx02h89caGcJeoou/++V25aYggYeseijqeSGUZbkG0gBUcLUtnz9AB10w1XzL/
	xYdAA2w90Jfu40wv7HWHn2GoUrKbvEaV1GvDw4HZBeRaFcF7cWrIxF8YTMynu9CVqJqbQBBjl98re
	dT//b1vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZYw1-000000065PG-25Rx;
	Mon, 12 Feb 2024 16:13:33 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZYvy-000000065OZ-3Fgc;
	Mon, 12 Feb 2024 16:13:32 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41CGDGQl130327;
	Mon, 12 Feb 2024 10:13:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707754396;
	bh=TN1i4r7AT4NTHS/cqs4Lebur5DhSNWFg6+vsiT9DZoU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rZFpmCroVnlnwibRs0YS/V8/opPg+hp25gqg1uA8X+ZQHdncTK9t0CDHLEnCQppDu
	 nDd7OyQ4Sp6DIizWgAcFu3Ugeui+/qeRQrHPraYnj/YniuBoI/kOPUwE4L5GGwclQK
	 CHZmnd7pdSyiZ00RbnTe/+knicsQU03xtf3Ls/FA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41CGDGRi023925
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Feb 2024 10:13:16 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Feb 2024 10:13:15 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Feb 2024 10:13:16 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41CGDFF9065517;
	Mon, 12 Feb 2024 10:13:15 -0600
Message-ID: <961cb55f-1725-4e3e-9704-c0e7cb9e4e7c@ti.com>
Date: Mon, 12 Feb 2024 10:13:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/19] power: reset: syscon-poweroff: Move device data
 into a struct
To: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Cristian
 Ciocaltea <cristian.ciocaltea@gmail.com>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden
	<sbranden@broadcom.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad
 Dybcio <konrad.dybcio@linaro.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-actions@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
References: <20240208170410.67975-1-afd@ti.com>
 <20240208170410.67975-19-afd@ti.com>
 <glaiaikudbtuahnwnqoduretcnmrpb7lg2gerlnntcltrjfcko@4vgjb4v66rad>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <glaiaikudbtuahnwnqoduretcnmrpb7lg2gerlnntcltrjfcko@4vgjb4v66rad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_081330_936369_9685F7C5 
X-CRM114-Status: GOOD (  16.38  )
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

On 2/11/24 5:52 PM, Sebastian Reichel wrote:
> Hi Andrew,
> 
> On Thu, Feb 08, 2024 at 11:04:09AM -0600, Andrew Davis wrote:
>> Currently all these device data elements are top level global variables.
>> Move these into a struct. This will be used in the next patch when
>> the global variable usage is removed. Doing this in two steps makes
>> the patches easier to read.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/power/reset/syscon-poweroff.c | 36 +++++++++++++++------------
>>   1 file changed, 20 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/power/reset/syscon-poweroff.c b/drivers/power/reset/syscon-poweroff.c
>> index 1b2ce7734260c..4899a019256e8 100644
>> --- a/drivers/power/reset/syscon-poweroff.c
>> +++ b/drivers/power/reset/syscon-poweroff.c
>> @@ -15,15 +15,19 @@
>>   #include <linux/pm.h>
>>   #include <linux/regmap.h>
>>   
>> -static struct regmap *map;
>> -static u32 offset;
>> -static u32 value;
>> -static u32 mask;
>> +struct syscon_poweroff_data {
>> +	struct regmap *map;
>> +	u32 offset;
>> +	u32 value;
>> +	u32 mask;
>> +};
>> +
>> +static struct syscon_poweroff_data *data;
> 
> This patch is broken without the follow-up patch, since data is
> never allocated. You need to move the memory allocation from the
> next patch to this one.

Ah, yes, seems I meant to make this struct point to a definition
not just a declaration. But just moving the allocation to this
patch seems to make this easier too, will do that, v4 on the way.

Thanks,
Andrew

> 
> Greetings,
> 
> -- Sebastian

