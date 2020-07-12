Return-Path: <SRS0=2SCH=AX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F7EC433DF
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jul 2020 01:26:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 850F220748
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jul 2020 01:26:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CqejrqQo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bhH/g5V3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 850F220748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sIH0izGFeX/qWwRLjzQmn+D7X7lrz5ss8FoO5Sv1Vzc=; b=CqejrqQooz4TCZQOJzZstgUVw
	KAf/vyGjxhA3Zkvk5gq2rpLuh3uAiGwghOLPOB/h8OQnkyKkKCh6FhE8gpPyFWoceYEYNQbeUpZvO
	B0hRbxCDtxfu8hvrY7Mfvh0vznnWqCAhKRIekgjQt3/rwbewFfPlrXGJi1r5XGfFkkH6ROt75U0q0
	0+ZZ7PCOVF7M0KLMrn5dss4GRH882oDSRsrXpNtVuS1T5EUA3z05cpZOpgDdoccwjxAUs82Cr8KyX
	C+4Ig+9Dv1K2Mc/sJC+yWudsMqAOkBs/EVTqxNr1gJNp4uBMEkJyNWpYnQVmGbd6NHdj6SKZYsW/5
	Bpdaj5I/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juQl3-0003iz-Rd; Sun, 12 Jul 2020 01:26:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juQkw-0003i0-OV; Sun, 12 Jul 2020 01:26:16 +0000
X-UUID: db7259648cff4a2b9a86c455eb9e3eac-20200711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5+Yrq9V4GhTf7cocU/ltdK++Qz2IRNUuCTCYC0FtTd4=; 
 b=bhH/g5V3ul2PR1nE7dMymRTKQcgi/CeVKg+RRuZL2Hg6WC1cZYWao3X1HpD8aYhsN1UB9QnEPA9oRsQUrNS+A9qxBHcChtd1qt0FLccH+9vs6WXQ4RSjGYO7iefqbyIvR2dlY6Y/ezs6Fq6zqvCYhnRt5PPUpcXG2rx4SFAC7Zo=;
X-UUID: db7259648cff4a2b9a86c455eb9e3eac-20200711
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1138003123; Sat, 11 Jul 2020 17:26:09 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Jul 2020 18:26:07 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jul 2020 09:25:59 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 12 Jul 2020 09:25:59 +0800
Message-ID: <1594517160.10600.33.camel@mtkswgap22>
Subject: RE: [PATCH v3] scsi: ufs: Cleanup completed request without
 interrupt notification
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Sun, 12 Jul 2020 09:26:00 +0800
In-Reply-To: <SN6PR04MB4640BEAFE18BDC933FC7EC95FC640@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200706132113.21096-1-stanley.chu@mediatek.com>
 <SN6PR04MB4640BEAFE18BDC933FC7EC95FC640@SN6PR04MB4640.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200711_212614_979406_11B85378 
X-CRM114-Status: GOOD (  27.77  )
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

On Thu, 2020-07-09 at 08:31 +0000, Avri Altman wrote:
> > 
> > If somehow no interrupt notification is raised for a completed request
> > and its doorbell bit is cleared by host, UFS driver needs to cleanup
> > its outstanding bit in ufshcd_abort().
> Theoretically, this case is already accounted for - 
> See line 6407: a proper error is issued and eventually outstanding req is cleared.
> 
> Can you go over the scenario you are attending line by line,
> And explain why ufshcd_abort does not account for it?

Sure.

If a request using tag N is completed by UFS device without interrupt
notification till timeout happens, ufshcd_abort() will be invoked.

Since request completion flow is not executed, current status may be

- Tag N in hba->outstanding_reqs is set
- Tag N in doorbell register is not set

In this case, ufshcd_abort() flow would be

- This log is printed: "ufshcd_abort: cmd was completed, but without a
notifying intr, tag = N"
- This log is printed: "ufshcd_abort: Device abort task at tag N"
- If hba->req_abort_skip is zero, QUERY_TASK command is sent
- Device responds "UPIU_TASK_MANAGEMENT_FUNC_COMPL"
- This log is printed: "ufshcd_abort: cmd at tag N not pending in the
device."
- Doorbell tells that tag N is not set, so the driver goes to label
"out" with this log printed: "ufshcd_abort: cmd at tag %d successfully
cleared from DB."
- In label "out" section, no cleanup will be made, and then ufshcd_abort
exits
- This request will be re-queued to request queue by SCSI timeout
handler

Now, Inconsistent state shows-up: A request is "re-queued" but its
corresponding resource in UFS layer is not cleared, below flow will
trigger bad things,

- A new request with tag M is finished
- Interrupt is raised and ufshcd_transfer_req_compl() found both tag N
and M can process the completion flow
- The post-processing flow for tag N will be executed while its request
is still alive

I am sorry that below messages are only for old kernel in non-blk-mq
case. However above scenario will also trigger bad thing in blk-mq case.

> 
> > 
> > Otherwise, system may crash by below abnormal flow:
> > 
> > After this request is requeued by SCSI layer with its
> > outstanding bit set, the next completed request will trigger
> > ufshcd_transfer_req_compl() to handle all "completed outstanding
> > bits". In this time, the "abnormal outstanding bit" will be detected
> > and the "requeued request" will be chosen to execute request
> > post-processing flow. This is wrong and blk_finish_request() will
> > BUG_ON because this request is still "alive".
> > 
> > It is worth mentioning that before ufshcd_abort() cleans the timed-out
> > request, driver need to check again if this request is really not
> > handled by __ufshcd_transfer_req_compl() yet because it may be
> > possible that the interrupt comes very lately before the cleaning.
> What do you mean? Why checking the outstanding reqs isn't enough?
> 
> > 
> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > ---
> >  drivers/scsi/ufs/ufshcd.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> > index 8603b07045a6..f23fb14df9f6 100644
> > --- a/drivers/scsi/ufs/ufshcd.c
> > +++ b/drivers/scsi/ufs/ufshcd.c
> > @@ -6462,7 +6462,7 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
> >                         /* command completed already */
> >                         dev_err(hba->dev, "%s: cmd at tag %d successfully cleared from
> > DB.\n",
> >                                 __func__, tag);
> > -                       goto out;
> > +                       goto cleanup;
> But you've arrived here only if (!(test_bit(tag, &hba->outstanding_reqs))) - 
> See line 6400. 
> 
> >                 } else {
> >                         dev_err(hba->dev,
> >                                 "%s: no response from device. tag = %d, err %d\n",
> > @@ -6496,9 +6496,14 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
> >                 goto out;
> >         }
> > 
> > +cleanup:
> > +       spin_lock_irqsave(host->host_lock, flags);
> > +       if (!test_bit(tag, &hba->outstanding_reqs)) {
> > +               spin_unlock_irqrestore(host->host_lock, flags);
> > +               goto out;
> > +       }
> >         scsi_dma_unmap(cmd);
> > 
> > -       spin_lock_irqsave(host->host_lock, flags);
> >         ufshcd_outstanding_req_clear(hba, tag);
> >         hba->lrb[tag].cmd = NULL;
> >         spin_unlock_irqrestore(host->host_lock, flags);
> > --
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
