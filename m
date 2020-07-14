Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B2CC433E5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 08:49:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E3AF2075B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 08:49:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="onSsbCMo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CeMkR8ga"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E3AF2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SDSx9DTADgHiJg9AYpOppUMdlrJDawaroxL1qBN9U5E=; b=onSsbCMorQGtHJxKwQebS5dsU
	awltW4vfmp2Fvae31H7s2lAhee+GiKTogzW0Du697gw+hc2A3B+C7/HPExpiIFo0/GPHxp/xmtPTw
	ECoqechGSRvrvQZI8Cl8uUFFdm8fhlkDfgMj+y5P0tjO9Fj8ulkIqcq1u8bdawrnwP0qvM7D52YvV
	YDp5QPyvKBhgdqCQGuVHyWiv93+rL/cG6B1X3s6j9M1v2rKKVbagP5ixMEJqpP4kgiAr4dIPjz32Q
	iq+QxpA7QkBMdICOUWOCd7/hVhBy/pPqg4ms0LIuid9o9qkebTu6enUD6fxeFpdTHZ+b/2pqY9/0L
	uH/QS8EJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvGci-0006zs-9z; Tue, 14 Jul 2020 08:49:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvGcd-0006yy-Jd; Tue, 14 Jul 2020 08:49:08 +0000
X-UUID: ee9c708786b641918ff2cca24897c9a0-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=vnbU38YH1fLWZ3HM1C/sYvZdgYd9jxLvr3eoKT0+obM=; 
 b=CeMkR8gaz97ktebcZOfMScpiZiYEL8ViFxBqbs2kvvq2VV2GQMtVjBE6hdfWffvoTfRfJbd4SVnwjVTpaVpRE10hgixtSTmxoXVJkhHrgBXdMsoEbw9PSEvWO1Cst3MCCy4YGSRZkyU+ILnBIo1/3/VLqK3KBdabyjJSqtutY2A=;
X-UUID: ee9c708786b641918ff2cca24897c9a0-20200714
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1726160556; Tue, 14 Jul 2020 00:49:03 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 01:48:59 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 16:48:46 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Jul 2020 16:48:46 +0800
Message-ID: <1594716527.22878.28.camel@mtkswgap22>
Subject: RE: [PATCH v3] scsi: ufs: Cleanup completed request without
 interrupt notification
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Tue, 14 Jul 2020 16:48:47 +0800
In-Reply-To: <SN6PR04MB4640F34CAA25B3CB58F94CABFC630@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200706132113.21096-1-stanley.chu@mediatek.com>
 <SN6PR04MB4640BEAFE18BDC933FC7EC95FC640@SN6PR04MB4640.namprd04.prod.outlook.com>
 <1594517160.10600.33.camel@mtkswgap22>
 <SN6PR04MB4640F34CAA25B3CB58F94CABFC630@SN6PR04MB4640.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_044907_780690_E8EBA53A 
X-CRM114-Status: GOOD (  35.79  )
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
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "beanhuo@micron.com" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Avri,

Sorry for the late response.

On Sun, 2020-07-12 at 10:04 +0000, Avri Altman wrote:
> 
> > 
> > Hi Avri,
> > 
> > On Thu, 2020-07-09 at 08:31 +0000, Avri Altman wrote:
> > > >
> > > > If somehow no interrupt notification is raised for a completed request
> > > > and its doorbell bit is cleared by host, UFS driver needs to cleanup
> > > > its outstanding bit in ufshcd_abort().
> > > Theoretically, this case is already accounted for -
> > > See line 6407: a proper error is issued and eventually outstanding req is
> > cleared.
> > >
> > > Can you go over the scenario you are attending line by line,
> > > And explain why ufshcd_abort does not account for it?
> > 
> > Sure.
> > 
> > If a request using tag N is completed by UFS device without interrupt
> > notification till timeout happens, ufshcd_abort() will be invoked.
> > 
> > Since request completion flow is not executed, current status may be
> > 
> > - Tag N in hba->outstanding_reqs is set
> > - Tag N in doorbell register is not set
> > 
> > In this case, ufshcd_abort() flow would be
> > 
> > - This log is printed: "ufshcd_abort: cmd was completed, but without a
> > notifying intr, tag = N"
> > - This log is printed: "ufshcd_abort: Device abort task at tag N"
> > - If hba->req_abort_skip is zero, QUERY_TASK command is sent
> > - Device responds "UPIU_TASK_MANAGEMENT_FUNC_COMPL"
> > - This log is printed: "ufshcd_abort: cmd at tag N not pending in the
> > device."
> > - Doorbell tells that tag N is not set, so the driver goes to label
> > "out" with this log printed: "ufshcd_abort: cmd at tag %d successfully
> > cleared from DB."
> > - In label "out" section, no cleanup will be made, and then ufshcd_abort
> > exits
> > - This request will be re-queued to request queue by SCSI timeout
> > handler
> > 
> > Now, Inconsistent state shows-up: A request is "re-queued" but its
> > corresponding resource in UFS layer is not cleared, below flow will
> > trigger bad things,
> > 
> > - A new request with tag M is finished
> > - Interrupt is raised and ufshcd_transfer_req_compl() found both tag N
> > and M can process the completion flow
> > - The post-processing flow for tag N will be executed while its request
> > is still alive
> > 
> > I am sorry that below messages are only for old kernel in non-blk-mq
> > case. However above scenario will also trigger bad thing in blk-mq case.
> 
> Ok.  Thanks.
> 
> > 
> > >
> > > >
> > > > Otherwise, system may crash by below abnormal flow:
> > > >
> > > > After this request is requeued by SCSI layer with its
> > > > outstanding bit set, the next completed request will trigger
> > > > ufshcd_transfer_req_compl() to handle all "completed outstanding
> > > > bits". In this time, the "abnormal outstanding bit" will be detected
> > > > and the "requeued request" will be chosen to execute request
> > > > post-processing flow. This is wrong and blk_finish_request() will
> > > > BUG_ON because this request is still "alive".
> > > >
> > > > It is worth mentioning that before ufshcd_abort() cleans the timed-out
> > > > request, driver need to check again if this request is really not
> > > > handled by __ufshcd_transfer_req_compl() yet because it may be
> > > > possible that the interrupt comes very lately before the cleaning.
> > > What do you mean? Why checking the outstanding reqs isn't enough?
> > >
> > > >
> > > > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > > > ---
> > > >  drivers/scsi/ufs/ufshcd.c | 9 +++++++--
> > > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> > > > index 8603b07045a6..f23fb14df9f6 100644
> > > > --- a/drivers/scsi/ufs/ufshcd.c
> > > > +++ b/drivers/scsi/ufs/ufshcd.c
> > > > @@ -6462,7 +6462,7 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
> > > >                         /* command completed already */
> > > >                         dev_err(hba->dev, "%s: cmd at tag %d successfully cleared
> > from
> > > > DB.\n",
> > > >                                 __func__, tag);
> > > > -                       goto out;
> > > > +                       goto cleanup;
> > > But you've arrived here only if (!(test_bit(tag, &hba->outstanding_reqs))) -
> > > See line 6400.
> > >
> > > >                 } else {
> > > >                         dev_err(hba->dev,
> > > >                                 "%s: no response from device. tag = %d, err %d\n",
> > > > @@ -6496,9 +6496,14 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
> > > >                 goto out;
> > > >         }
> > > >
> > > > +cleanup:
> > > > +       spin_lock_irqsave(host->host_lock, flags);
> > > > +       if (!test_bit(tag, &hba->outstanding_reqs)) {
> Is this needed?  it was already checked in line 6439.
> 

I am worried about the case that interrupt comes very lately. For
example, if interrupt finally comes while ufshcd_abort() is handling
this command, then probably this command may be completed first by
interrupt handler. In this case, ufshcd_abort() shall not clear this
command again. In contrast, if ufshcd_abort() clears this command first,
then interrupt shall not complete it. Thus here checking
hba->outstanding_req with host lock held is required to prevent above
racing.

Thanks,
Stanley Chu


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
