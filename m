Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D065BC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 16:40:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B1BB64FC1
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 16:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B1BB64FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zz/SoX1gND9/gGvBsA6q1Tx1FgSXSMIHhp3zW+v+yME=; b=n/8nl3ofMs4nd1JYdgugp9/2P
	TMoAzOzAYC4qWTxOdtDt4NQseh9rkrAjO/gCX+BUASLM+yFb/v1u+FGJQSf0RcaOLvbE0FSmR0Huq
	cGRDqunBGvDkaqtoGJA8yFiX9+TkXSwC0ZlCbyAEi115UaVDnIyNXucq9fhH5wm21mJ9cTNrTigJW
	gZDgggsckTPyGtkMyI5lrlB4m04ualSsn1Cih7RD+syIiyF8mekVjOt1C0mWzmLle3ytHcHmR7v5B
	rBc7InAKC//Sa7Zj5uSjf5h9tJg6Gw0suFUwEPGXeOeLguYcWd9TCdux37mFjNi8V1VhBQHocyDX5
	KHsxGu0+w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK1sf-007Fuz-Kp; Wed, 10 Mar 2021 16:40:17 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK1sb-007FuQ-GE
 for linux-mediatek@lists.infradead.org; Wed, 10 Mar 2021 16:40:15 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615394412; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=A3hXmK2V9BzYBLeUgSG9YZi0trl61aWRPGcB/gnH5c4=;
 b=m0aAyf4vNXUCB7B6pNdpO1ls24Is55oPlWJEwfbSeLNRB1y6+7Eijoim0ilZMGS2kw3PNmIp
 RFt5sNta2Q2RQoDvgwK3z0EKsljLmOKt3TU2GibnsnMPPs9o/7j/ShKvwh4nwKztfPbYEjbi
 CDwaVyJ6A8jE7Uft/9eHOMWzQIk=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6048f65b6e1c22bc8d6cb1f8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 16:39:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 79EC4C43467; Wed, 10 Mar 2021 16:39:55 +0000 (UTC)
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 10C6EC433C6;
 Wed, 10 Mar 2021 16:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 10C6EC433C6
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
References: <0576d6eae15486740c25767e2d8805f7e94eb79d.1614725302.git.asutoshd@codeaurora.org>
 <85086647-7292-b0a2-d842-290818bd2858@intel.com>
 <6e98724d-2e75-d1fe-188f-a7010f86c509@codeaurora.org>
 <20210306161616.GC74411@rowland.harvard.edu>
 <CAJZ5v0ihJe8rNjWRwNic_BQUvKbALNcjx8iiPAh5nxLhOV9duw@mail.gmail.com>
 <CAJZ5v0iJ4yqRTt=mTCC930HULNFNTgvO4f9ToVO6pNz53kxFkw@mail.gmail.com>
 <f1e9b21d-1722-d20b-4bae-df7e6ce50bbc@codeaurora.org>
 <2bd90336-18a9-9acd-5abb-5b52b27fc535@codeaurora.org>
 <20210310031438.GB203516@rowland.harvard.edu>
 <6b985880-f23a-adb3-8b7a-7ee1b56e6fa7@codeaurora.org>
 <20210310162730.GB221857@rowland.harvard.edu>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <a89ad647-6c0c-b45e-cff3-a205bed034cf@codeaurora.org>
Date: Wed, 10 Mar 2021 08:39:51 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210310162730.GB221857@rowland.harvard.edu>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_164013_695150_8C39A2BD 
X-CRM114-Status: GOOD (  40.13  )
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

On 3/10/2021 8:27 AM, Alan Stern wrote:
> On Tue, Mar 09, 2021 at 08:04:53PM -0800, Asutosh Das (asd) wrote:
>> On 3/9/2021 7:14 PM, Alan Stern wrote:
>>> On Tue, Mar 09, 2021 at 07:04:34PM -0800, Asutosh Das (asd) wrote:
>>>> Hello
>>>> I & Can (thanks CanG) debugged this further:
>>>>
>>>> Looks like this issue can occur if the sd probe is asynchronous.
>>>>
>>>> Essentially, the sd_probe() is done asynchronously and driver_probe_device()
>>>> invokes pm_runtime_get_suppliers() before invoking sd_probe().
>>>>
>>>> But scsi_probe_and_add_lun() runs in a separate context.
>>>> So the scsi_autopm_put_device() invoked from scsi_scan_host() context
>>>> reduces the link->rpm_active to 1. And sd_probe() invokes
>>>> scsi_autopm_put_device() and starts a timer. And then driver_probe_device()
>>>> invoked from __device_attach_async_helper context reduces the
>>>> link->rpm_active to 1 thus enabling the supplier to suspend before the
>>>> consumer suspends.
>>>
>>>> I don't see a way around this. Please let me know if you
>>>> (@Alan/@Bart/@Adrian) have any thoughts on this.
>>>
>>> How about changing the SCSI core so that it does a runtime_get before
>>> starting an async probe, and the async probe routine does a
>>> runtime_put when it is finished?  In other words, don't allow a device
>>> to go into runtime suspend while it is waiting to be probed.
>>>
>>> I don't think that would be too intrusive.
>>>
>>> Alan Stern
>>>
>>
>> Hi Alan
>> Thanks for the suggestion.
>>
>> Am trying to understand:
>>
>> Do you mean something like this:
>>
>> int scsi_sysfs_add_sdev(struct scsi_device *sdev)
>> {
>> 	
>> 	scsi_autopm_get_device(sdev);
>> 	pm_runtime_get_noresume(&sdev->sdev_gendev);
>> 	[...]
>> 	scsi_autopm_put_device(sdev);
>> 	[...]
>> }
>>
>> static int sd_probe(struct device *dev)
>> {
>> 	[...]
>> 	pm_runtime_put_noidle(dev);
>> 	scsi_autopm_put_device(sdp);
>> 	[...]
>> }
>>
>> This may work (I'm limited by my imagination in scsi layer :) ).
> 
> I'm not sure about this.  To be honest, I did not read the entirety of
> your last message; it had way too much detail.  THere's a time and place
> for that, but when you're brainstorming to figure out the underlying
> cause of a problem and come up with a strategy to fix it, you want to
> concentrate on the overall picture, not the details.
> 
> As I understand the situation, you've get a SCSI target with multiple
> logical units, let's say A and B, and you need to make sure that A never
> goes into runtime suspend unless B is already suspended.  In other
> words, B always has to suspend before A and resume after A.
> 
> To do this, you register a device link with A as the supplier and B as
> the consumer.  Then the PM core takes care of the ordering for you.
> 
> But I don't understand when you set up the device link.  If the timing
> is wrong then, thanks to async SCSI probing, you may have a situation
> where A is registered before B and before the link is set up.  Then
> there's temporarily nothing to stop A from suspending before B.
> 
> You also need to prevent each device from suspending before it is
> probed.  That's the easy part I was trying to address before (although
> it may not be so easy if the drivers are in loadable modules and not
> present in the kernel).
> 
> You need to think through these issues before proposing actual changes.
> 
>> But the pm_runtime_put_noidle() would have to be added to all registered
>> scsi_driver{}, perhaps? Or may be I can check for sdp->type?
> 
> Like this; it's too early to worry about this sort of thing.
> 
> Alan Stern
> 
Hi Alan
Thanks. Understood.

I will check the details and see if I can come up with something.
I'll propose an alternate fix otherwise and drop this change altogether.

Thanks!
-asd

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
