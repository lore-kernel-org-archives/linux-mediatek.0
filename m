Return-Path: <SRS0=EkB4=4W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DEEBC3F2CD
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2020 13:31:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70BAE20848
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2020 13:31:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KpfpRT5v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Edejk94U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70BAE20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=of2ECxeTRNasqMufyHq/Y1E1eaodr341qC7n75TUSuE=; b=KpfpRT5vlwGs9d
	Q4v60l4mYUA/4vg0z0p1ibIrkbMESlmV4/n4nUg0sqKtLluivT/kwXkAgS3qpdMbSiOdUcwgdBnn7
	wIN8Rb9T4OiVW1H2GR9M/iBmqvxVGmR6Wwlbw+YqdPEUtW24cOn8UCydC90+VIovKLXlZhghvOjkG
	KHf0dIkxBBXJmDV3J9f4+DP8zf2mHCrNi3PWXJo2xFsq9Y3VLOwIdim4MclIAD8xS/5LWj5Sg6AH2
	fLPRpNw6CpSPMbjkyU9OcsWzR/ypGG9bYOn4xsfT/MzkjeKyrJaIGftG5eAiAQ0KdYw3TKWqAc8/L
	HwuYLuL66IS9sAap9aog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9qaV-0000vv-6x; Thu, 05 Mar 2020 13:30:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9qaN-0000n2-Fp; Thu, 05 Mar 2020 13:30:48 +0000
X-UUID: 3e36fb96404d45f09e1041493798b962-20200305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=vJUGDoFzTQdjcbPEZc20+na+H1fziGynCmehL0Gfwnk=; 
 b=Edejk94UMt9bpOodRgLuaVcBa4S2X0Q+G3Pm6zylOtGdk37Kf36DvIY/Dz1aMXPkoGmDjCGn2RpKEGnN9btiYv9lu3P2J2e0jZoidPcutZT575g3CMQdFoYW4SW4IivKijgNmCcSqXyNhGSRrlDsRB4r5TiRu+vM9zdkf0yRY30=;
X-UUID: 3e36fb96404d45f09e1041493798b962-20200305
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2028000410; Thu, 05 Mar 2020 05:30:38 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Mar 2020 05:26:18 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Mar 2020 21:23:54 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 5 Mar 2020 21:25:10 +0800
Message-ID: <1583414757.14250.7.camel@mtksdccf07>
Subject: RE: [PATCH v1 4/4] scsi: ufs-mediatek: remove delay for host enabling
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Thu, 5 Mar 2020 21:25:57 +0800
In-Reply-To: <MN2PR04MB6991FAE18CCA3DACF2306E08FCE20@MN2PR04MB6991.namprd04.prod.outlook.com>
References: <20200305040704.10645-1-stanley.chu@mediatek.com>
 <20200305040704.10645-5-stanley.chu@mediatek.com>
 <MN2PR04MB6991FAE18CCA3DACF2306E08FCE20@MN2PR04MB6991.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_053047_534431_C1DDF8AC 
X-CRM114-Status: GOOD (  12.99  )
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
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Avri,

On Thu, 2020-03-05 at 13:14 +0000, Avri Altman wrote:
> Hi Stanley,
> 
> > 
> > 
> > MediaTek platform and UFS controller do not require the delay
> > for host enabling, thus remove it.
> > 
> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > ---
> >  drivers/scsi/ufs/ufs-mediatek.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
> > index 3b0e575d7460..ea3b5fd62492 100644
> > --- a/drivers/scsi/ufs/ufs-mediatek.c
> > +++ b/drivers/scsi/ufs/ufs-mediatek.c
> > @@ -258,6 +258,8 @@ static int ufs_mtk_init(struct ufs_hba *hba)
> I would expect to set whatever is needed for your host controller
> In ufshcd_vops_hce_enable_notify(hba, PRE_CHANGE), and not here.
> 

I think this is a good suggestion! And thus we could have more
flexibility to customize the value according to different scenarios.

I will consider this approach in next version.

Thanks!
Stanley Chu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
