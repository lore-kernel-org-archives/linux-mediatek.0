Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4183BC388F2
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 07:40:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF3D82222B
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 07:40:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="POmKu6rx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jpEKNxLM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF3D82222B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OFiKN1jsUnEkPte6W2E14gAtOC8GP3BqScuvqCbd8ps=; b=POmKu6rxVPyVHSjxcIrW2BS+Q
	zUj+rNEE555NGgHJpqAoAxitqXOwd8jyAjXnuY3HSca5xD6062dw62B5OOK40u5H9OTqXWozzPiMY
	ELFBRW+Bvvq7gb82+Dp23CERtwc85n9CVx9gNPoiPb6FAXWvjkIlfiJmfqp4gxypK8LoxIuibqfWa
	/OxbezfCReGc8d2FwcRYt/98ViWVZAVmgLr6XL+goFfZn5LyxLn6mAgVwg0ekVAQkfxVmhhLI9XQx
	QC/Fqewl0XCIMaFOryU2hltSPKI/KGhRMztH3jAFD5jC3WmgvVKEiit/hmqZwakBT0gO0UB8QQocH
	ioViaLV9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZqvH-0001Qj-Ca; Tue, 03 Nov 2020 07:40:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZqvE-0001Pb-SL; Tue, 03 Nov 2020 07:40:06 +0000
X-UUID: 68d8bca986fb4e4ba35aea121ca07304-20201102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ZZrwHSS1iEJcnFxsaFwOkWSIeqBrHNXbvsvad1w31c0=; 
 b=jpEKNxLMJF3m1Z2UJy/TLKydQxeNHaEsfpxxLSTBf/189X6IgF1caOFcvf27tZduzmCI/3kn4RaTzyE3nu2JoYTuVNoYsK87bkvtjpCf0Y8EVzvwV3BltVdt3UqdsohYaySfcBFan1SZ2JYC6bFUWlXUO9WwookACIf9u9FmsCk=;
X-UUID: 68d8bca986fb4e4ba35aea121ca07304-20201102
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 613923419; Mon, 02 Nov 2020 23:39:53 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Nov 2020 23:39:51 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Nov 2020 15:39:44 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 Nov 2020 15:39:44 +0800
Message-ID: <1604389184.13152.9.camel@mtkswgap22>
Subject: RE: [PATCH v1 1/6] scsi: ufs-mediatek: Assign arguments with
 correct type
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Tue, 3 Nov 2020 15:39:44 +0800
In-Reply-To: <DM6PR04MB6575F51915ED4E904ED82EC1FC110@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20201029115750.24391-1-stanley.chu@mediatek.com>
 <20201029115750.24391-2-stanley.chu@mediatek.com>
 <DM6PR04MB6575F51915ED4E904ED82EC1FC110@DM6PR04MB6575.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0E859257A7E797E8F756E436308F7A8CC066855BC4D0EBA211CF9AA173D4A0132000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_024005_117447_721FD9AF 
X-CRM114-Status: GOOD (  24.61  )
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
 "jiajie.hao@mediatek.com" <jiajie.hao@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "alice.chao@mediatek.com" <alice.chao@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Avri,

On Tue, 2020-11-03 at 07:12 +0000, Avri Altman wrote:
> > 
> > In ufs_mtk_unipro_set_lpm(), use specific unsigned values
> > as the argument to invoke ufshcd_dme_set().
> > 
> > In the same time, change the name of ufs_mtk_unipro_set_pm()
> > to ufs_mtk_unipro_set_lpm() to align the naming convention
> > in MediaTek UFS driver.
> > 
> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> Looks like this patch is gilding the lily?

Thanks for the review.

Please see explanation below.

> 
> > ---
> >  drivers/scsi/ufs/ufs-mediatek.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
> > index 8df73bc2f8cb..0196a89055b5 100644
> > --- a/drivers/scsi/ufs/ufs-mediatek.c
> > +++ b/drivers/scsi/ufs/ufs-mediatek.c
> > @@ -639,14 +639,14 @@ static int ufs_mtk_pwr_change_notify(struct
> > ufs_hba *hba,
> >         return ret;
> >  }
> > 
> > -static int ufs_mtk_unipro_set_pm(struct ufs_hba *hba, bool lpm)
> > +static int ufs_mtk_unipro_set_lpm(struct ufs_hba *hba, bool lpm)
> >  {
> >         int ret;
> >         struct ufs_mtk_host *host = ufshcd_get_variant(hba);
> > 
> >         ret = ufshcd_dme_set(hba,
> >                              UIC_ARG_MIB_SEL(VS_UNIPROPOWERDOWNCONTROL, 0),
> > -                            lpm);
> > +                            lpm ? 1 : 0);
> bool is implicitly converted to int anyway?

This change is the echo of your suggestion in
https://patchwork.kernel.org/project/linux-scsi/patch/20200908064507.30774-4-stanley.chu@mediatek.com/

Actually I think your suggestion is constructive that the accepted
values of VS_UNIPROPOWERDOWNCONTROL are better clearly defined so I use
the casting here in this patch.

> 
> >         if (!ret || !lpm) {
> >                 /*
> >                  * Forcibly set as non-LPM mode if UIC commands is failed
> > @@ -664,7 +664,7 @@ static int ufs_mtk_pre_link(struct ufs_hba *hba)
> >         int ret;
> >         u32 tmp;
> > 
> > -       ret = ufs_mtk_unipro_set_pm(hba, false);
> > +       ret = ufs_mtk_unipro_set_lpm(hba, false);
> >         if (ret)
> >                 return ret;
> > 
> > @@ -774,7 +774,7 @@ static int ufs_mtk_link_set_hpm(struct ufs_hba
> > *hba)
> >         if (err)
> >                 return err;
> > 
> > -       err = ufs_mtk_unipro_set_pm(hba, false);
> > +       err = ufs_mtk_unipro_set_lpm(hba, false);
> >         if (err)
> >                 return err;
> > 
> > @@ -795,10 +795,10 @@ static int ufs_mtk_link_set_lpm(struct ufs_hba
> > *hba)
> >  {
> >         int err;
> > 
> > -       err = ufs_mtk_unipro_set_pm(hba, true);
> > +       err = ufs_mtk_unipro_set_lpm(hba, true);
> >         if (err) {
> >                 /* Resume UniPro state for following error recovery */
> > -               ufs_mtk_unipro_set_pm(hba, false);
> > +               ufs_mtk_unipro_set_lpm(hba, false);
> >                 return err;
> >         }
> > 
> > --
> > 2.18.0

Thanks,
Stanley Chu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
