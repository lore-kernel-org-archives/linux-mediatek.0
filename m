Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13040C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 01:30:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D579F2076B
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 01:30:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AE/pSu8G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="T9CGKxez"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D579F2076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R/swB2Hfwb79+oti/lzLNE7+TyEF0n5+oqSGd/GD1T8=; b=AE/pSu8GpGMZttqQzMYzRy0uM
	TKMMZ3+CBwSJB6EeYgiLlYQsjBacJYvrH+B4Oz47vytFvivya93LY/aD1B4iYl3Eg6LKa4LVYslWa
	cMSLB0OjBRA/r0SgxNeliKQEFPkTU/fYVVWVhlaW6N+QkeVIBcVu5sRAwgbKvZ8eND2Z8s3fqaRai
	+drsxTqLo7kgZMCzPAHZoRggyPy05lJk6HV/eNeiJk5A+WBXvjkLZcC/6uRavIcxES+z4QsqkMF8/
	6VINeZiQzyaeKT1+HbVe8m/Fb397zTduCiYVyMgQIPyovDQvYlT3wWhqb+S+WU8Jf3DsB94Qb9liq
	ffDYaW1fw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1JsX-0005qE-Qm; Fri, 31 Jul 2020 01:30:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1JsS-0005p6-I8; Fri, 31 Jul 2020 01:30:29 +0000
X-UUID: 1eabd25f206f4ff3a779e8ec0f27eabf-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=25R/tw9vzd5F5fUTQ5kr+ADS9zBYCPAZwj9/d7vMggQ=; 
 b=T9CGKxezcUwjFFv0w8UR1KW8FDeNUufY6a6WivPAgApqaG8BGbKT8yKZ6dIqbTGUVHqjcNl28GlE/I14Uebl+QRM8gWOlkMNVPPxekbOQGz38CJfXtVPKQYmUuLZDRVCtGgS3/lbq0oaIjiCIuwsab25abEmwhWp1Lgpp3DpSGM=;
X-UUID: 1eabd25f206f4ff3a779e8ec0f27eabf-20200730
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 410260034; Thu, 30 Jul 2020 17:30:21 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 18:30:19 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 31 Jul 2020 09:30:17 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 31 Jul 2020 09:30:17 +0800
Message-ID: <1596159018.17247.53.camel@mtkswgap22>
Subject: RE: [PATCH v4] scsi: ufs: Cleanup completed request without
 interrupt notification
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>
Date: Fri, 31 Jul 2020 09:30:18 +0800
In-Reply-To: <SN6PR04MB4640B5FC06968244DDACB8BEFC720@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200724140246.19434-1-stanley.chu@mediatek.com>
 <SN6PR04MB4640B5FC06968244DDACB8BEFC720@SN6PR04MB4640.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 71FB6D29D6D2F90D2C8183B6D742B66C6D52B9406A7B5C1C22638F62489F611D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_213028_859938_238745ED 
X-CRM114-Status: GOOD (  23.06  )
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

Hi Bart,

On Mon, 2020-07-27 at 11:18 +0000, Avri Altman wrote:
> Looks good to me.
> But better wait and see if Bart have any further reservations.
> 

Would you have any further suggestions?

Thanks a lot,
Stanley Chu

> Thanks,
> Avri 
> > 
> > If somehow no interrupt notification is raised for a completed request
> > and its doorbell bit is cleared by host, UFS driver needs to cleanup
> > its outstanding bit in ufshcd_abort(). Otherwise, system may behave
> > abnormally by below flow:
> > 
> > After ufshcd_abort() returns, this request will be requeued by SCSI
> > layer with its outstanding bit set. Any future completed request
> > will trigger ufshcd_transfer_req_compl() to handle all "completed
> > outstanding bits". In this time, the "abnormal outstanding bit"
> > will be detected and the "requeued request" will be chosen to execute
> > request post-processing flow. This is wrong because this request is
> > still "alive".
> > 
> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > ---
> >  drivers/scsi/ufs/ufshcd.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> > index 577cc0d7487f..9d180da77488 100644
> > --- a/drivers/scsi/ufs/ufshcd.c
> > +++ b/drivers/scsi/ufs/ufshcd.c
> > @@ -6493,7 +6493,7 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
> >                         /* command completed already */
> >                         dev_err(hba->dev, "%s: cmd at tag %d successfully cleared from
> > DB.\n",
> >                                 __func__, tag);
> > -                       goto out;
> > +                       goto cleanup;
> >                 } else {
> >                         dev_err(hba->dev,
> >                                 "%s: no response from device. tag = %d, err %d\n",
> > @@ -6527,6 +6527,7 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
> >                 goto out;
> >         }
> > 
> > +cleanup:
> >         scsi_dma_unmap(cmd);
> > 
> >         spin_lock_irqsave(host->host_lock, flags);
> > --
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
