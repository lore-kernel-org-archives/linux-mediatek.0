Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B57EC433E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:30:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 270F92070B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:30:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e9fulI3b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="U1OFtCfh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 270F92070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VC7dQ3l3oR8tiGbaVBLa32C4iqCwdscEsHaHOZMCFj8=; b=e9fulI3b2OrRtgWj5PfRo0Rnv
	bGaFIyLZtRQdMe61xDOFEO3vOkEGPV3xAbn2zz8CwNGDNEz1t+YfgyiTkMtkUC5u+TNuHtrPY6kAV
	eRCVUPY8gF8qkcYONWFyg1JO1qPAW66sFEwVGfLNv8NTizqSjiEnsE6X9GoD7nO+KTh667bHS9/1H
	tKVW4Sz+oN5fW0El7rDP5IalSCzVP9/Y6SXWtXRQds1J2/bEIZrEpRR17rmyLcZvXLBgS94Rfdxzh
	tctWkZha+jyZbenhxW1UV8g9I4XhWBelpKQZWvdJ3OI/augSTzC38M71Lu5IAJGIqXwdcT4NkoVBz
	zb8KGNl8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzxaa-00028B-QR; Mon, 27 Jul 2020 07:30:24 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzxaV-000275-Os
 for linux-mediatek@lists.infradead.org; Mon, 27 Jul 2020 07:30:23 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1595835022; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=CVDJovx8o6kxZAd7Siw03nCa0NOSEKdy2eVnCp0MImQ=;
 b=U1OFtCfhfyo5ZoGgba/qBZq+xP/Aj3SSdLSKHFwZccWJZNDxtOCs/NMh6xZVQBeuDPMgRDZn
 MKs3zX6HOcrL3QJKiumfP4w4zMqNXxWRgs3Eqf5V+BsfNTScOACI0wVK2vebuBmxRhYCe8Wy
 7rIwYX4KN3tIRZIv3M9Ix/HuWlM=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-west-2.postgun.com with SMTP id
 5f1e8284845c4d05a3407e2e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 27 Jul 2020 07:30:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EC018C4339C; Mon, 27 Jul 2020 07:30:11 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CB45FC433C9;
 Mon, 27 Jul 2020 07:30:10 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 27 Jul 2020 15:30:10 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v4] scsi: ufs: Quiesce all scsi devices before shutdown
In-Reply-To: <20200724140140.18186-1-stanley.chu@mediatek.com>
References: <20200724140140.18186-1-stanley.chu@mediatek.com>
Message-ID: <84510fc12ada0de8284e6a689b7a2358@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_033022_341670_032A8894 
X-CRM114-Status: GOOD (  20.32  )
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
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 asutoshd@codeaurora.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, beanhuo@micron.com,
 chaotian.jing@mediatek.com, cc.chou@mediatek.com,
 linux-arm-kernel@lists.infradead.org, bvanassche@acm.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Stanley,

On 2020-07-24 22:01, Stanley Chu wrote:
> Currently I/O request could be still submitted to UFS device while
> UFS is working on shutdown flow. This may lead to racing as below
> scenarios and finally system may crash due to unclocked register
> accesses.
> 
> To fix this kind of issues, specifically quiesce all SCSI devices
> before UFS shutdown to block all I/O request sending from block
> layer.
> 
> Example of racing scenario: While UFS device is runtime-suspended
> 
> Thread #1: Executing UFS shutdown flow, e.g.,
>            ufshcd_suspend(UFS_SHUTDOWN_PM)
> Thread #2: Executing runtime resume flow triggered by I/O request,
>            e.g., ufshcd_resume(UFS_RUNTIME_PM)
> 

I don't quite get it, how can you prevent block layer PM from iniating
hba runtime resume by quiescing the scsi devices? Block layer PM
iniates hba async runtime resume in blk_queue_enter(). But quiescing
the scsi devices can only prevent general I/O requests from passing
through scsi_queue_rq() callback.

Say hba is runtime suspended, if an I/O request to sda is sent from
block layer (sda must be runtime suspended as well at this time),
blk_queue_enter() initiates async runtime resume for sda. But since
sda's parents are also runtime suspended, the RPM framework shall do
runtime resume to the devices in the sequence hba->host->target->sda.
In this case, ufshcd_resume() still runs concurrently, no?

Thanks,

Can Guo.

> This breaks the assumption that UFS PM flows can not be running
> concurrently and some unexpected racing behavior may happen.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufshcd.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 9d180da77488..2e18596f3a8e 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -159,6 +159,12 @@ struct ufs_pm_lvl_states ufs_pm_lvl_states[] = {
>  	{UFS_POWERDOWN_PWR_MODE, UIC_LINK_OFF_STATE},
>  };
> 
> +#define ufshcd_scsi_for_each_sdev(fn) \
> +	list_for_each_entry(starget, &hba->host->__targets, siblings) { \
> +		__starget_for_each_device(starget, NULL, \
> +					  fn); \
> +	}
> +
>  static inline enum ufs_dev_pwr_mode
>  ufs_get_pm_lvl_to_dev_pwr_mode(enum ufs_pm_level lvl)
>  {
> @@ -8620,6 +8626,13 @@ int ufshcd_runtime_idle(struct ufs_hba *hba)
>  }
>  EXPORT_SYMBOL(ufshcd_runtime_idle);
> 
> +static void ufshcd_quiesce_sdev(struct scsi_device *sdev, void *data)
> +{
> +	/* Suspended devices are already quiesced so can be skipped */
> +	if (!pm_runtime_suspended(&sdev->sdev_gendev))
> +		scsi_device_quiesce(sdev);
> +}
> +
>  /**
>   * ufshcd_shutdown - shutdown routine
>   * @hba: per adapter instance
> @@ -8631,6 +8644,7 @@ EXPORT_SYMBOL(ufshcd_runtime_idle);
>  int ufshcd_shutdown(struct ufs_hba *hba)
>  {
>  	int ret = 0;
> +	struct scsi_target *starget;
> 
>  	if (!hba->is_powered)
>  		goto out;
> @@ -8644,6 +8658,21 @@ int ufshcd_shutdown(struct ufs_hba *hba)
>  			goto out;
>  	}
> 
> +	/*
> +	 * Quiesce all SCSI devices to prevent any non-PM requests sending
> +	 * from block layer during and after shutdown.
> +	 *
> +	 * Here we can not use blk_cleanup_queue() since PM requests
> +	 * (with BLK_MQ_REQ_PREEMPT flag) are still required to be sent
> +	 * through block layer. Therefore SCSI command queued after the
> +	 * scsi_target_quiesce() call returned will block until
> +	 * blk_cleanup_queue() is called.
> +	 *
> +	 * Besides, scsi_target_"un"quiesce (e.g., scsi_target_resume) can
> +	 * be ignored since shutdown is one-way flow.
> +	 */
> +	ufshcd_scsi_for_each_sdev(ufshcd_quiesce_sdev);
> +
>  	ret = ufshcd_suspend(hba, UFS_SHUTDOWN_PM);
>  out:
>  	if (ret)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
