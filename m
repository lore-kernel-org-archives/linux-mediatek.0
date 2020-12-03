Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61192C6369E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 01:29:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF942221FB
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 01:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF942221FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J9/qesTd+tsXaIsoPse+IIWC4tyilU5Qxi7AQCh2o4E=; b=F7Na9AEUPlgNOYHd8iWMs/uCQ
	SWetsIMU78jews/xmOjcq5vkA6CaUkERQeqHfStAfly+vujmUe9No5S7IpZbAzuUHvhbCWq879ZCG
	6RzmZl0eWNm5UZkPOI9BUrqfI0LAmdzNgOD5dTVMIl5+L4GkRFzo9hgCa4XxXFFhI3mc30wBKGgnU
	DzI/QqpRnrnOsz1k7RqRbeRUEtLsTEZBHD98PYJbv2Wd2hxWZLnQMSkpGBgGE0mKboZPh07flelk/
	ougL04w7PmUnBjjMFPN4B3rucA0/xphfInZpIMRWwfpQPpWkeBHF4pie0cC8/2m1a4M+cTgLr/Btj
	+EYu3maag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkdR5-0003ia-8L; Thu, 03 Dec 2020 01:29:31 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkdR1-0003hD-0S
 for linux-mediatek@lists.infradead.org; Thu, 03 Dec 2020 01:29:28 +0000
Received: by mail-vs1-xe43.google.com with SMTP id s85so393489vsc.3
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Dec 2020 17:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fd/GRD9cyxAWL0iNFB8pBucV96AYVJpP+i+zKUmbx0M=;
 b=b8rb2+6vQ9VKN6FCi69FvHejkt9pxiQleJb7BmtYl7hCd/cr2V5fmKhrqXcHNjRXvo
 eejyaRxKYVc28uD0tDGZaLmX8XkYNZEiveN7to+V0u8BbI4Pj7XmxK3V+YVN3aQmYQto
 CmiNyn7qzTD5Z1Gj35MgZXgCQ7WiCDXMmEE6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fd/GRD9cyxAWL0iNFB8pBucV96AYVJpP+i+zKUmbx0M=;
 b=DIGQR9niziK6QUP3kIML4QB+7CrKeXQekKsCTZwtw0jtVb7++jBiCSQhbwn8/A+LcZ
 jZzfV7JQka2nryU14wRGP72wTZ+bvWBFYQes3LdFGTzJCn/dDI/cmXtfJ6bxVra9meDb
 q/owIHfvIS5cOFDj6ScfJb6ooeYLXL3/7GJTchu/GYhumxPDXvuAtcR6X7K16VDkXDdr
 fikK4M59vWAvXLOh4UqrR1qSs2uB51ZhEHSa1PqqsH4rpHcIKxApHj+HnCyK51ERZzyx
 4QKwpyF2+IQRbStJN4mN5WwIjkrA5jTGDQzkrwKP1Bdd+MD249o2iL2FCDmjyEphSuyv
 z79g==
X-Gm-Message-State: AOAM5300J+ptFDdQTWHZsvAudIOuPPy5iGS6E9kLLbDOufJJ4RceCk7n
 xNpVXdh7jVSh7nIGQ3uKQ7ubI5vsLC4dPU8mralFIQ==
X-Google-Smtp-Source: ABdhPJwnzZgt4PVfjCTCg+tkzqA9yIGlP8pZu6dqJXQE+Mou1h6Gm+tLzjrrviJw+tPJmXRc14VK37OMb134aBXt+Yg=
X-Received: by 2002:a67:2783:: with SMTP id n125mr761689vsn.47.1606958963527; 
 Wed, 02 Dec 2020 17:29:23 -0800 (PST)
MIME-Version: 1.0
References: <20201118063405.24906-1-wenbin.mei@mediatek.com>
 <CAPDyKFpHAWBtxLOOvvqmAYFAwCsV66s_LzzVJg-zfXH5QE++Ng@mail.gmail.com>
 <1606266655.11864.7.camel@mhfsdcap03>
In-Reply-To: <1606266655.11864.7.camel@mhfsdcap03>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 3 Dec 2020 09:29:12 +0800
Message-ID: <CANMq1KBwtZNgkK5mEUdOk4sq05aXqQ59QsqYqapPqQr7DEWgMA@mail.gmail.com>
Subject: Re: [PATCH] mmc: mediatek: Add system suspend/resume interface
To: Wenbin Mei <wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_202927_152665_87535C3B 
X-CRM114-Status: GOOD (  29.58  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guenter Roeck <groeck@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This causes a 0-day warning (on our chromeos-5.4 backports but I don't
see why upstream would not be affected):
https://groups.google.com/g/cros-kernel-buildreports/c/MfS3SInT5jg/m/Hkzxh_U7AwAJ

Didn't look at the details of the config, but SET_SYSTEM_SLEEP_PM_OPS
is a noop if CONFIG_PM_SLEEP is not set (while SET_RUNTIME_PM_OPS is
noop-ed by CONFIG_PM).

So I guess msdc_suspend/msdc_resume should be guarded by
CONFIG_PM_SLEEP instead of CONFIG_PM.

On Wed, Nov 25, 2020 at 9:12 AM Wenbin Mei <wenbin.mei@mediatek.com> wrote:
>
> On Mon, 2020-11-23 at 17:06 +0100, Ulf Hansson wrote:
> > On Wed, 18 Nov 2020 at 07:34, Wenbin Mei <wenbin.mei@mediatek.com> wrote:
> > >
> > > Before we got these errors on MT8192 platform:
> > > [   59.153891] Restarting tasks ...
> > > [   59.154540] done.
> > > [   59.159175] PM: suspend exit
> > > [   59.218724] mtk-msdc 11f60000.mmc: phase: [map:fffffffe] [maxlen:31]
> > > [final:16]
> > > [  119.776083] mmc0: cqhci: timeout for tag 9
> > > [  119.780196] mmc0: cqhci: ============ CQHCI REGISTER DUMP ===========
> > > [  119.786709] mmc0: cqhci: Caps:      0x100020b6 | Version:  0x00000510
> > > [  119.793225] mmc0: cqhci: Config:    0x00000101 | Control:  0x00000000
> > > [  119.799706] mmc0: cqhci: Int stat:  0x00000000 | Int enab: 0x00000000
> > > [  119.806177] mmc0: cqhci: Int sig:   0x00000000 | Int Coal: 0x00000000
> > > [  119.812670] mmc0: cqhci: TDL base:  0x00000000 | TDL up32: 0x00000000
> > > [  119.819149] mmc0: cqhci: Doorbell:  0x003ffc00 | TCN:      0x00000200
> > > [  119.825656] mmc0: cqhci: Dev queue: 0x00000000 | Dev Pend: 0x00000000
> > > [  119.832155] mmc0: cqhci: Task clr:  0x00000000 | SSC1:     0x00001000
> > > [  119.838627] mmc0: cqhci: SSC2:      0x00000000 | DCMD rsp: 0x00000000
> > > [  119.845174] mmc0: cqhci: RED mask:  0xfdf9a080 | TERRI:    0x0000891c
> > > [  119.851654] mmc0: cqhci: Resp idx:  0x00000000 | Resp arg: 0x00000000
> > > [  119.865773] mmc0: cqhci: : ===========================================
> > > [  119.872358] mmc0: running CQE recovery
> > > From these logs, we found TDL base was back to the default value.
> > >
> > > After suspend, the mmc host is powered off by HW, and bring CQE register
> > > to the default value, so we add system suspend/resume interface, then bring
> > > CQE to deactivated state before suspend, it will be enabled by CQE first
> > > request after resume.
> > >
> > > Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> >
> > I took the liberty of renaming msdc_sys_suspend|resume to
> > msdc_suspend|resume, as I think the "_sys" is a bit superfluous.
> >
> > Additionally, I added a fixes+stable tag, then I applied this for fixes, thanks!
> >
> > Please tell me, if there is anything you would like me to change.
> >
> > Kind regards
> > Uffe
> >
> > It is OK for me, thanks for your help.
>
> > > ---
> > >  drivers/mmc/host/mtk-sd.c | 22 ++++++++++++++++++++--
> > >  1 file changed, 20 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> > > index fc5ee5df91ad..c5f9cd6fc951 100644
> > > --- a/drivers/mmc/host/mtk-sd.c
> > > +++ b/drivers/mmc/host/mtk-sd.c
> > > @@ -2758,11 +2758,29 @@ static int msdc_runtime_resume(struct device *dev)
> > >         msdc_restore_reg(host);
> > >         return 0;
> > >  }
> > > +
> > > +static int msdc_sys_suspend(struct device *dev)
> > > +{
> > > +       struct mmc_host *mmc = dev_get_drvdata(dev);
> > > +       int ret;
> > > +
> > > +       if (mmc->caps2 & MMC_CAP2_CQE) {
> > > +               ret = cqhci_suspend(mmc);
> > > +               if (ret)
> > > +                       return ret;
> > > +       }
> > > +
> > > +       return pm_runtime_force_suspend(dev);
> > > +}
> > > +
> > > +static int msdc_sys_resume(struct device *dev)
> > > +{
> > > +       return pm_runtime_force_resume(dev);
> > > +}
> > >  #endif
> > >
> > >  static const struct dev_pm_ops msdc_dev_pm_ops = {
> > > -       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > > -                               pm_runtime_force_resume)
> > > +       SET_SYSTEM_SLEEP_PM_OPS(msdc_sys_suspend, msdc_sys_resume)
> > >         SET_RUNTIME_PM_OPS(msdc_runtime_suspend, msdc_runtime_resume, NULL)
> > >  };
> > >
> > > --
> > > 2.18.0
> > >
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
