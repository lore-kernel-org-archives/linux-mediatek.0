Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D97DC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 09:06:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18B882074D
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 09:06:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e5PvPE1/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MnE2VtzB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18B882074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UTLI1SAZZ3GViS4hz26ov2/dG1OmUaUiLlftqrx3wJM=; b=e5PvPE1/fepEemrh/l723zkT5
	mI2gBlrCOprclAoaA4e2xK/oFWM+XtGTq9zm8HJmN+SFp4zCX4cU6lLe7pH+vJQCwXDbhb1RsAPBL
	5g9Rrf3U09QZ0yYBVU8CWJrVM+9RDJxN2CBkGWlnFqU3EecwFBiV6qGIAxjsPSKwglR+hq7ItGaR0
	CxRSx6fc/HhoUOulcFMPyre5494sFb/V3RpVCtQdIyQS96eGenn2NjPl/GIoqKIYXhmlpPpdlmXp3
	xhx6T7emfrSUsn5aWs5T3MEBAL/vC5XhmYQuGMwUBFrqrTkuXPcPJvN2wLat+hL4uVxaqdp3if/GN
	pzViP2GsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k69Be-0006vQ-PU; Thu, 13 Aug 2020 09:06:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k69BZ-0006uN-Ii; Thu, 13 Aug 2020 09:06:12 +0000
X-UUID: f6b1b1b627294e928c0901835ab6b17d-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xNEibFjIE0xUhw/eSSimln7Sb1lNhA3Oq/fLa0kDVp8=; 
 b=MnE2VtzBUVklNS1vxAEKEWLbGpgXm0DIeHn7NkmILyjM50fOe+kYopxylDn1jR7MHptnRkdlHpqxyAylGOnHhZgiD/wiOKy3xNlKe8YZFa5Ex+Tvs5cDaXUCJ6ovdJY/tIOuSzc9OcsrKEUlpmO0GSlsH8upFhQT4NFMCcuAMEI=;
X-UUID: f6b1b1b627294e928c0901835ab6b17d-20200813
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2134486826; Thu, 13 Aug 2020 01:06:02 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 01:55:59 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 16:55:49 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Aug 2020 16:55:49 +0800
Message-ID: <1597308950.26065.25.camel@mtkswgap22>
Subject: Re: [PATCH v7] scsi: ufs: Quiesce all scsi devices before shutdown
From: Stanley Chu <stanley.chu@mediatek.com>
To: Bart Van Assche <bvanassche@acm.org>
Date: Thu, 13 Aug 2020 16:55:50 +0800
In-Reply-To: <f40ad9e1-2e45-f21c-d067-eff579982cc7@acm.org>
References: <20200803100448.2738-1-stanley.chu@mediatek.com>
 <f40ad9e1-2e45-f21c-d067-eff579982cc7@acm.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D839A85286D21DB220A7566B75E9C29412EA56B227F2D207F45821E187AD12D42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_050609_828452_96D65837 
X-CRM114-Status: GOOD (  21.85  )
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
Cc: Jiajie Hao =?UTF-8?Q?=28=E9=83=9D=E5=8A=A0=E8=8A=82=29?=
 <jiajie.hao@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 Andy Teng =?UTF-8?Q?=28=E9=84=A7=E5=A6=82=E5=AE=8F=29?=
 <Andy.Teng@mediatek.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 Chun-Hung Wu =?UTF-8?Q?=28=E5=B7=AB=E9=A7=BF=E5=AE=8F=29?=
 <Chun-hung.Wu@mediatek.com>,
 Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?=
 <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Peter Wang =?UTF-8?Q?=28=E7=8E=8B=E4=BF=A1=E5=8F=8B=29?=
 <peter.wang@mediatek.com>, "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
 Chaotian Jing =?UTF-8?Q?=28=E4=BA=95=E6=9C=9D=E5=A4=A9=29?=
 <Chaotian.Jing@mediatek.com>,
 CC Chou =?UTF-8?Q?=28=E5=91=A8=E5=BF=97=E6=9D=B0=29?= <cc.chou@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "beanhuo@micron.com" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bart, Can, Chaotian,

Very appreciate your comments and suggestions, please see update below,

On Tue, 2020-08-04 at 00:04 +0800, Bart Van Assche wrote:
> On 2020-08-03 03:04, Stanley Chu wrote:
> > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> > index 307622284239..7cb220b3fde0 100644
> > --- a/drivers/scsi/ufs/ufshcd.c
> > +++ b/drivers/scsi/ufs/ufshcd.c
> > @@ -8640,6 +8640,7 @@ EXPORT_SYMBOL(ufshcd_runtime_idle);
> >  int ufshcd_shutdown(struct ufs_hba *hba)
> >  {
> >  	int ret = 0;
> > +	struct scsi_target *starget;
> >  
> >  	if (!hba->is_powered)
> >  		goto out;
> > @@ -8647,11 +8648,27 @@ int ufshcd_shutdown(struct ufs_hba *hba)
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
> > +	list_for_each_entry(starget, &hba->host->__targets, siblings)
> > +		scsi_target_quiesce(starget);
> >  
> >  	ret = ufshcd_suspend(hba, UFS_SHUTDOWN_PM);
> >  out:
> 
> This seems wrong to me. Since ufshcd_shutdown() shuts down the link I think
> it should call scsi_remove_device() instead of scsi_target_quiesce().

I tried many ways to come out the final solution. Currently two options
are considered,

== Option 1 ==
	pm_runtime_get_sync(hba->dev);

	shost_for_each_device(sdev, hba->host) {
		scsi_autopm_get_device(sdev);
		if (sdev == hba->sdev_ufs_device)
			scsi_device_quiesce(sdev);
		else
			scsi_remove_device(sdev);
	}

	ret = ufshcd_suspend(hba, UFS_SHUTDOWN_PM);

	scsi_remove_device(hba->sdev_ufs_device);

Note. Using scsi_autopm_get_device() instead of pm_runtime_disable()
is to prevent noisy message by below checking,

	WARN_ON_ONCE(sdev->quiesced_by && sdev->quiesced_by != current);

in
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/scsi/scsi_lib.c#n2515

This warning shows up if we try to quiesce a runtime-suspended SCSI
device. This is possible during our new shutdown flow. Using
scsi_autopm_get_device() to resume all SCSI devices first can prevent
it.

In addition, normally sd_shutdown() would be executed prior than
ufshcd_shutdown(). If scsi_remove_device() is invoked by
ufshcd_shutdown(), sd_shutdown() will be executed again for a SCSI disk
by

[  131.398977]  sd_shutdown+0x44/0x118
[  131.399416]  sd_remove+0x5c/0xc4
[  131.399824]  device_release_driver_internal+0x1c4/0x2e4
[  131.400481]  device_release_driver+0x18/0x24
[  131.401018]  bus_remove_device+0x108/0x134
[  131.401533]  device_del+0x2dc/0x630
[  131.401973]  __scsi_remove_device+0xc0/0x174
[  131.402510]  scsi_remove_device+0x30/0x48
[  131.403014]  ufshcd_shutdown+0xc8/0x138

In this case, we could see SYNCHRONIZE_CACHE command will be sent to the
same SCSI device twice. This is kind of wired during shutdown flow.

Moreover, in consideration of performance of ufshcd_shutdown(), Option 1
obviously degrades the latency a lot by scsi_remove_device(). Please see
the "Performance Measurement" data below.

Compared Option 2, this way is simpler and also effective. This way may
be a better compromise.

== Option 2  ==
	pm_runtime_get_sync(hba->dev);

	shost_for_each_device(sdev, hba->host) {
		scsi_autopm_get_device(sdev);
		scsi_device_quiesce(sdev);
	}

== Performance Measurement ==
As-Is: < 5 ms
Option 1: 850 ms
Option 2: 60 ms

What would you prefer? Or would you have any further suggestions?

Thanks,

Stanley Chu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
