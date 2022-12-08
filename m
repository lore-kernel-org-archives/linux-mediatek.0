Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720C6C3A5A7
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 06:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uoCAFfZqoCIhYB3mIGrt0A/of/lv5QagkPMUoGp/ew=; b=B4LsPs2brSt2ms8OPQXL+czKsg
	dQeavujAGmSrFssESaiq2h0E4GRg2jqA6yS2mFo2YTo6O35yw+YGkpyIqyArQWvwSL4QpO/kZfQuc
	R0UrBMXsCzFnmG+uE9SbF2hVQO1rqcj9MlWeqZJ+UyCyIzKT0keYGlCUFqnlgQGynGdk9d+ehNhro
	e0JxTZDIS+jRBuqd2D6OBhL0QvZUR9hGwD7biXdjY7Vn0zb4lyokiBMe8Bgik/upKVxBGARaIJiSP
	52dnn3BC/DeM3ypXi1UTexDdq8gy9fdH0XXf7y2hjnBxzBT9bK1MnmLv0IvuN0x4aa32yO9agPrU1
	LhfUnmVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Abr-004AOZ-K0; Thu, 08 Dec 2022 06:42:19 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Abh-004A9a-Sr
	for linux-mediatek@lists.infradead.org; Thu, 08 Dec 2022 06:42:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670481729; x=1702017729;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NcHgDkS2iIPJsvHqQw6KgdKSkSodTvp+XCZTiPJlg70=;
  b=BiOw7OnxoVfRsLjCzsOqJyOzxGWJ2fzg6vc8PJtJN+BNIn7yFaoQbdQ/
   6UTksIUFgo/J0iZJ8lOEDu+tASv9bHwb31jJbqz5O6sN8densRZqsMJk+
   gezc9w/yZJ8zifUoolsZT1ADD2PAXggC5TABBfULDFxtPPSdAbonPwjz0
   Wd5aIblf597CDdOz0+TQ33Ry/vwNTKM0By/WK+jAYJSAw3fqKrYjrXYft
   RKI0N6qg/kBAaWbjQuomiVum098+q2APSBYPzH9J8l/36Bu9f2MTZ45XO
   LzvGy+Ek/jzn9tq8TEWv1N7chyLAqD6occq8aDwwIsC5siD1qm5GFTBbl
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="297447989"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="297447989"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 22:42:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="679416894"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="679416894"
Received: from rnichen-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.252.39.190])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 22:42:01 -0800
Message-ID: <ce72f874-f403-82cf-115e-55d08532bd66@intel.com>
Date: Thu, 8 Dec 2022 08:41:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.1
Subject: Re: [PATCH v5] ufs: core: wlun suspend SSU/enter hibern8 fail
 recovery
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, stable@vger.kernel.org
References: <20221208061037.24313-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20221208061037.24313-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_224210_014310_380B4693 
X-CRM114-Status: GOOD (  18.53  )
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

On 8/12/22 08:10, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> When SSU/enter hibern8 fail in wlun suspend flow, trigger error
> handler and return busy to break the suspend.
> If not, wlun runtime pm status become error and the consumer will
> stuck in runtime suspend status.
> 
> Fixes: b294ff3e3449 ("scsi: ufs: core: Enable power management for wlun")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> ---
>  drivers/ufs/core/ufshcd.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index b1f59a5fe632..c91d58d1486a 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -106,6 +106,13 @@
>  		       16, 4, buf, __len, false);                        \
>  } while (0)
>  
> +#define ufshcd_force_error_recovery(hba) do {                           \
> +	spin_lock_irq(hba->host->host_lock);                            \
> +	hba->force_reset = true;                                        \
> +	ufshcd_schedule_eh_work(hba);                                   \
> +	spin_unlock_irq(hba->host->host_lock);                          \
> +} while (0)

Thanks for separating it out, but there is no reason to make this
a macro, so it should be a function, because functions offer nicer
structure and less chance of surprises. It need not be an inline
function either because the compiler can determine that, and this
is not a hot path. i.e.

static void ufshcd_force_error_recovery(struct ufs_hba *hba)
{
	spin_lock_irq(hba->host->host_lock);
	hba->force_reset = true;
	ufshcd_schedule_eh_work(hba);
	spin_unlock_irq(hba->host->host_lock);
}

> +
>  int ufshcd_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,
>  		     const char *prefix)
>  {
> @@ -9049,6 +9056,15 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  
>  		if (!hba->dev_info.b_rpm_dev_flush_capable) {
>  			ret = ufshcd_set_dev_pwr_mode(hba, req_dev_pwr_mode);
> +			if (ret && pm_op != UFS_SHUTDOWN_PM) {
> +				/*
> +				 * If return err in suspend flow, IO will hang.
> +				 * Trigger error handler and break suspend for
> +				 * error recovery.
> +				 */
> +				ufshcd_force_error_recovery(hba);
> +				ret = -EBUSY;
> +			}
>  			if (ret)
>  				goto enable_scaling;
>  		}
> @@ -9060,6 +9076,15 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	 */
>  	check_for_bkops = !ufshcd_is_ufs_dev_deepsleep(hba);
>  	ret = ufshcd_link_state_transition(hba, req_link_state, check_for_bkops);
> +	if (ret && pm_op != UFS_SHUTDOWN_PM) {
> +		/*
> +		 * If return err in suspend flow, IO will hang.
> +		 * Trigger error handler and break suspend for
> +		 * error recovery.
> +		 */
> +		ufshcd_force_error_recovery(hba);
> +		ret = -EBUSY;
> +	}
>  	if (ret)
>  		goto set_dev_active;
>  


