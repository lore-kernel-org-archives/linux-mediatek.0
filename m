Return-Path: <SRS0=7Zfj=FT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D02C4361B
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 17:34:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09F5622ADC
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 17:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09F5622ADC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5SAsiWKMqGd+PKQUgF8mkXobjcflg9FNts/Ur78CfBc=; b=XNs4/g6ppKoqCcy/zQVMjNoxc
	+iZvwxc7d2GQJvuLgCifihVUEIuP//meQKr5pKTQrqSNTtHJy/+fS3Pm5IFQDF/rpEcKPhPc9GbYw
	bPcO7JRroKtfhyqApYx63idIg5Q6OPGvjWgRNfwt6jfQBgErXzkza+1xXzl41OqLEdCeqV2tK+fLG
	SAxe8XqI3SRZMpDflEqA05Qc/yxFNfNrV03v8GCVpp73k9lnjL1GrpX76Os1ieX4y6OtYqS/1iPsv
	QbNDagpTO4vcZD72OPj1ef31TI84HOnGqeFRmDaKASq/CFfeHHUmnhvu1o+wTjleZf8mvGaMKxWl9
	vtdU1xX/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpED1-0007J3-2e; Tue, 15 Dec 2020 17:33:59 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpECz-0007IH-0K
 for linux-mediatek@lists.infradead.org; Tue, 15 Dec 2020 17:33:58 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608053635; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=xXc2UK5tza7QAAftIMaq+gM4d7+YcF9ucDsrs/aFZvk=;
 b=qdqOyeAHOF7ct8VdV0PJS1R8WHGvovGyOOS/5SChLldRJwqM8Zf+3lmx6Yw/9P7ySGJJMZy5
 54xsnYXtzGXSnPUS+2hIGUmngJNxywT8tYj2e4AlprjfUj5mbd14IMOAIGQ3twRxwxFWwCm6
 XU5EhdKgmw7xIY2icVTY6xzT8Lk=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fd8f3820564dfefcdda44c0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Dec 2020 17:33:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AFE14C43461; Tue, 15 Dec 2020 17:33:53 +0000 (UTC)
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B6F67C433CA;
 Tue, 15 Dec 2020 17:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B6F67C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v2 2/2] scsi: ufs: Uninline ufshcd_vops_device_reset
 function
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
References: <20201208135635.15326-1-stanley.chu@mediatek.com>
 <20201208135635.15326-3-stanley.chu@mediatek.com>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <a1b39518-6a44-f349-008a-f029295d7e10@codeaurora.org>
Date: Tue, 15 Dec 2020 09:33:49 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201208135635.15326-3-stanley.chu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_123357_117498_C567DF15 
X-CRM114-Status: GOOD (  24.86  )
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
Cc: alice.chao@mediatek.com, bvanassche@acm.org, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, nguyenb@codeaurora.org, jiajie.hao@mediatek.com,
 cang@codeaurora.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com, bjorn.andersson@linaro.org,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12/8/2020 5:56 AM, Stanley Chu wrote:
> Since more and more statements showing up in ufshcd_vops_device_reset(),
> uninline it to allow compiler making possibly better optimization.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---

Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>

>   drivers/scsi/ufs/ufshcd.c | 27 ++++++++++++++++++++++-----
>   drivers/scsi/ufs/ufshcd.h | 19 +++++--------------
>   2 files changed, 27 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index c1c401b2b69d..b2ca1a6ad426 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -580,6 +580,23 @@ static void ufshcd_print_pwr_info(struct ufs_hba *hba)
>   		 hba->pwr_info.hs_rate);
>   }
>   
> +static void ufshcd_device_reset(struct ufs_hba *hba)
> +{
> +	int err;
> +
> +	err = ufshcd_vops_device_reset(hba);
> +
> +	if (!err) {
> +		ufshcd_set_ufs_dev_active(hba);
> +		if (ufshcd_is_wb_allowed(hba)) {
> +			hba->wb_enabled = false;
> +			hba->wb_buf_flush_enabled = false;
> +		}
> +	}
> +	if (err != -EOPNOTSUPP)
> +		ufshcd_update_evt_hist(hba, UFS_EVT_DEV_RESET, err);
> +}
> +
>   void ufshcd_delay_us(unsigned long us, unsigned long tolerance)
>   {
>   	if (!us)
> @@ -3932,7 +3949,7 @@ int ufshcd_link_recovery(struct ufs_hba *hba)
>   	spin_unlock_irqrestore(hba->host->host_lock, flags);
>   
>   	/* Reset the attached device */
> -	ufshcd_vops_device_reset(hba);
> +	ufshcd_device_reset(hba);
>   
>   	ret = ufshcd_host_reset_and_restore(hba);
>   
> @@ -6933,7 +6950,7 @@ static int ufshcd_reset_and_restore(struct ufs_hba *hba)
>   
>   	do {
>   		/* Reset the attached device */
> -		ufshcd_vops_device_reset(hba);
> +		ufshcd_device_reset(hba);
>   
>   		err = ufshcd_host_reset_and_restore(hba);
>   	} while (err && --retries);
> @@ -8712,7 +8729,7 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>   	 * further below.
>   	 */
>   	if (ufshcd_is_ufs_dev_deepsleep(hba)) {
> -		ufshcd_vops_device_reset(hba);
> +		ufshcd_device_reset(hba);
>   		WARN_ON(!ufshcd_is_link_off(hba));
>   	}
>   	if (ufshcd_is_link_hibern8(hba) && !ufshcd_uic_hibern8_exit(hba))
> @@ -8722,7 +8739,7 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>   set_dev_active:
>   	/* Can also get here needing to exit DeepSleep */
>   	if (ufshcd_is_ufs_dev_deepsleep(hba)) {
> -		ufshcd_vops_device_reset(hba);
> +		ufshcd_device_reset(hba);
>   		ufshcd_host_reset_and_restore(hba);
>   	}
>   	if (!ufshcd_set_dev_pwr_mode(hba, UFS_ACTIVE_PWR_MODE))
> @@ -9321,7 +9338,7 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
>   	}
>   
>   	/* Reset the attached device */
> -	ufshcd_vops_device_reset(hba);
> +	ufshcd_device_reset(hba);
>   
>   	ufshcd_init_crypto(hba);
>   
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index 36d367eb8139..9bb5f0ed4124 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -1216,21 +1216,12 @@ static inline void ufshcd_vops_dbg_register_dump(struct ufs_hba *hba)
>   		hba->vops->dbg_register_dump(hba);
>   }
>   
> -static inline void ufshcd_vops_device_reset(struct ufs_hba *hba)
> +static inline int ufshcd_vops_device_reset(struct ufs_hba *hba)
>   {
> -	if (hba->vops && hba->vops->device_reset) {
> -		int err = hba->vops->device_reset(hba);
> -
> -		if (!err) {
> -			ufshcd_set_ufs_dev_active(hba);
> -			if (ufshcd_is_wb_allowed(hba)) {
> -				hba->wb_enabled = false;
> -				hba->wb_buf_flush_enabled = false;
> -			}
> -		}
> -		if (err != -EOPNOTSUPP)
> -			ufshcd_update_evt_hist(hba, UFS_EVT_DEV_RESET, err);
> -	}
> +	if (hba->vops && hba->vops->device_reset)
> +		return hba->vops->device_reset(hba);
> +
> +	return -EOPNOTSUPP;
>   }
>   
>   static inline void ufshcd_vops_config_scaling_param(struct ufs_hba *hba,
> 


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
