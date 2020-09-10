Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F2C2C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:18:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16DCE214F1
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:18:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZMuSV8Tk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="M0gdpn/S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16DCE214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LN885iSAXTgpPwV3EriFYek8C9NtKAqHwyp89Xqi+qY=; b=ZMuSV8TkWwiR+0qGcmhrHh+1P
	fVGjn4EFmYwUnwM9/q6wJxqy+ZR1+FVBzkvu9nSjlIe7NP3xtF6GIVTHaXkr88im9Qo0fYBdXWRuM
	bFVISj2tzexXnNX50nAqhFt8p4HkLKgQSIh4KHlaxAE8GYBrJ5WrlQd0iTiUWDaxtOfXaKjcX+2Be
	VajarFUunB8Wyqbxalb469EihVqpqquOt2E6UL9LJwQFy4RBdiGG5/vXn0M5IMdi0h3feVSmOJyJj
	5uPgMD2bs3e2+8Ush0m3UgHNBXMviw8eFSH3upw1inBuJLVt+HEQEc07hGKd7+/5XBUKuKY4I3/ZI
	iK+lLyPcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHmp-0001zy-P8; Thu, 10 Sep 2020 08:18:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHmm-0001yJ-G1; Thu, 10 Sep 2020 08:18:30 +0000
X-UUID: 8697c7a379e047dd92d5147241652824-20200910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=bkb5Dy/8w+zHjkkTDsE8PQgPRJ9l73bWXdZaPEjv76U=; 
 b=M0gdpn/SUVnT5bMls+oA6AXSzyzBbOUONIYQljbCYq532ESn7Mup5MX/GjHXFzsUI+kRt2n9f2G32Pxe1QOVQffdH0qiAgQi0Fqyxge7rbAQ2RihN4YsAxxW5/NAYnU9u2mrkML+xeyLI/4gMeQfozX5dpiha/zQmDcqVGVEpEM=;
X-UUID: 8697c7a379e047dd92d5147241652824-20200910
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 838040284; Thu, 10 Sep 2020 00:18:20 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 01:18:17 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 16:17:59 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Sep 2020 16:18:00 +0800
Message-ID: <1599725880.10649.35.camel@mtkswgap22>
Subject: Re: [PATCH v2 1/2] scsi: ufs: Abort tasks before clear them from
 doorbell
From: Stanley Chu <stanley.chu@mediatek.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Date: Thu, 10 Sep 2020 16:18:00 +0800
In-Reply-To: <1599718697.3851.3.camel@HansenPartnership.com>
References: <1599099873-32579-1-git-send-email-cang@codeaurora.org>
 <1599099873-32579-2-git-send-email-cang@codeaurora.org>
 <1599627906.10803.65.camel@linux.ibm.com>
 <yq14ko62wn5.fsf@ca-mkp.ca.oracle.com>
 <1599706080.10649.30.camel@mtkswgap22>
 <1599718697.3851.3.camel@HansenPartnership.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A2C192D7D6C5BEF5796E0FAE8F65EF53DA767CA6CB2A138333CA328A03A2C0152000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_041829_531715_7165BE3A 
X-CRM114-Status: GOOD (  31.47  )
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
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, rnayak@codeaurora.org,
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 open list <linux-kernel@vger.kernel.org>, saravanak@google.com,
 nguyenb@codeaurora.org, ziqichen@codeaurora.org,
 Avri Altman <avri.altman@wdc.com>, Can Guo <cang@codeaurora.org>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, salyzyn@google.com,
 Alim Akhtar <alim.akhtar@samsung.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Bean Huo <beanhuo@micron.com>,
 kernel-team@android.com, Bart Van
 Assche <bvanassche@acm.org>, hongwus@codeaurora.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi James,

On Wed, 2020-09-09 at 23:18 -0700, James Bottomley wrote:
> On Thu, 2020-09-10 at 10:48 +0800, Stanley Chu wrote:
> > Hi Martin, Can,
> > 
> > On Wed, 2020-09-09 at 22:32 -0400, Martin K. Petersen wrote:
> > > Can and Stanley,
> > > 
> > > > I can't reconcile this hunk:
> > > 
> > > Please provide a resolution for these conflicting commits in fixes
> > > and
> > > queue:
> > > 
> > > 307348f6ab14 scsi: ufs: Abort tasks before clearing them from
> > > doorbell
> > > 
> > > b10178ee7fa8 scsi: ufs: Clean up completed request without
> > > interrupt
> > > notification
> > > 
> > 
> > Can's patch has considered my fix in the new flow.
> > 
> > To be more clear, for the fixing case in my patch,
> > ufshcd_try_to_abort_task() will return 0 (err = 0) and finally the
> > target tag can be completed and cleared by
> > __ufshcd_transfer_req_compl()
> > in Can's new flow.
> > 
> > Thus I think the resolution can just using the code in Can's patch.
> > 
> > Can, please correct me if I was wrong.
> 
> Well, that really doesn't make for an easy merge. The resolution I took
> is below.
> 
> James
> 
> ---
> 
> commit 5399a4aa684d491c35a386effe385c06b41398fa
> Merge: 59958f7a956b 8c6572356646
> Author: James Bottomley <James.Bottomley@HansenPartnership.com>
> Date:   Wed Sep 9 23:12:52 2020 -0700
> 
>     Merge branch 'misc' into for-next
>     
>     Conflicts:
>             drivers/scsi/ufs/ufshcd.c
>             drivers/scsi/ufs/ufshcd.h
> 
> diff --cc drivers/scsi/ufs/ufshcd.c
> index 34e1ab407b05,05716f62febe..49478c8a601f
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@@ -6574,84 -6739,22 +6736,25 @@@ static int ufshcd_abort(struct scsi_cmn
>   	}
>   	hba->req_abort_count++;
>   
>  -	/* Skip task abort in case previous aborts failed and report failure */
>  -	if (lrbp->req_abort_skip) {
>  -		err = -EIO;
>  -		goto out;
>  +	if (!(reg & (1 << tag))) {
>  +		dev_err(hba->dev,
>  +		"%s: cmd was completed, but without a notifying intr, tag = %d",
>  +		__func__, tag);
>  +		goto cleanup;
>   	}
>   
>  -	err = ufshcd_try_to_abort_task(hba, tag);
>  -	if (err)
>  -		goto out;
>  -
>  -	spin_lock_irqsave(host->host_lock, flags);
>  -	__ufshcd_transfer_req_compl(hba, (1UL << tag));
>  -	spin_unlock_irqrestore(host->host_lock, flags);
>  +	/* Skip task abort in case previous aborts failed and report failure */
> - 	if (lrbp->req_abort_skip) {
> ++	if (lrbp->req_abort_skip)
>  +		err = -EIO;
> - 		goto out;
> - 	}
> - 
> - 	for (poll_cnt = 100; poll_cnt; poll_cnt--) {
> - 		err = ufshcd_issue_tm_cmd(hba, lrbp->lun, lrbp->task_tag,
> - 				UFS_QUERY_TASK, &resp);
> - 		if (!err && resp == UPIU_TASK_MANAGEMENT_FUNC_SUCCEEDED) {
> - 			/* cmd pending in the device */
> - 			dev_err(hba->dev, "%s: cmd pending in the device. tag = %d\n",
> - 				__func__, tag);
> - 			break;
> - 		} else if (!err && resp == UPIU_TASK_MANAGEMENT_FUNC_COMPL) {
> - 			/*
> - 			 * cmd not pending in the device, check if it is
> - 			 * in transition.
> - 			 */
> - 			dev_err(hba->dev, "%s: cmd at tag %d not pending in the device.\n",
> - 				__func__, tag);
> - 			reg = ufshcd_readl(hba, REG_UTP_TRANSFER_REQ_DOOR_BELL);
> - 			if (reg & (1 << tag)) {
> - 				/* sleep for max. 200us to stabilize */
> - 				usleep_range(100, 200);
> - 				continue;
> - 			}
> - 			/* command completed already */
> - 			dev_err(hba->dev, "%s: cmd at tag %d successfully cleared from DB.\n",
> - 				__func__, tag);
> - 			goto cleanup;
> - 		} else {
> - 			dev_err(hba->dev,
> - 				"%s: no response from device. tag = %d, err %d\n",
> - 				__func__, tag, err);
> - 			if (!err)
> - 				err = resp; /* service response error */
> - 			goto out;
> - 		}
> - 	}
> - 
> - 	if (!poll_cnt) {
> - 		err = -EBUSY;
> - 		goto out;
> - 	}
> - 
> - 	err = ufshcd_issue_tm_cmd(hba, lrbp->lun, lrbp->task_tag,
> - 			UFS_ABORT_TASK, &resp);
> - 	if (err || resp != UPIU_TASK_MANAGEMENT_FUNC_COMPL) {
> - 		if (!err) {
> - 			err = resp; /* service response error */
> - 			dev_err(hba->dev, "%s: issued. tag = %d, err %d\n",
> - 				__func__, tag, err);
> - 		}
> - 		goto out;
> - 	}
> - 
> - 	err = ufshcd_clear_cmd(hba, tag);
> - 	if (err) {
> - 		dev_err(hba->dev, "%s: Failed clearing cmd at tag %d, err %d\n",
> - 			__func__, tag, err);
> - 		goto out;
> - 	}
> ++	else
> ++		err = ufshcd_try_to_abort_task(hba, tag);
>   
>  -out:
> + 	if (!err) {
>  +cleanup:

Yeah, considering Bean Huo's patch "scsi: ufs: No need to send Abort
Task if the task in DB was cleared", "cleanup" label shall be added back
here.

So your resolution looks good to me.

Thanks so much : )

Stanley Chu

> - 	spin_lock_irqsave(host->host_lock, flags);
> - 	__ufshcd_transfer_req_compl(hba, (1UL << tag));
> - 	spin_unlock_irqrestore(host->host_lock, flags);
> - 
> ++		spin_lock_irqsave(host->host_lock, flags);
> ++		__ufshcd_transfer_req_compl(hba, (1UL << tag));
> ++		spin_unlock_irqrestore(host->host_lock, flags);
>  +out:
> - 	if (!err) {
>   		err = SUCCESS;
>   	} else {
>   		dev_err(hba->dev, "%s: failed with err %d\n", __func__, err);
> diff --cc drivers/scsi/ufs/ufshcd.h
> index b5b2761456fb,8011fdc89fb1..6663325ed8a0
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@@ -531,11 -531,10 +531,16 @@@ enum ufshcd_quirks 
>   	 */
>   	UFSHCD_QUIRK_BROKEN_OCS_FATAL_ERROR		= 1 << 10,
>   
>  +	/*
>  +	 * This quirk needs to be enabled if the host controller has
>  +	 * auto-hibernate capability but it doesn't work.
>  +	 */
>  +	UFSHCD_QUIRK_BROKEN_AUTO_HIBERN8		= 1 << 11,
> ++
> + 	/*
> + 	 * This quirk needs to disable manual flush for write booster
> + 	 */
>  -	UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL		= 1 << 11,
> ++	UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL		= 1 << 12,
>   };
>   
>   enum ufshcd_caps {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
