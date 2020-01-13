Return-Path: <SRS0=6pE3=3C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6150EC33CA9
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 18:59:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2479521744
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 18:59:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UR1e5DZz";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="HLp9DLKG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2479521744
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gwnEhxsVPOwJQwPkvHWpmDrjRyut+y8XwGxTrrcHq0c=; b=UR1e5DZz8h5h//G5FLImB3NRa
	YkIEdN859NuF0Cu8ZjfasPwr/SMRBOGujJG0AVX2DtlR3VbjWkwN36pyM1jcVEDUNS8r4Ocxl/EXW
	zqCMtMvpdJZ3ImxvOZJm/rwS3D5I/ySf9D61imbzB1Fw1vUE5b0UHKB7ODZMgSdWgUGbT0Nmc0CqT
	2fPL4WRExUl/xjHogDJ/+dQj08VX17qf/YaL84LAhCrFIbaum5h3xHrgfWOs58N1rIl3Cb1lFRhWy
	c7mY3uaqFAiqwSYxkQihbdc9dmQ6wJLR33Yack3fFDZDIm5ownDReYgnBHIUj5yEW3yDyXaseELAk
	lTw5Cv6Cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir4vz-0001Pp-9q; Mon, 13 Jan 2020 18:59:31 +0000
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir4vm-0001Ef-Lg
 for linux-mediatek@lists.infradead.org; Mon, 13 Jan 2020 18:59:20 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1578941959; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=rEVhNoA+SMCklIOXL2qRZ8K89XUanuaNJQR/wOG0Dcw=;
 b=HLp9DLKGIkgi62qAQLPRYClSKO16AcjWJK4FJN5+4wU7QiU2yKlEwCkc+CGhtiUtMye2zJbF
 En5+6Ry/Bi5ZslExl7cKxQSgbYYqCdq6gXw7PZ5MgJFRT7zxPtbUpjnIoG78pSYqIHciq5c9
 jlLozHKYBrQwfJAz+CIvRBJEIkg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e1cbdfa.7f83ae025fb8-smtp-out-n01;
 Mon, 13 Jan 2020 18:59:06 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D2515C447A5; Mon, 13 Jan 2020 18:59:04 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 758BBC433CB;
 Mon, 13 Jan 2020 18:59:03 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 13 Jan 2020 10:59:03 -0800
From: asutoshd@codeaurora.org
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1 2/3] scsi: ufs: add device reset history for vendor
 implementations
In-Reply-To: <1578147968-30938-3-git-send-email-stanley.chu@mediatek.com>
References: <1578147968-30938-1-git-send-email-stanley.chu@mediatek.com>
 <1578147968-30938-3-git-send-email-stanley.chu@mediatek.com>
Message-ID: <20ed97a2333ff27d5901c373579f710a@codeaurora.org>
X-Sender: asutoshd@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_105919_144977_5570B596 
X-CRM114-Status: GOOD (  12.91  )
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
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, avri.altman@wdc.com,
 cang@codeaurora.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 bvanassche@acm.org, linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-01-04 06:26, Stanley Chu wrote:
> Device reset history shall be also added for vendor's device
> reset variant operation implementation.
> 
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Asutosh Das <asutoshd@codeaurora.org>
> Cc: Avri Altman <avri.altman@wdc.com>
> Cc: Bart Van Assche <bvanassche@acm.org>
> Cc: Bean Huo <beanhuo@micron.com>
> Cc: Can Guo <cang@codeaurora.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufshcd.c | 5 +++--
>  drivers/scsi/ufs/ufshcd.h | 6 +++++-
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index bae43da00bb6..29e3d50aabfb 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -4346,13 +4346,14 @@ static inline int
> ufshcd_disable_device_tx_lcc(struct ufs_hba *hba)
>  	return ufshcd_disable_tx_lcc(hba, true);
>  }
> 
> -static void ufshcd_update_reg_hist(struct ufs_err_reg_hist *reg_hist,
> -				   u32 reg)
> +void ufshcd_update_reg_hist(struct ufs_err_reg_hist *reg_hist,
> +			    u32 reg)
>  {
>  	reg_hist->reg[reg_hist->pos] = reg;
>  	reg_hist->tstamp[reg_hist->pos] = ktime_get();
>  	reg_hist->pos = (reg_hist->pos + 1) % UFS_ERR_REG_HIST_LENGTH;
>  }
> +EXPORT_SYMBOL_GPL(ufshcd_update_reg_hist);
> 
>  /**
>   * ufshcd_link_startup - Initialize unipro link startup
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index e05cafddc87b..de1be6a862b0 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -805,6 +805,8 @@ int ufshcd_wait_for_register(struct ufs_hba *hba,
> u32 reg, u32 mask,
>  				u32 val, unsigned long interval_us,
>  				unsigned long timeout_ms, bool can_sleep);
>  void ufshcd_parse_dev_ref_clk_freq(struct ufs_hba *hba, struct clk 
> *refclk);
> +void ufshcd_update_reg_hist(struct ufs_err_reg_hist *reg_hist,
> +			    u32 reg);
> 
>  static inline void check_upiu_size(void)
>  {
> @@ -1083,8 +1085,10 @@ static inline void
> ufshcd_vops_dbg_register_dump(struct ufs_hba *hba)
> 
>  static inline void ufshcd_vops_device_reset(struct ufs_hba *hba)
>  {
> -	if (hba->vops && hba->vops->device_reset)
> +	if (hba->vops && hba->vops->device_reset) {
>  		hba->vops->device_reset(hba);
> +		ufshcd_update_reg_hist(&hba->ufs_stats.dev_reset, 0);
> +	}
>  }
> 
>  extern struct ufs_pm_lvl_states ufs_pm_lvl_states[];

Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
