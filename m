Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E599BC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 21:54:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66D2961279
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 21:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66D2961279
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G8PIIsS2Nx7RI6EdR42xH+/ticuVq8IfQo16LS5t7Kw=; b=ldd/v95VAhmHWeFdRmgl15/YI
	U1vqAeYlQnd8Us6Ww0c+aiokdoZwAXxexD793ReuBgNVKtZAkB10cVvKlb917OLEljXzlI5/9hTDh
	6w8dCnlbyuAECt7OoLpWtsZnYM6USTdEKvKbyCkdngA9WY5fSxPpZJstwjvSD8NSbk8rtMX0jrNlN
	7nshznu5bTZBBn8IvyGmX5wH1bRULSXwsVG7KsmmPPJvVD0ijBdgk5V1uVISQlbVRZL4IK4I9Gen8
	xpfztnUI5+7iwtrq93OojLQhT/hPei7WG3g78pUQknLK2KLN/NU5F+3XH6poYVSKkz8VdmZlHwvpq
	h9hkN4bbQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYbqZ-00AgZa-7b; Mon, 19 Apr 2021 21:54:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYbqW-00AgZQ-Jf
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 21:54:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=Hq64TonC+NenCtnU0+rJhatIPlhtHcQUw02PEAk3v+U=; b=iG2TTMZ1BbhrW8v6aBHJco72QO
 NYDoQ/ZXmRi0i6T39XUwYiM0K5x1WVyl+tSCsRsRVSrIL3msloBt+TLmUEGOUS+0dW8fZxdOAj+Er
 qUt783W99Oro56HfHI9kN1VnJ1J5kn1EfKb5C6WETmZCLGLUhJJFdcrSeofwtAX2fOJ/zl9HRw9cD
 rrliypdMe3Oe1XVJT6rLlG+Httd4yanl2o4HuoKJitNSE9KXAeR/1JRQYG1fiZrXF9zP0Tk6kSehc
 PH1oQFKgePhtzpOu/XH/mKdiYNlx5EuDuvxQEo9D+6b9OtDf09GaZm7HQ3CB2G4vwZnyBmAu3nOSj
 bWy1nBGA==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYbqR-00BgMc-9F
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 21:54:19 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618869251; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Hq64TonC+NenCtnU0+rJhatIPlhtHcQUw02PEAk3v+U=;
 b=joQ+H47WJkFNkINInv4O+IxAgCPVdsfRDU5PC/FBFrzgRL45s0zcK4w29A3MMqWlQ2RCCW76
 PBxzjbmokvuGpzPiWV7pe6PSaIDrVUNzjMF+mRdSMhxL+F4gbXv4yHNjI5FTKAWahP/8+64/
 BNSkyZsWHUW5K3RZmBLzDeOqijA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 607dfbf487ce1fbb5621ca5f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 19 Apr 2021 21:53:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 55B18C43217; Mon, 19 Apr 2021 21:53:55 +0000 (UTC)
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 88C7EC433D3;
 Mon, 19 Apr 2021 21:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 88C7EC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v20 1/2] scsi: ufs: Enable power management for wlun
To: Adrian Hunter <adrian.hunter@intel.com>, cang@codeaurora.org,
 martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Bean Huo <beanhuo@micron.com>, Kiwoong Kim <kwmad.kim@samsung.com>,
 Colin Ian King <colin.king@canonical.com>,
 Wei Yongjun <weiyongjun1@huawei.com>, Yue Hu <huyue2@yulong.com>,
 Bart van Assche <bvanassche@acm.org>,
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
References: <cover.1618600985.git.asutoshd@codeaurora.org>
 <d660b8d4e1fb192810abd09a8ff0ef4d9f6b96cd.1618600985.git.asutoshd@codeaurora.org>
 <fdadd467-b613-d800-18c5-be064396fd10@intel.com>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <07e3ea07-e1c3-7b8c-e398-8b008f873e6d@codeaurora.org>
Date: Mon, 19 Apr 2021 14:53:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <fdadd467-b613-d800-18c5-be064396fd10@intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_145415_408033_0BE94EE1 
X-CRM114-Status: GOOD (  19.01  )
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

On 4/19/2021 11:37 AM, Adrian Hunter wrote:
> On 16/04/21 10:49 pm, Asutosh Das wrote:
>>
>> Co-developed-by: Can Guo <cang@codeaurora.org>
>> Signed-off-by: Can Guo <cang@codeaurora.org>
>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>> ---
> 
> I came across 3 issues while testing.  See comments below.
> 
Hi Adrian
Thanks for the comments.
> <SNIP>
> 
>> @@ -5794,7 +5839,7 @@ static void ufshcd_err_handling_unprepare(struct ufs_hba *hba)
>>   	if (ufshcd_is_clkscaling_supported(hba))
>>   		ufshcd_clk_scaling_suspend(hba, false);
>>   	ufshcd_clear_ua_wluns(hba);
> 
> ufshcd_clear_ua_wluns() deadlocks trying to clear UFS_UPIU_RPMB_WLUN
> if sdev_rpmb is suspended and sdev_ufs_device is suspending.
> e.g. ufshcd_wl_suspend() is waiting on host_sem while ufshcd_err_handler()
> is running, at which point sdev_rpmb has already suspended.
> 
Umm, I didn't understand this deadlock.
When you say, sdev_rpmb is suspended, does it mean runtime_suspended?
sdev_ufs_device is suspending - this can't be runtime_suspending, while 
ufshcd_err_handling_unprepare is running.

If you've a call-stack of this deadlock, please can you share it with 
me. I'll also try to reproduce this.

I'll address the other comments in the next version.


Thank you!

>> -	pm_runtime_put(hba->dev);
>> +	ufshcd_rpm_put(hba);
>>   }
> 
> <SNIP>
> 
>> +void ufshcd_resume_complete(struct device *dev)
>> +{

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
