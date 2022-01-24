Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78483C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 06:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Q36iC3+FaamcOwNBifrR4S0QYvQkNsp9O5BGAEs+NM=; b=iY9i74R/k39GCQ
	+fgHyX1smYccSoRTPIZ5OOJlHAAPv3YB7JYmczkOeV1DM3/tYtch+aTEf9EH9SZJp1HugbZRSAT0p
	186+cxOoUJSnjMeQZyvmaSysU4IPIRJoUBEJGU2tFEHea6GcJfBA6E4d28VJlMvddWQElac7ftDkO
	tFwJ3YEgE0M1fieK+KIg5yWMeGQYj5pN8SMAg90DmMKXi51Ba3oAE+Nr3NgBunAMTGc/qOn15V/T8
	tbMM4JIlWF/EnLi3TtqTvlouXJanVs2K9jgA/0H//2iTm516KXc0JWjcfebb1XqzIXMG0kSb9gfGU
	OCZBgHTu45dYtgTckiaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBtGw-002RyO-FF; Mon, 24 Jan 2022 06:56:14 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBtGt-002RxW-Es
 for linux-mediatek@lists.infradead.org; Mon, 24 Jan 2022 06:56:13 +0000
Received: by mail-lj1-x236.google.com with SMTP id b14so4426291ljb.0
 for <linux-mediatek@lists.infradead.org>; Sun, 23 Jan 2022 22:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6eCEcMeA9Fkb0FluXxSrK7i6IfK5ynhLkp1exKbEon8=;
 b=OGBcMOrV1Z0m2tOW1AiBcywVQKzyrsnU/JUIawoJ4prFqLdEjMc7dVWmXZBcH7FxaY
 4qo4K6XAAa2LyDI0c+fvoiJ53fa0kXDxguZyrHyL4XJreVdSXHd27L1i52qw0X/ZNzoE
 sQr7Uzxq4SgmFQOEfr759mutd41cl50vHxVFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6eCEcMeA9Fkb0FluXxSrK7i6IfK5ynhLkp1exKbEon8=;
 b=0PVD1v/u/dg+HAHIIInmTL2ZPyredZbjFaNV8vw77WphhTiamjtsrqxh0tU3zmCr71
 yZP7IkUnOc61yxkW89R2UnMQQVtO6qCgC8DXbJgyiM9utP05y8bLchZc7iTJ7eb998pU
 zNvlL2Dg27V1tPuBwDS2aflRhL63oUxo3v7f9qyKVkyXL9MFxzhtDxBbiHQIGvD7OLE/
 djDF65whgqo8s6mDA6ZpjCZvaN7qWOVspqlL92nBbOTWHwbZ7dHW6ieiAWJzWXYTOpK/
 6ixB75s2DbfawqTSOGDWqR/i2tTDpxsFxb9crsKC9LwQir9hf7mH/KjLiKgGjLSjdLK/
 7vSA==
X-Gm-Message-State: AOAM530qMWwIbIUyfen06PPOYt5AAWjEBFP5tZq6d+7AWbcRLZ74iR1U
 nFsm+Y2Hr0f3vJq/Tt8fJPZn41AlBZWOL8cKvCN2fkpol2E=
X-Google-Smtp-Source: ABdhPJyQX8kByoNsnhzYvi39UHrRBNLJT8x4eB8dLRIbLqUY9db041EKQT+HEsVFbuzf9bwzlZzkdhG3mdce8oTvEiU=
X-Received: by 2002:a2e:b70a:: with SMTP id j10mr10465200ljo.376.1643007369423; 
 Sun, 23 Jan 2022 22:56:09 -0800 (PST)
MIME-Version: 1.0
References: <20220123033306.29799-1-qizhong.cheng@mediatek.com>
 <CAGXv+5EcAXFTnjkbeU4f3J2s4Ue5zxrN4QgS=t54BnLX8Gkw2w@mail.gmail.com>
 <bddf917f241a6628d43ddd95b577024c9ddf9931.camel@mediatek.com>
In-Reply-To: <bddf917f241a6628d43ddd95b577024c9ddf9931.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Jan 2022 14:55:58 +0800
Message-ID: <CAGXv+5GUW6qcxwnfj3dsn7Lb1yY5bNv+v+PQ2VN1NX9yPmGd2A@mail.gmail.com>
Subject: Re: [PATCH] PCI: mediatek: Change MSI interrupt processing sequence
To: "qizhong.cheng" <qizhong.cheng@mediatek.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, chuanjia.liu@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_225611_559387_B614CA24 
X-CRM114-Status: GOOD (  30.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 24, 2022 at 2:27 PM qizhong.cheng
<qizhong.cheng@mediatek.com> wrote:
>
> Hi chenYu,
>
> On Mon, 2022-01-24 at 11:12 +0800, Chen-Yu Tsai wrote:
> > Hi,
> >
> > On Sun, Jan 23, 2022 at 11:34 AM qizhong cheng
> > <qizhong.cheng@mediatek.com> wrote:
> > >
> > > As an edge-triggered interrupts, its interrupt status should be
> > > cleared
> > > before dispatch to the handler of device.
> >
> > I'm curious, is this just a code correction or are there real world
> > cases where something fails?
>
> Yes, we found a failure when used iperf tool for wifi and network cards
> performance testing. The function of "while" has just been executed,
> and the EP sent an MSI before executing "Clear MSI interrupt status".
> After executing "Clear MSI interrupt status", this edge-triggered
> interrupt status is cleared, but EP is still waiting for interrupt
> handler.

Can you also include this in the commit log?  It would be nice to record
the exact scenario that this fix targets.

ChenYu

> >
> > Also, please add a Fixes tag and maybe Cc stable so this gets
> > backported
> > automatically.
>
> Thanks for your review, I will fix it in the next version.
>
> >
> > ChenYu
> >
> > > Signed-off-by: qizhong cheng <qizhong.cheng@mediatek.com>
> > > ---
> > >  drivers/pci/controller/pcie-mediatek.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/pcie-mediatek.c
> > > b/drivers/pci/controller/pcie-mediatek.c
> > > index 2f3f974977a3..705ea33758b1 100644
> > > --- a/drivers/pci/controller/pcie-mediatek.c
> > > +++ b/drivers/pci/controller/pcie-mediatek.c
> > > @@ -624,12 +624,12 @@ static void mtk_pcie_intr_handler(struct
> > > irq_desc *desc)
> > >                 if (status & MSI_STATUS){
> > >                         unsigned long imsi_status;
> > >
> > > +                       /* Clear MSI interrupt status */
> > > +                       writel(MSI_STATUS, port->base +
> > > PCIE_INT_STATUS);
> > >                         while ((imsi_status = readl(port->base +
> > > PCIE_IMSI_STATUS))) {
> > >                                 for_each_set_bit(bit, &imsi_status,
> > > MTK_MSI_IRQS_NUM)
> > >                                         generic_handle_domain_irq(p
> > > ort->inner_domain, bit);
> > >                         }
> > > -                       /* Clear MSI interrupt status */
> > > -                       writel(MSI_STATUS, port->base +
> > > PCIE_INT_STATUS);
> > >                 }
> > >         }
> > >
> > > --
> > > 2.25.1
> > >
> > >
> > > _______________________________________________
> > > Linux-mediatek mailing list
> > > Linux-mediatek@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-mediatek
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
