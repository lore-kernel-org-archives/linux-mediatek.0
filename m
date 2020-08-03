Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A23C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 05:03:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94E722068F
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 05:03:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lT2hepUu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="whTqEGVe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94E722068F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rpdm87IR9zfbyXPS0IyHu0Tm/++EU4TCGUAy9FswHH8=; b=lT2hepUugBEDwRrxJjfKlTsDT
	S/B9scTIELI/5iB6o2bxSFhaPBqvMiq8N1Nd0u+nKDGbTTIINw/SaHdVbcc2e7lFV8KVc+GxQmOub
	/eWlQ+Ix30pXUk/+zwdmiRDDxZksMZRSRqRBG7BWRZfbwTnJ9Fy+e+aykA3qpqEpVM7zXUlB1FVxk
	cUbhpg1rv+VpBPSvvdmIaAf3+ieFgJ5Jks2jqjIcxAIeQslGbIgXySXeCZnXamK7/P5sCGM5PbwVZ
	3EWRgeqPgrEs8VsKYMlRmkEJj+g63fGkBXcxQEm6F39PbpirDBqQKyB8yiBolCyAWJfrIoXGSkxi2
	i3UYQRIiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2SdA-0001eF-0G; Mon, 03 Aug 2020 05:03:24 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2Sd6-0001dU-Cm
 for linux-mediatek@lists.infradead.org; Mon, 03 Aug 2020 05:03:21 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1596430998; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ZEq3dQL1T4rfyaJOBFm/8UoCpiFNlnou1J2+YfKngHo=;
 b=whTqEGVeCy/7K/yN3Dhc9OPTE87fGLv0ie08jHB8iaWtD6oH/6F+Cwl8i3e9IsCwy3l4q8vt
 nhTkWmGljjA2Smu6tgHP3f+oZGvtgF4OTxQ8hXCxjf+pYOgFugBwq+TdsDX5omuuARl1QjUi
 TRx1fprU1HO9uzG0uJ6MKkBlyX8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f279a96ba6d142d1c679964 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 03 Aug 2020 05:03:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 45062C433CA; Mon,  3 Aug 2020 05:03:17 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 198A3C433C6;
 Mon,  3 Aug 2020 05:03:16 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 03 Aug 2020 13:03:16 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v6] scsi: ufs: Quiesce all scsi devices before shutdown
In-Reply-To: <20200803042514.7111-1-stanley.chu@mediatek.com>
References: <20200803042514.7111-1-stanley.chu@mediatek.com>
Message-ID: <d85cdb877bced2d6b0a8ba67670271f2@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_010320_517957_260E3EA7 
X-CRM114-Status: GOOD (  24.88  )
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

On 2020-08-03 12:25, Stanley Chu wrote:
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
>   - Since v4: Use pm_runtime_get_sync() instead of resuming UFS device
> by ufshcd_runtime_resume() "internally".
> ---
>  drivers/scsi/ufs/ufshcd.c | 39 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 307622284239..fc01171d13b1 100644
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
> @@ -8629,6 +8635,13 @@ int ufshcd_runtime_idle(struct ufs_hba *hba)
>  }
>  EXPORT_SYMBOL(ufshcd_runtime_idle);
> 
> +static void ufshcd_quiesce_sdev(struct scsi_device *sdev, void *data)
> +{
> +	/* Suspended devices are already quiesced so can be skipped */

Why can runtime suspended sdevs be skipped? Block layer can still resume
them at any time, no?

> +	if (!pm_runtime_suspended(&sdev->sdev_gendev))
> +		scsi_device_quiesce(sdev);
> +}
> +
>  /**
>   * ufshcd_shutdown - shutdown routine
>   * @hba: per adapter instance
> @@ -8640,6 +8653,7 @@ EXPORT_SYMBOL(ufshcd_runtime_idle);
>  int ufshcd_shutdown(struct ufs_hba *hba)
>  {
>  	int ret = 0;
> +	struct scsi_target *starget;
> 
>  	if (!hba->is_powered)
>  		goto out;
> @@ -8647,11 +8661,26 @@ int ufshcd_shutdown(struct ufs_hba *hba)
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
> +	ufshcd_scsi_for_each_sdev(ufshcd_quiesce_sdev);

Any reasons why don't use scsi_target_quiesce() here?

Thanks,

Can Guo.

> 
>  	ret = ufshcd_suspend(hba, UFS_SHUTDOWN_PM);
>  out:

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
