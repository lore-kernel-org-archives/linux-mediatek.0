Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFBBC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 03:36:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD040613AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 03:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD040613AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/8rOReQDFQh3ny+amp4Ap6l7WEOOo5UWNYtj/nPVPZM=; b=gJ14EscUSZvm6flXB1odGLXWS
	QlONMQfIDEBe2bQHl6AYpuTFfCV8NyMx790rvZZZzz9rUJLIQpReNmYVnwVg+k4R4dGgNkzKAf16N
	JoK6w07rqE3priyMAM0XrRriXCtXCstSp2LQl8mOmQwCzlyZjMIdBeu8bZ05HHPjX/G8awKgVk5RD
	5clQ6m2AakKdB+4FtCurLPMzNu38mj6YEceAZMl3SF8rUr5y+uau1BzMrVbRgcRkfZP63OhKyngfF
	+LC4D+ztILzy8/rygBFtG4uRhptp/YBBvwZlNur4xqNmhsi9V/nzHA18IXaVFP3Fq5jTqvJDQEa6F
	a3QWJbrdQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lW9qZ-008AWd-5V; Tue, 13 Apr 2021 03:36:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lW9qW-008AVo-37; Tue, 13 Apr 2021 03:36:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=IG3yM/hhJgI4HS5wGt30gHoTh2N5TgYAPQd9CFSLGVU=; b=Fj4lkpibozbLZzQ+uWHRq8HsFo
 ea8tWtL3woPXMalhJRtjDgT6EQ2y8F+6LOK2MGKm1I/W6cL86ChZJQng94Vie6u6niaplrMTeNCKK
 zL/IQacv+VHZ4xkInoBY5Z6e9AGK/9ivZ3bpy9B/isIA/rGtkHwiPY1Yaqop1jahlh5O1CTPMnVCV
 VewU2esRYE4gpc7JLeDLf3O+IYzkn1Tj8XQ62J/bT6oStw0Hfh7rMhlq8NBQ4ONMLUi8FFhAxMFUY
 jl4dEa0qRjfoKvt3zvdq8SFYK5NLkV2Us2+VHgS8BnyL53QGGpBgorybSfuR9L3sjrBQuCs4BJhat
 Kz3Mrf0A==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lW9qS-006hZz-R5; Tue, 13 Apr 2021 03:36:10 +0000
X-UUID: 20c47adf39724fe38ae5b28112967086-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=IG3yM/hhJgI4HS5wGt30gHoTh2N5TgYAPQd9CFSLGVU=; 
 b=i8XHIhZmfMskkSFm9k2AgslQZBZgOa32QS5qXZZbIvfe6lVKw7IyZ5f9zk8gV5sdQjI3iLdB1xpQICa8w7D1pcQn233o2PRZvRwvCqd5peRnPK6yWQ9k2C0rE1jnvZDTbWClSjZ8IGJFQXB2nHqodVBVPDaIeqa6eEHkev1ue7Q=;
X-UUID: 20c47adf39724fe38ae5b28112967086-20210412
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 175298707; Mon, 12 Apr 2021 20:36:02 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 20:36:01 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 13 Apr 2021 11:35:56 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 13 Apr 2021 11:35:55 +0800
Message-ID: <1618284955.25729.6.camel@mhfsdcap03>
Subject: Re: [PATCH 4/6] usb: xhci-mtk: add support runtime PM
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
CC: Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown
 <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
 <linux-usb@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>, Tony Lindgren
 <tony@atomide.com>, Tianping Fang <tianping.fang@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 13 Apr 2021 11:35:55 +0800
In-Reply-To: <CAATdQgCjNbUKsJYZjr5wHbXV5y-7ZZrN=URKccCv1d+S4zFiDA@mail.gmail.com>
References: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
 <1617874514-12282-4-git-send-email-chunfeng.yun@mediatek.com>
 <CAATdQgArnkdmbZefF4h7xp6=j-wHLgdQs1K0cDv06sP4eVdHmw@mail.gmail.com>
 <1617958441.12105.39.camel@mhfsdcap03>
 <CAATdQgCjNbUKsJYZjr5wHbXV5y-7ZZrN=URKccCv1d+S4zFiDA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0F74016DEA0EBF8425D7EB065E277E06D9AF29BCA93A4312D24DDEB9D2D3B32A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_203608_904601_C909C7D7 
X-CRM114-Status: GOOD (  40.74  )
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

On Mon, 2021-04-12 at 13:14 +0800, Ikjoon Jang wrote:
> On Fri, Apr 9, 2021 at 4:54 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >
> > On Fri, 2021-04-09 at 13:45 +0800, Ikjoon Jang wrote:
> > > On Thu, Apr 8, 2021 at 5:35 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > > >
> > > > A dedicated wakeup irq will be used to handle runtime suspend/resume,
> > > > we use dev_pm_set_dedicated_wake_irq API to take care of requesting
> > > > and attaching wakeup irq, then the suspend/resume framework will help
> > > > to enable/disable wakeup irq.
> > > >
> > > > The runtime PM is default off since some platforms may not support it.
> > > > users can enable it via power/control (set "auto") in sysfs.
> > > >
> > > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > > ---
> > > >  drivers/usb/host/xhci-mtk.c | 140 +++++++++++++++++++++++++++++++-----
> > > >  1 file changed, 124 insertions(+), 16 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> > > > index a74764ab914a..30927f4064d4 100644
> > > > --- a/drivers/usb/host/xhci-mtk.c
> > > > +++ b/drivers/usb/host/xhci-mtk.c
[...]
> > > >
> > > > +static int check_rhub_status(struct xhci_hcd *xhci, struct xhci_hub *rhub)
> > > > +{
> > > > +       u32 suspended_ports;
> > > > +       u32 status;
> > > > +       int num_ports;
> > > > +       int i;
> > > > +
> > > > +       num_ports = rhub->num_ports;
> > > > +       suspended_ports = rhub->bus_state.suspended_ports;
> > > > +       for (i = 0; i < num_ports; i++) {
> > > > +               if (!(suspended_ports & BIT(i))) {
> > > > +                       status = readl(rhub->ports[i]->addr);
> > > > +                       if (status & PORT_CONNECT)
> > >
> > > So this pm_runtime support is activated only when there's no devices
> > > connected at all?
> > No, if the connected devices also support runtime suspend, it will enter
> > suspend mode when no data transfer, then the controller can enter
> > suspend too
> > > I think this will always return -EBUSY with my board having an on-board hub
> > > connected to both rhubs.
> > the on-board hub supports runtime suspend by default, so if no devices
> > connected, it will enter suspend
> 
> Sorry, you're correct. I was confused that the condition was
> (suspended && connect)
> My on-board hub connected to rhub is always in a suspended state
> whenever it's called.
> 
> However, I don't think this could return -EBUSY
> rpm_suspend() only be called when all the descendants are in sleep already.
You mean we can drop the bus check? 
If PM already takes care of children count, I think no need check it
anymore.
> Did you see any cases of this function returning -EBUSY or any concerns on here?
No, I didn't see it before.

Thanks

> 
> 
> >
> > >
> > > > +                               return -EBUSY;
> > > > +               }
> > > > +       }
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +/*
> > > > + * check the bus whether it could suspend or not
> > > > + * the bus will suspend if the downstream ports are already suspended,
> > > > + * or no devices connected.
> > > > + */
> > > > +static int check_bus_status(struct xhci_hcd *xhci)
> > > > +{
> > > > +       int ret;
> > > > +
> > > > +       ret = check_rhub_status(xhci, &xhci->usb3_rhub);
> > > > +       if (ret)
> > > > +               return ret;
> > > > +
> > > > +       return check_rhub_status(xhci, &xhci->usb2_rhub);
> > > > +}
> > > > +
> > > > +static int __maybe_unused xhci_mtk_runtime_suspend(struct device *dev)
> > > > +{
> > > > +       struct xhci_hcd_mtk  *mtk = dev_get_drvdata(dev);
> > > > +       struct xhci_hcd *xhci = hcd_to_xhci(mtk->hcd);
> > > > +       int ret = 0;
> > > > +
> > > > +       if (xhci->xhc_state)
> > > > +               return -ESHUTDOWN;
> > > > +
> > > > +       if (device_may_wakeup(dev)) {
> > > > +               ret = check_bus_status(xhci);
> > > > +               if (!ret)
> > > > +                       ret = xhci_mtk_suspend(dev);
> > > > +       }
> > > > +
> > > > +       /* -EBUSY: let PM automatically reschedule another autosuspend */
> > > > +       return ret ? -EBUSY : 0;
> > > > +}
> > > > +
> > > > +static int __maybe_unused xhci_mtk_runtime_resume(struct device *dev)
> > > > +{
> > > > +       struct xhci_hcd_mtk  *mtk = dev_get_drvdata(dev);
> > > > +       struct xhci_hcd *xhci = hcd_to_xhci(mtk->hcd);
> > > > +       int ret = 0;
> > > > +
> > > > +       if (xhci->xhc_state)
> > > > +               return -ESHUTDOWN;
> > > > +
> > > > +       if (device_may_wakeup(dev))
> > > > +               ret = xhci_mtk_resume(dev);
> > > > +
> > > > +       return ret;
> > > > +}
> > > > +
> > > >  static const struct dev_pm_ops xhci_mtk_pm_ops = {
> > > >         SET_SYSTEM_SLEEP_PM_OPS(xhci_mtk_suspend, xhci_mtk_resume)
> > > > +       SET_RUNTIME_PM_OPS(xhci_mtk_runtime_suspend,
> > > > +                          xhci_mtk_runtime_resume, NULL)
> > > >  };
> > > > -#define DEV_PM_OPS IS_ENABLED(CONFIG_PM) ? &xhci_mtk_pm_ops : NULL
> > > > +
> > > > +#define DEV_PM_OPS (IS_ENABLED(CONFIG_PM) ? &xhci_mtk_pm_ops : NULL)
> > > >
> > > >  static const struct of_device_id mtk_xhci_of_match[] = {
> > > >         { .compatible = "mediatek,mt8173-xhci"},
> > > > --
> > > > 2.18.0
> > > >
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
