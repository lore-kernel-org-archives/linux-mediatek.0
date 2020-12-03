Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF785C63777
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 05:49:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42F4720B80
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 05:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42F4720B80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OFZ2GvEVdfhNUEB11RI5Cr0VKPGgNHg/RNKuwY3Gm3c=; b=aapBJH0j4fdv6Ly6Sq7ats4dF
	zycQ3Kq0BRGYtIUe8Kwa9y0wuuujd2dRp5GX8NjUXBP1LRqZPU0VNZYYiuEaf9PdBuE9vBL2S2cAz
	B4bxUi41ZYxm3OMfb6QP6XTgU/hynWYSAFccAp+xGSC8brbZgDYX6Ys1QhZPmU40yzfs1ZgV2jpkW
	STaQLqdC3mN16+2ZpmmkG5GN0xOC3qWypiTeeiP5jwVBtTUYRP2ROrTJXnkC9aNXJRZ1HcfS5Q81k
	fXFEVPxGHSq7iVoqrj9fV83ytrKSghpbnZDwkTZ5QC5AYAb3y4PtNNs1JeLszxpS8YOAQDEbjK0Yl
	jx8hU7JxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkhUS-0007pX-Uu; Thu, 03 Dec 2020 05:49:16 +0000
Received: from m42-5.mailgun.net ([69.72.42.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkhUP-0007oe-EI
 for linux-mediatek@lists.infradead.org; Thu, 03 Dec 2020 05:49:15 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606974554; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=NJ4IfsZbGPDKNl9KMbMJltvvUnRSFPpja3eddaNzntw=;
 b=Ecg/zk/Dp5a+h95QCbj33cObW7X548ojGR6swgmFtDJNnZAbCZuRDen1D6x+FwB99IsL6eIy
 Umruqij0pnVLPwMs6I8f2cHqvjRqBHmDmqBCv9EuPTWg3fzBk75UgRETHb2O9JzA9l/jNNnD
 YzqgPUf4cZJc/rjP0tQQzJgSDyM=
X-Mailgun-Sending-Ip: 69.72.42.5
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fc87c53a5d4da3a6cd4c244 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Dec 2020 05:49:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 49280C43462; Thu,  3 Dec 2020 05:49:06 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5AFD3C433C6;
 Thu,  3 Dec 2020 05:49:05 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 03 Dec 2020 13:49:05 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1 3/3] scsi: ufs: Introduce notify_event variant function
In-Reply-To: <20201126053839.25889-4-stanley.chu@mediatek.com>
References: <20201126053839.25889-1-stanley.chu@mediatek.com>
 <20201126053839.25889-4-stanley.chu@mediatek.com>
Message-ID: <b8d2d4e45e1738865925de17d53dcaa7@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_004914_619009_585AF29A 
X-CRM114-Status: GOOD (  19.42  )
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
Cc: jiajie.hao@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, huadian.liu@mediatek.com, andy.teng@mediatek.com,
 jejb@linux.ibm.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cc.chou@mediatek.com, avri.altman@wdc.com,
 alice.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 asutoshd@codeaurora.org, chaotian.jing@mediatek.com, bvanassche@acm.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-11-26 13:38, Stanley Chu wrote:
> Introduce notify_event variant function to allow
> vendor to get notified of important events and connect
> to any proprietary debugging facilities.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufshcd.c |  2 ++
>  drivers/scsi/ufs/ufshcd.h | 11 +++++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 7194bed1f10b..63fe37e1c908 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -4484,6 +4484,8 @@ void ufshcd_update_evt_hist(struct ufs_hba *hba,
> u32 id, u32 val)
>  	e->val[e->pos] = val;
>  	e->tstamp[e->pos] = ktime_get();
>  	e->pos = (e->pos + 1) % UFS_EVENT_HIST_LENGTH;
> +
> +	ufshcd_vops_notify_event(hba, id, &val);
>  }
>  EXPORT_SYMBOL_GPL(ufshcd_update_evt_hist);
> 
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index 82c2fc5597bb..a81ca36c1715 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -317,6 +317,7 @@ struct ufs_pwr_mode_info {
>   * @phy_initialization: used to initialize phys
>   * @device_reset: called to issue a reset pulse on the UFS device
>   * @program_key: program or evict an inline encryption key
> + * @notify_event: called to notify important events
>   */
>  struct ufs_hba_variant_ops {
>  	const char *name;
> @@ -352,6 +353,8 @@ struct ufs_hba_variant_ops {
>  					void *data);
>  	int	(*program_key)(struct ufs_hba *hba,
>  			       const union ufs_crypto_cfg_entry *cfg, int slot);
> +	void	(*notify_event)(struct ufs_hba *hba,
> +				enum ufs_event_type evt, void *data);
>  };
> 
>  /* clock gating state  */
> @@ -1097,6 +1100,14 @@ static inline int
> ufshcd_vops_clk_scale_notify(struct ufs_hba *hba,
>  	return 0;
>  }
> 
> +static inline void ufshcd_vops_notify_event(struct ufs_hba *hba,
> +					    enum ufs_event_type evt,
> +					    void *data)
> +{
> +	if (hba->vops && hba->vops->notify_event)
> +		hba->vops->notify_event(hba, evt, data);
> +}
> +
>  static inline int ufshcd_vops_setup_clocks(struct ufs_hba *hba, bool 
> on,
>  					enum ufs_notify_change_status status)
>  {

Reviewed-by: Can Guo <cang@codeaurora.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
