Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A38CD4841
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 16:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sc770OlaE49GZgWY9dRnFqPa0lUiVYKCPXxKFeWKJIU=; b=o0O3X8Ol3v7fODWdaWY4I0ttkh
	doBMvPMuAeTO3bTIhuiwvXTQSn0NviHdqlVijhfCE2m9L72yMPhQUNoIiHIDaBm8zuWetrAItPVkG
	JW5xoZJAp/0QZQuU1+bmlJ8D/E5cyXzl8CMHOH7KcHj69lR4IwoyUKfPyp6m60VgyEhsRsn/DI2h1
	FiKnz0p+1PSvzXDjMMeqdNSQhvSthofZ9DVaRXh1McXteC2lCZmVJKyLaLHl1XPvLcv+tY4UpSiF2
	8KQTNOMTNBl7blvQHQNGQPH3n2izScm1EkdBXzi3lY/YsH2FfEyQWP6ED2rMy7kjPHae4uwxpryNY
	ZQS9Dgmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjifY-009NTe-2k;
	Fri, 22 Sep 2023 16:06:16 +0000
Received: from mail-pl1-f179.google.com ([209.85.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjifV-009NSp-2d
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Sep 2023 16:06:15 +0000
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c44a25bd0bso27265625ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 22 Sep 2023 09:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695398768; x=1696003568;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sc770OlaE49GZgWY9dRnFqPa0lUiVYKCPXxKFeWKJIU=;
        b=UwOEjI/vA2YRMj4jQ5fDUlP81582P41O2Oeoem3cVa5DzcXzNLpaLlLJIrQMpH0RUv
         M9zYRISSQorPq7HjyeAaizTJlHph00U4SrAJEBO2UCof5g8KtczqRvmzEmyrxDLB5dcr
         kQzUT01+oZqUB1TGH10T1I6OLOpWU6Mm3QT3SPIDVVRwv1OnlW2KBWBJ3w7tVsL/XSjD
         xEV1nHeP3u6heexxrfSPwXHTQLIrJTbpGzQH/C1pNjN3I9IYdy2d1BHPt2PR7yPaetNk
         cV7L4GoNBSsnlh2ikPKkZFWeGJcT/efQd+bQjtEg7v2NXdXg8P5gcWcTZjRFOPPtris0
         +/sA==
X-Gm-Message-State: AOJu0YyKK6KzRrquX6bVCI4W1dY2fTCYSAZbFTaUeIGnCsw1gi9DQiiR
	59f9sOsNk3LXDYqyaYadxWs=
X-Google-Smtp-Source: AGHT+IErCCNZlUzb+d9FfxnEF0XfSXKa1nmUOyrJsc00193Xh0fis9J535wTTRwmZlisTvJzTHWT+g==
X-Received: by 2002:a17:902:ced2:b0:1bc:2fe1:1821 with SMTP id d18-20020a170902ced200b001bc2fe11821mr4638920plg.17.1695398768094;
        Fri, 22 Sep 2023 09:06:08 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:70e9:c86f:4352:fcc? ([2620:15c:211:201:70e9:c86f:4352:fcc])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902c3c500b001b7fd27144dsm3678150plj.40.2023.09.22.09.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 09:06:07 -0700 (PDT)
Message-ID: <10bf17cf-8a92-469b-bc5c-1f0dba0ed5ed@acm.org>
Date: Fri, 22 Sep 2023 09:06:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH v4] ufs: core: wlun send SSU timeout recovery
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com
References: <20230922090925.16339-1-peter.wang@mediatek.com>
Content-Language: en-US
In-Reply-To: <20230922090925.16339-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_090613_854306_922AA2CD 
X-CRM114-Status: GOOD (  17.65  )
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

On 9/22/23 02:09, peter.wang@mediatek.com wrote:
> When runtime pm send SSU times out, the SCSI core invokes
> eh_host_reset_handler, which hooks function ufshcd_eh_host_reset_handler
> schedule eh_work and stuck at wait flush_work(&hba->eh_work).
> However, ufshcd_err_handler hangs in wait rpm resume.
> Do link recovery only in this case.
> Below is IO hang stack dump in kernel-6.1

What does kernel-6.1 mean? Has commit 7029e2151a7c ("scsi: ufs: Fix a
deadlock between PM and the SCSI error handler") been backported to
that kernel?

> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index c2df07545f96..7608d75bb4fe 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -7713,9 +7713,29 @@ static int ufshcd_eh_host_reset_handler(struct scsi_cmnd *cmd)
>   	int err = SUCCESS;
>   	unsigned long flags;
>   	struct ufs_hba *hba;
> +	struct device *dev;
>   
>   	hba = shost_priv(cmd->device->host);
>   
> +	/*
> +	 * If runtime pm send SSU and got timeout, scsi_error_handler
> +	 * stuck at this function to wait flush_work(&hba->eh_work).
> +	 * And ufshcd_err_handler(eh_work) stuck at wait runtime pm active.
> +	 * Do ufshcd_link_recovery instead shedule eh_work can prevent
> +	 * dead lock happen.
> +	 */
> +	dev = &hba->ufs_device_wlun->sdev_gendev;
> +	if ((dev->power.runtime_status == RPM_RESUMING) ||
> +		(dev->power.runtime_status == RPM_SUSPENDING)) {
> +		err = ufshcd_link_recovery(hba);
> +		if (err) {
> +			dev_err(hba->dev, "WL Device PM: status:%d, err:%d\n",
> +				dev->power.runtime_status,
> +				dev->power.runtime_error);
> +		}
> +		return err;
> +	}
> +
>   	spin_lock_irqsave(hba->host->host_lock, flags);
>   	hba->force_reset = true;
>   	ufshcd_schedule_eh_work(hba);

I think this change is racy because the runtime power management status
may change after the above checks have been performed and before
ufshcd_err_handling_prepare() is called. If commit 7029e2151a7c is
included in your kernel, does applying the untested patch below help?

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index d45a7dd80ab8..656dabea678e 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -123,8 +123,7 @@ static void scsi_mq_requeue_cmd(struct scsi_cmnd *cmd, unsigned long msecs)
  	}

  	blk_mq_requeue_request(rq, false);
-	if (!scsi_host_in_recovery(cmd->device->host))
-		blk_mq_delay_kick_requeue_list(rq->q, msecs);
+	blk_mq_delay_kick_requeue_list(rq->q, msecs);
  }

  /**
@@ -163,8 +162,7 @@ static void __scsi_queue_insert(struct scsi_cmnd *cmd, int reason, bool unbusy)
  	 */
  	cmd->result = 0;

-	blk_mq_requeue_request(scsi_cmd_to_rq(cmd),
-			       !scsi_host_in_recovery(cmd->device->host));
+	blk_mq_requeue_request(scsi_cmd_to_rq(cmd), true);
  }

  /**
@@ -495,9 +493,6 @@ static void scsi_mq_uninit_cmd(struct scsi_cmnd *cmd)

  static void scsi_run_queue_async(struct scsi_device *sdev)
  {
-	if (scsi_host_in_recovery(sdev->host))
-		return;
-
  	if (scsi_target(sdev)->single_lun ||
  	    !list_empty(&sdev->host->starved_list)) {
  		kblockd_schedule_work(&sdev->requeue_work);

Thanks,

Bart.

