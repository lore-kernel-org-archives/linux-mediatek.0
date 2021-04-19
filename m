Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7801AC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 18:37:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAAC861246
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 18:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAAC861246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vAK0A/6/EGTvsnSMkgL3u3nh1QrnuFHnkVc1l0SXg7I=; b=bZ+jREPNiY3CagFus4WjHd19p
	uHrtK0TDX4iyqBKk86MNvdk7Z03dQz4fsRbIFp2/yefOmaGwcVcVxJf8IWl7HYMRUM0FoTmjDlZ3Z
	o/5Xl9XqpuPZc7hp3M2BXXCv6MypQd2jbMHo6z/ctk5rgOX/5F1QbxJ3VGDBO2SfY12RYzP5JTwir
	raMUuSwqieCbSpRV/9hRrfy6QTa3EXvqlLzVtkO5I69TV8K/1Jis5bGartZvqk6COE6havo5217gt
	c1Vit3kq/N6ot3MHe4gHagGgca5ObLeXHXddOXVMiQOLXJ22FZvRTxj/wpVwBbYdPz4YN5q8zDAW8
	oInF/lgGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYYmC-00ASOV-KL; Mon, 19 Apr 2021 18:37:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYYm1-00ASO9-4D; Mon, 19 Apr 2021 18:37:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=ZPOmobRjcv7IQzwVSmVWdEyaH7QTwGtUqDg+swchP2k=; b=IkXEkuu+NW45uhzzFO8KR8OWnx
 0Ezu94uKQfEC9NZwnTVKvKePvrUn9/9RxuO4NViEJ0zDhOlhKuP4OeO35NxekZp502cS/AZCfDoeJ
 goWJ+evq1qA4HLUTxkXABJaHURdOtlpSXhLWRB8rSNiPRgh3/5f87k8ZpNIzvj3Y/EiE87AxZVJsl
 hKPKC+jPc0HhOphIV5SthQg9deLkLtMkeHKzUEeDr84qYDr64MgPpVhByBS0N471m8E3MSi1Z/XLo
 m7dMFeQToJMx17iyQk2yx2uLSFy6CvIRqX+Ko9nKqlA8Ld3QzSKrvutnaAR+DN9y8w4RRMPyIdRt3
 g1TokGmw==;
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYYlt-00BasY-Cy; Mon, 19 Apr 2021 18:37:26 +0000
IronPort-SDR: vvqnrP0AzWNFT5ju8M2mwJLnjB0egQXhyM6Cp0lE+CXvkCcJtxEDku9V0kcam1axazp4lUmp0x
 QPRVIL7zLp6A==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="182873674"
X-IronPort-AV: E=Sophos;i="5.82,234,1613462400"; d="scan'208";a="182873674"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 11:37:19 -0700
IronPort-SDR: mVnC+7o/ux30dgipxuCPMQsRxirpqDL70m7B/udEKgj4RQEgeyqfuV8cNyuXo9lVBQPOv0TWk1
 HU6sC2AH2gvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,234,1613462400"; d="scan'208";a="420108005"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174])
 ([10.237.72.174])
 by fmsmga008.fm.intel.com with ESMTP; 19 Apr 2021 11:37:12 -0700
Subject: Re: [PATCH v20 1/2] scsi: ufs: Enable power management for wlun
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
 Colin Ian King <colin.king@canonical.com>,
 Wei Yongjun <weiyongjun1@huawei.com>, Yue Hu <huyue2@yulong.com>,
 Bart van Assche <bvanassche@acm.org>,
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
References: <cover.1618600985.git.asutoshd@codeaurora.org>
 <d660b8d4e1fb192810abd09a8ff0ef4d9f6b96cd.1618600985.git.asutoshd@codeaurora.org>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <fdadd467-b613-d800-18c5-be064396fd10@intel.com>
Date: Mon, 19 Apr 2021 21:37:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d660b8d4e1fb192810abd09a8ff0ef4d9f6b96cd.1618600985.git.asutoshd@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_113721_518814_3E770F41 
X-CRM114-Status: GOOD (  35.60  )
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

On 16/04/21 10:49 pm, Asutosh Das wrote:
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
> hba resumes. This also registers a new scsi driver for rpmb wlun.
> This new driver is mostly used to clear rpmb uac.
> 
> Fixed smatch warnings:
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Co-developed-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> ---

I came across 3 issues while testing.  See comments below.

<SNIP>

> @@ -5753,12 +5797,13 @@ static void ufshcd_clk_scaling_suspend(struct ufs_hba *hba, bool suspend)
>  
>  static void ufshcd_err_handling_prepare(struct ufs_hba *hba)
>  {
> -	pm_runtime_get_sync(hba->dev);
> -	if (pm_runtime_status_suspended(hba->dev) || hba->is_sys_suspended) {
> +	ufshcd_rpm_get_sync(hba);

hba->sdev_ufs_device could be NULL.
Need to add a check for that in ufshcd_err_handling_should_stop()

> +	if (pm_runtime_status_suspended(&hba->sdev_ufs_device->sdev_gendev) ||
> +	    hba->is_sys_suspended) {
>  		enum ufs_pm_op pm_op;
>  
>  		/*
> -		 * Don't assume anything of pm_runtime_get_sync(), if
> +		 * Don't assume anything of resume, if
>  		 * resume fails, irq and clocks can be OFF, and powers
>  		 * can be OFF or in LPM.
>  		 */
> @@ -5794,7 +5839,7 @@ static void ufshcd_err_handling_unprepare(struct ufs_hba *hba)
>  	if (ufshcd_is_clkscaling_supported(hba))
>  		ufshcd_clk_scaling_suspend(hba, false);
>  	ufshcd_clear_ua_wluns(hba);

ufshcd_clear_ua_wluns() deadlocks trying to clear UFS_UPIU_RPMB_WLUN
if sdev_rpmb is suspended and sdev_ufs_device is suspending.
e.g. ufshcd_wl_suspend() is waiting on host_sem while ufshcd_err_handler()
is running, at which point sdev_rpmb has already suspended.

> -	pm_runtime_put(hba->dev);
> +	ufshcd_rpm_put(hba);
>  }

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
> +	struct device *ufs_dev = &hba->sdev_ufs_device->sdev_gendev;
> +	enum ufs_dev_pwr_mode spm_pwr_mode;
> +	enum uic_link_state spm_link_state;
> +	unsigned long flags;
> +	bool rpm_state_ok;
> +
> +	/*
> +	 * SCSI assumes that runtime-pm and system-pm for scsi drivers
> +	 * are same. And it doesn't wake up the device for system-suspend
> +	 * if it's runtime suspended. But ufs doesn't follow that.
> +	 * The rpm-lvl and spm-lvl can be different in ufs.
> +	 * However, if the current_{pwr_mode, link_state} is same as the
> +	 * desired_{pwr_mode, link_state}, there's no need to rpm resume
> +	 * the device.
> +	 * Refer ufshcd_resume_complete()
> +	 */
> +	pm_runtime_get_noresume(ufs_dev);
> +
> +	spin_lock_irqsave(&ufs_dev->power.lock, flags);
> +
> +	spm_pwr_mode = ufs_get_pm_lvl_to_dev_pwr_mode(hba->spm_lvl);
> +	spm_link_state = ufs_get_pm_lvl_to_link_pwr_state(hba->spm_lvl);
> +
> +	rpm_state_ok = pm_runtime_suspended(ufs_dev) &&
> +		hba->curr_dev_pwr_mode == spm_pwr_mode &&
> +		hba->uic_link_state == spm_link_state &&
> +		!hba->dev_info.b_rpm_dev_flush_capable;
> +
> +	spin_unlock_irqrestore(&ufs_dev->power.lock, flags);
> +
> +	if (!rpm_state_ok) {
> +		int ret = pm_runtime_resume(ufs_dev);
> +
> +		if (ret < 0 && ret != -EACCES) {
> +			pm_runtime_put(ufs_dev);
> +			return ret;
> +		}
> +	}
> +	return 0;
> +}

Unfortunately this does not work because SCSI PM forcibly sets
the sdevs to runtime active after system resume.  Really we should
change SCSI PM to call the driver's .prepare / .complete then we could
use direct complete, but let's leave that for now and go back to
before, but allowing for errors and !hba->sdev_ufs_device. e.g.

void ufshcd_resume_complete(struct device *dev)
{
	struct ufs_hba *hba = dev_get_drvdata(dev);

	if (hba->complete_put) {
		hba->complete_put = false;
		ufshcd_rpm_put(hba);
	}
}
EXPORT_SYMBOL_GPL(ufshcd_resume_complete);

int ufshcd_suspend_prepare(struct device *dev)
{
	struct ufs_hba *hba = dev_get_drvdata(dev);
	int ret;

	if (!hba->sdev_ufs_device)
		return 0;

	ret = ufshcd_rpm_get_sync(hba);
	if (ret < 0 && ret != -EACCES) {
		ufshcd_rpm_put(hba);
		return ret;
	}
	hba->complete_put = true;
	return 0;
}
EXPORT_SYMBOL_GPL(ufshcd_suspend_prepare);


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
