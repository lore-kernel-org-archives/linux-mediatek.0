Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E09FC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 10:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehOioe6XBZuoxzLfxLeRVX6uIAYjarPS7/ok+wFzxCM=; b=k9kW5CivS5O6QlRK2mRNFLXsVl
	XpT9eMHvNW/xNi8fQ7PtXSjtaRtA4XvsoRZkUQU0TnHW9uoQ6jFrSLEEKdUH+KpqZlCUvG0r8D860
	HcKwQEsndTrWETyKWvc6tJ2DSKBL1u+e5lJLUMdLEHLO1imr2oJXycYPCL43ICSTYWdlNY7fR8TmU
	GYN8n+9nunh69qoNPPlzYpFWBU9cdjbkdGLFpjn3WpGUmbmthIMGX9jOZ0wc8EqZU4KhRiJc5sGhp
	9oJB61eJi9j6+oAZog3E0Sr3Dj/Ov5BnoZlMaPA4oiDUTPZ/KiQwj2v7xxjNgpv5NVnXFSTAcRT/D
	ptOe1cnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0K9s-00FPIu-Ps; Wed, 30 Nov 2022 10:17:40 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0K9q-00FPGd-5C
	for linux-mediatek@lists.infradead.org; Wed, 30 Nov 2022 10:17:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669803458; x=1701339458;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bByuVskl/8XPlxn6hYxVCcRye/G/AXccEKig7foijVg=;
  b=bAuQCT8LV7UIkBVMojYshr75SD/hO5hCw8znbvKkQrJIxmUJ/bVso7Tr
   Jo04IohLO0OHc7Mrmrnf0SgLpgEBLlbnUZGKLLUMkIQ8moJaTm6XmAxtL
   MNXB9xXNCKGS9ZCFIhb8F8K8xe1VX2C4AAKDKiEMQBEwv9tkmgWpH4zO1
   yxRxLqQcomPIb3sGbGuPeNY0Zw0yLfZru/aS6RgD+yXdLJDzC92Utb1EB
   D3tPg0kIbSfN/r1kyLxBdlET23+nUHSstKknJWGReorY570Ab01Q3h4mJ
   ELJCWoHUMEsom9iu1DKw21aRQADToMWPHL+Yz6vY7khANt5Eeu5BZpg5A
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="401639917"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="401639917"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 02:17:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="594612031"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="594612031"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.252.53.75])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 02:17:08 -0800
Message-ID: <98bfafd3-c7b7-89b5-497a-aa694d0152dd@intel.com>
Date: Wed, 30 Nov 2022 12:17:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: Re: [PATCH v1] ufs: core: wlun suspend SSU fail recovery
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com
References: <20221101142410.31463-1-peter.wang@mediatek.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20221101142410.31463-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_021738_256568_E7825D2B 
X-CRM114-Status: GOOD (  17.47  )
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

On 1/11/22 16:24, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> When SSU fail in wlun suspend flow, trigger error handlder and

handlder -> handler

Why / how does SSU fail?

> return busy to break the suspend.
> If not, wlun runtime pm status become error and the consumer will
> stuck in runtime suspend status.
> 
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> ---
>  drivers/ufs/core/ufshcd.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index b1f59a5fe632..2f2d3d5d8684 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -8970,6 +8970,7 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	enum ufs_pm_level pm_lvl;
>  	enum ufs_dev_pwr_mode req_dev_pwr_mode;
>  	enum uic_link_state req_link_state;
> +	unsigned long flags;
>  
>  	hba->pm_op_in_progress = true;
>  	if (pm_op != UFS_SHUTDOWN_PM) {
> @@ -9049,8 +9050,21 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  
>  		if (!hba->dev_info.b_rpm_dev_flush_capable) {
>  			ret = ufshcd_set_dev_pwr_mode(hba, req_dev_pwr_mode);
> -			if (ret)
> +			if (ret) {
> +				/*
> +				 * If retrun err in suspend flow, IO will hang.

retrun -> return

> +				 * Trigger error handler and break suspend for
> +				 * error recovery.
> +				 */
> +				spin_lock_irqsave(hba->host->host_lock, flags);
> +				hba->force_reset = true;
> +				ufshcd_schedule_eh_work(hba);

__ufshcd_wl_suspend() is also used for shutdown and poweroff
where scheduling EH is not appropriate.

> +				spin_unlock_irqrestore(hba->host->host_lock,
> +					flags);
> +
> +				ret = -EBUSY;
>  				goto enable_scaling;
> +			}
>  		}
>  	}
>  


