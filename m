Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB23CE79A4
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 22:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zI6A978+krEB7OSTo/vpzaBj1JGx02MNClgbePebqCI=; b=GBAJ1TEXMbyUa+2GCivnW6wlnT
	hTN+2urGvt0BprH8xYFkiktUdmBdPSIEqiSkqgmRzzqzI7HX+pGXe28QLAX4HAHzQITszq8FJbJov
	czKyRN6O4U0sT4BqT/KaQBmLbDHVgb2sFKZC9VIqWdXw4X59OqqFCjikVuGpVK3lV27Xrc+c38BS1
	qX69qIvSKwwme++zNMH3UNMHDVWOZ3WKWYD073xUPZy25WCHVbjOInJxDLDSyLMdMf904uf4cXwHa
	fiQRZYNgKgE2xokfv54OX4cYPXdMQUEm9xRGc3l8ERwjTFHyApkXYgAfrtUIqtqj4h+0rbtsC3/M1
	LEog4dTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qktjp-00F7C4-2W;
	Mon, 25 Sep 2023 22:07:33 +0000
Received: from mail-pf1-f180.google.com ([209.85.210.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qktjn-00F7BH-0V
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 22:07:32 +0000
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-690bf8fdd1aso5754591b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 15:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695679649; x=1696284449;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zI6A978+krEB7OSTo/vpzaBj1JGx02MNClgbePebqCI=;
        b=JpIGa9O+ehewRu/CRp2PTKmxaeM4kPza3qDz2IWsK9Nj0Yms+orjYvilljJ/dfBPi4
         JswAJ51+k8wYjAX9GlUta4sleDZfo9T3mkRO49t+w1gVjIs3olc0PFIeZ4bhBFy9rVCU
         rH8EHAFjSlVUkvlaLB4NMXXA682t2gxmP7E58PSZ7MIr+7Hv/ZGFdnV8H0H0K8Gd4v6M
         j/q9BBgPiRMWJp5rs6fqF5gcTU2HGY6ASkDQ5lfwiv6zn+0QPQDEboKJ5qiYqhV9wwDY
         DoAKFaBvMsrxT1I2kwbDM6OLrcBWXH7DDI9RRi8JLz3RVnTyKp5lbM0r7tP/RNYd7myk
         u8ig==
X-Gm-Message-State: AOJu0YwTrHMAjCqEMDOvwpd0NVQjarP821Gds2pg6qkOPozoZZPxknC/
	CXrT5jCICRNPGPFAWEMHUZE=
X-Google-Smtp-Source: AGHT+IEqkx2aVqSbKbfjjkYftbXfgsI+5/ngzI52WM5rFeJSq10jIItCoWOnaiFJQKlEIpeJcwjarA==
X-Received: by 2002:a05:6a00:850:b0:68e:2b17:a729 with SMTP id q16-20020a056a00085000b0068e2b17a729mr7481928pfk.24.1695679649004;
        Mon, 25 Sep 2023 15:07:29 -0700 (PDT)
Received: from ?IPV6:2601:647:4d7e:54f3:667:4981:ffa1:7be1? ([2601:647:4d7e:54f3:667:4981:ffa1:7be1])
        by smtp.gmail.com with ESMTPSA id i187-20020a639dc4000000b0050f85ef50d1sm8297686pgd.26.2023.09.25.15.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 15:07:28 -0700 (PDT)
Message-ID: <98f256e3-72f7-48cf-8d25-58781d7051fa@acm.org>
Date: Mon, 25 Sep 2023 15:07:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] ufs: core: wlun send SSU timeout recovery
Content-Language: en-US
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 =?UTF-8?B?U3RhbmxleSBDaHUgKOacseWOn+mZnik=?= <stanley.chu@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?SmlhamllIEhhbyAo6YOd5Yqg6IqCKQ==?= <jiajie.hao@mediatek.com>,
 =?UTF-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 =?UTF-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, =?UTF-8?B?TGluIEd1aSAo5qGC5p6X?=
 =?UTF-8?Q?=29?= <Lin.Gui@mediatek.com>,
 =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 =?UTF-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?= <Tun-yu.Yu@mediatek.com>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, =?UTF-8?B?UG93ZW4gS2FvICjpq5jkvK/mlocp?=
 <Powen.Kao@mediatek.com>, =?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
 <Naomi.Chu@mediatek.com>, =?UTF-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?=
 <Qilin.Tan@mediatek.com>
References: <20230922090925.16339-1-peter.wang@mediatek.com>
 <10bf17cf-8a92-469b-bc5c-1f0dba0ed5ed@acm.org>
 <39e0a8b6d6f235dfa7dd36a4436c9eac5ab5210e.camel@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <39e0a8b6d6f235dfa7dd36a4436c9eac5ab5210e.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_150731_218382_11B7CED4 
X-CRM114-Status: GOOD (  25.57  )
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

On 9/25/23 01:51, Peter Wang (王信友) wrote:
> On Fri, 2023-09-22 at 09:06 -0700, Bart Van Assche wrote:
>> On 9/22/23 02:09, peter.wang@mediatek.com wrote:
>> > When runtime pm send SSU times out, the SCSI core invokes
>> > eh_host_reset_handler, which hooks function ufshcd_eh_host_reset_handler
>> > schedule eh_work and stuck at wait flush_work(&hba->eh_work).
>> > However, ufshcd_err_handler hangs in wait rpm resume.
>> > Do link recovery only in this case.
>> > Below is IO hang stack dump in kernel-6.1
>>
>> What does kernel-6.1 mean? Has commit 7029e2151a7c ("scsi: ufs: Fix a
>> deadlock between PM and the SCSI error handler") been backported to
>> that kernel?
> 
> Yes, our kernel-6.1 have backport 7029e2151a7c ("scsi: ufs: Fix a
> deadlock between PM and the SCSI error handler")

Hi Peter,

Thanks for having confirmed this.

Please use text mode instead of HTML mode when replying. As one can see
here, your reply did not make it to the linux-scsi mailing list:
https://lore.kernel.org/linux-scsi/20230922090925.16339-1-peter.wang@mediatek.com/

> And this IO hang issue still happen.
> 
> This issue is easy trigger if we drop the SSU response to let SSU timeout.
> 
> 
> 
>>
>> > diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>> > index c2df07545f96..7608d75bb4fe 100644
>> > --- a/drivers/ufs/core/ufshcd.c
>> > +++ b/drivers/ufs/core/ufshcd.c
>> > @@ -7713,9 +7713,29 @@ static int ufshcd_eh_host_reset_handler(struct scsi_cmnd *cmd)
>> >   int err = SUCCESS;
>> >   unsigned long flags;
>> >   struct ufs_hba *hba;
>> > +struct device *dev;
>> >   
>> >   hba = shost_priv(cmd->device->host);
>> >   
>> > +/*
>> > + * If runtime pm send SSU and got timeout, scsi_error_handler
>> > + * stuck at this function to wait flush_work(&hba->eh_work).
>> > + * And ufshcd_err_handler(eh_work) stuck at wait runtime pm active.
>> > + * Do ufshcd_link_recovery instead shedule eh_work can prevent
>> > + * dead lock happen.
>> > + */
>> > +dev = &hba->ufs_device_wlun->sdev_gendev;
>> > +if ((dev->power.runtime_status == RPM_RESUMING) ||
>> > +(dev->power.runtime_status == RPM_SUSPENDING)) {
>> > +err = ufshcd_link_recovery(hba);
>> > +if (err) {
>> > +dev_err(hba->dev, "WL Device PM: status:%d, err:%d\n",
>> > +dev->power.runtime_status,
>> > +dev->power.runtime_error);
>> > +}
>> > +return err;
>> > +}
>> > +
>> >   spin_lock_irqsave(hba->host->host_lock, flags);
>> >   hba->force_reset = true;
>> >   ufshcd_schedule_eh_work(hba);
>>
>> I think this change is racy because the runtime power management status
>> may change after the above checks have been performed and before
>> ufshcd_err_handling_prepare() is called.
> 
> If this function invoke and RPM state is in the RPM_RESUMING or RPM_SUSPENDING state,
> it means error happen in ufs driver resume/suspend callback function and no chance
> move to next state if callback function is not finished, just like backtrace stuck in send SSU cmd.
> Or we can make it simple by check pm_op_in_progress, what do you think?

I'm concerned that this approach will fix some cases but not all cases. The
UFS error handler (ufshcd_err_handler()) and runtime suspend or resume code
may be called concurrently. No matter which checks are added at the start of
ufshcd_eh_host_reset_handler(), I think these checks won't protect against
concurrent execution of runtime power management code just after these checks
have finished.

> Since the hang db backtrace is not involde below function, it is not help.

I think that conclusion is wrong. Can you please test the patch that I provided?

Thanks,

Bart.

