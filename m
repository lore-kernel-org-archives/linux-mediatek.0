Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1D6C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 18:22:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 949C0610FB
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 18:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 949C0610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AYdIRinRHlE9nZ4MOzw3SXPA1sBfQFDr0FAOoFj0V6M=; b=Npr5jrAy/b3OgvutlWMGcFhwH
	JP+PMbxFCzcIn61kvKG3kJg9aKpmIcLwgTdAnY4cKbEINEKd+IZc/L20mPaQDE+O29G7fduz7W5UR
	VOyJv8hfn9EG43gevQSsA5/zCYyHhGHmsOOdrw05mImliFcfadbs27T1Nutv7HDdfmKTSOMQNNX1p
	4hxIshHtBLqk5MrCi0IxShjZwWnwIeOVg3ldhzOrDkLQtAvvoJotxNLn+pCrCK4lqXlQ09+T/44cV
	me+Ljd2BlgWRF8mLwyZKORM37mk+Ji8BzikRB6ZI1lZkPZ20FNU+0iHQ/Af1CGhmPM6gBQey+SUIb
	/+TtkOGxQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXT6d-0033mu-M9; Fri, 16 Apr 2021 18:22:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXT6b-0033mj-5s
 for linux-mediatek@desiato.infradead.org; Fri, 16 Apr 2021 18:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=kVxxHWGXgfHGZWYXemFNetuQ9QkDGOKq4KF+Razehig=; b=4frpWe2KGTvzyLkz0Ujxvh6lrV
 Y/6VLQiO+R1heHhE0U5lBGyLdEegHosYtr8WbsmyOLE6sDNFDdVoQ1WHnKDd+rcfuPUYexKyr5/Xv
 PEWYbMQQefuDX+yiNs8f+xmDucPXp05IcuKH+a+Ps0slJWj6sdWGncfQSmyik0HLVb0TFm89lSBcI
 8+gxyl8/m5X8s9RrKnVNF0n19yzpSS+Jtz056/blWl5I7Qi0YpaHZhVR5PD7Y3hC4gE52mX3kuKhI
 zFxHiewAo6sW4kl/q76ZF0a4XCAP2hnlScLXCvehr68n3LVrhsfE+IqsrT/97yO2Tgo8AXoXhLELX
 IxOi9SEw==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXT6U-009caR-H7
 for linux-mediatek@lists.infradead.org; Fri, 16 Apr 2021 18:22:11 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618597329; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=kVxxHWGXgfHGZWYXemFNetuQ9QkDGOKq4KF+Razehig=;
 b=mbw2yz0QA6x7QTjbOI1HKnXHTP2fIngUfWdnMXRO+IL4Pxsf8q6TXS1YSqqavaOVSGXCPVsg
 8zu0rzzQSI9T5eaumqzzv3K0IDD9G4f+Z4yVB68rZHkgzPRgy/5CYIOSWE/WfkL5+ii9oD0h
 RqK1AAbRMRKUMeL3jv5LKGbpKXs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6079d5c1a817abd39a049d98 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Apr 2021 18:21:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1F901C4346B; Fri, 16 Apr 2021 18:21:51 +0000 (UTC)
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3F772C433CA;
 Fri, 16 Apr 2021 18:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3F772C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v18 1/2] scsi: ufs: Enable power management for wlun
To: Bart Van Assche <bvanassche@acm.org>, cang@codeaurora.org,
 martin.petersen@oracle.com, adrian.hunter@intel.com,
 linux-scsi@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, Pedro Sousa <pedrom.sousa@synopsys.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Stanley Chu
 <stanley.chu@mediatek.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Bean Huo <beanhuo@micron.com>, Kiwoong Kim <kwmad.kim@samsung.com>,
 Yue Hu <huyue2@yulong.com>, Wei Yongjun <weiyongjun1@huawei.com>,
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
References: <cover.1618426513.git.asutoshd@codeaurora.org>
 <d1a6af736730b9d79f977100286c5d9325546ac2.1618426513.git.asutoshd@codeaurora.org>
 <f111e363-c709-fe3c-65da-450c9e9e3408@acm.org>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <9ae35c14-f8aa-a181-2259-2d32bd2c1f07@codeaurora.org>
Date: Fri, 16 Apr 2021 11:21:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <f111e363-c709-fe3c-65da-450c9e9e3408@acm.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_112209_274311_B6CC8FD3 
X-CRM114-Status: GOOD (  22.08  )
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

On 4/15/2021 4:11 PM, Bart Van Assche wrote:
> On 4/14/21 11:58 AM, Asutosh Das wrote:
>> [ ... ]
> 
Hi Bart,
Thanks for the comments. I will fix the comments in the next version.

> The following code is executed before ufshcd_async_scan() is called:
> 
> 	dev = hba->dev;
> 	[ ... ]
> 	/* Hold auto suspend until async scan completes */
> 	pm_runtime_get_sync(dev);
> 
That would only keep the hba runtime resumed. At this point of time the 
luns are not detected yet.
> and the following code occurs in ufshcd_add_lus():
> 
> 	pm_runtime_put_sync(hba->dev);
> 
> Isn't that sufficient to postpone enabling of runtime PM until LUN
> scanning has finished? Or in other words, is adding a
> pm_runtime_get_noresume() call in ufshcd_slave_configure() really necessary?
> 
Yes, because the supplier (device wlun) may be suspended otherwise in 
scsi_sysfs_add_sdev().
>> @@ -4979,15 +5035,9 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp)
>>   			 */
>>   			if (!hba->pm_op_in_progress &&
>>   			    !ufshcd_eh_in_progress(hba) &&
>> -			    ufshcd_is_exception_event(lrbp->ucd_rsp_ptr) &&
>> -			    schedule_work(&hba->eeh_work)) {
>> -				/*
>> -				 * Prevent suspend once eeh_work is scheduled
>> -				 * to avoid deadlock between ufshcd_suspend
>> -				 * and exception event handler.
>> -				 */
>> -				pm_runtime_get_noresume(hba->dev);
>> -			}
>> +			    ufshcd_is_exception_event(lrbp->ucd_rsp_ptr))
>> +				/* Flushed in suspend */
>> +				schedule_work(&hba->eeh_work);
> 
> What makes it safe to leave out the above pm_runtime_get_noresume() call?
> 
The __ufshcd_wl_suspend() would flush this work so that it doesn't run 
after suspend.
> Thanks,
> 
> Bart.
> 


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
