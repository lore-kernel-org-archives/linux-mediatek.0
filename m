Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A002FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 06:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdS2oecJpSoVSYVWm4W+CfUdoD4L8ZlMM+fSiZBh1sw=; b=O6s3FMCiY/ueuIlw4Fn1xek1i0
	dER9UuXymy5zw7MfiF7jrs3gsjR87NlkNqJ81nRNBO8yveGrzy8VGR3TzXgfn1TSfv+dTk9z48wUI
	dfuew2BYM55wY9ZaXQcYtbWG/Gomj3OQKVI7tL2/lxY9jAs8HjMJYCCBQdVCw4pap2w++jko0Vzfq
	7333+wGRtQKbeGkl1FIw+4rOPsmmxqAfs9wodAe7PY/7TFgPKmzjOeWFtEa8Uw3aT2InFtw3qqdAD
	XCSH7GG+6NwF/RV7TJA+g4EHa7g74PW9yTUZCofNUWLk5oNbMILY4XJ2olO4aXLVHJu5tfIdb0H5Q
	B5OWN1BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4GfW-00Dl2D-O7; Thu, 23 Jun 2022 06:50:22 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4GfL-00Dkwz-T7; Thu, 23 Jun 2022 06:50:13 +0000
Received: from kwepemi500023.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LT9lJ3PpyzSh98;
	Thu, 23 Jun 2022 14:46:36 +0800 (CST)
Received: from [10.174.176.254] (10.174.176.254) by
 kwepemi500023.china.huawei.com (7.221.188.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 23 Jun 2022 14:50:00 +0800
Subject: Re: [PATCH] soc: mediatek: fix missing clk_disable_unprepare() on err
 in svs_resume()
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<liwei391@huawei.com>
References: <20220621114658.10054-1-wupeng58@huawei.com>
 <f48e0cca-644a-bad7-282b-28e3e0d5d437@gmail.com>
From: "wupeng (D)" <wupeng58@huawei.com>
Message-ID: <6b1751c2-28c9-8b1b-4273-3f3c5681151a@huawei.com>
Date: Thu, 23 Jun 2022 14:50:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0
MIME-Version: 1.0
In-Reply-To: <f48e0cca-644a-bad7-282b-28e3e0d5d437@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.254]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500023.china.huawei.com (7.221.188.76)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_235012_160185_56D34612 
X-CRM114-Status: GOOD (  10.76  )
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

On 2022/6/22 22:02, Matthias Brugger wrote:
> 
> 
> On 21/06/2022 13:46, Peng Wu wrote:
>> Fix the missing clk_disable_unprepare() before return
>> from svs_resume() in the error handling case.
>>
>> Signed-off-by: Peng Wu <wupeng58@huawei.com>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> ---
>>   drivers/soc/mediatek/mtk-svs.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
>> index 606a00a2e57d..1b5c297aaec5 100644
>> --- a/drivers/soc/mediatek/mtk-svs.c
>> +++ b/drivers/soc/mediatek/mtk-svs.c
>> @@ -1525,6 +1525,7 @@ static int svs_resume(struct device *dev)
>>       ret = reset_control_deassert(svsp->rst);
>>       if (ret) {
>> +        clk_disable_unprepare(svsp->main_clk);
> 
> Same holds for the error path of svs_init02(), correct?
> 
> Regards,
> Matthias
> 
>>           dev_err(svsp->dev, "cannot deassert reset %d\n", ret);
>>           return ret;
>>       }
> .
Yes, the error path of svs_init02() requires the same operation.
I will resubmit a patch.

Regards,
Peng

