Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6CAC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 11:50:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C87A2076C
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 11:50:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1rmED387";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="Ma4KAjCK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C87A2076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ivCVp7qTbLygiK19ozgmxcUCMyJPxoX1TlEQAzqdi1o=; b=1rmED387pAItqADc6Q5inxMcA
	evAbnkOTayZ00LvKM8broxUvMOoxpKLGOQF06WZghR7QCCFda+GzO47rGiGYD7pZT1RK/z/YI0sms
	fH1ixtKs3Qxr4sVhzbVwxM5axEoLdwe8uW+TqplsR+gF08VolSo3lmTsCIO/6lxyO0zyZkZcWboP8
	BqFvetFujCpKxW6FjFj1WjDKYj7xWF8b7T+Xcap1ES/EyL0jmSp1NDNFAxL/4k1+Gbr46RDET+aNE
	ZVW7f73S2axO4B0MV8+HLmfK6kT5cjOSSsb/Kb9wFrR8LZDH/XfhKRxUZ25Bysb+azObQixNp62Ky
	PrsuvWrFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2Yyy-00005S-C2; Mon, 03 Aug 2020 11:50:20 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2Yyw-0008WM-5s
 for linux-mediatek@lists.infradead.org; Mon, 03 Aug 2020 11:50:19 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1596455417; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=SeFmOwx1N51AVvBTY0pLClU+gO/8xIouA4x4ny2GJKI=;
 b=Ma4KAjCKPqVKSyEiKsNw3yW22bujAqsGxachjObfyFUyeyTgraJ3YrQaZvKSEVAZHbbnxQsF
 PVnqOecaC+hVo6k1y8ddwwA0LNXTgZfHhTEsrVPeP59tveWB3Hr3bcGDnjBlIltVz6tsDijS
 oDDGb/69AsIR/reUjOrs5PxhPi4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-west-2.postgun.com with SMTP id
 5f27f9f8eb556d49a688a5fb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 03 Aug 2020 11:50:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 487E6C43395; Mon,  3 Aug 2020 11:50:15 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A93D1C433C6;
 Mon,  3 Aug 2020 11:50:13 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 03 Aug 2020 19:50:13 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v7] scsi: ufs: Quiesce all scsi devices before shutdown
In-Reply-To: <20200803100448.2738-1-stanley.chu@mediatek.com>
References: <20200803100448.2738-1-stanley.chu@mediatek.com>
Message-ID: <ee423cd3b5c42942a8895a8f08a26e68@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_075018_295790_8DD4EB44 
X-CRM114-Status: GOOD (  26.95  )
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
Cc: jiajie.hao@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, andy.teng@mediatek.com, jejb@linux.ibm.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, asutoshd@codeaurora.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, beanhuo@micron.com,
 chaotian.jing@mediatek.com, cc.chou@mediatek.com,
 linux-arm-kernel@lists.infradead.org, bvanassche@acm.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Stanley,

On 2020-08-03 18:04, Stanley Chu wrote:
> Currently I/O request could be still submitted to UFS device while
> UFS is working on shutdown flow. This may lead to racing as below
> scenarios and finally system may crash due to unclocked register
> accesses.
> 
> To fix this kind of issues, in ufshcd_shutdown(),
> 
> 1. Use pm_runtime_get_sync() instead of resuming UFS device by
>    ufshcd_runtime_resume() "internally" to let runtime PM framework
>    manage and prevent concurrent runtime operations by incoming I/O
>    requests.
> 
> 2. Specifically quiesce all SCSI devices to block all I/O requests
>    after device is resumed.
> 
> Example of racing scenario: While UFS device is runtime-suspended
> 
> Thread #1: Executing UFS shutdown flow, e.g.,
>            ufshcd_suspend(UFS_SHUTDOWN_PM)
> 
> Thread #2: Executing runtime resume flow triggered by I/O request,
>            e.g., ufshcd_resume(UFS_RUNTIME_PM)
> 
> This breaks the assumption that UFS PM flows can not be running
> concurrently and some unexpected racing behavior may happen.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
> Changes:
>   - Since v6:
> 	- Do quiesce to all SCSI devices.
>   - Since v4:
> 	- Use pm_runtime_get_sync() instead of resuming UFS device by
> ufshcd_runtime_resume() "internally".
> ---
>  drivers/scsi/ufs/ufshcd.c | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 307622284239..7cb220b3fde0 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -8640,6 +8640,7 @@ EXPORT_SYMBOL(ufshcd_runtime_idle);
>  int ufshcd_shutdown(struct ufs_hba *hba)
>  {
>  	int ret = 0;
> +	struct scsi_target *starget;
> 
>  	if (!hba->is_powered)
>  		goto out;
> @@ -8647,11 +8648,27 @@ int ufshcd_shutdown(struct ufs_hba *hba)
>  	if (ufshcd_is_ufs_dev_poweroff(hba) && ufshcd_is_link_off(hba))
>  		goto out;
> 
> -	if (pm_runtime_suspended(hba->dev)) {
> -		ret = ufshcd_runtime_resume(hba);
> -		if (ret)
> -			goto out;
> -	}
> +	/*
> +	 * Let runtime PM framework manage and prevent concurrent runtime
> +	 * operations with shutdown flow.
> +	 */
> +	pm_runtime_get_sync(hba->dev);
> +
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
> +	list_for_each_entry(starget, &hba->host->__targets, siblings)
> +		scsi_target_quiesce(starget);
> 

Sorry for misleading you to scsi_target_quiesce(), maybe below is 
better.

     shost_for_each_device(sdev, hba->host)
         scsi_device_quiesce(sdev);

We may need to discuss more about this quiesce part since I missed 
something.

After we quiesce the scsi devices, only PM requests are allowed, but it
is still not safe: [1] PM requests can still pass through, [2] there can
be tasks/reqs present in doorbells before the devices are quiesced. So,
these tasks/reqs in [1] and [2] can still be flying in parallel while
ufshcd_suspend is running.

How about only quiescing the UFS device well known scsi device but using
freeze_queue to the other scsi devices? blk_mq_freeze_queue can 
eliminate
the risks mentioned in [1] and [2].

      shost_for_each_device(sdev, hba->host) {
          if (sdev == hba->sdev_ufs_device)
               scsi_device_quiesce(sdev);
          else
               blk_mq_freeze_queue(sdev->request_queue);
      }

IF blk_mq_freeze_queue is not allowed to be used by LLD (I think we can
use it as I recalled Bart used to use it in one of his changes to UFS 
scaling),
we may need to make changes like below. [1] is to make sure no more PM 
requests
sent to scsi devices, [2] is make sure doorbells are cleared before 
invoke
ufshcd_suspend.

     shost_for_each_device(sdev, hba->host) {
         scsi_autopm_get_device(sdev); [1]
         scsi_device_quiesce(sdev);
     }

     ufshcd_wait_for_doorbell_clr(hba, U64_MAX); [2]

Please let me know your ideas, thanks!

Regards,

Can Guo.

>  	ret = ufshcd_suspend(hba, UFS_SHUTDOWN_PM);
>  out:

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
