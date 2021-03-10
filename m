Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1924AC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 04:05:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94B8D64FE3
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 04:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94B8D64FE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TGtcGSWUxiG1MIQKNyg0JKB8NoCimRlpXtj4IquJcTQ=; b=Mlr2+EsVWmGNdMENLLAu0vMpg
	kHqC1zcejqACgSCF5bETZkGQ+NuzfmTIJkepVpXYloXyYT41oAjrg7s+XSQr6jjJgRRC42o9XlpYG
	iBVYYJRvKXs6inQFMNzC/5ULKDyxWKUpi75pNKCBiNkwv+D6kXzGteTgQBkcSgG8Jr7ypgEGQkRjq
	M95pmBvScIJy5hZawT+my3gCM/8Z8tL+mYJQ+NezI+1eRw02pgFdJDQmTPIspy79RAiH4LlOlhQdY
	EZ0j6QgH5yWVsKUa2pNtZzSxff/dI22Psxjd+YmqYizpOHsMNgYsFJhJoAQ1Io5l/BbNSUYhMBYMV
	4A4qcVovw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJq5w-005ygR-Mt; Wed, 10 Mar 2021 04:05:13 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJq5q-005yfo-1P
 for linux-mediatek@lists.infradead.org; Wed, 10 Mar 2021 04:05:10 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615349106; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ZHa7iIF6f1BAN5sS7dr1WZt2PGRaGrl4ziVtXJN3He8=;
 b=a93VdOFGJ73RHLtKcsrN22l3YiqtpdEBQgkecI7+s0WmMmzef++bkCHA26rkseWqIPih/i7T
 mG2A5TK7KXrKfQFJpBP+oWKqxU24nTd0ET097uJr9Q3+9FeOLnrLQCpVpbuU8VAAwTN4ocRd
 +NrJPZ4q2EtC+0elETuHN6TTXU8=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6048456aa6850484a6d41a75 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 04:04:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 872D4C43469; Wed, 10 Mar 2021 04:04:57 +0000 (UTC)
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 79864C433C6;
 Wed, 10 Mar 2021 04:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 79864C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v10 1/2] scsi: ufs: Enable power management for wlun
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Bart Van Assche <bvanassche@acm.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, cang@codeaurora.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Stanley Chu
 <stanley.chu@mediatek.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Bean Huo <beanhuo@micron.com>,
 Lee Jones <lee.jones@linaro.org>, Wei Yongjun <weiyongjun1@huawei.com>,
 Dinghao Liu <dinghao.liu@zju.edu.cn>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Tomas Winkler <tomas.winkler@intel.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Satya Tangirala <satyat@google.com>, open list
 <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
 Linux-PM mailing list <linux-pm@vger.kernel.org>
References: <cover.1614725302.git.asutoshd@codeaurora.org>
 <0576d6eae15486740c25767e2d8805f7e94eb79d.1614725302.git.asutoshd@codeaurora.org>
 <85086647-7292-b0a2-d842-290818bd2858@intel.com>
 <6e98724d-2e75-d1fe-188f-a7010f86c509@codeaurora.org>
 <20210306161616.GC74411@rowland.harvard.edu>
 <CAJZ5v0ihJe8rNjWRwNic_BQUvKbALNcjx8iiPAh5nxLhOV9duw@mail.gmail.com>
 <CAJZ5v0iJ4yqRTt=mTCC930HULNFNTgvO4f9ToVO6pNz53kxFkw@mail.gmail.com>
 <f1e9b21d-1722-d20b-4bae-df7e6ce50bbc@codeaurora.org>
 <2bd90336-18a9-9acd-5abb-5b52b27fc535@codeaurora.org>
 <20210310031438.GB203516@rowland.harvard.edu>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <6b985880-f23a-adb3-8b7a-7ee1b56e6fa7@codeaurora.org>
Date: Tue, 9 Mar 2021 20:04:53 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210310031438.GB203516@rowland.harvard.edu>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_040508_830889_43B518A4 
X-CRM114-Status: GOOD (  25.39  )
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

On 3/9/2021 7:14 PM, Alan Stern wrote:
> On Tue, Mar 09, 2021 at 07:04:34PM -0800, Asutosh Das (asd) wrote:
>> Hello
>> I & Can (thanks CanG) debugged this further:
>>
>> Looks like this issue can occur if the sd probe is asynchronous.
>>
>> Essentially, the sd_probe() is done asynchronously and driver_probe_device()
>> invokes pm_runtime_get_suppliers() before invoking sd_probe().
>>
>> But scsi_probe_and_add_lun() runs in a separate context.
>> So the scsi_autopm_put_device() invoked from scsi_scan_host() context
>> reduces the link->rpm_active to 1. And sd_probe() invokes
>> scsi_autopm_put_device() and starts a timer. And then driver_probe_device()
>> invoked from __device_attach_async_helper context reduces the
>> link->rpm_active to 1 thus enabling the supplier to suspend before the
>> consumer suspends.
> 
>> I don't see a way around this. Please let me know if you
>> (@Alan/@Bart/@Adrian) have any thoughts on this.
> 
> How about changing the SCSI core so that it does a runtime_get before
> starting an async probe, and the async probe routine does a
> runtime_put when it is finished?  In other words, don't allow a device
> to go into runtime suspend while it is waiting to be probed.
> 
> I don't think that would be too intrusive.
> 
> Alan Stern
> 

Hi Alan
Thanks for the suggestion.

Am trying to understand:

Do you mean something like this:

int scsi_sysfs_add_sdev(struct scsi_device *sdev)
{
	
	scsi_autopm_get_device(sdev);
	pm_runtime_get_noresume(&sdev->sdev_gendev);
	[...]
	scsi_autopm_put_device(sdev);
	[...]
}

static int sd_probe(struct device *dev)
{
	[...]
	pm_runtime_put_noidle(dev);
	scsi_autopm_put_device(sdp);
	[...]
}

This may work (I'm limited by my imagination in scsi layer :) ).

But the pm_runtime_put_noidle() would have to be added to all registered 
scsi_driver{}, perhaps? Or may be I can check for sdp->type?

-asd

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
