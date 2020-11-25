Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B781C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 01:21:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 341E120DD4
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 01:21:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cK6fqus9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qIaUjWVq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 341E120DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XqQbJYuYSCJvESZCdq1JFQwM40oJ7qrw3W78fkiZ+6U=; b=cK6fqus9xKy7pWPi2fAyOHR4r
	Z/RAAmshKdErlyueyV4uum0umqFvCYl/QRNkFvsbDgtkU54zx1wj+2rfXYwVeh+4wa47lRLdlWeH+
	kePYihZ2n8WUcRbdmCAIRrYC1ZNZXrQL3x1Vv6CYv90C0lQKwofGqzQLiu6Rgrp7zenzpr4uA/Q6l
	Ugy1qQTtzmdDF2GWGxXXFeax2NNPSkhAIkKAkbs+TlOwL2+rkgk424EmBDrd9I0Wi7B4clR4GXJLa
	V3RHVt3ZUgYTOLc89Pu5b+s+AvrRfwBqsqGs/4aHCedvrHuXrvIE9T40nQE6+D9IiR/hKnq6zlq6o
	WZ3T4CS2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khjUn-00070n-J9; Wed, 25 Nov 2020 01:21:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khjUh-00070D-Uk; Wed, 25 Nov 2020 01:21:18 +0000
X-UUID: f3994f2a9db748839898bb8fa639505b-20201124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=zD9PnRSDQkta5y5sYo0Myaz8oC9QbODb/1/hmrtOsFo=; 
 b=qIaUjWVq4nUIkNiohHGbdTY+G8hI3xCXqGp46//yzaclqEWFABHi93KzjWnVIZr1WctGi6DxYtFCENOQjZ6pYO6zWvxC4YGp4NWrf6Gg7bIviCZcg03HW4l1ChPJW6lL4UBJSW5NapJk3KSqCqc9oUcoW2PlzGUJe+8n44tfwVY=;
X-UUID: f3994f2a9db748839898bb8fa639505b-20201124
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 914235956; Tue, 24 Nov 2020 17:21:04 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Nov 2020 17:11:03 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 25 Nov 2020 09:10:57 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Nov 2020 09:10:55 +0800
Message-ID: <1606266655.11864.7.camel@mhfsdcap03>
Subject: Re: [PATCH] mmc: mediatek: Add system suspend/resume interface
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 25 Nov 2020 09:10:55 +0800
In-Reply-To: <CAPDyKFpHAWBtxLOOvvqmAYFAwCsV66s_LzzVJg-zfXH5QE++Ng@mail.gmail.com>
References: <20201118063405.24906-1-wenbin.mei@mediatek.com>
 <CAPDyKFpHAWBtxLOOvvqmAYFAwCsV66s_LzzVJg-zfXH5QE++Ng@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E0BA17202977CDA0ADCBF4E0D56DAFAAA7974C1D3AD563521464216FB75063672000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_202116_762737_042E06FA 
X-CRM114-Status: GOOD (  27.58  )
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
Cc: srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-11-23 at 17:06 +0100, Ulf Hansson wrote:
> On Wed, 18 Nov 2020 at 07:34, Wenbin Mei <wenbin.mei@mediatek.com> wrote:
> >
> > Before we got these errors on MT8192 platform:
> > [   59.153891] Restarting tasks ...
> > [   59.154540] done.
> > [   59.159175] PM: suspend exit
> > [   59.218724] mtk-msdc 11f60000.mmc: phase: [map:fffffffe] [maxlen:31]
> > [final:16]
> > [  119.776083] mmc0: cqhci: timeout for tag 9
> > [  119.780196] mmc0: cqhci: ============ CQHCI REGISTER DUMP ===========
> > [  119.786709] mmc0: cqhci: Caps:      0x100020b6 | Version:  0x00000510
> > [  119.793225] mmc0: cqhci: Config:    0x00000101 | Control:  0x00000000
> > [  119.799706] mmc0: cqhci: Int stat:  0x00000000 | Int enab: 0x00000000
> > [  119.806177] mmc0: cqhci: Int sig:   0x00000000 | Int Coal: 0x00000000
> > [  119.812670] mmc0: cqhci: TDL base:  0x00000000 | TDL up32: 0x00000000
> > [  119.819149] mmc0: cqhci: Doorbell:  0x003ffc00 | TCN:      0x00000200
> > [  119.825656] mmc0: cqhci: Dev queue: 0x00000000 | Dev Pend: 0x00000000
> > [  119.832155] mmc0: cqhci: Task clr:  0x00000000 | SSC1:     0x00001000
> > [  119.838627] mmc0: cqhci: SSC2:      0x00000000 | DCMD rsp: 0x00000000
> > [  119.845174] mmc0: cqhci: RED mask:  0xfdf9a080 | TERRI:    0x0000891c
> > [  119.851654] mmc0: cqhci: Resp idx:  0x00000000 | Resp arg: 0x00000000
> > [  119.865773] mmc0: cqhci: : ===========================================
> > [  119.872358] mmc0: running CQE recovery
> > From these logs, we found TDL base was back to the default value.
> >
> > After suspend, the mmc host is powered off by HW, and bring CQE register
> > to the default value, so we add system suspend/resume interface, then bring
> > CQE to deactivated state before suspend, it will be enabled by CQE first
> > request after resume.
> >
> > Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> 
> I took the liberty of renaming msdc_sys_suspend|resume to
> msdc_suspend|resume, as I think the "_sys" is a bit superfluous.
> 
> Additionally, I added a fixes+stable tag, then I applied this for fixes, thanks!
> 
> Please tell me, if there is anything you would like me to change.
> 
> Kind regards
> Uffe
> 
> It is OK for me, thanks for your help.

> > ---
> >  drivers/mmc/host/mtk-sd.c | 22 ++++++++++++++++++++--
> >  1 file changed, 20 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> > index fc5ee5df91ad..c5f9cd6fc951 100644
> > --- a/drivers/mmc/host/mtk-sd.c
> > +++ b/drivers/mmc/host/mtk-sd.c
> > @@ -2758,11 +2758,29 @@ static int msdc_runtime_resume(struct device *dev)
> >         msdc_restore_reg(host);
> >         return 0;
> >  }
> > +
> > +static int msdc_sys_suspend(struct device *dev)
> > +{
> > +       struct mmc_host *mmc = dev_get_drvdata(dev);
> > +       int ret;
> > +
> > +       if (mmc->caps2 & MMC_CAP2_CQE) {
> > +               ret = cqhci_suspend(mmc);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> > +       return pm_runtime_force_suspend(dev);
> > +}
> > +
> > +static int msdc_sys_resume(struct device *dev)
> > +{
> > +       return pm_runtime_force_resume(dev);
> > +}
> >  #endif
> >
> >  static const struct dev_pm_ops msdc_dev_pm_ops = {
> > -       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > -                               pm_runtime_force_resume)
> > +       SET_SYSTEM_SLEEP_PM_OPS(msdc_sys_suspend, msdc_sys_resume)
> >         SET_RUNTIME_PM_OPS(msdc_runtime_suspend, msdc_runtime_resume, NULL)
> >  };
> >
> > --
> > 2.18.0
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
