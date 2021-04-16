Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4DFC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 09:39:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E01836115B
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 09:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E01836115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yjbFOeNBJfCKVqdLVXCsnvsJjzu2Lj4imVs1EuqgkPI=; b=LHwxOZccarMQFQv7wnUKg2upw
	JZSicO99rmjYvncEYz4PmRPiv7CFDoJ0lWHsKnro7WDKtOyT1fnVSGhe48saBFtgal5WPxLYQfKEU
	XMSA5x4FxAgGeMXnBNP4Y/TrXwyDT4X+2809WJDXOK0k77TdIL0GoWQfID57yvwvVNbnPa5e6Q9Nl
	zek0kAMYokxBpPf23VIeWeHxnBlzTf9oDVpP3SfkovI5OioqSXnOyGJHcXIs13MVUaDxUlQ2h7+O2
	mfgABvkmh2Zu3JFfEyLxL2+eKO61CuRI88/mKRZ95epEu1A7WzsMUfaWlRWvnL/KsSmCtIflzpA7a
	faaQwO+Ag==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXKwf-001ZeL-IJ; Fri, 16 Apr 2021 09:39:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXKgi-001XEK-59; Fri, 16 Apr 2021 09:22:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=TxiyJSGM/f4gXdgVEErKSxpSxs9YkxRZ/vyj2Uebt+M=; b=YISmhXBL/T8+P2JI3fPqmj6+52
 jnszoND0907d4ISM3VRxNC/VQX9W1ndnZ2anzuG0FR2CwHgJbuHq89FrDB9KXXrV0Megk8t7jVOK/
 ZA6unhUydsjuFim3u6tqdoVs+JUBxLCicSvn9reR7kNpS4vwu97MP8HJnBOgWPAXkXtU9QEC/6dL0
 XEydusMIFGVba0CCmUOl1ISpN59mlC21q+XBolGFNcN4C/NOCSzcIiVA9gUjGCPogMtc/QgKThv4c
 ZWlA5znn/fgSJobaacpimiVSXvzcS9b7ccO9r/JkCnZ//eyjRmFtdB3QWGavdyuqwWhLRg76wCW5B
 I4rgP0Eg==;
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXKgd-009EsF-Fd; Fri, 16 Apr 2021 09:22:53 +0000
IronPort-SDR: Jf2XLxYt7f3AB8tUS4Fp/DK/LdwAazsH84f1wIJCkTVxPc40I2OGjYVB/TeKdTrLuNjgrMQA1i
 TztJU0gWcCBw==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="258972643"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="258972643"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 02:22:49 -0700
IronPort-SDR: LTD0pPovf9LjGKkamh7GgF4XV/IKF+D+L90RasUrL15smP1ANlzLBKOzFST/j8Nljx+LMCUYWA
 hnVETrRrlDAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="461914819"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174])
 ([10.237.72.174])
 by orsmga001.jf.intel.com with ESMTP; 16 Apr 2021 02:22:40 -0700
Subject: Re: [PATCH v19 1/2] scsi: ufs: Enable power management for wlun
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
 Colin Ian King <colin.king@canonical.com>, Yue Hu <huyue2@yulong.com>,
 Wei Yongjun <weiyongjun1@huawei.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Dinghao Liu <dinghao.liu@zju.edu.cn>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Satya Tangirala <satyat@google.com>, open list
 <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>
References: <cover.1618529652.git.asutoshd@codeaurora.org>
 <48ab92db5b0d3c11b8357f0faa99a4473465099d.1618529652.git.asutoshd@codeaurora.org>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <d28cb2d4-8f24-c2c4-e87e-bb51ac73af6e@intel.com>
Date: Fri, 16 Apr 2021 12:22:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <48ab92db5b0d3c11b8357f0faa99a4473465099d.1618529652.git.asutoshd@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_022251_606224_E95F0F71 
X-CRM114-Status: GOOD (  35.38  )
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

On 16/04/21 2:36 am, Asutosh Das wrote:
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
> This also registers a new scsi driver for rpmb wlun.
> This new driver is mostly used to clear rpmb uac.
> With this design, the driver would always be runtime resumed
> before system suspend.

I thought some more about that and I think we can still support
allowing runtime suspend to work with system suspend, without
too much difficulty. See ufshcd_suspend_prepare() below.

> 
> Fixed smatch warnings:
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Co-developed-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> ---

<SNIP>

> -static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
> +static int __ufshcd_wl_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  {
>  	int ret;
> -	enum uic_link_state old_link_state;
> +	enum uic_link_state old_link_state = hba->uic_link_state;
>  
> -	hba->pm_op_in_progress = 1;
> -	old_link_state = hba->uic_link_state;
> -
> -	ufshcd_hba_vreg_set_hpm(hba);
> -	ret = ufshcd_vreg_set_hpm(hba);
> -	if (ret)
> -		goto out;
> -
> -	/* Make sure clocks are enabled before accessing controller */
> -	ret = ufshcd_setup_clocks(hba, true);
> -	if (ret)
> -		goto disable_vreg;
> -
> -	/* enable the host irq as host controller would be active soon */
> -	ufshcd_enable_irq(hba);
> +	hba->pm_op_in_progress = true;
>  
>  	/*
>  	 * Call vendor specific resume callback. As these callbacks may access
> @@ -8868,7 +8858,7 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	 */
>  	ret = ufshcd_vops_resume(hba, pm_op);
>  	if (ret)
> -		goto disable_irq_and_vops_clks;
> +		goto out;
>  
>  	/* For DeepSleep, the only supported option is to have the link off */
>  	WARN_ON(ufshcd_is_ufs_dev_deepsleep(hba) && !ufshcd_is_link_off(hba));
> @@ -8916,42 +8906,219 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	if (hba->ee_usr_mask)
>  		ufshcd_write_ee_control(hba);
>  
> -	hba->clk_gating.is_suspended = false;
> -
>  	if (ufshcd_is_clkscaling_supported(hba))
> -		ufshcd_clk_scaling_suspend(hba, false);
> -
> -	/* Enable Auto-Hibernate if configured */
> -	ufshcd_auto_hibern8_enable(hba);
> +		ufshcd_resume_clkscaling(hba);

This still doesn't look right. ufshcd_resume_clkscaling()
doesn't update hba->clk_scaling.is_allowed whereas
ufshcd_clk_scaling_suspend() does.

>  
>  	if (hba->dev_info.b_rpm_dev_flush_capable) {
>  		hba->dev_info.b_rpm_dev_flush_capable = false;
>  		cancel_delayed_work(&hba->rpm_dev_flush_recheck_work);
>  	}
>  
> -	ufshcd_clear_ua_wluns(hba);
> -
> -	/* Schedule clock gating in case of no access to UFS device yet */
> -	ufshcd_release(hba);
> -
> +	/* Enable Auto-Hibernate if configured */
> +	ufshcd_auto_hibern8_enable(hba);
>  	goto out;
>  
>  set_old_link_state:
>  	ufshcd_link_state_transition(hba, old_link_state, 0);
>  vendor_suspend:
>  	ufshcd_vops_suspend(hba, pm_op);
> -disable_irq_and_vops_clks:
> +out:
> +	if (ret)
> +		ufshcd_update_evt_hist(hba, UFS_EVT_WL_RES_ERR, (u32)ret);
> +	hba->clk_gating.is_suspended = false;
> +	ufshcd_release(hba);
> +	hba->pm_op_in_progress = false;
> +	return ret;
> +}

<SNIP>

> +void ufshcd_resume_complete(struct device *dev)
> +{
> +	struct ufs_hba *hba = dev_get_drvdata(dev);
> +
> +	ufshcd_rpm_put(hba);
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
> +	 * Refer ufshcd_resume_complete()
> +	 */
> +	ufshcd_rpm_get_sync(hba);
> +
> +	return 0;
> +}

I think we can support allowing runtime suspend to work with
system suspend.  ufshcd_resume_complete() remains the same,
and ufshcd_suspend_prepare() is like this:


/*
 * SCSI assumes that runtime-pm and system-pm for scsi drivers are same, and it
 * doesn't wake up the device for system-suspend if it's runtime suspended.
 * However UFS doesn't follow that. The rpm-lvl and spm-lvl can be different in
 * UFS, so special care is needed.
 * Refer also ufshcd_resume_complete()
 */
int ufshcd_suspend_prepare(struct device *dev)
{
	struct ufs_hba *hba = dev_get_drvdata(dev);
	struct device *ufs_dev = &hba->sdev_ufs_device->sdev_gendev;
	enum ufs_dev_pwr_mode spm_pwr_mode;
	enum uic_link_state spm_link_state;
	unsigned long flags;
	bool rpm_state_ok;

	/*
	 * First prevent runtime suspend. Note this does not prevent runtime
	 * resume e.g. pm_runtime_get_sync() will still do the right thing.
	 */
	pm_runtime_get_noresume(ufs_dev);

	/* Now check if the rpm state is ok to use for spm */
	spin_lock_irqsave(&ufs_dev->power.lock, flags);

	spm_pwr_mode = ufs_get_pm_lvl_to_dev_pwr_mode(hba->spm_lvl);
	spm_link_state = ufs_get_pm_lvl_to_link_pwr_state(hba->spm_lvl);

	rpm_state_ok = pm_runtime_suspended(ufs_dev) &&
		       hba->curr_dev_pwr_mode == spm_pwr_mode &&
		       hba->uic_link_state == spm_link_state &&
		       !hba->dev_info.b_rpm_dev_flush_capable;

	spin_unlock_irqrestore(&ufs_dev->power.lock, flags);

	/* If is isn't, do a runtime resume */
	if (!rpm_state_ok)
		pm_runtime_resume(ufs_dev);

	return 0;
}


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
