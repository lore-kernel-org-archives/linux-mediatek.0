Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2ACC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 07:34:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 284D820671
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 07:34:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iT++0P+t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UYcl7bgT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 284D820671
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hMB1kESzcAQ61TY3cKw+PjIbUSTTdz7gPtLNbuIaZds=; b=iT++0P+tgTuVIC
	ntewbkRNEElBdr+iEEyzNZKL3J+LTVqg0w+Rj9EFBkFC7kCp7Prpdi2hh0XjkpUU6n5paJUr7lSml
	NZCM1oiTXDbxnBaGJBUiUc2uUF4XGR9H1xOhLE7YIWUeVgu987eAMiSRcf5QdTW2TEwh+X77WEazB
	SwK9GpWRpHplPlz5jpj4R5d3XzcS0ATi/ciJyylu86nKhscIdKn7R+eQuO+YfMZiGT+ULTyNknEPb
	YukM3xsz9TWLDJ3gw8cTF63SPWPdXSB2wDrDtrer/92MDUmGiDVt5l4vk26EnA8w133M9djBCmPMz
	ohDj6p2nYE/5D19QSc1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbJEu-00033c-Qr; Wed, 20 May 2020 07:34:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbJET-0002Yj-On; Wed, 20 May 2020 07:33:43 +0000
X-UUID: 7a7cded23036422bbf1ec14a41dae522-20200519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=x7Ix7wIXALpP6Po6n+AWWCWKLuf6w1Ut3QGKm4+Qrs0=; 
 b=UYcl7bgTL/NsBWttvF9QFjJqD3OpeqXG7MKxvQ0jiRNwzfb3ucqS9ZA26MT5VeAzaWnCGukE344gyp4OucduX0fF5B8migELtKICRDjMkHLLXvtqGkzxfcCt8so8vjsJm2JWCtnbZ9zSXO1CXLt66biAbOXc5EtnWN656nJrPXs=;
X-UUID: 7a7cded23036422bbf1ec14a41dae522-20200519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 93966226; Tue, 19 May 2020 23:33:40 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 May 2020 00:23:35 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 May 2020 15:23:27 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 May 2020 15:23:27 +0800
Message-ID: <1589959408.7715.7.camel@mtkswgap22>
Subject: Re: [PATCH v3 5/5] scsi: ufs: Fix possible VCC power drain during
 runtime suspend
From: Stanley Chu <stanley.chu@mediatek.com>
To: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Date: Wed, 20 May 2020 15:23:28 +0800
In-Reply-To: <6d32fba1-f7c3-f043-42b6-0da065e9795b@codeaurora.org>
References: <20200516174615.15445-1-stanley.chu@mediatek.com>
 <20200516174615.15445-6-stanley.chu@mediatek.com>
 <6d32fba1-f7c3-f043-42b6-0da065e9795b@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3B5D2DD1F965F138CE1099F2E31E5F9F6B99042E6C4CAF4988037835AD6A6D8E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_003341_865656_9BDC2408 
X-CRM114-Status: GOOD (  26.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Asutosh,

Thanks for your review.

On Tue, 2020-05-19 at 09:27 -0700, Asutosh Das (asd) wrote:
> Hi Stanley,
> 
> On 5/16/2020 10:46 AM, Stanley Chu wrote:
> > The commit "scsi: ufs: Fix WriteBooster flush during runtime
> > suspend" promises essential resource, i.e., for UFS devices doing
> > WriteBooster buffer flush and Auto BKOPs. However if device
> > finishes its job but not resumed for a very long time, system
> > will have unnecessary power drain because VCC is still supplied.
> > 
> > To fix this, a method to recheck the threshold of keeping VCC
> > supply is required. However, the threshold recheck needs to
> > re-activate the link because the decision depends on the device
> > status.
> > 
> > Introduce a delayed work to force runtime resume after a certain
> > delay during runtime suspend. This makes threshold recheck simpler
> > which will be done in the next runtime-suspend.
> > 
> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > ---
> 
> Is there a reason to have this code as a separate patch?
> [1] Commit: "scsi: ufs: Fix WriteBooster flush during runtime suspend" 
> introduces 'keep_curr_dev_pwr_mode' and the very next change (this one) 
> removes it.
> Do you think this change and [1] should be merged?

Yes, these 2 patches shall be merged. I will do it in next version.

> 
> >   drivers/scsi/ufs/ufs.h    |  1 +
> >   drivers/scsi/ufs/ufshcd.c | 43 ++++++++++++++++++++++++++++++++++-----
> >   drivers/scsi/ufs/ufshcd.h |  1 +
> >   3 files changed, 40 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/scsi/ufs/ufs.h b/drivers/scsi/ufs/ufs.h
> > index db07eedfed96..c70845d41449 100644
> > --- a/drivers/scsi/ufs/ufs.h
> > +++ b/drivers/scsi/ufs/ufs.h
> > @@ -574,6 +574,7 @@ struct ufs_dev_info {
> >   	u32 d_ext_ufs_feature_sup;
> >   	u8 b_wb_buffer_type;
> >   	u32 d_wb_alloc_units;
> > +	bool b_rpm_dev_flush_capable;
> >   	u8 b_presrv_uspc_en;
> >   };
> >   
> > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> > index f4f2c7b5ab0a..a137553f9b41 100644
> > --- a/drivers/scsi/ufs/ufshcd.c
> > +++ b/drivers/scsi/ufs/ufshcd.c
> > @@ -94,6 +94,9 @@
> >   /* default delay of autosuspend: 2000 ms */
> >   #define RPM_AUTOSUSPEND_DELAY_MS 2000
> >   
> > +/* Default delay of RPM device flush delayed work */
> > +#define RPM_DEV_FLUSH_RECHECK_WORK_DELAY_MS 5000
> > +
> >   /* Default value of wait time before gating device ref clock */
> >   #define UFSHCD_REF_CLK_GATING_WAIT_US 0xFF /* microsecs */
> >   
> > @@ -5310,7 +5313,7 @@ static bool ufshcd_wb_presrv_usrspc_keep_vcc_on(struct ufs_hba *hba,
> >   	return false;
> >   }
> >   
> > -static bool ufshcd_wb_keep_vcc_on(struct ufs_hba *hba)
> > +static bool ufshcd_wb_need_flush(struct ufs_hba *hba)
> >   {
> >   	int ret;
> >   	u32 avail_buf;
> > @@ -5348,6 +5351,21 @@ static bool ufshcd_wb_keep_vcc_on(struct ufs_hba *hba)
> >   	return ufshcd_wb_presrv_usrspc_keep_vcc_on(hba, avail_buf);
> >   }
> >   
> > +static void ufshcd_rpm_dev_flush_recheck_work(struct work_struct *work)
> > +{
> > +	struct ufs_hba *hba = container_of(to_delayed_work(work),
> > +					   struct ufs_hba,
> > +					   rpm_dev_flush_recheck_work);
> > +	/*
> > +	 * To prevent unnecessary VCC power drain after device finishes
> > +	 * WriteBooster buffer flush or Auto BKOPs, force runtime resume
> > +	 * after a certain delay to recheck the threshold by next runtime
> > +	 * supsend.
> > +	 */
> > +	pm_runtime_get_sync(hba->dev);
> > +	pm_runtime_put_sync(hba->dev);
> > +}
> > +
> >   /**
> >    * ufshcd_exception_event_handler - handle exceptions raised by device
> >    * @work: pointer to work data
> > @@ -8164,7 +8182,6 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
> >   	enum ufs_pm_level pm_lvl;
> >   	enum ufs_dev_pwr_mode req_dev_pwr_mode;
> >   	enum uic_link_state req_link_state;
> > -	bool keep_curr_dev_pwr_mode = false;
> >   
> >   	hba->pm_op_in_progress = 1;
> >   	if (!ufshcd_is_shutdown_pm(pm_op)) {
> > @@ -8224,11 +8241,12 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
> >   		 * Hibern8, keep device power mode as "active power mode"
> >   		 * and VCC supply.
> >   		 */
> > -		keep_curr_dev_pwr_mode = hba->auto_bkops_enabled ||
> > +		hba->dev_info.b_rpm_dev_flush_capable =
> > +			hba->auto_bkops_enabled ||
> >   			(((req_link_state == UIC_LINK_HIBERN8_STATE) ||
> >   			((req_link_state == UIC_LINK_ACTIVE_STATE) &&
> >   			ufshcd_is_auto_hibern8_enabled(hba))) &&
> > -			ufshcd_wb_keep_vcc_on(hba));
> > +			ufshcd_wb_need_flush(hba));
> >   	}
> >   
> >   	if (req_dev_pwr_mode != hba->curr_dev_pwr_mode) {
> > @@ -8238,7 +8256,7 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
> >   			ufshcd_disable_auto_bkops(hba);
> >   		}
> >   
> > -		if (!keep_curr_dev_pwr_mode) {
> > +		if (!hba->dev_info.b_rpm_dev_flush_capable) {
> >   			ret = ufshcd_set_dev_pwr_mode(hba, req_dev_pwr_mode);
> >   			if (ret)
> >   				goto enable_gating;
> > @@ -8295,9 +8313,16 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
> >   	if (hba->clk_scaling.is_allowed)
> >   		ufshcd_resume_clkscaling(hba);
> >   	hba->clk_gating.is_suspended = false;
> > +	hba->dev_info.b_rpm_dev_flush_capable = false;
> >   	ufshcd_release(hba);
> >   out:
> > +	if (hba->dev_info.b_rpm_dev_flush_capable) {
> > +		schedule_delayed_work(&hba->rpm_dev_flush_recheck_work,
> > +			msecs_to_jiffies(RPM_DEV_FLUSH_RECHECK_WORK_DELAY_MS));
> > +	}
> > +
> >   	hba->pm_op_in_progress = 0;
> > +
> Nitpick; newline, perhaps?

Thanks, I Will remove it.

> 
> >   	if (ret)
> >   		ufshcd_update_reg_hist(&hba->ufs_stats.suspend_err, (u32)ret);
> >   	return ret;
> > @@ -8386,6 +8411,11 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
> >   	/* Enable Auto-Hibernate if configured */
> >   	ufshcd_auto_hibern8_enable(hba);
> >   
> > +	if (hba->dev_info.b_rpm_dev_flush_capable) {
> > +		hba->dev_info.b_rpm_dev_flush_capable = false;
> > +		cancel_delayed_work(&hba->rpm_dev_flush_recheck_work);
> > +	}
> > +
> >   	/* Schedule clock gating in case of no access to UFS device yet */
> >   	ufshcd_release(hba);
> >   
> > @@ -8859,6 +8889,9 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
> >   						UFS_SLEEP_PWR_MODE,
> >   						UIC_LINK_HIBERN8_STATE);
> >   
> > +	INIT_DELAYED_WORK(&hba->rpm_dev_flush_recheck_work,
> > +			  ufshcd_rpm_dev_flush_recheck_work);
> > +
> >   	/* Set the default auto-hiberate idle timer value to 150 ms */
> >   	if (ufshcd_is_auto_hibern8_supported(hba) && !hba->ahit) {
> >   		hba->ahit = FIELD_PREP(UFSHCI_AHIBERN8_TIMER_MASK, 150) |
> > diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> > index 8db7a6101892..9acd437037e8 100644
> > --- a/drivers/scsi/ufs/ufshcd.h
> > +++ b/drivers/scsi/ufs/ufshcd.h
> > @@ -745,6 +745,7 @@ struct ufs_hba {
> >   	struct request_queue	*bsg_queue;
> >   	bool wb_buf_flush_enabled;
> >   	bool wb_enabled;
> > +	struct delayed_work rpm_dev_flush_recheck_work;
> >   };
> >   
> >   /* Returns true if clocks can be gated. Otherwise false */
> > 
> 
> 

Thanks,
Stanley Chu


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
