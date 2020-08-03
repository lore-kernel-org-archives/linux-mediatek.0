Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 719CAC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 10:08:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F81E20678
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 10:08:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FfqodZnz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mMfwffbQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F81E20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SPIwSt7F2JjG65p0zoAV8H2iME3nowLcOL/4a2MfLCU=; b=FfqodZnzleQAeQKkCYGSrP6Ic
	rgONRKLuajL+VaaVo3qhXcJI7lEeI2azJYaEe/h9tWBd9bUygPeoXcojLB+Sxsnif+8nWCijJmay0
	G/vPFm+04CJ2G4vZY7A6Th0Yt3n4NId3o/5CAPuPNI3Ce1D7jBXBWFYf2kKVHQ6asKaAxUftfLgfE
	iu+Q7LDPItRZ9mlc+SWaS2Xg5uA0AevEWITYMrkLYN6Rh00GbpgQr/uqzupSxKg5y++rUFjRxxDBW
	nFj2zaFB+Q5lkGs2NpcM6DYGwHYslRlKhlGvt5Hwd9tdvhMQjMu4GqUBMK5TEKEprX14uhgRN0l1H
	zrl0eYv0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2XOa-0005gY-JS; Mon, 03 Aug 2020 10:08:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2XOV-0005fO-Sk; Mon, 03 Aug 2020 10:08:37 +0000
X-UUID: 60bb191674324a7da9f5506e5d722276-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=rk95z43C2aNrN15eIkcdc/c36r6GmjdjgaMR2GV/CrU=; 
 b=mMfwffbQJYONWWbMqmx4076dHiGMTs1t95utf/cDchpXubEtsGkJQKjRoi6Pwe3uA9B/uY/HBgTQu5E+CEskPdr0BEqVhjFW0+vTEaKcwFRM8Fa05mO9M/O6yVZKWmHc30QO3qkyK3wz2IE6BFDkCcE8p1tdAHYunSNIjW2kcas=;
X-UUID: 60bb191674324a7da9f5506e5d722276-20200803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1729368746; Mon, 03 Aug 2020 02:08:04 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 02:58:10 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 17:58:02 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Aug 2020 17:58:02 +0800
Message-ID: <1596448684.32283.25.camel@mtkswgap22>
Subject: Re: [PATCH v6] scsi: ufs: Quiesce all scsi devices before shutdown
From: Stanley Chu <stanley.chu@mediatek.com>
To: Can Guo <cang@codeaurora.org>
Date: Mon, 3 Aug 2020 17:58:04 +0800
In-Reply-To: <d85cdb877bced2d6b0a8ba67670271f2@codeaurora.org>
References: <20200803042514.7111-1-stanley.chu@mediatek.com>
 <d85cdb877bced2d6b0a8ba67670271f2@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_060836_098519_F54455DC 
X-CRM114-Status: GOOD (  30.13  )
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
 martin.petersen@oracle.com, andy.teng@mediatek.com, jejb@linux.ibm.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, asutoshd@codeaurora.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, beanhuo@micron.com,
 chaotian.jing@mediatek.com, cc.chou@mediatek.com,
 linux-arm-kernel@lists.infradead.org, bvanassche@acm.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Can,

On Mon, 2020-08-03 at 13:03 +0800, Can Guo wrote:
> Hi Stanley,
> 
> On 2020-08-03 12:25, Stanley Chu wrote:
> > Currently I/O request could be still submitted to UFS device while
> > UFS is working on shutdown flow. This may lead to racing as below
> > scenarios and finally system may crash due to unclocked register
> > accesses.
> > 
> > To fix this kind of issues, in ufshcd_shutdown(),
> > 
> > 1. Use pm_runtime_get_sync() instead of resuming UFS device by
> >    ufshcd_runtime_resume() "internally" to let runtime PM framework
> >    manage and prevent concurrent runtime operations by incoming I/O
> >    requests.
> > 
> > 2. Specifically quiesce all SCSI devices to block all I/O requests
> >    after device is resumed.
> > 
> > Example of racing scenario: While UFS device is runtime-suspended
> > 
> > Thread #1: Executing UFS shutdown flow, e.g.,
> >            ufshcd_suspend(UFS_SHUTDOWN_PM)
> > 
> > Thread #2: Executing runtime resume flow triggered by I/O request,
> >            e.g., ufshcd_resume(UFS_RUNTIME_PM)
> > 
> > This breaks the assumption that UFS PM flows can not be running
> > concurrently and some unexpected racing behavior may happen.
> > 
> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > ---
> > Changes:
> >   - Since v4: Use pm_runtime_get_sync() instead of resuming UFS device
> > by ufshcd_runtime_resume() "internally".
> > ---
> >  drivers/scsi/ufs/ufshcd.c | 39 ++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 34 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> > index 307622284239..fc01171d13b1 100644
> > --- a/drivers/scsi/ufs/ufshcd.c
> > +++ b/drivers/scsi/ufs/ufshcd.c
> > @@ -159,6 +159,12 @@ struct ufs_pm_lvl_states ufs_pm_lvl_states[] = {
> >  	{UFS_POWERDOWN_PWR_MODE, UIC_LINK_OFF_STATE},
> >  };
> > 
> > +#define ufshcd_scsi_for_each_sdev(fn) \
> > +	list_for_each_entry(starget, &hba->host->__targets, siblings) { \
> > +		__starget_for_each_device(starget, NULL, \
> > +					  fn); \
> > +	}
> > +
> >  static inline enum ufs_dev_pwr_mode
> >  ufs_get_pm_lvl_to_dev_pwr_mode(enum ufs_pm_level lvl)
> >  {
> > @@ -8629,6 +8635,13 @@ int ufshcd_runtime_idle(struct ufs_hba *hba)
> >  }
> >  EXPORT_SYMBOL(ufshcd_runtime_idle);
> > 
> > +static void ufshcd_quiesce_sdev(struct scsi_device *sdev, void *data)
> > +{
> > +	/* Suspended devices are already quiesced so can be skipped */
> 
> Why can runtime suspended sdevs be skipped? Block layer can still resume
> them at any time, no?

Thanks for reminding.
Yes, this check is wrong. All SCSI devices shall be applied
scsi_device_quiesce() here so I will fix it in next version.

> 
> > +	if (!pm_runtime_suspended(&sdev->sdev_gendev))
> > +		scsi_device_quiesce(sdev);
> > +}
> > +
> >  /**
> >   * ufshcd_shutdown - shutdown routine
> >   * @hba: per adapter instance
> > @@ -8640,6 +8653,7 @@ EXPORT_SYMBOL(ufshcd_runtime_idle);
> >  int ufshcd_shutdown(struct ufs_hba *hba)
> >  {
> >  	int ret = 0;
> > +	struct scsi_target *starget;
> > 
> >  	if (!hba->is_powered)
> >  		goto out;
> > @@ -8647,11 +8661,26 @@ int ufshcd_shutdown(struct ufs_hba *hba)
> >  	if (ufshcd_is_ufs_dev_poweroff(hba) && ufshcd_is_link_off(hba))
> >  		goto out;
> > 
> > -	if (pm_runtime_suspended(hba->dev)) {
> > -		ret = ufshcd_runtime_resume(hba);
> > -		if (ret)
> > -			goto out;
> > -	}
> > +	/*
> > +	 * Let runtime PM framework manage and prevent concurrent runtime
> > +	 * operations with shutdown flow.
> > +	 */
> > +	pm_runtime_get_sync(hba->dev);
> > +
> > +	/*
> > +	 * Quiesce all SCSI devices to prevent any non-PM requests sending
> > +	 * from block layer during and after shutdown.
> > +	 *
> > +	 * Here we can not use blk_cleanup_queue() since PM requests
> > +	 * (with BLK_MQ_REQ_PREEMPT flag) are still required to be sent
> > +	 * through block layer. Therefore SCSI command queued after the
> > +	 * scsi_target_quiesce() call returned will block until
> > +	 * blk_cleanup_queue() is called.
> > +	 *
> > +	 * Besides, scsi_target_"un"quiesce (e.g., scsi_target_resume) can
> > +	 * be ignored since shutdown is one-way flow.
> > +	 */
> > +	ufshcd_scsi_for_each_sdev(ufshcd_quiesce_sdev);
> 
> Any reasons why don't use scsi_target_quiesce() here?

As above, now all SCSI devices shall be quiesced here, so I could use
the way in v2: using scsi_target_quiesce() directly here.

Thanks,

Stanley Chu 

> 
> Thanks,
> 
> Can Guo.
> 
> > 
> >  	ret = ufshcd_suspend(hba, UFS_SHUTDOWN_PM);
> >  out:

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
