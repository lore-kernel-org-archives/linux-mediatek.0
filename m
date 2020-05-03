Return-Path: <SRS0=D1Kh=6R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC0EC28CBC
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 May 2020 10:50:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CDDF20787
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 May 2020 10:50:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FbpzO1rl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qegX4C+8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CDDF20787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bi9IHNOZbKKtIRhyXUCcJBxcZebkZWa/cLOFyaj6DiI=; b=FbpzO1rl6WvBam
	LWpYErLH8IJgHXS6WZDxbHC5PgjFT6f/dAwVUBzbSA2kIqF2kZFgzzcCEt6E2UxbM/xJj1r/Iga4J
	XNasVLMNh87JVNnaXajI87H3POrieh8R/J0PppH154k+xzgKS1ucX3sVAW70JW3ors6dusxrDh5VX
	fI91IjEDy0XzVv+cPxGPl9gCjpdxDPbtDXMLVkt30FHzGJuRLhcqkA6njuQoNS+EjiDPWNcdqAkrr
	ztRp0eT7HZv0YkMnyY+EUrbdENczULdTVBCFXKSH4reYHZd+zL5m+9W0P7240WFJghTVgshK/g0Vk
	4PNWMqwm+GidIVF+OQmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVCCQ-0003JC-Dy; Sun, 03 May 2020 10:50:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVCCE-0001V2-JT; Sun, 03 May 2020 10:50:11 +0000
X-UUID: b1da16d424064c229f43d76091e47423-20200503
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5A6fTMTWOdOt9hL3z4b4ndRhgV2eSquiME190vL1b78=; 
 b=qegX4C+8LkkgZJDfNwZnkkXT+oCv6OeITF89Z2Yt8wxp7m7kR2Uz/sdN7q8XenpOUHxp6gycXEU2eWam0Vb6ohDmr4sWNZ3cL9FSaKhuEaX9HezELA3Z5ir3zmUuElWaEhm+a3ScIHA+OcRNcZ5/8CoT4yPH9lI9sE3YZ33ziUg=;
X-UUID: b1da16d424064c229f43d76091e47423-20200503
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1938449606; Sun, 03 May 2020 02:50:02 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 3 May 2020 03:39:56 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 3 May 2020 18:39:46 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 3 May 2020 18:39:49 +0800
Message-ID: <1588502389.3197.19.camel@mtkswgap22>
Subject: RE: [PATCH v4 6/8] scsi: ufs: add LU Dedicated buffer mode support
 for WriteBooster
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Sun, 3 May 2020 18:39:49 +0800
In-Reply-To: <SN6PR04MB4640977062BF81B6DE7CBE51FCA90@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200503060351.10572-1-stanley.chu@mediatek.com>
 <20200503060351.10572-7-stanley.chu@mediatek.com>
 <SN6PR04MB4640977062BF81B6DE7CBE51FCA90@SN6PR04MB4640.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200503_035008_704071_13F9CB00 
X-CRM114-Status: GOOD (  18.91  )
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
Cc: "bvanassche@acm.org" <bvanassche@acm.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Avri,

On Sun, 2020-05-03 at 08:00 +0000, Avri Altman wrote:
> 
> > -       if (!(hba->dev_info.b_wb_buffer_type &&
> > -             hba->dev_info.d_wb_alloc_units))
> > -               goto wb_disabled;
> > +       if (hba->dev_info.b_wb_buffer_type == WB_BUF_MODE_SHARED) {
> > +               hba->dev_info.d_wb_alloc_units =
> > +               get_unaligned_be32(desc_buf +
> > +                                  DEVICE_DESC_PARAM_WB_SHARED_ALLOC_UNITS);
> > +               if (!hba->dev_info.d_wb_alloc_units)
> > +                       goto wb_disabled;
> > +       } else {
> > +               for (lun = 0; lun < hba->dev_info.max_lu_supported; lun++) {
> max_lu_supported is determined according to bMaxNumberLU in the geometry descriptor,
> which can be 32. WB buffer however, is only valid only for LU 0, ..., LU7.
> Better to add this new limit to ufs.h.

Thanks for noticing this. I will fix it in next version.

> 
> > +                       ret = ufshcd_read_unit_desc_param(hba,
> > +                                       lun,
> > +                                       UNIT_DESC_PARAM_WB_BUF_ALLOC_UNITS,
> > +                                       (u8 *)&d_lu_wb_buf_alloc,
> > +                                       sizeof(d_lu_wb_buf_alloc));
> > +                       if (ret)
> > +                               goto wb_disabled;
> I think you should just continue here, as it is ok for the query to fail.
> The spec says:
> The WriteBooster Buffer is available only for the logical units from 0 to 7 which are configured as
> "normal memory type" (bMemoryType = 00h) and "not Boot well known logical unit" (bBootLunID =
> 00h), otherwise the Query Request shall fail and the Query Response field shall be set to "General
> Failure".
> 
> Sorry for not noticing this earlier.

Always appreciate your review and always not being too late : )

The spec does not mention clearly that the Query Request shall fail for
Read or Write. Although I think it shall fail for Write only, i.e., fail
during configuration only, it is better to let fail being skipped and
check d_lu_wb_buf_alloc only anyway.

I will fix this as well in next version.

Thanks,
Stanley Chu

> 
> Thanks,
> Avri
> > +                       if (d_lu_wb_buf_alloc) {
> > +                               hba->dev_info.wb_dedicated_lu = lun;
> > +                               break;
> > +                       }
> > +               }
> > 
> > +               if (!d_lu_wb_buf_alloc)
> > +                       goto wb_disabled;
> > +       }
> >         return;
> > 
> >  wb_disabled:
> > diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> > index 898883058e3a..f232a67fd9b3 100644
> > --- a/drivers/scsi/ufs/ufshcd.h
> > +++ b/drivers/scsi/ufs/ufshcd.h
> > @@ -861,6 +861,13 @@ static inline bool
> > ufshcd_keep_autobkops_enabled_except_suspend(
> >         return hba->caps &
> > UFSHCD_CAP_KEEP_AUTO_BKOPS_ENABLED_EXCEPT_SUSPEND;
> >  }
> > 
> > +static inline u8 ufshcd_wb_get_flag_index(struct ufs_hba *hba)
> > +{
> > +       if (hba->dev_info.b_wb_buffer_type ==
> > WB_BUF_MODE_LU_DEDICATED)
> > +               return hba->dev_info.wb_dedicated_lu;
> > +       return 0;
> > +}
> > +
> >  extern int ufshcd_runtime_suspend(struct ufs_hba *hba);
> >  extern int ufshcd_runtime_resume(struct ufs_hba *hba);
> >  extern int ufshcd_runtime_idle(struct ufs_hba *hba);
> > --
> > 2.18.0
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
