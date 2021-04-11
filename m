Return-Path: <SRS0=mAey=JI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D15F1C433ED
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Apr 2021 17:52:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A9586108B
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Apr 2021 17:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A9586108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TXkqY3ATNwxSQraQMRlWoHbr2nQndZ9pHED8EQqf6oY=; b=bJ8oltUiKbQbf8IajPhmv3219
	dpq23dmoqxUt7wlOqeBraKa0rl+AOe07A4HaZf7NU2MTcIt1amjBQxv4uZmyKcYEfS4NVxzyR0n6I
	6FkRE2q9RDyTFuhNcxCLGDwJ+gcvPuTsDFIzJXAh2V5tXqx4SL4zEfCSrvWbG4F7pxUncptGsvI1n
	kW8fkZpaGiVgasxsV2ZvpQ8GZRJ+mRlH5AZzi5ii96MHSbryJH8aWaIHgLK1YoYTtjQuhlDEhTJan
	LJvy2PQpkuJN5kfcO0rxqry7vbz+hVlfp8VhEsGaCL2Qs5rkRiFn1yQZAKBZUsEEBkvUQjlN7mb8R
	UwoZMKtfw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVeGC-004r9C-GB; Sun, 11 Apr 2021 17:52:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVeFe-004r6H-Ap; Sun, 11 Apr 2021 17:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=FBZSchDztnCTaSFO+oDO5Pi9jmOW/aUNbsZl0T0Ocp8=; b=MlqvI6SU0co/mUByDtlTl0bmPl
 cmtvPbT8v/XzZsvmkXts/BiheG5MlnopO/QhPoTpnh0NUfzGifKCAvXx6ouwTbmCWSOvN0Wd+ErKt
 vt4XBIt9HfHHKgJ2L7EjXFtkeqyyWYK+7TtVVNXDSZ6NFr+Tz4mR7HOvixFGj1jB4u54CqbKhRK7c
 pO2BN58eHkY6VnFCbjSCdZgvSm2oU2dKLEnqb6jvDGK/PBJyaog1ljBGbq1A0IwwH1vs7/42AGufy
 SPiWR24a2AtTTVo82hKHo3gzZU9a2dGjnACn8XD4J8IHgwoCeyyNXa5a9C7k1SZNHcsP25fX1qaeo
 hJvcMCTQ==;
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVeFZ-005cvS-LE; Sun, 11 Apr 2021 17:52:00 +0000
IronPort-SDR: DIcqirIeuKGIyN+uUbaKnZ1SeHMmlF6tBld1JAVeI1MfOECRXufbgYZHB6A1PMtJ3VtrbzHmO7
 Jxn+uOTwDLpQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="174148687"
X-IronPort-AV: E=Sophos;i="5.82,214,1613462400"; d="scan'208";a="174148687"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2021 10:51:53 -0700
IronPort-SDR: fAOWtYbgAB1mhxjlRGSqRwrAb7+ftR0XColTBsZ2dlyklyJlRGJk0H0xxQeH5H2pxUUrFcZtkL
 H9ubZ2d7JFVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,214,1613462400"; d="scan'208";a="520918924"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174])
 ([10.237.72.174])
 by fmsmga001.fm.intel.com with ESMTP; 11 Apr 2021 10:51:46 -0700
Subject: Re: [PATCH v17 1/2] scsi: ufs: Enable power management for wlun
To: Asutosh Das <asutoshd@codeaurora.org>, cang@codeaurora.org,
 martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Bean Huo <beanhuo@micron.com>, Kiwoong Kim <kwmad.kim@samsung.com>,
 Wei Yongjun <weiyongjun1@huawei.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Yue Hu <huyue2@yulong.com>,
 Dinghao Liu <dinghao.liu@zju.edu.cn>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Satya Tangirala <satyat@google.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>
References: <cover.1617893198.git.asutoshd@codeaurora.org>
 <1b3d53dad245a7166f3f67a4c65f3a731e6600b3.1617893198.git.asutoshd@codeaurora.org>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <0e967ede-e233-8202-d638-5b1d24144192@intel.com>
Date: Sun, 11 Apr 2021 20:52:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1b3d53dad245a7166f3f67a4c65f3a731e6600b3.1617893198.git.asutoshd@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_105157_768843_7CEAAC61 
X-CRM114-Status: GOOD (  44.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 8/04/21 5:49 pm, Asutosh Das wrote:
> During runtime-suspend of ufs host, the scsi devices are
> already suspended and so are the queues associated with them.
> But the ufs host sends SSU (START_STOP_UNIT) to wlun
> during its runtime-suspend.
> During the process blk_queue_enter checks if the queue is not in
> suspended state. If so, it waits for the queue to resume, and never
> comes out of it.
> The commit
> (d55d15a33: scsi: block: Do not accept any requests while suspended)
> adds the check if the queue is in suspended state in blk_queue_enter().
> 
> Call trace:
>  __switch_to+0x174/0x2c4
>  __schedule+0x478/0x764
>  schedule+0x9c/0xe0
>  blk_queue_enter+0x158/0x228
>  blk_mq_alloc_request+0x40/0xa4
>  blk_get_request+0x2c/0x70
>  __scsi_execute+0x60/0x1c4
>  ufshcd_set_dev_pwr_mode+0x124/0x1e4
>  ufshcd_suspend+0x208/0x83c
>  ufshcd_runtime_suspend+0x40/0x154
>  ufshcd_pltfrm_runtime_suspend+0x14/0x20
>  pm_generic_runtime_suspend+0x28/0x3c
>  __rpm_callback+0x80/0x2a4
>  rpm_suspend+0x308/0x614
>  rpm_idle+0x158/0x228
>  pm_runtime_work+0x84/0xac
>  process_one_work+0x1f0/0x470
>  worker_thread+0x26c/0x4c8
>  kthread+0x13c/0x320
>  ret_from_fork+0x10/0x18
> 
> Fix this by registering ufs device wlun as a scsi driver and
> registering it for block runtime-pm. Also make this as a
> supplier for all other luns. That way, this device wlun
> suspends after all the consumers and resumes after
> hba resumes.
> 
> Co-developed-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> ---

<SNIP>

> @@ -5815,14 +5857,14 @@ static void ufshcd_recover_pm_error(struct ufs_hba *hba)
>  
>  	hba->is_sys_suspended = false;
>  	/*
> -	 * Set RPM status of hba device to RPM_ACTIVE,
> +	 * Set RPM status of wlun device to RPM_ACTIVE,
>  	 * this also clears its runtime error.
>  	 */
> -	ret = pm_runtime_set_active(hba->dev);
> +	ret = pm_runtime_set_active(&hba->sdev_ufs_device->sdev_gendev);

It may be that it was hba->dev with a runtime error. So,
also need here:

	if (ret)
		ret = pm_runtime_set_active(hba->dev);


> @@ -8671,7 +8701,7 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	enum ufs_dev_pwr_mode req_dev_pwr_mode;
>  	enum uic_link_state req_link_state;
>  
> -	hba->pm_op_in_progress = 1;
> +	hba->pm_op_in_progress = true;
>  	if (!ufshcd_is_shutdown_pm(pm_op)) {
>  		pm_lvl = ufshcd_is_runtime_pm(pm_op) ?
>  			 hba->rpm_lvl : hba->spm_lvl;
> @@ -8694,17 +8724,17 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  
>  	if (req_dev_pwr_mode == UFS_ACTIVE_PWR_MODE &&
>  			req_link_state == UIC_LINK_ACTIVE_STATE) {
> -		goto disable_clks;
> +		goto enable_scaling;

Previously "goto disable_clks" would go to the vendor callback
ufshcd_vops_suspend(), but now it is skipped.


>  	}
>  
>  	if ((req_dev_pwr_mode == hba->curr_dev_pwr_mode) &&
>  	    (req_link_state == hba->uic_link_state))
> -		goto enable_gating;
> +		goto enable_scaling;
>  
>  	/* UFS device & link must be active before we enter in this function */
>  	if (!ufshcd_is_ufs_dev_active(hba) || !ufshcd_is_link_active(hba)) {
>  		ret = -EINVAL;
> -		goto enable_gating;
> +		goto enable_scaling;
>  	}

<SNIP>

> +/**
> + * ufshcd_suspend - helper function for suspend operations
> + * @hba: per adapter instance
> + *
> + * This function will put disable irqs, turn off clocks
> + * and set vreg and hba-vreg in lpm mode.
> + * Also check the description of __ufshcd_wl_suspend().
> + */
> +static void ufshcd_suspend(struct ufs_hba *hba)
> +{
> +	hba->pm_op_in_progress = 1;

Seems like pm_op_in_progress wouldn't be needed in this function,
nor ufshcd_resume().

You could probably simplify the callers slighly by
putting the "if (!hbs->is_powered) return" check here and in
ufshcd_resume().

> +
> +	/*
> +	 * Disable the host irq as host controller as there won't be any
> +	 * host controller transaction expected till resume.
> +	 */
>  	ufshcd_disable_irq(hba);
>  	ufshcd_setup_clocks(hba, false);
>  	if (ufshcd_is_clkgating_allowed(hba)) {
> @@ -8948,6 +9054,43 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  		trace_ufshcd_clk_gating(dev_name(hba->dev),
>  					hba->clk_gating.state);
>  	}
> +
> +	ufshcd_vreg_set_lpm(hba);
> +	/* Put the host controller in low power mode if possible */
> +	ufshcd_hba_vreg_set_lpm(hba);
> +	hba->pm_op_in_progress = 0;
> +}
> +
> +/**
> + * ufshcd_resume - helper function for resume operations
> + * @hba: per adapter instance
> + *
> + * This function basically turns on the regulators, clocks and
> + * irqs of the hba.
> + * Also check the description of __ufshcd_wl_resume().
> + *
> + * Returns 0 for success and non-zero for failure
> + */
> +static int ufshcd_resume(struct ufs_hba *hba)
> +{
> +	int ret;
> +
> +	hba->pm_op_in_progress = 1;
> +
> +	ufshcd_hba_vreg_set_hpm(hba);
> +	ret = ufshcd_vreg_set_hpm(hba);
> +	if (ret)
> +		goto out;
> +
> +	/* Make sure clocks are enabled before accessing controller */
> +	ret = ufshcd_setup_clocks(hba, true);
> +	if (ret)
> +		goto disable_vreg;
> +
> +	/* enable the host irq as host controller would be active soon */
> +	ufshcd_enable_irq(hba);
> +	goto out;
> +
>  disable_vreg:
>  	ufshcd_vreg_set_lpm(hba);
>  out:
> @@ -8962,6 +9105,7 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>   * @hba: per adapter instance
>   *
>   * Check the description of ufshcd_suspend() function for more details.
> + * Also check the description of __ufshcd_wl_suspend().
>   *
>   * Returns 0 for success and non-zero for failure
>   */
> @@ -8982,21 +9126,7 @@ int ufshcd_system_suspend(struct ufs_hba *hba)
>	if ((ufs_get_pm_lvl_to_dev_pwr_mode(hba->spm_lvl) ==
>	     hba->curr_dev_pwr_mode) &&
>	    (ufs_get_pm_lvl_to_link_pwr_state(hba->spm_lvl) ==
>	     hba->uic_link_state) &&
>  	     !hba->dev_info.b_rpm_dev_flush_capable)
>  		goto out;

The logic above can be removed.

>  
> -	if (pm_runtime_suspended(hba->dev)) {
> -		/*
> -		 * UFS device and/or UFS link low power states during runtime
> -		 * suspend seems to be different than what is expected during
> -		 * system suspend. Hence runtime resume the devic & link and
> -		 * let the system suspend low power states to take effect.
> -		 * TODO: If resume takes longer time, we might have optimize
> -		 * it in future by not resuming everything if possible.
> -		 */
> -		ret = ufshcd_runtime_resume(hba);
> -		if (ret)
> -			goto out;
> -	}

System suspend/resume and runtime suspend/resume are identical
for hba->dev, so the logic becomes:

	if (pm_runtime_suspended(hba->dev))
		goto out;

> -
> -	ret = ufshcd_suspend(hba, UFS_SYSTEM_PM);
> +	ufshcd_suspend(hba);
>  out:
>  	trace_ufshcd_system_suspend(dev_name(hba->dev), ret,
>  		ktime_to_us(ktime_sub(ktime_get(), start)),
> @@ -9018,25 +9148,20 @@ EXPORT_SYMBOL(ufshcd_system_suspend);
>  
>  int ufshcd_system_resume(struct ufs_hba *hba)
>  {
> -	int ret = 0;
>  	ktime_t start = ktime_get();
>  
> -	if (!hba->is_powered || pm_runtime_suspended(hba->dev))
> -		/*
> -		 * Let the runtime resume take care of resuming
> -		 * if runtime suspended.
> -		 */
> +	if (!hba->is_powered)

System suspend/resume and runtime suspend/resume are identical
for hba->dev, so the original logic is fine here.

>  		goto out;
>  	else
> -		ret = ufshcd_resume(hba, UFS_SYSTEM_PM);
> +		ufshcd_resume(hba);
>  out:
> -	trace_ufshcd_system_resume(dev_name(hba->dev), ret,
> +	trace_ufshcd_system_resume(dev_name(hba->dev), 0,
>  		ktime_to_us(ktime_sub(ktime_get(), start)),
>  		hba->curr_dev_pwr_mode, hba->uic_link_state);
> -	if (!ret)
> -		hba->is_sys_suspended = false;
> +
> +	hba->is_sys_suspended = false;
>  	up(&hba->host_sem);

It seems likely that hba->host_sem down / up should be in 
ufshcd_wl_suspend() / ufshcd_wl_resume() respectively, instead
of here.

Ditto hba->is_sys_suspended

> -	return ret;
> +	return 0;
>  }
>  EXPORT_SYMBOL(ufshcd_system_resume);
>  
> @@ -9045,23 +9170,23 @@ EXPORT_SYMBOL(ufshcd_system_resume);
>   * @hba: per adapter instance
>   *
>   * Check the description of ufshcd_suspend() function for more details.
> + * Also check the description of __ufshcd_wl_suspend().
>   *
>   * Returns 0 for success and non-zero for failure
>   */
>  int ufshcd_runtime_suspend(struct ufs_hba *hba)
>  {
> -	int ret = 0;
>  	ktime_t start = ktime_get();
>  
>  	if (!hba->is_powered)
>  		goto out;
>  	else
> -		ret = ufshcd_suspend(hba, UFS_RUNTIME_PM);
> +		ufshcd_suspend(hba);
>  out:
> -	trace_ufshcd_runtime_suspend(dev_name(hba->dev), ret,
> +	trace_ufshcd_runtime_suspend(dev_name(hba->dev), 0,
>  		ktime_to_us(ktime_sub(ktime_get(), start)),
>  		hba->curr_dev_pwr_mode, hba->uic_link_state);
> -	return ret;
> +	return 0;
>  }
>  EXPORT_SYMBOL(ufshcd_runtime_suspend);
>  
> @@ -9069,37 +9194,25 @@ EXPORT_SYMBOL(ufshcd_runtime_suspend);
>   * ufshcd_runtime_resume - runtime resume routine
>   * @hba: per adapter instance
>   *
> - * This function basically brings the UFS device, UniPro link and controller
> + * This function basically brings controller
>   * to active state. Following operations are done in this function:
>   *
>   * 1. Turn on all the controller related clocks
> - * 2. Bring the UniPro link out of Hibernate state
> - * 3. If UFS device is in sleep state, turn ON VCC rail and bring the UFS device
> - *    to active state.
> - * 4. If auto-bkops is enabled on the device, disable it.
> - *
> - * So following would be the possible power state after this function return
> - * successfully:
> - *	S1: UFS device in Active state with VCC rail ON
> - *	    UniPro link in Active state
> - *	    All the UFS/UniPro controller clocks are ON
> - *
> - * Returns 0 for success and non-zero for failure
> + * 2. Turn ON VCC rail
>   */
>  int ufshcd_runtime_resume(struct ufs_hba *hba)
>  {
> -	int ret = 0;
>  	ktime_t start = ktime_get();
>  
>  	if (!hba->is_powered)
>  		goto out;
>  	else
> -		ret = ufshcd_resume(hba, UFS_RUNTIME_PM);
> +		ufshcd_resume(hba);
>  out:
> -	trace_ufshcd_runtime_resume(dev_name(hba->dev), ret,
> +	trace_ufshcd_runtime_resume(dev_name(hba->dev), 0,
>  		ktime_to_us(ktime_sub(ktime_get(), start)),
>  		hba->curr_dev_pwr_mode, hba->uic_link_state);
> -	return ret;
> +	return 0;
>  }
>  EXPORT_SYMBOL(ufshcd_runtime_resume);
>  
> @@ -9113,18 +9226,13 @@ EXPORT_SYMBOL(ufshcd_runtime_idle);
>   * ufshcd_shutdown - shutdown routine
>   * @hba: per adapter instance
>   *
> - * This function would power off both UFS device and UFS link.
> + * This function would turn off both UFS device and UFS hba
> + * regulators. It would also disable clocks.
>   *
>   * Returns 0 always to allow force shutdown even in case of errors.
>   */
>  int ufshcd_shutdown(struct ufs_hba *hba)
>  {
> -	int ret = 0;
> -
> -	down(&hba->host_sem);
> -	hba->shutting_down = true;
> -	up(&hba->host_sem);
> -
>  	if (!hba->is_powered)
>  		goto out;
>  
> @@ -9133,10 +9241,8 @@ int ufshcd_shutdown(struct ufs_hba *hba)
>  
>  	pm_runtime_get_sync(hba->dev);
>  
> -	ret = ufshcd_suspend(hba, UFS_SHUTDOWN_PM);
> +	ufshcd_suspend(hba);
>  out:
> -	if (ret)
> -		dev_err(hba->dev, "%s failed, err %d\n", __func__, ret);
>  	hba->is_powered = false;
>  	/* allow force shutdown even in case of errors */
>  	return 0;
> @@ -9150,6 +9256,8 @@ EXPORT_SYMBOL(ufshcd_shutdown);
>   */
>  void ufshcd_remove(struct ufs_hba *hba)
>  {
> +	if (hba->sdev_ufs_device)
> +		scsi_autopm_get_device(hba->sdev_ufs_device);
>  	ufs_bsg_remove(hba);
>  	ufs_sysfs_remove_nodes(hba->dev);
>  	blk_cleanup_queue(hba->tmf_queue);
> @@ -9453,15 +9561,175 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
>  }
>  EXPORT_SYMBOL_GPL(ufshcd_init);
>  
> +void ufshcd_resume_complete(struct device *dev)
> +{
> +	struct ufs_hba *hba = dev_get_drvdata(dev);
> +
> +	pm_runtime_put_noidle(&hba->sdev_ufs_device->sdev_gendev);

pm_runtime_put() instead of pm_runtime_put_noidle() would be
more correct here.

> +}
> +EXPORT_SYMBOL_GPL(ufshcd_resume_complete);
> +
> +int ufshcd_suspend_prepare(struct device *dev)
> +{
> +	struct ufs_hba *hba = dev_get_drvdata(dev);
> +
> +	/*
> +	 * SCSI assumes that runtime-pm and system-pm for scsi drivers
> +	 * are same. And it doesn't wake up the device for system-suspend
> +	 * if it's runtime suspended. But ufs doesn't follow that.
> +	 * The rpm-lvl and spm-lvl can be different in ufs.
> +	 * Force it to honor system-suspend.
> +	 */
> +	scsi_autopm_get_device(hba->sdev_ufs_device);
> +	/* Refer ufshcd_resume_complete() */
> +	pm_runtime_get_noresume(&hba->sdev_ufs_device->sdev_gendev);
> +	scsi_autopm_put_device(hba->sdev_ufs_device);

This could simply be:

	pm_runtime_get_sync(&hba->sdev_ufs_device->sdev_gendev);

or new wrapper.

> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(ufshcd_suspend_prepare);
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int ufshcd_wl_poweroff(struct device *dev)
> +{
> +	struct scsi_device *sdev = to_scsi_device(dev);
> +	struct ufs_hba *hba = shost_priv(sdev->host);
> +
> +	__ufshcd_wl_suspend(hba, UFS_SHUTDOWN_PM);
> +	return 0;
> +}
> +#endif
> +
> +static int ufshcd_wl_probe(struct device *dev)
> +{
> +	struct scsi_device *sdev = to_scsi_device(dev);
> +
> +	if (!is_device_wlun(sdev))
> +		return -ENODEV;
> +
> +	blk_pm_runtime_init(sdev->request_queue, dev);
> +	pm_runtime_set_autosuspend_delay(dev, 0);
> +	pm_runtime_allow(dev);
> +
> +	return  0;
> +}
> +
> +static int ufshcd_wl_remove(struct device *dev)
> +{
> +	pm_runtime_forbid(dev);
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops ufshcd_wl_pm_ops = {
> +#ifdef CONFIG_PM_SLEEP
> +	.suspend = ufshcd_wl_suspend,
> +	.resume = ufshcd_wl_resume,
> +	.freeze = ufshcd_wl_suspend,
> +	.thaw = ufshcd_wl_resume,
> +	.poweroff = ufshcd_wl_poweroff,
> +	.restore = ufshcd_wl_resume,
> +#endif
> +	SET_RUNTIME_PM_OPS(ufshcd_wl_runtime_suspend, ufshcd_wl_runtime_resume, NULL)
> +};
> +
> +/**
> + * ufs_dev_wlun_template - describes ufs device wlun
> + * ufs-device wlun - used to send pm commands
> + * All luns are consumers of ufs-device wlun.
> + *
> + * Currently, no sd driver is present for wluns.
> + * Hence the no specific pm operations are performed.
> + * With ufs design, SSU should be sent to ufs-device wlun.
> + * Hence register a scsi driver for ufs wluns only.
> + */
> +static struct scsi_driver ufs_dev_wlun_template = {
> +	.gendrv = {
> +		.name = "ufs_device_wlun",
> +		.owner = THIS_MODULE,
> +		.probe = ufshcd_wl_probe,
> +		.remove = ufshcd_wl_remove,
> +		.pm = &ufshcd_wl_pm_ops,
> +		.shutdown = ufshcd_wl_shutdown,
> +	},
> +};
> +
> +static int ufshcd_rpmb_probe(struct device *dev)
> +{
> +	return is_rpmb_wlun(to_scsi_device(dev)) ? 0 : -ENODEV;
> +}
> +
> +static inline int ufshcd_clear_rpmb_uac(struct ufs_hba *hba)
> +{
> +	int ret = 0;
> +
> +	if (!hba->wlun_rpmb_clr_ua)
> +		return 0;
> +	ret = ufshcd_clear_ua_wlun(hba, UFS_UPIU_RPMB_WLUN);
> +	if (!ret)
> +		hba->wlun_rpmb_clr_ua = 0;
> +	return ret;
> +}
> +
> +static int ufshcd_rpmb_runtime_resume(struct device *dev)
> +{
> +	struct ufs_hba *hba = wlun_dev_to_hba(dev);
> +
> +	if (hba->sdev_rpmb)
> +		return ufshcd_clear_rpmb_uac(hba);
> +	return 0;
> +}
> +
> +static int ufshcd_rpmb_resume(struct device *dev)
> +{
> +	struct ufs_hba *hba = wlun_dev_to_hba(dev);
> +
> +	if (hba->sdev_rpmb && !pm_runtime_suspended(dev))
> +		return ufshcd_clear_rpmb_uac(hba);
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops ufs_rpmb_pm_ops = {
> +	SET_RUNTIME_PM_OPS(NULL, ufshcd_rpmb_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(NULL, ufshcd_rpmb_resume)
> +};
> +
> +/**
> + * Describes the ufs rpmb wlun.
> + * Used only to send uac.
> + */
> +static struct scsi_driver ufs_rpmb_wlun_template = {
> +	.gendrv = {
> +		.name = "ufs_rpmb_wlun",
> +		.owner = THIS_MODULE,
> +		.probe = ufshcd_rpmb_probe,
> +		.pm = &ufs_rpmb_pm_ops,
> +	},
> +};
> +
>  static int __init ufshcd_core_init(void)
>  {
> +	int ret;
> +
>  	ufs_debugfs_init();
> +
> +	ret = scsi_register_driver(&ufs_dev_wlun_template.gendrv);
> +	if (ret) {
> +		ufs_debugfs_exit();
> +		return ret;
> +	}
> +	ret = scsi_register_driver(&ufs_rpmb_wlun_template.gendrv);
> +	if (ret) {
> +		ufs_debugfs_exit();
> +		scsi_unregister_driver(&ufs_dev_wlun_template.gendrv);
> +		return ret;
> +	}
>  	return 0;

A separated error path is preferred i.e.

	ret = scsi_register_driver(&ufs_dev_wlun_template.gendrv);
	if (ret)
		goto debugfs_exit;

	ret = scsi_register_driver(&ufs_rpmb_wlun_template.gendrv);
	if (ret)
		goto unregister;

  	return 0;

unregister:
	scsi_unregister_driver(&ufs_dev_wlun_template.gendrv);
debugfs_exit:
	ufs_debugfs_exit();
	return ret;

>  }
>  
>  static void __exit ufshcd_core_exit(void)
>  {
>  	ufs_debugfs_exit();
> +	scsi_unregister_driver(&ufs_rpmb_wlun_template.gendrv);
> +	scsi_unregister_driver(&ufs_dev_wlun_template.gendrv);
>  }
>  
>  module_init(ufshcd_core_init);
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index 5eb66a8..40436e3 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -72,6 +72,8 @@ enum ufs_event_type {
>  	UFS_EVT_LINK_STARTUP_FAIL,
>  	UFS_EVT_RESUME_ERR,
>  	UFS_EVT_SUSPEND_ERR,
> +	UFS_EVT_WL_SUSP_ERR,
> +	UFS_EVT_WL_RES_ERR,
>  
>  	/* abnormal events */
>  	UFS_EVT_DEV_RESET,
> @@ -807,6 +809,7 @@ struct ufs_hba {
>  	struct list_head clk_list_head;
>  
>  	bool wlun_dev_clr_ua;
> +	bool wlun_rpmb_clr_ua;
>  
>  	/* Number of requests aborts */
>  	int req_abort_count;
> @@ -846,6 +849,7 @@ struct ufs_hba {
>  	struct delayed_work debugfs_ee_work;
>  	u32 debugfs_ee_rate_limit_ms;
>  #endif
> +	u32 luns_avail;
>  };
>  
>  /* Returns true if clocks can be gated. Otherwise false */
> @@ -1105,6 +1109,8 @@ int ufshcd_exec_raw_upiu_cmd(struct ufs_hba *hba,
>  			     enum query_opcode desc_op);
>  
>  int ufshcd_wb_toggle(struct ufs_hba *hba, bool enable);
> +int ufshcd_suspend_prepare(struct device *dev);
> +void ufshcd_resume_complete(struct device *dev);
>  
>  /* Wrapper functions for safely calling variant operations */
>  static inline const char *ufshcd_get_var_name(struct ufs_hba *hba)
> diff --git a/include/trace/events/ufs.h b/include/trace/events/ufs.h
> index 1cb6f1a..599739e 100644
> --- a/include/trace/events/ufs.h
> +++ b/include/trace/events/ufs.h
> @@ -246,6 +246,26 @@ DEFINE_EVENT(ufshcd_template, ufshcd_init,
>  		      int dev_state, int link_state),
>  	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
>  
> +DEFINE_EVENT(ufshcd_template, ufshcd_wl_suspend,
> +	     TP_PROTO(const char *dev_name, int err, s64 usecs,
> +		      int dev_state, int link_state),
> +	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
> +
> +DEFINE_EVENT(ufshcd_template, ufshcd_wl_resume,
> +	     TP_PROTO(const char *dev_name, int err, s64 usecs,
> +		      int dev_state, int link_state),
> +	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
> +
> +DEFINE_EVENT(ufshcd_template, ufshcd_wl_runtime_suspend,
> +	     TP_PROTO(const char *dev_name, int err, s64 usecs,
> +		      int dev_state, int link_state),
> +	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
> +
> +DEFINE_EVENT(ufshcd_template, ufshcd_wl_runtime_resume,
> +	     TP_PROTO(const char *dev_name, int err, s64 usecs,
> +		      int dev_state, int link_state),
> +	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
> +
>  TRACE_EVENT(ufshcd_command,
>  	TP_PROTO(const char *dev_name, enum ufs_trace_str_t str_t,
>  		 unsigned int tag, u32 doorbell, int transfer_len, u32 intr,
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
