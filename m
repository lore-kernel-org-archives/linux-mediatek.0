Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F826C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 14:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ausyBxe1EwSltgsOW+aLx9gGKbI9xmb58xvni35q/8=; b=ECcDTm2w1kOVF7IUjm82lxlAhU
	dmkdnXrzAnNoLNhA0cqGxE2JBGWEhU4RleLN9qetVZGKkShQkhcmgfeQRzEx+AQTHPGTGczIP3Jc8
	MG/MP7hOzP05CRZlspPfbElP+meBAj00oG1P5zEBG52SxHfktXXPEDrivO79Ptb3gFkONgVKo4a0T
	G5Bt9RRRuLWbxU6QNUo22dtNaQ+beh976VNdMqvAnn7MWc1wi4joGVA6XXZrq8K/ljxmi9EgXR8iN
	NAgv4QrqNG2ngZ2n02l36s9q2eM0QUmiDwotFDhT7qX6VPWXWW8WweJuZU+h4CBL3BjPBha+27gBh
	kX5kabIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5pil-001Pjq-29; Mon, 27 Jun 2022 14:28:11 +0000
Received: from mail-yw1-f177.google.com ([209.85.128.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5piZ-001PeS-Lu; Mon, 27 Jun 2022 14:28:01 +0000
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-3176d94c236so87486837b3.3;
        Mon, 27 Jun 2022 07:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2ausyBxe1EwSltgsOW+aLx9gGKbI9xmb58xvni35q/8=;
        b=WzHvdaUB2JK2uSqjchQcFy/22QR8TucH7/t6gR8Yi/+ZfSCJh1TkdZeig6vLAmKK1Q
         zK4kLt3FW6QgVVm0iBU3MvGl2jdrCbNDJTBeDAa7lkbAYhGH/sgPtdaMT+i/JhOs8rfD
         PppyghkGQTtj1jHWbh+WwsFR06Yn6xf01oY3vqbVAtnZpnlfwtmJBTpaY9Q3vZZezlfX
         w4ifbzk921pikyWgKnVs25Mz9zHgC6AZJq4fgv3jHMvRw9EsAFQcJhhiZv5+hu+gjIMP
         YTEoOVO6SK9mKC54sl2hNEILwhtj8+RJ/RqY6LHJCCzZb1QVb6O6BvaMMmsfcGFDrSCF
         lz8g==
X-Gm-Message-State: AJIora/2lzPXryDvEVcKVUYZZGTAc5MbwPGQBymJ3znwkY592iOVEUfa
	OPOyCHNESeG10D1Hvl3OEsIq2sG49m92vrJD5Ww=
X-Google-Smtp-Source: AGRyM1vIcglL1E5IuPFyWS28U+Yjuq52Iosbfn31LhbYRsuDUhrfMrQfTgx6LXwcWn1lzMGswldF2MiwAQkGGvT1aJ8=
X-Received: by 2002:a81:1b97:0:b0:2db:640f:49d8 with SMTP id
 b145-20020a811b97000000b002db640f49d8mr14642063ywb.326.1656340076401; Mon, 27
 Jun 2022 07:27:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220613120755.14306-1-peter.wang@mediatek.com> <Yrm7QSRXKZg4/q7s@kroah.com>
In-Reply-To: <Yrm7QSRXKZg4/q7s@kroah.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 27 Jun 2022 16:27:45 +0200
Message-ID: <CAJZ5v0iFyTXc8TfEq5vHZvRmi9YbW-OA_G3n4xULhsw7=gdZ5A@mail.gmail.com>
Subject: Re: [PATCH v1] PM-runtime: Check supplier_preactivated before release supplier
To: Greg KH <gregkh@linuxfoundation.org>
Cc: peter.wang@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>, 
	Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Stanley Chu <stanley.chu@mediatek.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Avri Altman <avri.altman@wdc.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	wsd_upstream <wsd_upstream@mediatek.com>, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, chun-hung.wu@mediatek.com, 
	alice.chao@mediatek.com, cc.chou@mediatek.com, chaotian.jing@mediatek.com, 
	jiajie.hao@mediatek.com, powen.kao@mediatek.com, qilin.tan@mediatek.com, 
	lin.gui@mediatek.com, tun-yu.yu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_072759_756570_ED103FB9 
X-CRM114-Status: GOOD (  29.14  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jun 27, 2022 at 4:14 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jun 13, 2022 at 08:07:55PM +0800, peter.wang@mediatek.com wrote:
> > From: Peter Wang <peter.wang@mediatek.com>
> >
> > With divice link of DL_FLAG_PM_RUNTIME, if consumer call pm_runtime_get_suppliers
> > to prevent supplier enter suspend, pm_runtime_release_supplier should
> > check supplier_preactivated before let supplier enter suspend.
> >
> > If the link is drop or release, bypass check supplier_preactivated.
> >
> > Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> > ---
> >  drivers/base/core.c          |  2 +-
> >  drivers/base/power/runtime.c | 15 ++++++++++++---
> >  include/linux/pm_runtime.h   |  5 +++--
> >  3 files changed, 16 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index 7cd789c4985d..3b9cc559928f 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -486,7 +486,7 @@ static void device_link_release_fn(struct work_struct *work)
> >       /* Ensure that all references to the link object have been dropped. */
> >       device_link_synchronize_removal();
> >
> > -     pm_runtime_release_supplier(link, true);
> > +     pm_runtime_release_supplier(link, true, true);
> >
> >       put_device(link->consumer);
> >       put_device(link->supplier);
> > diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> > index 676dc72d912d..3c4f425937a1 100644
> > --- a/drivers/base/power/runtime.c
> > +++ b/drivers/base/power/runtime.c
> > @@ -314,10 +314,19 @@ static int rpm_get_suppliers(struct device *dev)
> >   * and if @check_idle is set, check if that device is idle (and so it can be
> >   * suspended).
> >   */
> > -void pm_runtime_release_supplier(struct device_link *link, bool check_idle)
> > +void pm_runtime_release_supplier(struct device_link *link, bool check_idle,
> > +     bool drop)
>
> This is just making this horrible api even worse.  Now there are 2
> boolean flags required, 2 more than really should even be here at all.
> Every time you see this function being used, you will now have to look
> up the definition  to see what it really does.
>
> Please make a new function that calls the internal function with the
> flag set properly, so that it is obvious what is happening when the call
> is made.
>
> and really, the same thing should be done for the check_idle flag,
> that's not good either.

Agreed, and let me take care of this.

