Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21903C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 03:20:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1675F2065C
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 03:20:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A3pLLrgz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ubx5fqR3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1675F2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pr+hxMyRMAyPI6niwtK1kQGp5Wufhc70AWR4B6HlXlU=; b=A3pLLrgzTtHoPgGnKwxQ1UowV
	5zy2nfxvitmQlvcYaRS38jpJ/Qnp2q+Vq9S5zbCi94fUQ6oQi5HKbcPAhoqiR5XjlB+BLn59tHmLD
	O1rg6QD0Rd3HqOXKIIt/jyEB7b6jd+/c+7wX8+0DQGgjr4nCT0kNG1oR9hyySzjRfq18oJWbBhvjx
	eH4H71tkXzq6Em3QchhKwyk1tAf0KgizrZ9al3S0inDxJtVYe/HMXwgEOfksaPUqx7S5tlrqu//MV
	cYdPrw7RTJ35duh9xpyQRi01lDicJXIT3nIgOSfRNsVlXIGkD4zgxCvhitAXsI0nYypNM64b2836T
	uXPXKkcTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2nUh-0003hm-KQ; Tue, 04 Aug 2020 03:20:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2nUd-0003gy-MD; Tue, 04 Aug 2020 03:20:00 +0000
X-UUID: 4287704693dd42c79c4e5d1ef60d70ff-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hj2ZwHVB8o2hTVExdpkX1edkc5Bc/Z17qO+aiUu7lwc=; 
 b=ubx5fqR3P+4qZ2GDTpig0ClOFkoIYfTDd2t6M8Ubxsz2QYWPkP28y6MO2UUtLov/2oC+CKy85acG0IISLTbiddBWOM62XXL8kT6J3Na9sYnvuXLhFFaJ3PyfeoERrEGbr+F9TYSU/sWiZ/CWfXa1AiYtT3u3O5qabbwtRb+KLuM=;
X-UUID: 4287704693dd42c79c4e5d1ef60d70ff-20200803
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chaotian.jing@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 313730892; Mon, 03 Aug 2020 19:19:53 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 20:19:47 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 4 Aug 2020 11:19:44 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Aug 2020 11:19:45 +0800
Message-ID: <1596511150.22157.12.camel@mhfsdcap03>
Subject: Re: [SPAM]Re: [PATCH v7] scsi: ufs: Quiesce all scsi devices before
 shutdown
From: Chaotian Jing <chaotian.jing@mediatek.com>
To: Bart Van Assche <bvanassche@acm.org>
Date: Tue, 4 Aug 2020 11:19:10 +0800
In-Reply-To: <f40ad9e1-2e45-f21c-d067-eff579982cc7@acm.org>
References: <20200803100448.2738-1-stanley.chu@mediatek.com>
 <f40ad9e1-2e45-f21c-d067-eff579982cc7@acm.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 13A9C596D4BF257DDA5A2B05C7FD9395E9228CF3B2FAA20FEBBCC9D7C4BF65C72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_231959_942308_637B811A 
X-CRM114-Status: GOOD (  22.95  )
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
Cc: beanhuo@micron.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 asutoshd@codeaurora.org, avri.altman@wdc.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, jiajie.hao@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, cc.chou@mediatek.com,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-08-03 at 09:04 -0700, Bart Van Assche wrote:
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
> 
> Thanks,
> 
> Bart.
> 
> Hi Bart & Can & Stanley,

I have a question about this:
thread A is running the shutdown flow, but thread B is still access
UFS(sda/sdb/sdc..), is it expected ? after the sd_shutdown() completed,
if thread B still has access to UFS(sda/sdb/sdc...), it will make the
sd_shutdown() make no sense because the sd_resume() will send ssu to
start sda/sdb/sdc.

so can we avoid this and ensure that there is no request to sda after
sda's shutdown() is completed ?

so that is it possible to modify the sd_shutdown() ? take "sda" for
example: after sync cache && ssu to stop sda, do blk_cleanup_queue()
then it will ensure no runtime resume of sda and no more new requests to
sda.

then, for UFSHCI host driver, its shutdown() no need and should not
handle the sda/sdb/sdc's queue and device status, because these
devices(sda/sdb/sdc) has already complete its shutdown.
just like part of Can's comment, UFSHCI's shutdown() should only handle
hba->sdev_ufs_device.
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
