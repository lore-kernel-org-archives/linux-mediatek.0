Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17302C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 08:26:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D77CA2072A
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 08:26:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zlc013O8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oASkbbkB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D77CA2072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hKyxRqMw2fBzqxrwgGtT1OzCrk4wZHZiivlY0BwjG80=; b=zlc013O8nq1vdFhHawMoCOhCM
	Gnpy/JX4pWNSTpRpcqsMRDf6AhlpEnR6WkeAqI8TH+Ltq/3epN/1pl1YFwCaX6j60sTIqIgboyJGB
	2v9miRzUE2j8KOjQ5JO9VZsu1ZwKIItglkI+t5DVQ4NYoKY7mecD3ajPAhgJXxYdtTIygLXfCZvrY
	KdCxBbmSuT1VP3J56JX4NHSIHChBAmBZ+SkOYy88HBfbicooNmup54SYKnUF/94wZP0IUGGdtvwl2
	+CZ9fnlUFL31fEwghmXTlvN3GgUsPOcHvffpvSt0gUSKh73EnfMfh56yy1aTbyq4Axz3uBKa0kd46
	6JnsD18BQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1QMe-0004AI-8a; Fri, 31 Jul 2020 08:26:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1QMZ-00048N-9x; Fri, 31 Jul 2020 08:26:00 +0000
X-UUID: 391686765b5b4d0587787ed8c03c1b2e-20200731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qXyEm7h1EU9iqmjDOw4TDt54TkGuM6Zg2jr9jG/xIl8=; 
 b=oASkbbkBMM2oGYvNqAS/mRDILnsgdcgdLnbmuIB/4QQgGf11ZIyf50yO9EcPpOX/9LQpfwH5gK6JJe+IAo5D/f4FEXkCLZpa8sljfUG6/pdNIzc52nF4mF/SJtb7VWbuUysVia6GimD8oH9k2M0j19y9FjM0CvH/DK8IY9FbGKY=;
X-UUID: 391686765b5b4d0587787ed8c03c1b2e-20200731
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 762975629; Fri, 31 Jul 2020 00:25:40 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 31 Jul 2020 01:23:07 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 31 Jul 2020 16:22:51 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 31 Jul 2020 16:22:52 +0800
Message-ID: <1596183773.17247.60.camel@mtkswgap22>
Subject: Re: [PATCH v4] scsi: ufs: Quiesce all scsi devices before shutdown
From: Stanley Chu <stanley.chu@mediatek.com>
To: Can Guo <cang@codeaurora.org>
Date: Fri, 31 Jul 2020 16:22:53 +0800
In-Reply-To: <84510fc12ada0de8284e6a689b7a2358@codeaurora.org>
References: <20200724140140.18186-1-stanley.chu@mediatek.com>
 <84510fc12ada0de8284e6a689b7a2358@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A79C3ADDAB7B9C127D5D88B4633D40D8D96A1FC4951186C47B06E8EDFCB1D9292000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_042559_569061_4C61E52E 
X-CRM114-Status: GOOD (  30.29  )
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
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "Andy Teng \($B{}G!9\(\(B\)" <Andy.Teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 Chun-Hung Wu =?UTF-8?Q?=28=E5=B7=AB=E9=A7=BF=E5=AE=8F=29?=
 <Chun-hung.Wu@mediatek.com>,
 Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?=
 <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Peter Wang =?UTF-8?Q?=28=E7=8E=8B=E4=BF=A1=E5=8F=8B=29?=
 <peter.wang@mediatek.com>, "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 Chaotian Jing =?UTF-8?Q?=28=E4=BA=95=E6=9C=9D=E5=A4=A9=29?=
 <Chaotian.Jing@mediatek.com>,
 CC Chou =?UTF-8?Q?=28=E5=91=A8=E5=BF=97=E6=9D=B0=29?= <cc.chou@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "bvanassche@acm.org" <bvanassche@acm.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Can,

On Mon, 2020-07-27 at 15:30 +0800, Can Guo wrote:
> Hi Stanley,
> 
> On 2020-07-24 22:01, Stanley Chu wrote:
> > Currently I/O request could be still submitted to UFS device while
> > UFS is working on shutdown flow. This may lead to racing as below
> > scenarios and finally system may crash due to unclocked register
> > accesses.
> > 
> > To fix this kind of issues, specifically quiesce all SCSI devices
> > before UFS shutdown to block all I/O request sending from block
> > layer.
> > 
> > Example of racing scenario: While UFS device is runtime-suspended
> > 
> > Thread #1: Executing UFS shutdown flow, e.g.,
> >            ufshcd_suspend(UFS_SHUTDOWN_PM)
> > Thread #2: Executing runtime resume flow triggered by I/O request,
> >            e.g., ufshcd_resume(UFS_RUNTIME_PM)
> > 
> 
> I don't quite get it, how can you prevent block layer PM from iniating
> hba runtime resume by quiescing the scsi devices? Block layer PM
> iniates hba async runtime resume in blk_queue_enter(). But quiescing
> the scsi devices can only prevent general I/O requests from passing
> through scsi_queue_rq() callback.
> 
> Say hba is runtime suspended, if an I/O request to sda is sent from
> block layer (sda must be runtime suspended as well at this time),
> blk_queue_enter() initiates async runtime resume for sda. But since
> sda's parents are also runtime suspended, the RPM framework shall do
> runtime resume to the devices in the sequence hba->host->target->sda.
> In this case, ufshcd_resume() still runs concurrently, no?
> 

You are right. This patch can not fix the case you mentioned. It just
prevents "general I/O requests".

So perhaps we also need below patch?

#2 scsi: ufs: Use pm_runtime_get_sync in shutdown flow
https://patchwork.kernel.org/patch/10964097/

The above patch #2 let runtime PM framework manage and prevent
concurrent runtime operations in device driver.

And then using patch #1 (this patch) to block general I/O requests after
ufshcd device is resumed.

Thanks,
Stanley Chu


> Thanks,
> 
> Can Guo.
> 
> > This breaks the assumption that UFS PM flows can not be running
> > concurrently and some unexpected racing behavior may happen.
> > 
> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > ---
> >  drivers/scsi/ufs/ufshcd.c | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> > 
> > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> > index 9d180da77488..2e18596f3a8e 100644
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
> > @@ -8620,6 +8626,13 @@ int ufshcd_runtime_idle(struct ufs_hba *hba)
> >  }
> >  EXPORT_SYMBOL(ufshcd_runtime_idle);
> > 
> > +static void ufshcd_quiesce_sdev(struct scsi_device *sdev, void *data)
> > +{
> > +	/* Suspended devices are already quiesced so can be skipped */
> > +	if (!pm_runtime_suspended(&sdev->sdev_gendev))
> > +		scsi_device_quiesce(sdev);
> > +}
> > +
> >  /**
> >   * ufshcd_shutdown - shutdown routine
> >   * @hba: per adapter instance
> > @@ -8631,6 +8644,7 @@ EXPORT_SYMBOL(ufshcd_runtime_idle);
> >  int ufshcd_shutdown(struct ufs_hba *hba)
> >  {
> >  	int ret = 0;
> > +	struct scsi_target *starget;
> > 
> >  	if (!hba->is_powered)
> >  		goto out;
> > @@ -8644,6 +8658,21 @@ int ufshcd_shutdown(struct ufs_hba *hba)
> >  			goto out;
> >  	}
> > 
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
> > +
> >  	ret = ufshcd_suspend(hba, UFS_SHUTDOWN_PM);
> >  out:
> >  	if (ret)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
