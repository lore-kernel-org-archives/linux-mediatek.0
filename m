Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC347C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 11:11:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5007C6124B
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 11:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5007C6124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ioFKdM1kIqbqYtoSLv+3FJjelVPn5TV1KX2cClMeQdc=; b=ecqD/i3wS4AV5o7LQTab4mgCe
	jDrkLyybGiKTe7NnokCOsF8nF7a0WunPG6QgZEj3Bk4aqU4ilJDGm1XBxB30/rUyPK7Ip38sdaP2h
	LRYCrm/AdTzLDikT4R8X1OlpUbk4zWztQ61g74V4dwo+H7RWvyPh0Yl8Pf4kpb5kzRLtTyQyV7lwb
	IyBHsEpAs6ASrIqqGWJ1C0AZ8U1VnD1TPIT9f4icBFyIVUxPv3rGtoQs3pL86Ls7uoUuK0ZV50/Iz
	qZiTSF7qXFdUMvSs82Ym1zXFFICex9H9JcGDzrArIaMFZbJZbgokzXhM6yRsdyUwb2k2cdyq+YowH
	MPtPdYIsA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWztd-00FuBf-El; Thu, 15 Apr 2021 11:10:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWzpm-00Fsnj-7B; Thu, 15 Apr 2021 11:06:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=4c2r6O30bVtoowAnnuKMVC5QjJQ6ZS5QMNC95v3ffAQ=; b=f/hKgffXdEuzNKAY1hwLHfpp7y
 F+0SUmZOVKg5KDZersZzErw6WVaOHHBKZHLtGJuzWP3zJZtt+v/S4Q6uif/wBSswhYcDEeZjVPLvS
 bUZYf5a4y7eDN/rSIO1HAftHrG9qOpLln7LQrn2hJ0O00SseZtamKDeprmK3oLCmFB9SxgRbzo0Fw
 r6vMrimNOzIRClNvIFz+I7c4fpWOhOZ6vNqX8fEZ/lTDlNJg3PTUgGcdHTSpsWxHd1dCSyy5Wn4v3
 1aqi8Rf28bGe+8wcQlT79mgckRvG3pmIj8XSZi/z/HiGgs6y6+FuIbB4T+60GI78/zb3UMCbx45a2
 tqbjYE0A==;
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWzpj-008VyW-Am; Thu, 15 Apr 2021 11:06:52 +0000
IronPort-SDR: qNFnUkzK63XBvyE8tDoH9X+rWcLm2le2DHBOWO1RDxPXJKIHtFSlTQY1x+t0p0fh5RNjONN/sk
 oYU6C0vV3ytg==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="215337155"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="215337155"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 04:06:48 -0700
IronPort-SDR: rFTEe/7ieLL7MmVazHp1Wky/wR37tK4aX1XplAuERrJlemRGGQRyIfYeGq5Jc0eYJ7JE4bSWUR
 l4FyJaTuX3sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="382695131"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174])
 ([10.237.72.174])
 by orsmga003.jf.intel.com with ESMTP; 15 Apr 2021 04:06:41 -0700
Subject: Re: [PATCH v18 1/2] scsi: ufs: Enable power management for wlun
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
 Yue Hu <huyue2@yulong.com>, Wei Yongjun <weiyongjun1@huawei.com>,
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
References: <cover.1618426513.git.asutoshd@codeaurora.org>
 <d1a6af736730b9d79f977100286c5d9325546ac2.1618426513.git.asutoshd@codeaurora.org>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <47049515-be9d-23b0-6dbd-24b3b09fdb82@intel.com>
Date: Thu, 15 Apr 2021 14:06:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d1a6af736730b9d79f977100286c5d9325546ac2.1618426513.git.asutoshd@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_040651_420268_640C549B 
X-CRM114-Status: GOOD (  29.32  )
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

On 14/04/21 9:58 pm, Asutosh Das wrote:
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

Can you also explain the new driver for RPMB WLUN and UAC changes here?

And also mention that the driver will now always be runtime
resumed before system suspend.

> 
> Co-developed-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> ---

<SNIP>

> +static void ufshcd_setup_links(struct ufs_hba *hba, struct scsi_device *sdev)
> +{
> +	struct device_link *link;
> +
> +	/*
> +	 * device wlun is the supplier & rest of the luns are consumers
> +	 * This ensures that device wlun suspends after all other luns.
> +	 */
> +	if (hba->sdev_ufs_device) {
> +		link = device_link_add(&sdev->sdev_gendev,
> +				       &hba->sdev_ufs_device->sdev_gendev,
> +				       DL_FLAG_PM_RUNTIME|DL_FLAG_RPM_ACTIVE);

"|" could be surrounded by spaces i.e.
				       DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);

> +		if (!link) {
> +			dev_err(&sdev->sdev_gendev, "Failed establishing link - %s\n",
> +				dev_name(&hba->sdev_ufs_device->sdev_gendev));
> +			return;
> +		}
> +		hba->luns_avail--;
> +		/* Ignore REPORT_LUN wlun probing */
> +		if (hba->luns_avail == 1) {
> +			ufshcd_rpm_put(hba);
> +			return;
> +		}
> +	} else {
> +		/* device wlun is probed */
> +		hba->luns_avail--;
> +	}
> +}

<SNIP>

> @@ -8916,42 +8906,214 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	if (hba->ee_usr_mask)
>  		ufshcd_write_ee_control(hba);
>  
> -	hba->clk_gating.is_suspended = false;
> -
> -	if (ufshcd_is_clkscaling_supported(hba))
> -		ufshcd_clk_scaling_suspend(hba, false);
> -
> -	/* Enable Auto-Hibernate if configured */
> -	ufshcd_auto_hibern8_enable(hba);
> +	if (hba->clk_scaling.is_allowed)
> +		ufshcd_resume_clkscaling(hba);

We don't use clks, regulators, clk gating, clk scaling, but the
original code looks more correct because hba->clk_scaling.is_allowed
will have been set to false by ufshcd_clk_scaling_suspend(hba, true)
in __ufshcd_wl_suspend().

<SNIP>

> +#ifdef CONFIG_PM_SLEEP
> +static int ufshcd_wl_suspend(struct device *dev)
> +{
> +	struct scsi_device *sdev = to_scsi_device(dev);
> +	struct ufs_hba *hba;
> +	int ret;

For below:
	int ret = 0;

> +	ktime_t start = ktime_get();
> +
> +	hba = shost_priv(sdev->host);
> +	down(&hba->host_sem);

If we get here with dev runtime suspended, then skip
__ufshcd_wl_suspend() i.e.

	if (pm_runtime_suspended(dev))
		goto out;

> +	ret = __ufshcd_wl_suspend(hba, UFS_SYSTEM_PM);
> +	if (ret) {
> +		dev_err(&sdev->sdev_gendev, "%s failed: %d\n", __func__,  ret);
> +		up(&hba->host_sem);
> +	} else {
> +		hba->is_sys_suspended = true;
> +	}

out:
	if (!ret)
		hba->is_sys_suspended = true;

> +
> +	trace_ufshcd_wl_suspend(dev_name(dev), ret,
> +		ktime_to_us(ktime_sub(ktime_get(), start)),
> +		hba->curr_dev_pwr_mode, hba->uic_link_state);
> +
> +	return ret;
> +}

<SNIP>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
