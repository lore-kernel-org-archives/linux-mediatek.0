Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6002C07E97
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 05:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7Z77RjphbCPmCZMpxba+QpuWMpaeLFT6P+Ivspq6Yw=; b=tUapsBEFK5t9mw5EsiosFRtro9
	h8YsouhThp177+5ngwYmIx9/38f96x1FNT/UD8hibiI46d561Lc91jZJh0CWOqdBG6pRhybOxwC25
	nL30NwTPdO6ktU9I+W+PHfokxgf7KUUQHBQIfdPwfp3igzf/TqY7K5a55cL7Ai2d7ojoEL8/kNjal
	5EpEvX4ln+JxNrGFxTXysZLKdXcp5+BqYQlxz9OyihtbTzKdCvhN1HZHomKqzyOcSbBikZbsRvRGY
	4RHfG2Ob4R5GSTs+LKUPtO4uL38xg+yFsBPQW1nufX4CxYHZaipMwItq4lzGQUinU0lqiIWVnEt1M
	idu26P+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7qVa-0047Wf-2I;
	Tue, 28 Nov 2023 05:19:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7qVW-0047VT-2q;
	Tue, 28 Nov 2023 05:19:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C7BF2B83701;
	Tue, 28 Nov 2023 05:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967B3C433C8;
	Tue, 28 Nov 2023 05:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701148776;
	bh=g9llaC8ltgxTxxvDGbWBf0eVeSzPP+QM99uu9MtnmlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXwl340KlxLh/Qcxd819majfF8sVbrLImgzxRb0XIM3UJXo9uVOwgFoOG6k2guHVI
	 o7wPhMQBCL597BEc7kaByIivM7gxNy6wUfy+VwvYGy2T69BXMDcN7iIXaq3KMMpSD8
	 DMntNWM6zyieKYqDLGTFAb2AMTd2cP6YIszs2GfO1yV5W/NTUB3D6F7jZkJRNCkwwY
	 bg5qFcB05MIMr8z4AQSLpYvJqxJw+Qq//wppIkK1qThhMT5z+GkzuREQuTeDJw80YU
	 R0eip+0k28A07SNOfVge7HbQxAuWfa5K+RQxtoM4+l1dpfdfhNw/U3V9IFXumkI7S/
	 u+NB9JHi/1u1g==
Date: Tue, 28 Nov 2023 10:49:17 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Can Guo <quic_cang@quicinc.com>
Cc: bvanassche@acm.org, mani@kernel.org, adrian.hunter@intel.com,
	beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
	martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Stanley Chu <stanley.chu@mediatek.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Brian Masney <bmasney@redhat.com>,
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v5 01/10] scsi: ufs: host: Rename structure
 ufs_dev_params to ufs_host_params
Message-ID: <20231128051917.GB3088@thinkpad>
References: <1700729190-17268-1-git-send-email-quic_cang@quicinc.com>
 <1700729190-17268-2-git-send-email-quic_cang@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1700729190-17268-2-git-send-email-quic_cang@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_211939_187043_76E55D7E 
X-CRM114-Status: GOOD (  37.96  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 23, 2023 at 12:46:21AM -0800, Can Guo wrote:
> Structure ufs_dev_params is actually used in UFS host vendor drivers to
> declare host specific power mode parameters, like ufs_<vendor>_params or
> host_cap, which makes the code not very straightforward to read. Rename the
> structure ufs_dev_params to ufs_host_params and unify the declarations in
> all vendor drivers to host_params.
> 
> In addition, rename the two functions ufshcd_init_pwr_dev_param() and
> ufshcd_get_pwr_dev_param() which work based on the ufs_host_params to
> ufshcd_init_host_param() and ufshcd_negotiate_pwr_param() respectively to
> avoid confusions.
> 
> This change does not change any functionalities or logic.
> 
> Acked-by: Andrew Halaney <ahalaney@redhat.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/ufs/host/ufs-exynos.c    |  7 ++--
>  drivers/ufs/host/ufs-hisi.c      | 11 +++----
>  drivers/ufs/host/ufs-mediatek.c  | 12 +++----
>  drivers/ufs/host/ufs-qcom.c      | 12 +++----
>  drivers/ufs/host/ufshcd-pltfrm.c | 69 ++++++++++++++++++++--------------------
>  drivers/ufs/host/ufshcd-pltfrm.h | 10 +++---
>  6 files changed, 57 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
> index 71bd6db..674f2f4 100644
> --- a/drivers/ufs/host/ufs-exynos.c
> +++ b/drivers/ufs/host/ufs-exynos.c
> @@ -765,7 +765,7 @@ static int exynos_ufs_pre_pwr_mode(struct ufs_hba *hba,
>  {
>  	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
>  	struct phy *generic_phy = ufs->phy;
> -	struct ufs_dev_params ufs_exynos_cap;
> +	struct ufs_host_params host_params;
>  	int ret;
>  
>  	if (!dev_req_params) {
> @@ -774,10 +774,9 @@ static int exynos_ufs_pre_pwr_mode(struct ufs_hba *hba,
>  		goto out;
>  	}
>  
> -	ufshcd_init_pwr_dev_param(&ufs_exynos_cap);
> +	ufshcd_init_host_param(&host_params);
>  
> -	ret = ufshcd_get_pwr_dev_param(&ufs_exynos_cap,
> -				       dev_max_params, dev_req_params);
> +	ret = ufshcd_negotiate_pwr_param(&host_params, dev_max_params, dev_req_params);
>  	if (ret) {
>  		pr_err("%s: failed to determine capabilities\n", __func__);
>  		goto out;
> diff --git a/drivers/ufs/host/ufs-hisi.c b/drivers/ufs/host/ufs-hisi.c
> index 0229ac0..bb0c9a7 100644
> --- a/drivers/ufs/host/ufs-hisi.c
> +++ b/drivers/ufs/host/ufs-hisi.c
> @@ -293,9 +293,9 @@ static int ufs_hisi_link_startup_notify(struct ufs_hba *hba,
>  	return err;
>  }
>  
> -static void ufs_hisi_set_dev_cap(struct ufs_dev_params *hisi_param)
> +static void ufs_hisi_set_dev_cap(struct ufs_host_params *host_params)
>  {
> -	ufshcd_init_pwr_dev_param(hisi_param);
> +	ufshcd_init_host_param(host_params);
>  }
>  
>  static void ufs_hisi_pwr_change_pre_change(struct ufs_hba *hba)
> @@ -365,7 +365,7 @@ static int ufs_hisi_pwr_change_notify(struct ufs_hba *hba,
>  				       struct ufs_pa_layer_attr *dev_max_params,
>  				       struct ufs_pa_layer_attr *dev_req_params)
>  {
> -	struct ufs_dev_params ufs_hisi_cap;
> +	struct ufs_host_params host_params;
>  	int ret = 0;
>  
>  	if (!dev_req_params) {
> @@ -377,9 +377,8 @@ static int ufs_hisi_pwr_change_notify(struct ufs_hba *hba,
>  
>  	switch (status) {
>  	case PRE_CHANGE:
> -		ufs_hisi_set_dev_cap(&ufs_hisi_cap);
> -		ret = ufshcd_get_pwr_dev_param(&ufs_hisi_cap,
> -					       dev_max_params, dev_req_params);
> +		ufs_hisi_set_dev_cap(&host_params);
> +		ret = ufshcd_negotiate_pwr_param(&host_params, dev_max_params, dev_req_params);
>  		if (ret) {
>  			dev_err(hba->dev,
>  			    "%s: failed to determine capabilities\n", __func__);
> diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
> index fc61790..016067d 100644
> --- a/drivers/ufs/host/ufs-mediatek.c
> +++ b/drivers/ufs/host/ufs-mediatek.c
> @@ -996,16 +996,14 @@ static int ufs_mtk_pre_pwr_change(struct ufs_hba *hba,
>  				  struct ufs_pa_layer_attr *dev_req_params)
>  {
>  	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
> -	struct ufs_dev_params host_cap;
> +	struct ufs_host_params host_params;
>  	int ret;
>  
> -	ufshcd_init_pwr_dev_param(&host_cap);
> -	host_cap.hs_rx_gear = UFS_HS_G5;
> -	host_cap.hs_tx_gear = UFS_HS_G5;
> +	ufshcd_init_host_param(&host_params);
> +	host_params.hs_rx_gear = UFS_HS_G5;
> +	host_params.hs_tx_gear = UFS_HS_G5;
>  
> -	ret = ufshcd_get_pwr_dev_param(&host_cap,
> -				       dev_max_params,
> -				       dev_req_params);
> +	ret = ufshcd_negotiate_pwr_param(&host_params, dev_max_params, dev_req_params);
>  	if (ret) {
>  		pr_info("%s: failed to determine capabilities\n",
>  			__func__);
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 96cb8b5..aee66a3 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -898,7 +898,7 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
>  				struct ufs_pa_layer_attr *dev_req_params)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> -	struct ufs_dev_params ufs_qcom_cap;
> +	struct ufs_host_params host_params;
>  	int ret = 0;
>  
>  	if (!dev_req_params) {
> @@ -908,15 +908,13 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
>  
>  	switch (status) {
>  	case PRE_CHANGE:
> -		ufshcd_init_pwr_dev_param(&ufs_qcom_cap);
> -		ufs_qcom_cap.hs_rate = UFS_QCOM_LIMIT_HS_RATE;
> +		ufshcd_init_host_param(&host_params);
> +		host_params.hs_rate = UFS_QCOM_LIMIT_HS_RATE;
>  
>  		/* This driver only supports symmetic gear setting i.e., hs_tx_gear == hs_rx_gear */
> -		ufs_qcom_cap.hs_tx_gear = ufs_qcom_cap.hs_rx_gear = ufs_qcom_get_hs_gear(hba);
> +		host_params.hs_tx_gear = host_params.hs_rx_gear = ufs_qcom_get_hs_gear(hba);
>  
> -		ret = ufshcd_get_pwr_dev_param(&ufs_qcom_cap,
> -					       dev_max_params,
> -					       dev_req_params);
> +		ret = ufshcd_negotiate_pwr_param(&host_params, dev_max_params, dev_req_params);
>  		if (ret) {
>  			dev_err(hba->dev, "%s: failed to determine capabilities\n",
>  					__func__);
> diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
> index da2558e..9ec11b9 100644
> --- a/drivers/ufs/host/ufshcd-pltfrm.c
> +++ b/drivers/ufs/host/ufshcd-pltfrm.c
> @@ -285,61 +285,60 @@ static int ufshcd_parse_operating_points(struct ufs_hba *hba)
>  }
>  
>  /**
> - * ufshcd_get_pwr_dev_param - get finally agreed attributes for
> - *                            power mode change
> - * @pltfrm_param: pointer to platform parameters
> + * ufshcd_negotiate_pwr_param - find power mode settings that are supported by
> +				both the controller and the device
> + * @host_param: pointer to host parameters
>   * @dev_max: pointer to device attributes
>   * @agreed_pwr: returned agreed attributes
>   *
>   * Return: 0 on success, non-zero value on failure.
>   */
> -int ufshcd_get_pwr_dev_param(const struct ufs_dev_params *pltfrm_param,
> -			     const struct ufs_pa_layer_attr *dev_max,
> -			     struct ufs_pa_layer_attr *agreed_pwr)
> +int ufshcd_negotiate_pwr_param(const struct ufs_host_params *host_param,
> +			       const struct ufs_pa_layer_attr *dev_max,
> +			       struct ufs_pa_layer_attr *agreed_pwr)
>  {
> -	int min_pltfrm_gear;
> +	int min_host_gear;
>  	int min_dev_gear;
>  	bool is_dev_sup_hs = false;
> -	bool is_pltfrm_max_hs = false;
> +	bool is_host_max_hs = false;
>  
>  	if (dev_max->pwr_rx == FAST_MODE)
>  		is_dev_sup_hs = true;
>  
> -	if (pltfrm_param->desired_working_mode == UFS_HS_MODE) {
> -		is_pltfrm_max_hs = true;
> -		min_pltfrm_gear = min_t(u32, pltfrm_param->hs_rx_gear,
> -					pltfrm_param->hs_tx_gear);
> +	if (host_param->desired_working_mode == UFS_HS_MODE) {
> +		is_host_max_hs = true;
> +		min_host_gear = min_t(u32, host_param->hs_rx_gear,
> +					host_param->hs_tx_gear);
>  	} else {
> -		min_pltfrm_gear = min_t(u32, pltfrm_param->pwm_rx_gear,
> -					pltfrm_param->pwm_tx_gear);
> +		min_host_gear = min_t(u32, host_param->pwm_rx_gear,
> +					host_param->pwm_tx_gear);
>  	}
>  
>  	/*
> -	 * device doesn't support HS but
> -	 * pltfrm_param->desired_working_mode is HS,
> -	 * thus device and pltfrm_param don't agree
> +	 * device doesn't support HS but host_param->desired_working_mode is HS,
> +	 * thus device and host_param don't agree
>  	 */
> -	if (!is_dev_sup_hs && is_pltfrm_max_hs) {
> +	if (!is_dev_sup_hs && is_host_max_hs) {
>  		pr_info("%s: device doesn't support HS\n",
>  			__func__);
>  		return -ENOTSUPP;
> -	} else if (is_dev_sup_hs && is_pltfrm_max_hs) {
> +	} else if (is_dev_sup_hs && is_host_max_hs) {
>  		/*
>  		 * since device supports HS, it supports FAST_MODE.
> -		 * since pltfrm_param->desired_working_mode is also HS
> +		 * since host_param->desired_working_mode is also HS
>  		 * then final decision (FAST/FASTAUTO) is done according
>  		 * to pltfrm_params as it is the restricting factor
>  		 */
> -		agreed_pwr->pwr_rx = pltfrm_param->rx_pwr_hs;
> +		agreed_pwr->pwr_rx = host_param->rx_pwr_hs;
>  		agreed_pwr->pwr_tx = agreed_pwr->pwr_rx;
>  	} else {
>  		/*
> -		 * here pltfrm_param->desired_working_mode is PWM.
> +		 * here host_param->desired_working_mode is PWM.
>  		 * it doesn't matter whether device supports HS or PWM,
> -		 * in both cases pltfrm_param->desired_working_mode will
> +		 * in both cases host_param->desired_working_mode will
>  		 * determine the mode
>  		 */
> -		agreed_pwr->pwr_rx = pltfrm_param->rx_pwr_pwm;
> +		agreed_pwr->pwr_rx = host_param->rx_pwr_pwm;
>  		agreed_pwr->pwr_tx = agreed_pwr->pwr_rx;
>  	}
>  
> @@ -349,9 +348,9 @@ int ufshcd_get_pwr_dev_param(const struct ufs_dev_params *pltfrm_param,
>  	 * the same decision will be made for rx
>  	 */
>  	agreed_pwr->lane_tx = min_t(u32, dev_max->lane_tx,
> -				    pltfrm_param->tx_lanes);
> +				    host_param->tx_lanes);
>  	agreed_pwr->lane_rx = min_t(u32, dev_max->lane_rx,
> -				    pltfrm_param->rx_lanes);
> +				    host_param->rx_lanes);
>  
>  	/* device maximum gear is the minimum between device rx and tx gears */
>  	min_dev_gear = min_t(u32, dev_max->gear_rx, dev_max->gear_tx);
> @@ -364,26 +363,26 @@ int ufshcd_get_pwr_dev_param(const struct ufs_dev_params *pltfrm_param,
>  	 * what is the gear, as it is the one that also decided previously what
>  	 * pwr the device will be configured to.
>  	 */
> -	if ((is_dev_sup_hs && is_pltfrm_max_hs) ||
> -	    (!is_dev_sup_hs && !is_pltfrm_max_hs)) {
> +	if ((is_dev_sup_hs && is_host_max_hs) ||
> +	    (!is_dev_sup_hs && !is_host_max_hs)) {
>  		agreed_pwr->gear_rx =
> -			min_t(u32, min_dev_gear, min_pltfrm_gear);
> +			min_t(u32, min_dev_gear, min_host_gear);
>  	} else if (!is_dev_sup_hs) {
>  		agreed_pwr->gear_rx = min_dev_gear;
>  	} else {
> -		agreed_pwr->gear_rx = min_pltfrm_gear;
> +		agreed_pwr->gear_rx = min_host_gear;
>  	}
>  	agreed_pwr->gear_tx = agreed_pwr->gear_rx;
>  
> -	agreed_pwr->hs_rate = pltfrm_param->hs_rate;
> +	agreed_pwr->hs_rate = host_param->hs_rate;
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(ufshcd_get_pwr_dev_param);
> +EXPORT_SYMBOL_GPL(ufshcd_negotiate_pwr_param);
>  
> -void ufshcd_init_pwr_dev_param(struct ufs_dev_params *dev_param)
> +void ufshcd_init_host_param(struct ufs_host_params *host_param)
>  {
> -	*dev_param = (struct ufs_dev_params){
> +	*host_param = (struct ufs_host_params){
>  		.tx_lanes = UFS_LANE_2,
>  		.rx_lanes = UFS_LANE_2,
>  		.hs_rx_gear = UFS_HS_G3,
> @@ -398,7 +397,7 @@ void ufshcd_init_pwr_dev_param(struct ufs_dev_params *dev_param)
>  		.desired_working_mode = UFS_HS_MODE,
>  	};
>  }
> -EXPORT_SYMBOL_GPL(ufshcd_init_pwr_dev_param);
> +EXPORT_SYMBOL_GPL(ufshcd_init_host_param);
>  
>  /**
>   * ufshcd_pltfrm_init - probe routine of the driver
> diff --git a/drivers/ufs/host/ufshcd-pltfrm.h b/drivers/ufs/host/ufshcd-pltfrm.h
> index a86a3ad..2d4d047 100644
> --- a/drivers/ufs/host/ufshcd-pltfrm.h
> +++ b/drivers/ufs/host/ufshcd-pltfrm.h
> @@ -10,7 +10,7 @@
>  #define UFS_PWM_MODE 1
>  #define UFS_HS_MODE  2
>  
> -struct ufs_dev_params {
> +struct ufs_host_params {
>  	u32 pwm_rx_gear;        /* pwm rx gear to work in */
>  	u32 pwm_tx_gear;        /* pwm tx gear to work in */
>  	u32 hs_rx_gear;         /* hs rx gear to work in */
> @@ -25,10 +25,10 @@ struct ufs_dev_params {
>  	u32 desired_working_mode;
>  };
>  
> -int ufshcd_get_pwr_dev_param(const struct ufs_dev_params *dev_param,
> -			     const struct ufs_pa_layer_attr *dev_max,
> -			     struct ufs_pa_layer_attr *agreed_pwr);
> -void ufshcd_init_pwr_dev_param(struct ufs_dev_params *dev_param);
> +int ufshcd_negotiate_pwr_param(const struct ufs_host_params *host_param,
> +			       const struct ufs_pa_layer_attr *dev_max,
> +			       struct ufs_pa_layer_attr *agreed_pwr);
> +void ufshcd_init_host_param(struct ufs_host_params *host_param);
>  int ufshcd_pltfrm_init(struct platform_device *pdev,
>  		       const struct ufs_hba_variant_ops *vops);
>  int ufshcd_populate_vreg(struct device *dev, const char *name,
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்

