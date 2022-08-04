Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC640C19F29
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 03:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtqsNxKZaq5+I1cwbh9HONBxD0qfz9wTAuYEHA1BdO8=; b=h2WlLAQl7wJKHeWV6cqwP8WkxS
	JBwpeHBovWtLNSZPqSip7tQxThxZIf4biDFOJ7Gy8YFeGotZEQBlN/jgzyif367aUVWr1PGNSGmWh
	X8vzBm/WfT3COo1X68DgqFZt+lPME4+3HQgaTaU5jXkVOKa3q7r+JydQdb+E3pOaQVYrj+gpATSru
	lEtkpHbu4bBhvpFaCsiR6By6BqWwdLtevuD5/6X7Sb++ZTJJdDkCbPkEj+vQQsJVm+goG2VMXKPyO
	BXXEdw7RHWoFBhddo/CuHkqaMpZsEkBNRRhkU4NjecrGMkFh2AlXg7gj6eVENYdiHZEK/VFdIZYFO
	yFt72upg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJR6L-00F97D-2i; Thu, 04 Aug 2022 03:00:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJR6H-00F8q7-N1
	for linux-mediatek@lists.infradead.org; Thu, 04 Aug 2022 03:00:43 +0000
X-UUID: 09812ef3f636441ab4bf7d66084afd87-20220803
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:18537bb5-3e51-4f60-8bfd-25364d9ebf50,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:fbae2dd1-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 09812ef3f636441ab4bf7d66084afd87-20220803
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 56684277; Wed, 03 Aug 2022 20:00:35 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 4 Aug 2022 10:49:58 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 4 Aug 2022 10:49:57 +0800
Subject: Re: [PATCH v4] ufs: allow host driver disable wb toggle druing clock
 scaling
To: Bart Van Assche <bvanassche@acm.org>, <stanley.chu@mediatek.com>,
	<linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
	<cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
	<jiajie.hao@mediatek.com>, <powen.kao@mediatek.com>,
	<qilin.tan@mediatek.com>, <lin.gui@mediatek.com>
References: <20220803030329.5897-1-peter.wang@mediatek.com>
 <2070dd08-371b-a660-388e-ec2481781db9@acm.org>
From: Peter Wang <peter.wang@mediatek.com>
Message-ID: <86e03b02-b8d9-cd16-dbc3-55efa10bda80@mediatek.com>
Date: Thu, 4 Aug 2022 10:49:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2070dd08-371b-a660-388e-ec2481781db9@acm.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_200041_803349_07A39131 
X-CRM114-Status: GOOD (  19.98  )
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


On 8/4/22 3:28 AM, Bart Van Assche wrote:
> On 8/2/22 20:03, peter.wang@mediatek.com wrote:
>>
>
> disable -> to disable?
>
> toggle -> toggling?
>
> druing -> during?
>
>> diff --git a/drivers/ufs/core/ufs-sysfs.c b/drivers/ufs/core/ufs-sysfs.c
>> index 0a088b47d557..7f41f2a69b04 100644
>> --- a/drivers/ufs/core/ufs-sysfs.c
>> +++ b/drivers/ufs/core/ufs-sysfs.c
>> @@ -225,7 +225,8 @@ static ssize_t wb_on_store(struct device *dev, 
>> struct device_attribute *attr,
>>       unsigned int wb_enable;
>>       ssize_t res;
>>   -    if (!ufshcd_is_wb_allowed(hba) || 
>> ufshcd_is_clkscaling_supported(hba)) {
>> +    if (!ufshcd_is_wb_allowed(hba) || 
>> (ufshcd_is_clkscaling_supported(hba)
>> +        && ufshcd_enable_wb_if_scaling_up(hba))) {
>
> The "&&" is misplaced - it should occur at the end of the previous 
> line. Isn't this something that checkpatch complains about?
>
>>       /* Enable Write Booster if we have scaled up else disable it */
>> -    downgrade_write(&hba->clk_scaling_lock);
>> -    is_writelock = false;
>> -    ufshcd_wb_toggle(hba, scale_up);
>> +    if (ufshcd_enable_wb_if_scaling_up(hba)) {
>> +        downgrade_write(&hba->clk_scaling_lock);
>> +        is_writelock = false;
>> +        ufshcd_wb_toggle(hba, scale_up);
>> +    }
>
> Since this code is being modified, please move the "/* Enable" comment 
> to where it should occur (just above the ufshcd_wb_toggle() call).
>
>> @@ -1004,6 +1010,10 @@ static inline bool ufshcd_is_wb_allowed(struct 
>> ufs_hba *hba)
>>   {
>>       return hba->caps & UFSHCD_CAP_WB_EN;
>>   }
>> +static inline bool ufshcd_enable_wb_if_scaling_up(struct ufs_hba *hba)
>> +{
>> +    return hba->caps & UFSHCD_CAP_WB_WITH_CLK_SCALING;
>> +}
>
> It seems like a blank line is missing above the new function definition?
>
> Otherwise this patch looks good to me.
>
> Thanks,

Hi Bart,


Will fix next version.


Thanks

Peter

>
> Bart.

