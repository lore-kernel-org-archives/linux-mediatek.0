Return-Path: <SRS0=jsh4=BY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6E6C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 02:52:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D05872078B
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 02:52:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TQzxwphw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D05872078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QcRSHRdECU2YNkJdNLsrTyHcRBogXeCyFtkU4RSeAfI=; b=TQzxwphwXARwqGCP73sKrEsxu
	IbJzkP6n8R2YwGLMiGELrHPmYCRsDBkdOTV2x8/gaB/Iwh5WAz0lR4o5GMeQKxvPHMphslCQVrlgm
	c7Ekob2Be/1mr2mqyd1DHRpLr7OSi5ti1alc2L9MrhEXXm0uRkH/xgXJbihVszfTlwMe8VYZ64mK/
	LJJWpAWb+ZMathHIQpMCIOjLT99Zi0Eq01MApQhHQOyrdkOdq6/pa1CpD8iLZlC+/2Lh0TCMAo4RU
	h53Tt/aDuq2ap3/+5C/Qc/V8K8H9nCilKlM5sh6L7A2KHyCcfuEGycd63FqW54ZAF7q7Im6HoV4HO
	ER5gerovw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6Ppb-0005Z1-3p; Fri, 14 Aug 2020 02:52:35 +0000
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6PpU-0005WU-9V; Fri, 14 Aug 2020 02:52:29 +0000
Received: by mail-pg1-f193.google.com with SMTP id m34so3820116pgl.11;
 Thu, 13 Aug 2020 19:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GLLgq3atnPSXi/im1cF44k0QoKLgpkLLSUPTSmQdJ4c=;
 b=akFKgFMiOOg4ybo1TfuzjJ4t8TyZmeoWXv6yHVSPoFj3QMgqeXwCig6Ot0jbaLdptH
 Xg5EKP/HwhCOz+NDVH2xMkiDdl/Yh0FPwGhbsDD8DKiVaE8vmYuQuYTlsWGzBP8OfsAV
 3DY7yBfoANBGgxWpZtshRY67NtUzX6y5aE69BzF0QUSIPm1hrM0aeKe7Wj+Q2c/aw2UJ
 jXzERA76DcQdMHXZIAU2qxLfykh1t7bF0o+XOmworc+swRw8t01KIqGZx1seIY7HQbId
 ogdombdlqVaJ4OjUWleCn373radTKYKtS/2Bq/lpnbQtDB4/BRgFeBx3TQy/HLOtTzQX
 aDZA==
X-Gm-Message-State: AOAM533SnO11bzqS0YIqltUhiP8IiE0RGlSUP+uHQjIsi31d/WrKVYcb
 o9O+y3l9B52CFNHtSeCpdcIkDs0CPhk=
X-Google-Smtp-Source: ABdhPJyt3LOZ8ZUi6nhoA86/62mZK/ncV7w8jvUcLWwIYItDeLk7VhagMjJVWYW68xmEwtowsx0wvQ==
X-Received: by 2002:aa7:9636:: with SMTP id r22mr291747pfg.304.1597373545097; 
 Thu, 13 Aug 2020 19:52:25 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net.
 [73.241.217.19])
 by smtp.gmail.com with ESMTPSA id y19sm7152325pfn.77.2020.08.13.19.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2020 19:52:24 -0700 (PDT)
Subject: Re: [PATCH v7] scsi: ufs: Quiesce all scsi devices before shutdown
To: Stanley Chu <stanley.chu@mediatek.com>
References: <20200803100448.2738-1-stanley.chu@mediatek.com>
 <f40ad9e1-2e45-f21c-d067-eff579982cc7@acm.org>
 <1597308950.26065.25.camel@mtkswgap22>
From: Bart Van Assche <bvanassche@acm.org>
Autocrypt: addr=bvanassche@acm.org; prefer-encrypt=mutual; keydata=
 mQENBFSOu4oBCADcRWxVUvkkvRmmwTwIjIJvZOu6wNm+dz5AF4z0FHW2KNZL3oheO3P8UZWr
 LQOrCfRcK8e/sIs2Y2D3Lg/SL7qqbMehGEYcJptu6mKkywBfoYbtBkVoJ/jQsi2H0vBiiCOy
 fmxMHIPcYxaJdXxrOG2UO4B60Y/BzE6OrPDT44w4cZA9DH5xialliWU447Bts8TJNa3lZKS1
 AvW1ZklbvJfAJJAwzDih35LxU2fcWbmhPa7EO2DCv/LM1B10GBB/oQB5kvlq4aA2PSIWkqz4
 3SI5kCPSsygD6wKnbRsvNn2mIACva6VHdm62A7xel5dJRfpQjXj2snd1F/YNoNc66UUTABEB
 AAG0JEJhcnQgVmFuIEFzc2NoZSA8YnZhbmFzc2NoZUBhY20ub3JnPokBOQQTAQIAIwUCVI67
 igIbAwcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFcPTXFzhAJ8QkH/1AdXblKL65M
 Y1Zk1bYKnkAb4a98LxCPm/pJBilvci6boefwlBDZ2NZuuYWYgyrehMB5H+q+Kq4P0IBbTqTa
 jTPAANn62A6jwJ0FnCn6YaM9TZQjM1F7LoDX3v+oAkaoXuq0dQ4hnxQNu792bi6QyVdZUvKc
 macVFVgfK9n04mL7RzjO3f+X4midKt/s+G+IPr4DGlrq+WH27eDbpUR3aYRk8EgbgGKvQFdD
 CEBFJi+5ZKOArmJVBSk21RHDpqyz6Vit3rjep7c1SN8s7NhVi9cjkKmMDM7KYhXkWc10lKx2
 RTkFI30rkDm4U+JpdAd2+tP3tjGf9AyGGinpzE2XY1K5AQ0EVI67igEIAKiSyd0nECrgz+H5
 PcFDGYQpGDMTl8MOPCKw/F3diXPuj2eql4xSbAdbUCJzk2ETif5s3twT2ER8cUTEVOaCEUY3
 eOiaFgQ+nGLx4BXqqGewikPJCe+UBjFnH1m2/IFn4T9jPZkV8xlkKmDUqMK5EV9n3eQLkn5g
 lco+FepTtmbkSCCjd91EfThVbNYpVQ5ZjdBCXN66CKyJDMJ85HVr5rmXG/nqriTh6cv1l1Js
 T7AFvvPjUPknS6d+BETMhTkbGzoyS+sywEsQAgA+BMCxBH4LvUmHYhpS+W6CiZ3ZMxjO8Hgc
 ++w1mLeRUvda3i4/U8wDT3SWuHcB3DWlcppECLkAEQEAAYkBHwQYAQIACQUCVI67igIbDAAK
 CRBxXD01xc4QCZ4dB/0QrnEasxjM0PGeXK5hcZMT9Eo998alUfn5XU0RQDYdwp6/kMEXMdmT
 oH0F0xB3SQ8WVSXA9rrc4EBvZruWQ+5/zjVrhhfUAx12CzL4oQ9Ro2k45daYaonKTANYG22y
 //x8dLe2Fv1By4SKGhmzwH87uXxbTJAUxiWIi1np0z3/RDnoVyfmfbbL1DY7zf2hYXLLzsJR
 mSsED/1nlJ9Oq5fALdNEPgDyPUerqHxcmIub+pF0AzJoYHK5punqpqfGmqPbjxrJLPJfHVKy
 goMj5DlBMoYqEgpbwdUYkH6QdizJJCur4icy8GUNbisFYABeoJ91pnD4IGei3MTdvINSZI5e
Message-ID: <68eb8e35-9619-ec78-3583-f4501ef200f8@acm.org>
Date: Thu, 13 Aug 2020 19:52:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1597308950.26065.25.camel@mtkswgap22>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_225228_396738_1F8B9A6A 
X-CRM114-Status: GOOD (  21.06  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?B?SmlhamllIEhhbyAo6YOd5Yqg6IqCKQ==?= <jiajie.hao@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 =?UTF-8?B?QW5keSBUZW5nICjphKflpoLlro8p?= <Andy.Teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?= <Chaotian.Jing@mediatek.com>,
 =?UTF-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "beanhuo@micron.com" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-08-13 01:55, Stanley Chu wrote:
> I tried many ways to come out the final solution. Currently two options
> are considered,
> 
> == Option 1 ==
> 	pm_runtime_get_sync(hba->dev);
> 
> 	shost_for_each_device(sdev, hba->host) {
> 		scsi_autopm_get_device(sdev);
> 		if (sdev == hba->sdev_ufs_device)
> 			scsi_device_quiesce(sdev);
> 		else
> 			scsi_remove_device(sdev);
> 	}
> 
> 	ret = ufshcd_suspend(hba, UFS_SHUTDOWN_PM);
> 
> 	scsi_remove_device(hba->sdev_ufs_device);
> 
> Note. Using scsi_autopm_get_device() instead of pm_runtime_disable()
> is to prevent noisy message by below checking,
> 
> 	WARN_ON_ONCE(sdev->quiesced_by && sdev->quiesced_by != current);
> 
> in
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/scsi/scsi_lib.c#n2515
> 
> This warning shows up if we try to quiesce a runtime-suspended SCSI
> device. This is possible during our new shutdown flow. Using
> scsi_autopm_get_device() to resume all SCSI devices first can prevent
> it.
> 
> In addition, normally sd_shutdown() would be executed prior than
> ufshcd_shutdown(). If scsi_remove_device() is invoked by
> ufshcd_shutdown(), sd_shutdown() will be executed again for a SCSI disk
> by
> 
> [  131.398977]  sd_shutdown+0x44/0x118
> [  131.399416]  sd_remove+0x5c/0xc4
> [  131.399824]  device_release_driver_internal+0x1c4/0x2e4
> [  131.400481]  device_release_driver+0x18/0x24
> [  131.401018]  bus_remove_device+0x108/0x134
> [  131.401533]  device_del+0x2dc/0x630
> [  131.401973]  __scsi_remove_device+0xc0/0x174
> [  131.402510]  scsi_remove_device+0x30/0x48
> [  131.403014]  ufshcd_shutdown+0xc8/0x138
> 
> In this case, we could see SYNCHRONIZE_CACHE command will be sent to the
> same SCSI device twice. This is kind of wired during shutdown flow.
> 
> Moreover, in consideration of performance of ufshcd_shutdown(), Option 1
> obviously degrades the latency a lot by scsi_remove_device(). Please see
> the "Performance Measurement" data below.
> 
> Compared Option 2, this way is simpler and also effective. This way may
> be a better compromise.
> 
> == Option 2  ==
> 	pm_runtime_get_sync(hba->dev);
> 
> 	shost_for_each_device(sdev, hba->host) {
> 		scsi_autopm_get_device(sdev);
> 		scsi_device_quiesce(sdev);
> 	}
> 
> == Performance Measurement ==
> As-Is: < 5 ms
> Option 1: 850 ms
> Option 2: 60 ms
> 
> What would you prefer? Or would you have any further suggestions?

Hi Stanley,

Thanks for the detailed report and also for having shared timing information.

The approach of option 2 seems wrong to me because the SCSI devices are not
removed. My concern is that option (2) could cause the sd driver to send SYNC
and/or STOP commands to the device after its PCIe resources have been freed,
resulting in a crash.

Please take a look at the output of the following command:

$ git grep -nHA10 'struct pci_driver.* = {$' */scsi |
  sed -e 's/-/:/' -e 's/-/:/' |
  grep ':[[:blank:]]*\.remove'

It seems to me that other SCSI LLDs do at least the following in their PCIe
removal callback:

1. Call scsi_remove_host()
2. Call scsi_host_put()
3. Call pci_disable_device()

Would that approach work for UFS? Would offlining the UFS LUNs (SDEV_OFFLINE)
before calling the above functions make SCSI host removal faster? See also
scsi_prep_state_check().

Thanks,

Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
