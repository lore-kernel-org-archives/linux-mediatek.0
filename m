Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF355C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 03:37:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C1FE207D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 03:37:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VXCIiSAd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dHs5bYlp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C1FE207D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3MO06XL2vpqncRS/jj9qcByx01uu4PelnSKGgX3Cj7I=; b=VXCIiSAdvMxYLkkI1ZZJqa20r
	LF4ruYSb7yj/vqJf+4BVLQVaWEwQy0+RRa6l344Qf/Bgb3+JkR6qg1lS6mGaLKo9GMZ6MAH/fwzEB
	lbi8llKs8WljNgMPUIBKmb3EAvvaEnXzRddF8ubrz2LS8Uxv+8hPfxROTjKDdVh4J+CeGawdkV53X
	EuUmVqGP6nA6Z9R661syQK2UXub7BabICRdNwjnao1TVs9/9CVr8ciXzdRABqt6kgDYPMpRvWEdmi
	afyHp33+d+e7nRi9ds3DUrwuRb1VQfLCeUabttP7tx62DP2jxeB4ai3syfBC93pg7WyFdWU9EMbwN
	J7jpQACqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqq1s-0006bB-BE; Thu, 02 Jul 2020 03:36:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqq1p-0006a3-41; Thu, 02 Jul 2020 03:36:49 +0000
X-UUID: 560a2516121c497ab013a13e9e680bd7-20200701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DynCopBXHiJ+Lg6AsJ3EnlHF2wkfA2Y2m1ODGfczMBE=; 
 b=dHs5bYlpzHY5m14LoqnlBTBVFkhkjOqERK434Tk6Br394LexLKlGr4vguXvd08Z4/idrTny8xjz1+pPdBbf8ry5av2xGsxMB7t5bxewMvnjIu5ZPFxI4zBv/iMEMFg3yaitDIF09DByWudyqpYhs/lOMWAjjiJ6x5+3zg5Fs4Wc=;
X-UUID: 560a2516121c497ab013a13e9e680bd7-20200701
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 916512764; Wed, 01 Jul 2020 19:36:45 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 20:36:44 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 11:36:42 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Jul 2020 11:36:43 +0800
Message-ID: <1593661004.3278.8.camel@mtkswgap22>
Subject: Re: [RFC PATCH v1] scsi: ufs: Quiesce all scsi devices before shutdown
From: Stanley Chu <stanley.chu@mediatek.com>
To: Bart Van Assche <bvanassche@acm.org>
Date: Thu, 2 Jul 2020 11:36:44 +0800
In-Reply-To: <83b1d5a1-c248-87bb-9554-ca10c8064041@acm.org>
References: <20200702013210.22958-1-stanley.chu@mediatek.com>
 <83b1d5a1-c248-87bb-9554-ca10c8064041@acm.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_233649_290438_2A557178 
X-CRM114-Status: GOOD (  14.15  )
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

On Wed, 2020-07-01 at 20:02 -0700, Bart Van Assche wrote:
> On 2020-07-01 18:32, Stanley Chu wrote:
> > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> > index 59358bb75014..cadfa9006972 100644
> > --- a/drivers/scsi/ufs/ufshcd.c
> > +++ b/drivers/scsi/ufs/ufshcd.c
> > @@ -8599,10 +8599,14 @@ EXPORT_SYMBOL(ufshcd_runtime_idle);
> >  int ufshcd_shutdown(struct ufs_hba *hba)
> >  {
> >  	int ret = 0;
> > +	struct scsi_target *starget;
> >  
> >  	if (!hba->is_powered)
> >  		goto out;
> >  
> > +	list_for_each_entry(starget, &hba->host->__targets, siblings)
> > +		scsi_target_quiesce(starget);
> > +
> >  	if (ufshcd_is_ufs_dev_poweroff(hba) && ufshcd_is_link_off(hba))
> >  		goto out;
> 
> Please add a comment above the list_for_each_entry() loop that explains
> that there is no matching scsi_target_unquiesce() call and also that
> SCSI commands queued after the scsi_target_quiesce() call returned will
> block until blk_cleanup_queue() is called (see also the blk_queue_dying()
> check in blk_queue_enter()).

Thanks for the review.
I'll add above comments in RFC v2.

Thanks,
Stanley Chu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
