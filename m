Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,
	BODY_QUOTE_MALF_MSGID,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69453C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 09:19:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31F942077D
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 09:19:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LBXQcZHF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="F8TvUub3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31F942077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3H/dRihSv1aHzsp5+rE+OmhDL0yM1LrDpFbU4GFl3Ko=; b=LBXQcZHF0BKc+TVlucOV2F1nt
	BL7OiiWMhHROpZkGDdoDfljzplrInAzrFfMg25h3tVPjt5dol0bVv57IOxckrv+Njr28EGlu3oXS7
	lGWYJUxs+Z7JJtLFSjPD0FrDqSLnzNtWJncpMVmgWw/V0Fv9B3C6In9qe7c3ZMOVIS2x/Dy2mhK9/
	uqIgLWvEryXTpYGe8HO+Yj7nRPjxJljLESoO/C9rU3lfVkxLGqtc8KvuWJZV3sCBoNhZeIzNNKVOL
	odavYYfGHI9TRSYR/hGwAkYyT/93KRPJsyV9muXE13ggL4wOc8R8HbLI576OJRTzMJ1c+wh+sN+Fm
	cMCDv5HdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyAuD-0000TA-Rg; Wed, 22 Jul 2020 09:19:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyAu8-0000RT-76; Wed, 22 Jul 2020 09:19:13 +0000
X-UUID: 3958718215004a41917c4fbbbc7814cc-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6BSWLjcQJzdicOh0iBZ0z0jDe5KmBxrTiIAJXKTT0yY=; 
 b=F8TvUub3E4fv4ZsqsRwVO/j7J3BkfuRadQnfsWNmvzq3nCePYpCuTi5NWj2PHR4uhYXEmwINOWsp6/dlC5cuSryIpvRJvbqFrd95lrzfCGoBgfXUU+4LvVoDez2CJ/SDk42WveH8LRDfo9fASRW+cbOoKrXP34DvkfHNJdXFJXs=;
X-UUID: 3958718215004a41917c4fbbbc7814cc-20200722
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1363677857; Wed, 22 Jul 2020 01:19:00 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 02:19:01 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 17:18:53 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 17:18:54 +0800
Message-ID: <1595409534.27178.19.camel@mtkswgap22>
Subject: Re: [RFC PATCH v3] scsi: ufs: Quiesce all scsi devices before shutdown
From: Stanley Chu <stanley.chu@mediatek.com>
To: Bart Van Assche <bvanassche@acm.org>
Date: Wed, 22 Jul 2020 17:18:54 +0800
In-Reply-To: <2465978d-28d3-e30f-248e-87333c789743@acm.org>
References: <20200706132218.21171-1-stanley.chu@mediatek.com>
 <2465978d-28d3-e30f-248e-87333c789743@acm.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1AEDC1CB880B4B35E07F8D0ADB4D38C01629038D20821CCF56DBF8140A0C9EA52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_051912_426370_162CB825 
X-CRM114-Status: GOOD (  15.02  )
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
 asutoshd@codeaurora.org, chaotian.jing@mediatek.com, cc.chou@mediatek.com,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bart,

On Sat, 2020-07-11 at 20:21 -0700, Bart Van Assche wrote:
> On 2020-07-06 06:22, Stanley Chu wrote:
> > +static void ufshcd_cleanup_queue(struct scsi_device *sdev, void *data)
> > +{
> > +	if (sdev->request_queue)
> > +		blk_cleanup_queue(sdev->request_queue);
> > +}
> 
> No SCSI LLD should ever call blk_cleanup_queue() directly for
> sdev->request_queue. Only the SCSI core should call blk_cleanup_queue()
> directly for that queue.

Got it.

So may I focus on fixing racing first by quiecsing all SCSI devices only
and do not touch blk_cleanup_queue() in UFS driver, just like v2?


> >  int ufshcd_shutdown(struct ufs_hba *hba)
> >  {
> >  	int ret = 0;
> > +	struct scsi_target *starget;
> >  
> >  	if (!hba->is_powered)
> >  		goto out;
> > @@ -8612,7 +8632,25 @@ int ufshcd_shutdown(struct ufs_hba *hba)
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
> > +	ufshcd_scsi_for_each_sdev(ufshcd_quiece_sdev);
> > +
> >  	ret = ufshcd_suspend(hba, UFS_SHUTDOWN_PM);
> > +
> > +	/* Set queue as dying to not block queueing commands */
> > +	ufshcd_scsi_for_each_sdev(ufshcd_cleanup_queue);
> >  out:
> >  	if (ret)
> >  		dev_err(hba->dev, "%s failed, err %d\n", __func__, ret);
> > 
> 
> What is the purpose of ufshcd_shutdown()? Why does this function exist?
> How about removing the calls to ufshcd_shutdown() and invoking power down
> code from inside sd_suspend_common() instead?

ufshcd_shutdown() configures below things different from or more than
what sd_suspend_common() can do now,

- Set link as OFF state
- Regulator and clock toggling according to required low-power state for
shutdown
- Auto BKOP toggling
- Vendor-specific shutdown flow ...etc.

Therefore UFS shutdown callback would be still required.

Thanks,
Stanley Chu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
