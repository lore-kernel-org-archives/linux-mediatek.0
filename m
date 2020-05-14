Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF84C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 02:24:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CE5F20671
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 02:24:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t0zU7FN9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GlDa03V6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CE5F20671
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkIFnMRbPQs+AYBZ//N1ZkCPftib0T3qZQ7YC5vap8Q=; b=t0zU7FN9lfLfld
	8LtiwBtKKAc5lMpzzcBGPoxI4ZeMyw85lWA11q5l5Wwdvxm4W9Z3ZR7rG12T4IPd8dTMYOREMZZGC
	BELfNe3rKa1cJnO0m46bCTW9+6Cp1hiSbAbYUVfJZB6eAOZAuU8Mn1YF4hoabLzLH3yzDA0IDRJbT
	aUo1cOZldGCTW93Mk9hzlU6gyqDf3/3vL2FSlcuyLfxKBBn6X+TeX1J0QIU9FdL6jN3OGK/wHBDDB
	q2ODsjltQFL3ve9iqWTTBaHnrqdKjU1KO1XstyzjK21s4vtVfp1+g8eJN7s2B3MpJF6Zfa2OSXqRp
	NeBXrbKH+jB+kgF1h8sA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZ3Xc-0003Fc-Dy; Thu, 14 May 2020 02:24:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ3XQ-00038s-Uv; Thu, 14 May 2020 02:24:00 +0000
X-UUID: 86c4d40b91454c62a911e7f2c012440d-20200513
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=gF/qkZSDBMNUmVBXvJwR6PHcG8SN91qI0JIPZWeq/hM=; 
 b=GlDa03V6dCLLPQe7PLDkkRpRI5IwPZRol6+f8uhkzLuZ3KUNMHDgBgDALr+Ip0XzHgyHb6v9Z+dBHHWjOrDBh+ps95Qgl4Ri763RIX9nDT9d3AW4sG9r3V3WCW+V+fccJkP4//4sluoadFLWwmE1nvCKc++5Gw1zhst71DkKky0=;
X-UUID: 86c4d40b91454c62a911e7f2c012440d-20200513
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 835977989; Wed, 13 May 2020 18:23:53 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 May 2020 19:23:51 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 May 2020 10:23:48 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 May 2020 10:23:48 +0800
Message-ID: <1589423030.3197.94.camel@mtkswgap22>
Subject: Re: [PATCH v1 4/4] scsi: ufs: Fix WriteBooster flush during runtime
 suspend
From: Stanley Chu <stanley.chu@mediatek.com>
To: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Date: Thu, 14 May 2020 10:23:50 +0800
In-Reply-To: <725d057c-2379-710e-287f-ac11a59c08bc@codeaurora.org>
References: <20200512104750.8711-1-stanley.chu@mediatek.com>
 <20200512104750.8711-5-stanley.chu@mediatek.com>
 <725d057c-2379-710e-287f-ac11a59c08bc@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_192357_003983_5AFDBAD6 
X-CRM114-Status: GOOD (  26.61  )
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

Hi Asutosh,

On Wed, 2020-05-13 at 12:31 -0700, Asutosh Das (asd) wrote:
> On 5/12/2020 3:47 AM, Stanley Chu wrote:
> > Currently UFS host driver promises VCC supply if UFS device
> > needs to do WriteBooster flush during runtime suspend.
> > 
> > However the UFS specification mentions,
> > 
> > "While the flushing operation is in progress, the device is
> > in Active power mode."
> > 
> > Therefore UFS host driver needs to promise more: Keep UFS
> > device as "Active power mode", otherwise UFS device shall not
> > do any flush if device enters Sleep or PowerDown power mode.
> > 
> > Fix this by not changing device power mode if WriteBooster
> > flush is required in ufshcd_suspend().
> > 
> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > ---
> >   drivers/scsi/ufs/ufs.h    |  1 -
> >   drivers/scsi/ufs/ufshcd.c | 39 +++++++++++++++++++--------------------
> >   2 files changed, 19 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/scsi/ufs/ufs.h b/drivers/scsi/ufs/ufs.h
> > index b3135344ab3f..9e4bc2e97ada 100644
> > --- a/drivers/scsi/ufs/ufs.h
> > +++ b/drivers/scsi/ufs/ufs.h
> > @@ -577,7 +577,6 @@ struct ufs_dev_info {
> >   	u32 d_ext_ufs_feature_sup;
> >   	u8 b_wb_buffer_type;
> >   	u32 d_wb_alloc_units;
> > -	bool keep_vcc_on;
> >   	u8 b_presrv_uspc_en;
> >   };
> >   
> > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> > index 169a3379e468..2d0aff8ac260 100644
> > --- a/drivers/scsi/ufs/ufshcd.c
> > +++ b/drivers/scsi/ufs/ufshcd.c
> > @@ -8101,8 +8101,7 @@ static void ufshcd_vreg_set_lpm(struct ufs_hba *hba)
> >   	    !hba->dev_info.is_lu_power_on_wp) {
> >   		ufshcd_setup_vreg(hba, false);
> >   	} else if (!ufshcd_is_ufs_dev_active(hba)) {
> > -		if (!hba->dev_info.keep_vcc_on)
> > -			ufshcd_toggle_vreg(hba->dev, hba->vreg_info.vcc, false);
> > +		ufshcd_toggle_vreg(hba->dev, hba->vreg_info.vcc, false);
> >   		if (!ufshcd_is_link_active(hba)) {
> >   			ufshcd_config_vreg_lpm(hba, hba->vreg_info.vccq);
> >   			ufshcd_config_vreg_lpm(hba, hba->vreg_info.vccq2);
> > @@ -8172,6 +8171,7 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
> >   	enum ufs_pm_level pm_lvl;
> >   	enum ufs_dev_pwr_mode req_dev_pwr_mode;
> >   	enum uic_link_state req_link_state;
> > +	bool keep_curr_dev_pwr_mode = false;
> >   
> >   	hba->pm_op_in_progress = 1;
> >   	if (!ufshcd_is_shutdown_pm(pm_op)) {
> > @@ -8226,28 +8226,27 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
> >   			/* make sure that auto bkops is disabled */
> >   			ufshcd_disable_auto_bkops(hba);
> >   		}
> > +
> Unnecessary newline, perhaps?

Yap, I will remove it in next version.

> >   		/*
> > -		 * With wb enabled, if the bkops is enabled or if the
> > -		 * configured WB type is 70% full, keep vcc ON
> > -		 * for the device to flush the wb buffer
> > +		 * If device needs to do BKOP or WB buffer flush, keep device
> > +		 * power mode as "active power mode" and its VCC supply.
> >   		 */
> > -		if ((hba->auto_bkops_enabled && ufshcd_is_wb_allowed(hba)) ||
> > -		    ufshcd_wb_keep_vcc_on(hba))
> > -			hba->dev_info.keep_vcc_on = true;
> > -		else
> > -			hba->dev_info.keep_vcc_on = false;
> > -	} else {
> > -		hba->dev_info.keep_vcc_on = false;
> > +		keep_curr_dev_pwr_mode = hba->auto_bkops_enabled ||
> > +			ufshcd_wb_keep_vcc_on(hba);
> Should the device be in UFS_ACTIVE_PWR_MODE to perform auto-bkops?
> 
> Also, is it needed to keep the device in UFS_ACTIVE_PWR_MODE , if flush 
> on hibern8 is enabled and the link is being put to hibern8 mode during 
> runtime-suspend? Perhaps that should also be factored in here?

Both auto-bkops and WriteBooster flush during Hibern8 need device power
mode to be "Active Power Mode".

For auto-bkops, the spec mentions,

"If the background operations enable bit is set and the device is in
Active power mode or Idle power mode, then the device is allowed to
execute any internal operations."

For WriteBooster flush during Hibern8, the spec mentions,

"While the flushing operation is in progress, the device is in Active
power mode."

Therefore here we can use an unified "keep_curr_dev_pwr_mode" to
indicate the same requirements of above both features.

Besides, both operations may access flash array inside UFS device thus
VCC supply shall be also kept.

Before this patch, the original code will keep device power mode (stay
in Active Power Mode) if hba->auto_bkops_enabled is set as true during
runtime-suspend with UFSHCD_CAP_AUTO_BKOPS_SUSPEND capability is
enabled. This patch will not change this decision, just add
"WriteBooster flush during Hibern8" feature as another condition to do
so.

Thank you so much to remind me that "Link shall be put in Hibern8" is a
necessary condition for "WriteBooster flush during Hibern8". I will add
more checking for keep_curr_dev_pwr_mode to prevent unnecessary power
drain.  

> >   	}
> >   
> > -	if ((req_dev_pwr_mode != hba->curr_dev_pwr_mode) &&
> > -	    ((ufshcd_is_runtime_pm(pm_op) && !hba->auto_bkops_enabled) ||
> > -	    !ufshcd_is_runtime_pm(pm_op))) {
> > -		/* ensure that bkops is disabled */
> > -		ufshcd_disable_auto_bkops(hba);
> > -		ret = ufshcd_set_dev_pwr_mode(hba, req_dev_pwr_mode);
> > -		if (ret)
> > -			goto enable_gating;
> > +	if (req_dev_pwr_mode != hba->curr_dev_pwr_mode) {
> > +		if ((ufshcd_is_runtime_pm(pm_op) && !hba->auto_bkops_enabled) ||
> > +		    !ufshcd_is_runtime_pm(pm_op)) {
> > +			/* ensure that bkops is disabled */
> > +			ufshcd_disable_auto_bkops(hba);
> > +		}
> > +
> > +		if (!keep_curr_dev_pwr_mode) {
> > +			ret = ufshcd_set_dev_pwr_mode(hba, req_dev_pwr_mode);
> 
> Now, when the WB buffer is completely flushed out, the device should be 
> put back into UFS_SLEEP_PWR_MODE or UFS_POWERDOWN_PWR_MODE. Say, the 
> device buffer has to be flushed and during runtime-suspend, the device 
> is put to UFS_ACTIVE_PWR_MODE and Vcc is kept ON; the device doesn't 
> resume nor does the system enters suspend for a very long time, and with 
> AH8 and hibern8 disabled, there will be an unnecessary power drain for 
> that much time.
> 
> How about a periodic interval checking of flush status if 
> keep_curr_dev_pwr_mode evaluates to be true?

This is a good point!

The same thing also happens for auto-bkops. How about add a timer to
leave runtime suspend if keep_curr_dev_pwr_mode is set as true? This is
simple and also favors power. The timeout value could be adjustable
according to the available WriteBooster buffer size.

A periodic interval checking of flush status needs to re-activate link
to communicate with the device. This would be tricky and the
re-activation flow is just like runtime-resume.

What would you think?

Thanks.
Stanley Chu


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
