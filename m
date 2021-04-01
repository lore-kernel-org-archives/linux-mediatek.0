Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81011C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 01:40:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 207A16105A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 01:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 207A16105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y3WStTpMEYXEU+qNo8x4PAMCp4fHrRm6CkYbnTRsx4I=; b=dSKImbJmaFdIbw6ZheJ3M23yg
	yte833fEOnvLiZG5lXDxMzNtaTTFqkagIw1JQvUaCCE2CveLw9D97S9P3YHF2vCZ3l2lLd/GMvB9G
	A3ZxcwDDMx+iADNoV9mT/SXUgz1z1MbpE/a0dSNEMiISisf9qMYxOHx3dDlINsDacPl4M31u6bl+l
	qG+nEwNiNpVtQsQLsTWJ6+kQr+xy0uJruT9o3fdMEff3iXw9BTzeIiy8FxseqEEAXFaqOz2w+66HI
	ScE6RGlWBo3GsbNxtIc2IkRe4TLliVw9rMb5N58Jryzy1vSTDk7BOFXjY2fyztpfY5HoVQMc+oIuc
	1Lg3BIeKA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRmJo-00885B-46; Thu, 01 Apr 2021 01:40:20 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRmJk-00884c-0e
 for linux-mediatek@lists.infradead.org; Thu, 01 Apr 2021 01:40:17 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617241213; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=188ScI7IN9TQ0IjdtTR3Qyp8g6FQy45LVuXM62ZjqjU=;
 b=H2G5YcxYiWQZW7aic5a5k2LaBaiMI1N43WUJ4QrTWdaKIreOFw74UAC7SA4bVrkAGfWL34e7
 TZNb0ZoaGJGF2k/GLNkSKQaDfRQpMApsQAR/vSEM5LaJJr5iK8NS/0CJ74XbwEnqixDb4VPC
 zjsRaMVP1mNwXoQnzh8n6r1JZjM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6065247cc06dd10a2d2be66f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Apr 2021 01:40:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A5A1FC43469; Thu,  1 Apr 2021 01:40:11 +0000 (UTC)
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 661EAC433CA;
 Thu,  1 Apr 2021 01:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 661EAC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v14 1/2] scsi: ufs: Enable power management for wlun
To: Adrian Hunter <adrian.hunter@intel.com>, cang@codeaurora.org,
 martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, Pedro Sousa <pedrom.sousa@synopsys.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Stanley Chu
 <stanley.chu@mediatek.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Bean Huo <beanhuo@micron.com>, Kiwoong Kim <kwmad.kim@samsung.com>,
 Yue Hu <huyue2@yulong.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 Wei Yongjun <weiyongjun1@huawei.com>, Bart van Assche <bvanassche@acm.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Dinghao Liu <dinghao.liu@zju.edu.cn>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Satya Tangirala <satyat@google.com>, open list
 <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>
References: <cover.1617143113.git.asutoshd@codeaurora.org>
 <16f1bcf76ff411c70fe0e3e13f84e4b0fa7d9063.1617143113.git.asutoshd@codeaurora.org>
 <a385141d-324b-680e-a19c-ab6121bd6c5d@intel.com>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <dbac8ce8-83c6-49a5-9f4d-f5ea19d7a883@codeaurora.org>
Date: Wed, 31 Mar 2021 18:40:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a385141d-324b-680e-a19c-ab6121bd6c5d@intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_024016_217094_5865A227 
X-CRM114-Status: GOOD (  23.35  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 3/31/2021 11:19 AM, Adrian Hunter wrote:
> On 31/03/21 1:31 am, Asutosh Das wrote:
>> During runtime-suspend of ufs host, the scsi devices are
>> already suspended and so are the queues associated with them.
>> But the ufs host sends SSU (START_STOP_UNIT) to wlun
>> during its runtime-suspend.
>> During the process blk_queue_enter checks if the queue is not in
>> suspended state. If so, it waits for the queue to resume, and never
>> comes out of it.
>> The commit
>> (d55d15a33: scsi: block: Do not accept any requests while suspended)
>> adds the check if the queue is in suspended state in blk_queue_enter().
>>
>> Call trace:
>>   __switch_to+0x174/0x2c4
>>   __schedule+0x478/0x764
>>   schedule+0x9c/0xe0
>>   blk_queue_enter+0x158/0x228
>>   blk_mq_alloc_request+0x40/0xa4
>>   blk_get_request+0x2c/0x70
>>   __scsi_execute+0x60/0x1c4
>>   ufshcd_set_dev_pwr_mode+0x124/0x1e4
>>   ufshcd_suspend+0x208/0x83c
>>   ufshcd_runtime_suspend+0x40/0x154
>>   ufshcd_pltfrm_runtime_suspend+0x14/0x20
>>   pm_generic_runtime_suspend+0x28/0x3c
>>   __rpm_callback+0x80/0x2a4
>>   rpm_suspend+0x308/0x614
>>   rpm_idle+0x158/0x228
>>   pm_runtime_work+0x84/0xac
>>   process_one_work+0x1f0/0x470
>>   worker_thread+0x26c/0x4c8
>>   kthread+0x13c/0x320
>>   ret_from_fork+0x10/0x18
>>
>> Fix this by registering ufs device wlun as a scsi driver and
>> registering it for block runtime-pm. Also make this as a
>> supplier for all other luns. That way, this device wlun
>> suspends after all the consumers and resumes after
>> hba resumes.
>>
>> Co-developed-by: Can Guo <cang@codeaurora.org>
>> Signed-off-by: Can Guo <cang@codeaurora.org>
>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>> ---
> 
Hi Adrian
Thanks for the comments.
> Looks good but still doesn't seem to based on the latest tree.
> 
Umm, it's based on the below:
git://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git
Branch: refs/heads/for-next

The top most change is e27f3c8 on 27th March'21.
Which tree are you referring to that'd be latest?

> Also came across the issue below:
> 
> <SNIP>
> 
>> +#ifdef CONFIG_PM_SLEEP
>> +static int ufshcd_wl_poweroff(struct device *dev)
>> +{
>> +	ufshcd_wl_shutdown(dev);
> 
> This turned out to be wrong.  This is a PM op and SCSI has already
> quiesced the sdev's.  All that is needed isOk. I'll fix it in the next version.

> 
> 	__ufshcd_wl_suspend(hba, UFS_SHUTDOWN_PM);
> 
>> +	return 0;
>> +}
>> +#endif


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
