Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B430DC4708E
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 17:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfnrJwYBnC1kWUdT7GbK2EkVI9hxaD+y1EqdGvZDudM=; b=rbIJcaZaXq/zjYBgvmjDaYT7Ox
	TC8Im+5kYEdxYn9WRFwoKXsDpPP8fOaydlDpS/C9HzDoSKr+tpgy3GjRUZymIDmlBWfxtv4JDM1UE
	PuiJn7m25d0haX+zzVa9Y2tdfv9fk6T/8aKm8OSSIG5GyqrLy/q1zqeRMjiMM5dwlyYx7r/k4NxIW
	+8nIoRLNLEb6S/MJoG5IjP+US938lalQ0UsI75P2XsL/Mp+aD93ff8paqDupf35BJ9Paz/ADfyKj7
	6noJ/DB3dfTuufT+ofV6/D1KXdzvKoHtcL71uvqauDSYt2XLeS8e0rrQTNIerIDS/2SKygzGCUj8W
	S0q5y0Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2y3D-007FYF-PU; Wed, 07 Dec 2022 17:17:43 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2y3B-007FRy-NA
	for linux-mediatek@lists.infradead.org; Wed, 07 Dec 2022 17:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670433461; x=1701969461;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8BTkkSN0FOm3ZX7WIxdDtwV5dm5TXFbbXMxWlJEKRaU=;
  b=CKHXvs6sFUSceGxo+vBPjF2heSD1vTspIbDfMQ/I4gZD8WTjGQpS1Xb2
   piy6cpOB/E8aFE84o67oHfAdRawiR4ov3W8AXiWw4a1mDkgoYoOzbw1zS
   IDPZtInZm4a87st/pcq2ibvBb5XoccUfBk1hbyefW7k1E0aN2KSkfg9hh
   6y3DGaC9O2XXrhFXwJocc1jP8surVemH/wJAfDBIFNtT9Zd1MYOFxLXv4
   26GGYumL4ezXgMWc/r8A5J+UniHc8ZImN06+5nloL1qRbnpYW8LLJKCWm
   lAskW9xzf0D7/BnCD3s1jR/NLt1X4iB4gT6URvIuKado30n+rxiih+fDy
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="315663340"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="315663340"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 09:17:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="788968522"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="788968522"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.252.38.130])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 09:17:32 -0800
Message-ID: <4ddd814b-c8ed-8ac8-710d-aa317882fdb1@intel.com>
Date: Wed, 7 Dec 2022 19:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.1
Subject: Re: [PATCH v4] ufs: core: wlun suspend SSU/enter hibern8 fail
 recovery
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com
References: <20221206031109.10609-1-peter.wang@mediatek.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20221206031109.10609-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_091741_798917_70FF2CA8 
X-CRM114-Status: GOOD (  16.48  )
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

On 6/12/22 05:11, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> When SSU/enter hibern8 fail in wlun suspend flow, trigger error
> handler and return busy to break the suspend.
> If not, wlun runtime pm status become error and the consumer will
> stuck in runtime suspend status.
> 
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>

Should this have a Fixes or stable tag?

Another minor comment below, otherwise:

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/ufs/core/ufshcd.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index b1f59a5fe632..98f105f32877 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -9049,6 +9049,19 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  
>  		if (!hba->dev_info.b_rpm_dev_flush_capable) {
>  			ret = ufshcd_set_dev_pwr_mode(hba, req_dev_pwr_mode);
> +			if (ret && pm_op != UFS_SHUTDOWN_PM) {
> +				/*
> +				 * If return err in suspend flow, IO will hang.
> +				 * Trigger error handler and break suspend for
> +				 * error recovery.
> +				 */
> +				spin_lock_irq(hba->host->host_lock);
> +				hba->force_reset = true;
> +				ufshcd_schedule_eh_work(hba);
> +				spin_unlock_irq(hba->host->host_lock);
> +
> +				ret = -EBUSY;
> +			}
>  			if (ret)
>  				goto enable_scaling;
>  		}
> @@ -9060,6 +9073,19 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	 */
>  	check_for_bkops = !ufshcd_is_ufs_dev_deepsleep(hba);
>  	ret = ufshcd_link_state_transition(hba, req_link_state, check_for_bkops);
> +	if (ret && pm_op != UFS_SHUTDOWN_PM) {
> +		/*
> +		 * If return err in suspend flow, IO will hang.
> +		 * Trigger error handler and break suspend for
> +		 * error recovery.
> +		 */
> +		spin_lock_irq(hba->host->host_lock);
> +		hba->force_reset = true;
> +		ufshcd_schedule_eh_work(hba);
> +		spin_unlock_irq(hba->host->host_lock);

Same 4 lines of code could be separated into a helper function.

> +
> +		ret = -EBUSY;
> +	}
>  	if (ret)
>  		goto set_dev_active;
>  


