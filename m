Return-Path: <SRS0=2SCH=AX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518C1C433DF
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jul 2020 01:31:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E00620748
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jul 2020 01:31:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UUgaWG/k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CKyckvdY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E00620748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xga5/XGQ1hHu0M2i5pjLgfxVVEV0RWjaXCQoi8lqSNg=; b=UUgaWG/ktATrfgGxJOa8EhNpi
	hLM2tqIgcUhkVEe9tQ+vs8O/dqh7Al3hbYTlKdAeen49p63J2CpE2SeGEBhKHHMKcyyLPlHMxjqmn
	H55dIQbhG7p6Pefc9vrU9VXmlIXH/PvxP8vANYR/rpbqULDqyLp6XcsSwEo3PiAyLg5v1Sifhua6d
	d0uWKvn9TlB3dUH1hvJ5JR86N1c2VK4cn0GjIS2pOAomB6D5oOm//1SqqVBUmz0ZA4Xp/22TV1X94
	Gzd+buUBq2VjOGjcrdpHumEAYUkhfIG0Wfp/RHaaIkcinqaa3QztcbeCg/xD/m9xL98KlyXzyn4FJ
	O2/ruBEkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juQpz-00048B-IR; Sun, 12 Jul 2020 01:31:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juQpu-000473-2M; Sun, 12 Jul 2020 01:31:24 +0000
X-UUID: 4e8fbd039ac0482d96e11ff655f77c2b-20200711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=IqgD/1yeFLs6o/vFQu2a3JKBQxZLmFNOwwCR3zm/zLc=; 
 b=CKyckvdYdjnbffxVwD6Vmi1I9L+JZwUI177D0Ohb/xyvqsR7yZl39ov90Bzt6p20zZdWvNb7AR1oFzyeE39DI64EGuLQ08r4s3PwDzEMY7UpMnWDhIfXEC1WPF1R28zuQod2hiT0569K0abgJjSh0igrW5mhjsXxhlTzM5OD/EE=;
X-UUID: 4e8fbd039ac0482d96e11ff655f77c2b-20200711
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 777759089; Sat, 11 Jul 2020 17:31:17 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Jul 2020 18:31:15 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jul 2020 09:31:07 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 12 Jul 2020 09:31:07 +0800
Message-ID: <1594517468.10600.35.camel@mtkswgap22>
Subject: Re: [RFC PATCH v3] scsi: ufs: Quiesce all scsi devices before shutdown
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>
Date: Sun, 12 Jul 2020 09:31:08 +0800
In-Reply-To: <20200706132218.21171-1-stanley.chu@mediatek.com>
References: <20200706132218.21171-1-stanley.chu@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200711_213123_973171_07BBC122 
X-CRM114-Status: GOOD (  20.77  )
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
Cc: bvanassche@acm.org, martin.petersen@oracle.com, andy.teng@mediatek.com,
 jejb@linux.ibm.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, avri.altman@wdc.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, asutoshd@codeaurora.org,
 chaotian.jing@mediatek.com, cc.chou@mediatek.com,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bart, Avri,

May I know if you have any suggestion for this RFC fix?

Very appreciated : )

On Mon, 2020-07-06 at 21:22 +0800, Stanley Chu wrote:
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
> This breaks the assumption that UFS PM flows can not be running
> concurrently and some unexpected racing behavior may happen.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufshcd.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 59358bb75014..104173c03492 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -158,6 +158,12 @@ struct ufs_pm_lvl_states ufs_pm_lvl_states[] = {
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
> @@ -8588,6 +8594,19 @@ int ufshcd_runtime_idle(struct ufs_hba *hba)
>  }
>  EXPORT_SYMBOL(ufshcd_runtime_idle);
>  
> +static void ufshcd_cleanup_queue(struct scsi_device *sdev, void *data)
> +{
> +	if (sdev->request_queue)
> +		blk_cleanup_queue(sdev->request_queue);
> +}
> +
> +static void ufshcd_quiece_sdev(struct scsi_device *sdev, void *data)
> +{
> +	/* Suspended devices are already quiecsed and shall be skipped */
> +	if (!pm_runtime_suspended(&sdev->sdev_gendev))
> +		scsi_device_quiesce(sdev);
> +}
> +
>  /**
>   * ufshcd_shutdown - shutdown routine
>   * @hba: per adapter instance
> @@ -8599,6 +8618,7 @@ EXPORT_SYMBOL(ufshcd_runtime_idle);
>  int ufshcd_shutdown(struct ufs_hba *hba)
>  {
>  	int ret = 0;
> +	struct scsi_target *starget;
>  
>  	if (!hba->is_powered)
>  		goto out;
> @@ -8612,7 +8632,25 @@ int ufshcd_shutdown(struct ufs_hba *hba)
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
> +	ufshcd_scsi_for_each_sdev(ufshcd_quiece_sdev);
> +
>  	ret = ufshcd_suspend(hba, UFS_SHUTDOWN_PM);
> +
> +	/* Set queue as dying to not block queueing commands */
> +	ufshcd_scsi_for_each_sdev(ufshcd_cleanup_queue);
>  out:
>  	if (ret)
>  		dev_err(hba->dev, "%s failed, err %d\n", __func__, ret);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
