Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5046BC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 12:17:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EED8A204EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 12:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EED8A204EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CpNVaGOBosETP0rf/EEBuc1MSGY4QfhbR5UVkJ/xU4k=; b=sC6i1Asuom423d/aXyCFWmPzb
	DEIirCpkwMBHm+aciwIk7Gp3OKCUyrqAJKeP+wZaBGMskVhvMBsu2S8whwJJ9dsTm7LAiKFuSsoGJ
	6UzqRQ/51FBLBwlMvoNxGJL8GAhjhVfSjTQGGe92BeaQZObGKAEfB7SbFlyGEZfETXSp/hrsfQR5H
	fifnZSN0iCUZc5sTxx75dmMVdfqzhfR5eT2RqP55IKWJFlglt4y9AvWmNe+21oIV3TxjUL4l4bY7L
	NHupJ8+Qp/ND8bBVIySeFRjGkMR1vhnE2ae4JAqxtYITS9qtidPhdvWZTPF6r+lf0SWlA3x0oh9pE
	Ma8bUytdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks35F-0008A3-Fv; Wed, 23 Dec 2020 12:17:37 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks35B-00088X-P7
 for linux-mediatek@lists.infradead.org; Wed, 23 Dec 2020 12:17:35 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608725853; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1KTK9or5xKlLwp6/3i+0Z3wDLsS0tFkJkzTfKBY0x10=;
 b=UQdwRm3rbEaXiYXwflDqK7vqM8nBPJKGchcm2FkF9TVq/nrH3J4FXK/WX1cHp3q7ZXmVC6RL
 bi7fgnEvrBEZzUoIi7BP4AN3P5xqX9srWYKT5qWbQ1Xvlv7L9K0cn4rWkZrYrNJMj6pouz4t
 Ts9f/oBf4MGmZPERaMG2kdVZrzc=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fe3355a7bc801dc4fa8f753 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Dec 2020 12:17:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4218BC433ED; Wed, 23 Dec 2020 12:17:29 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 029D0C433C6;
 Wed, 23 Dec 2020 12:17:26 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 23 Dec 2020 20:17:26 +0800
From: Can Guo <cang@codeaurora.org>
To: Ziqi Chen <ziqichen@codeaurora.org>
Subject: Re: [PATCH RFC v4 1/1] scsi: ufs: Fix ufs power down/on specs
 violation
In-Reply-To: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
References: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
Message-ID: <2c355b51a35c7d7da6dd1ce995a4615a@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_071734_213333_CB67A3F1 
X-CRM114-Status: GOOD (  29.52  )
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
Cc: nguyenb@codeaurora.org, Alim Akhtar <alim.akhtar@samsung.com>,
 vinholikatti@gmail.com, Bean Huo <beanhuo@micron.com>,
 Satya Tangirala <satyat@google.com>, jejb@linux.vnet.ibm.com,
 Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org,
 kwmad.kim@samsung.com, Andy Gross <agross@kernel.org>, kernel-team@android.com,
 salyzyn@google.com, linux-arm-msm@vger.kernel.org, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, Avri Altman <avri.altman@wdc.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 stanley.chu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 rnayak@codeaurora.org, saravanak@google.com, martin.petersen@oracle.com,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, hongwus@codeaurora.org,
 asutoshd@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-12-22 21:49, Ziqi Chen wrote:
> As per specs, e.g, JESD220E chapter 7.2, while powering
> off/on the ufs device, RST_N signal and REF_CLK signal
> should be between VSS(Ground) and VCCQ/VCCQ2.
> 
> To flexibly control device reset line, refactor the function
> ufschd_vops_device_reset(sturct ufs_hba *hba) to ufshcd_
> vops_device_reset(sturct ufs_hba *hba, bool asserted). The
> new parameter "bool asserted" is used to separate device reset
> line pulling down from pulling up.
> 
> Cc: Kiwoong Kim <kwmad.kim@samsung.com>
> Cc: Stanley Chu <stanley.chu@mediatek.com>
> Signed-off-by: Ziqi Chen <ziqichen@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufs-mediatek.c | 32 ++++++++++++++++----------------
>  drivers/scsi/ufs/ufs-qcom.c     | 24 +++++++++++++++---------
>  drivers/scsi/ufs/ufshcd.c       | 36 
> +++++++++++++++++++++++++-----------
>  drivers/scsi/ufs/ufshcd.h       |  8 ++++----
>  4 files changed, 60 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-mediatek.c 
> b/drivers/scsi/ufs/ufs-mediatek.c
> index 80618af..072f4db 100644
> --- a/drivers/scsi/ufs/ufs-mediatek.c
> +++ b/drivers/scsi/ufs/ufs-mediatek.c
> @@ -841,27 +841,27 @@ static int ufs_mtk_link_startup_notify(struct
> ufs_hba *hba,
>  	return ret;
>  }
> 
> -static int ufs_mtk_device_reset(struct ufs_hba *hba)
> +static int ufs_mtk_device_reset(struct ufs_hba *hba, bool asserted)
>  {
>  	struct arm_smccc_res res;
> 
> -	ufs_mtk_device_reset_ctrl(0, res);
> +	if (asserted) {
> +		ufs_mtk_device_reset_ctrl(0, res);
> 
> -	/*
> -	 * The reset signal is active low. UFS devices shall detect
> -	 * more than or equal to 1us of positive or negative RST_n
> -	 * pulse width.
> -	 *
> -	 * To be on safe side, keep the reset low for at least 10us.
> -	 */
> -	usleep_range(10, 15);
> -
> -	ufs_mtk_device_reset_ctrl(1, res);
> -
> -	/* Some devices may need time to respond to rst_n */
> -	usleep_range(10000, 15000);
> +		/*
> +		 * The reset signal is active low. UFS devices shall detect
> +		 * more than or equal to 1us of positive or negative RST_n
> +		 * pulse width.
> +		 *
> +		 * To be on safe side, keep the reset low for at least 10us.
> +		 */
> +		usleep_range(10, 15);
> +	} else {
> +		ufs_mtk_device_reset_ctrl(1, res);
> 
> -	dev_info(hba->dev, "device reset done\n");
> +		/* Some devices may need time to respond to rst_n */
> +		usleep_range(10000, 15000);
> +	}
> 
>  	return 0;
>  }
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index 2206b1e..fed10e5 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -1406,10 +1406,11 @@ static void ufs_qcom_dump_dbg_regs(struct 
> ufs_hba *hba)
>  /**
>   * ufs_qcom_device_reset() - toggle the (optional) device reset line
>   * @hba: per-adapter instance
> + * @asserted: assert or deassert device reset line
>   *
>   * Toggles the (optional) reset line to reset the attached device.
>   */
> -static int ufs_qcom_device_reset(struct ufs_hba *hba)
> +static int ufs_qcom_device_reset(struct ufs_hba *hba, bool asserted)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> 
> @@ -1417,15 +1418,20 @@ static int ufs_qcom_device_reset(struct ufs_hba 
> *hba)
>  	if (!host->device_reset)
>  		return -EOPNOTSUPP;
> 
> -	/*
> -	 * The UFS device shall detect reset pulses of 1us, sleep for 10us to
> -	 * be on the safe side.
> -	 */
> -	gpiod_set_value_cansleep(host->device_reset, 1);
> -	usleep_range(10, 15);
> +	if (asserted) {
> +		gpiod_set_value_cansleep(host->device_reset, 1);
> 
> -	gpiod_set_value_cansleep(host->device_reset, 0);
> -	usleep_range(10, 15);
> +		/*
> +		 * The UFS device shall detect reset pulses of 1us, sleep for 10us 
> to
> +		 * be on the safe side.
> +		 */
> +		usleep_range(10, 15);
> +	} else {
> +		gpiod_set_value_cansleep(host->device_reset, 0);
> +
> +		 /* Some devices may need time to respond to rst_n */
> +		usleep_range(10, 15);
> +	}
> 
>  	return 0;
>  }
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index e221add..f2daac2 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -585,7 +585,13 @@ static void ufshcd_device_reset(struct ufs_hba 
> *hba)
>  {
>  	int err;
> 
> -	err = ufshcd_vops_device_reset(hba);
> +	err = ufshcd_vops_device_reset(hba, true);
> +	if (err) {
> +		dev_err(hba->dev, "asserting device reset failed: %d\n", err);
> +		return;
> +	}
> +
> +	err = ufshcd_vops_device_reset(hba, false);
> 
>  	if (!err) {
>  		ufshcd_set_ufs_dev_active(hba);
> @@ -593,7 +599,11 @@ static void ufshcd_device_reset(struct ufs_hba 
> *hba)
>  			hba->wb_enabled = false;
>  			hba->wb_buf_flush_enabled = false;
>  		}
> +		dev_dbg(hba->dev, "device reset done\n");
> +	} else {
> +		dev_err(hba->dev, "deasserting device reset failed: %d\n", err);
>  	}
> +
>  	if (err != -EOPNOTSUPP)
>  		ufshcd_update_evt_hist(hba, UFS_EVT_DEV_RESET, err);
>  }
> @@ -8686,8 +8696,6 @@ static int ufshcd_suspend(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>  	if (ret)
>  		goto set_dev_active;
> 
> -	ufshcd_vreg_set_lpm(hba);
> -
>  disable_clks:
>  	/*
>  	 * Call vendor specific suspend callback. As these callbacks may 
> access
> @@ -8703,6 +8711,9 @@ static int ufshcd_suspend(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>  	 */
>  	ufshcd_disable_irq(hba);
> 
> +	if (ufshcd_is_link_off(hba))
> +		ufshcd_vops_device_reset(hba, true);
> +
>  	ufshcd_setup_clocks(hba, false);
> 
>  	if (ufshcd_is_clkgating_allowed(hba)) {
> @@ -8711,6 +8722,8 @@ static int ufshcd_suspend(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>  					hba->clk_gating.state);
>  	}
> 
> +	ufshcd_vreg_set_lpm(hba);
> +
>  	/* Put the host controller in low power mode if possible */
>  	ufshcd_hba_vreg_set_lpm(hba);
>  	goto out;
> @@ -8778,18 +8791,19 @@ static int ufshcd_resume(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>  	old_link_state = hba->uic_link_state;
> 
>  	ufshcd_hba_vreg_set_hpm(hba);
> +
> +	ret = ufshcd_vreg_set_hpm(hba);
> +	if (ret)
> +		goto out;
> +
>  	/* Make sure clocks are enabled before accessing controller */
>  	ret = ufshcd_setup_clocks(hba, true);
>  	if (ret)
> -		goto out;
> +		goto disable_vreg;
> 
>  	/* enable the host irq as host controller would be active soon */
>  	ufshcd_enable_irq(hba);
> 
> -	ret = ufshcd_vreg_set_hpm(hba);
> -	if (ret)
> -		goto disable_irq_and_vops_clks;
> -
>  	/*
>  	 * Call vendor specific resume callback. As these callbacks may 
> access
>  	 * vendor specific host controller register space call them when the
> @@ -8797,7 +8811,7 @@ static int ufshcd_resume(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>  	 */
>  	ret = ufshcd_vops_resume(hba, pm_op);
>  	if (ret)
> -		goto disable_vreg;
> +		goto disable_irq_and_vops_clks;
> 
>  	/* For DeepSleep, the only supported option is to have the link off 
> */
>  	WARN_ON(ufshcd_is_ufs_dev_deepsleep(hba) && 
> !ufshcd_is_link_off(hba));
> @@ -8864,8 +8878,6 @@ static int ufshcd_resume(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>  	ufshcd_link_state_transition(hba, old_link_state, 0);
>  vendor_suspend:
>  	ufshcd_vops_suspend(hba, pm_op);
> -disable_vreg:
> -	ufshcd_vreg_set_lpm(hba);
>  disable_irq_and_vops_clks:
>  	ufshcd_disable_irq(hba);
>  	if (hba->clk_scaling.is_allowed)
> @@ -8876,6 +8888,8 @@ static int ufshcd_resume(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>  		trace_ufshcd_clk_gating(dev_name(hba->dev),
>  					hba->clk_gating.state);
>  	}
> +disable_vreg:
> +	ufshcd_vreg_set_lpm(hba);
>  out:
>  	hba->pm_op_in_progress = 0;
>  	if (ret)
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index 9bb5f0e..d5fbaba 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -319,7 +319,7 @@ struct ufs_pwr_mode_info {
>   * @resume: called during host controller PM callback
>   * @dbg_register_dump: used to dump controller debug information
>   * @phy_initialization: used to initialize phys
> - * @device_reset: called to issue a reset pulse on the UFS device
> + * @device_reset: called to assert or deassert device reset line
>   * @program_key: program or evict an inline encryption key
>   * @event_notify: called to notify important events
>   */
> @@ -350,7 +350,7 @@ struct ufs_hba_variant_ops {
>  	int     (*resume)(struct ufs_hba *, enum ufs_pm_op);
>  	void	(*dbg_register_dump)(struct ufs_hba *hba);
>  	int	(*phy_initialization)(struct ufs_hba *);
> -	int	(*device_reset)(struct ufs_hba *hba);
> +	int	(*device_reset)(struct ufs_hba *hba, bool asserted);
>  	void	(*config_scaling_param)(struct ufs_hba *hba,
>  					struct devfreq_dev_profile *profile,
>  					void *data);
> @@ -1216,10 +1216,10 @@ static inline void
> ufshcd_vops_dbg_register_dump(struct ufs_hba *hba)
>  		hba->vops->dbg_register_dump(hba);
>  }
> 
> -static inline int ufshcd_vops_device_reset(struct ufs_hba *hba)
> +static inline int ufshcd_vops_device_reset(struct ufs_hba *hba, bool 
> asserted)
>  {
>  	if (hba->vops && hba->vops->device_reset)
> -		return hba->vops->device_reset(hba);
> +		return hba->vops->device_reset(hba, asserted);
> 
>  	return -EOPNOTSUPP;
>  }

Reviewed-by: Can Guo <cang@codeaurora.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
