Return-Path: <SRS0=uKpE=IH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B303C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Mar 2021 15:56:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C176E65242
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Mar 2021 15:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C176E65242
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MxVEW2zPPPu7j6XeHapyMb7yyF4zJOKvBkPf43cykqw=; b=he2Y/RxWBj2Yxw5pZmyAnFsRG
	Lb+4bZ5MEH+fgakDSSjhdEt7qqh722hALPWP4/N71qcyPvrAQZplzlR9YgrkIXPD+IYQCckA9y01u
	ChJidgILQ0b8Mf8vyarognXgpGsTii/ipL7X9KzAY/rqO6rrA6tbJwgp8URZkVDXn9/qWraTCDORU
	lXsaiL5RScy+KhtHrGKNb8gJC4ZjbjPs994z3+txkzqg6m96Jp5aNc8Luo/SSXj76EGHqHNKhePfp
	MSpL6hwT8jvNszVUkuYSN0i0IrKBZ9eaLDKjX4dukFYP/6BP5o+fPzZaNdMhTJyfZi9fjxH8ctZVF
	S1AtnJlcw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJeix-0050rq-P9; Tue, 09 Mar 2021 15:56:43 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJeir-0050UV-GO
 for linux-mediatek@lists.infradead.org; Tue, 09 Mar 2021 15:56:40 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615305396; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=/m2KFCZftUzumg8DPFWYqFDdMycSz9cl+cIGSvANNXM=;
 b=CPG53illYMbFBEh7Noh/gucnpGwmGeD01MidA0QIQ8V+2OE5v93LzPdHrY1d76gh/WcbaHxZ
 NntnT2rmajRH3BUUMNLM73mZdZ+i8q6lcQIbaqyAqEtjJPN8IpTJj8jlr7ETVKPzqVDCNGTi
 QAvm9VP6hCBTTCOYbPOvs0gMNXE=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60479ab3f14e98d35d346a3b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Mar 2021 15:56:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C794BC43468; Tue,  9 Mar 2021 15:56:34 +0000 (UTC)
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D314C433CA;
 Tue,  9 Mar 2021 15:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0D314C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v10 1/2] scsi: ufs: Enable power management for wlun
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Adrian Hunter <adrian.hunter@intel.com>, cang@codeaurora.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 Bart Van Assche <bvanassche@acm.org>,
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
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <f1e9b21d-1722-d20b-4bae-df7e6ce50bbc@codeaurora.org>
Date: Tue, 9 Mar 2021 07:56:30 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0iJ4yqRTt=mTCC930HULNFNTgvO4f9ToVO6pNz53kxFkw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_155637_847363_3E1425A5 
X-CRM114-Status: GOOD (  21.35  )
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

On 3/8/2021 9:17 AM, Rafael J. Wysocki wrote:
> On Mon, Mar 8, 2021 at 5:21 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>>
>> On Sat, Mar 6, 2021 at 5:17 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>>>
>>> On Fri, Mar 05, 2021 at 06:54:24PM -0800, Asutosh Das (asd) wrote:
>>>
>>>> Now during my testing I see a weird issue sometimes (1 in 7).
>>>> Scenario - bootups
>>>>
>>>> Issue:
>>>> The supplier 'ufs_device_wlun 0:0:0:49488' goes into runtime suspend even
>>>> when one/more of its consumers are in RPM_ACTIVE state.
>>>>
>>>> *Log:
>>>> [   10.056379][  T206] sd 0:0:0:1: [sdb] Synchronizing SCSI cache
>>>> [   10.062497][  T113] sd 0:0:0:5: [sdf] Synchronizing SCSI cache
>>>> [   10.356600][   T32] sd 0:0:0:7: [sdh] Synchronizing SCSI cache
>>>> [   10.362944][  T174] sd 0:0:0:3: [sdd] Synchronizing SCSI cache
>>>> [   10.696627][   T83] sd 0:0:0:2: [sdc] Synchronizing SCSI cache
>>>> [   10.704562][  T170] sd 0:0:0:6: [sdg] Synchronizing SCSI cache
>>>> [   10.980602][    T5] sd 0:0:0:0: [sda] Synchronizing SCSI cache
>>>>
>>>> /** Printing all the consumer nodes of supplier **/
>>>> [   10.987327][    T5] ufs_device_wlun 0:0:0:49488: usage-count @ suspend: 0
>>>> <-- this is the usage_count
>>>> [   10.994440][    T5] ufs_rpmb_wlun 0:0:0:49476: PM state - 2
>>>> [   11.000402][    T5] scsi 0:0:0:49456: PM state - 2
>>>> [   11.005453][    T5] sd 0:0:0:0: PM state - 2
>>>> [   11.009958][    T5] sd 0:0:0:1: PM state - 2
>>>> [   11.014469][    T5] sd 0:0:0:2: PM state - 2
>>>> [   11.019072][    T5] sd 0:0:0:3: PM state - 2
>>>> [   11.023595][    T5] sd 0:0:0:4: PM state - 0 << RPM_ACTIVE
>>>> [   11.353298][    T5] sd 0:0:0:5: PM state - 2
>>>> [   11.357726][    T5] sd 0:0:0:6: PM state - 2
>>>> [   11.362155][    T5] sd 0:0:0:7: PM state - 2
>>>> [   11.366584][    T5] ufshcd-qcom 1d84000.ufshc: __ufshcd_wl_suspend - 8709
>>>> [   11.374366][    T5] ufs_device_wlun 0:0:0:49488: __ufshcd_wl_suspend -
>>>> (0) has rpm_active flags
>>
>> Do you mean that rpm_active of the link between the consumer and the
>> supplier is greater than 0 at this point and the consumer is
> 
> I mean is rpm_active of the link greater than 1 (because 1 means "no
> active references to the supplier")?
Hi Rafael:
No - it is not greater than 1.

I'm trying to understand what's going on in it; will update when I've 
something.

> 
>> RPM_ACTIVE, but the supplier suspends successfully nevertheless?
>>
>>>> [   11.383376][    T5] ufs_device_wlun 0:0:0:49488:
>>>> ufshcd_wl_runtime_suspend <-- Supplier suspends fine.
>>>> [   12.977318][  T174] sd 0:0:0:4: [sde] Synchronizing SCSI cache
>>>>
>>>> And the the suspend of sde is stuck now:
>>>> schedule+0x9c/0xe0
>>>> schedule_timeout+0x40/0x128
>>>> io_schedule_timeout+0x44/0x68
>>>> wait_for_common_io+0x7c/0x100
>>>> wait_for_completion_io+0x14/0x20
>>>> blk_execute_rq+0x90/0xcc
>>>> __scsi_execute+0x104/0x1c4
>>>> sd_sync_cache+0xf8/0x2a0
>>>> sd_suspend_common+0x74/0x11c
>>>> sd_suspend_runtime+0x14/0x20
>>>> scsi_runtime_suspend+0x64/0x94
>>>> __rpm_callback+0x80/0x2a4
>>>> rpm_suspend+0x308/0x614
>>>> pm_runtime_work+0x98/0xa8
>>>>
>>>> I added 'DL_FLAG_RPM_ACTIVE' while creating links.
>>>>        if (hba->sdev_ufs_device) {
>>>>                link = device_link_add(&sdev->sdev_gendev,
>>>>                                    &hba->sdev_ufs_device->sdev_gendev,
>>>>                                   DL_FLAG_PM_RUNTIME|DL_FLAG_RPM_ACTIVE);
>>>> I didn't expect this to resolve the issue anyway and it didn't.
>>>>
>>>> Another interesting point here is when I resume any of the above suspended
>>>> consumers, it all goes back to normal, which is kind of expected. I tried
>>>> resuming the consumer and the supplier is resumed and the supplier is
>>>> suspended when all the consumers are suspended.
>>>>
>>>> Any pointers on this issue please?
>>>>
>>>> @Bart/@Alan - Do you've any pointers please?
>>>
>>> It's very noticeable that although you seem to have isolated a bug in
>>> the power management subsystem (supplier goes into runtime suspend
>>> even when one of its consumers is still active), you did not CC the
>>> power management maintainer or mailing list.
>>>
>>> I have added the appropriate CC's.
>>
>> Thanks Alan!


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
