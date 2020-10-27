Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DF5C388F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 09:52:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14BBF20759
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 09:52:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w4SG2pYA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fXAhHZIg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14BBF20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xYcSEy2l3TGouutchlmExSQrga72Xp4CMkXpgXDZOT4=; b=w4SG2pYA4s7dSJ1xiHn/s4OMq
	2J3cnKjPvbKX/JLUpmJtSKZUxxNgugC8cNNYD4TOWKsyoU6x18wzzv5tEsCgJM+YnSIdny3Ue7JhJ
	HS3MFcCZDDnVwEPHQCLClzBpsVUzKm4TWiI+YgvB33HoKQJcvBgFKGzXurbHW+29MAsQIAuHvXZMB
	boi5I8ZkNCqLshMjMb3ShxUwYXqcBWTwhy67DrDEeQQFNPi8h/kKdfKPdzKCchU/TjBeHKQg+ZUzI
	UQZT9VqvztRQEUzGK1D3t6mK+4Yyqrjhewl5be5dV+N0BkZlIa0dfeMUr+QPE02nfnNOn7HZ1VPYC
	qIyapZl4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXLeb-0006vN-Bm; Tue, 27 Oct 2020 09:52:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXLeX-0006s1-6m; Tue, 27 Oct 2020 09:52:31 +0000
X-UUID: 1a4cf63bf244492685ee0e4b7ff56c2a-20201027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=LDji51ZuVtXodbYhY6ntu2rO47u7vkwshUVSjF4m5dQ=; 
 b=fXAhHZIguYrWdZk7rzJue5/OdNv0iTdE03yTAcUgDMS+CqCRd6XDwSAqDpgzT9fTDJrT0WTolTGkrHA/vJ9YZhIbkjsUWU41xwBS+H2EehFJlfgu0zcQE13qOBHG+WkY9L7JOgmv7yofcRK+D6g5V0C0X5SaHh4SDQOPTfib9kE=;
X-UUID: 1a4cf63bf244492685ee0e4b7ff56c2a-20201027
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 721430166; Tue, 27 Oct 2020 01:52:18 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Oct 2020 02:52:17 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Oct 2020 17:52:14 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 27 Oct 2020 17:52:14 +0800
Message-ID: <1603792335.2104.12.camel@mtkswgap22>
Subject: RE: [PATCH 3/4] scsi: ufs-mediatek: Fix flag of unipro low-power mode
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Tue, 27 Oct 2020 17:52:15 +0800
In-Reply-To: <BY5PR04MB67058DE7C6B5F63E960280CBFC3C0@BY5PR04MB6705.namprd04.prod.outlook.com>
References: <20200908064507.30774-1-stanley.chu@mediatek.com>
 <20200908064507.30774-4-stanley.chu@mediatek.com>
 <BY5PR04MB67058DE7C6B5F63E960280CBFC3C0@BY5PR04MB6705.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 58549434F085AA0CF554C6FA97DDC7A7439B1FBB93D811B8F34E8BA4BBC087112000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_055229_991607_A8E738D9 
X-CRM114-Status: GOOD (  20.35  )
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
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "bvanassche@acm.org" <bvanassche@acm.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Avri,

On Sat, 2020-09-19 at 08:08 +0000, Avri Altman wrote:
> > 
> > Forcibly leave UniPro low-power mode if UIC commands is failed.
> > This makes hba_enable_delay_us as correct (default) value for
> > re-enabling the host.
> > 
> > At the same time, change type of parameter "lpm" in function
> > ufs_mtk_unipro_set_pm() to "bool".
> Semantically, better leave it u32 as its eventually assigned to the arg3 of the uic command 
> 

Thanks for reminding.
I will use specific u32 values while sending arg3 to fix this.

> > 
> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > ---
> >  drivers/scsi/ufs/ufs-mediatek.c | 20 ++++++++++++++------
> >  1 file changed, 14 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
> > index 887c03e8bcc0..feba74a72309 100644
> > --- a/drivers/scsi/ufs/ufs-mediatek.c
> > +++ b/drivers/scsi/ufs/ufs-mediatek.c
> > @@ -419,7 +419,7 @@ static int ufs_mtk_pwr_change_notify(struct ufs_hba
> > *hba,
> >         return ret;
> >  }
> > 
> > -static int ufs_mtk_unipro_set_pm(struct ufs_hba *hba, u32 lpm)
> > +static int ufs_mtk_unipro_set_pm(struct ufs_hba *hba, bool lpm)
> >  {
> >         int ret;
> >         struct ufs_mtk_host *host = ufshcd_get_variant(hba);
> > @@ -427,8 +427,14 @@ static int ufs_mtk_unipro_set_pm(struct ufs_hba
> > *hba, u32 lpm)
> >         ret = ufshcd_dme_set(hba,
> >                              UIC_ARG_MIB_SEL(VS_UNIPROPOWERDOWNCONTROL, 0),
> >                              lpm);
> > -       if (!ret)
> > +       if (!ret || !lpm) {
> > +               /*
> > +                * Forcibly set as non-LPM mode if UIC commands is failed
> > +                * to use default hba_enable_delay_us value for re-enabling
> > +                * the host.
> > +                */
> >                 host->unipro_lpm = lpm;
> Maybe just host->unipro_lpm = false; instead

This statement shall stay like this for case: "lpm = true"

Thanks,
Stanley Chu


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
