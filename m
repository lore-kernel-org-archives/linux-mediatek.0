Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256B0C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 06:08:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A329664DD9
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 06:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A329664DD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=grBdYAYXOcDhEvOQfQeelowwc9fzzjIX673cv/oJiBM=; b=N4L9hFYj+GWgFMzyJyXJIiws2
	VFI8kcJ8Dfno/lXvHnrbvcaRFtLi54AEPPS7V7WESMNA12YWh05H2Hwx2nRb8RNGX7Y/KETz2jf49
	ZdYqrfYl0K1Sc7Llm7vAGMPEuVa/RydFa+3CYvCWVv7BUjhLof9xfYkCN9ZLh3B0i63r2yDNbcpmO
	CfHrH878UWrLjdCeYtoWTZciHPfHgkNKf4c3v+hXeCzSePRi2gVIxrudG8vwmSGkBpHbHFShOjXjs
	3yPvjsCMd6/yDlOg/4ldee0H/l809r5gZqBsQcSFFPgMnYUugEdLihqwFIk9Np1grObt4vBMjfZSm
	lpY1Sj1eQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6orj-0000sr-O4; Tue, 02 Feb 2021 06:08:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6ori-0000sR-0e; Tue, 02 Feb 2021 06:08:43 +0000
X-UUID: 759052afdb0c41c89a27e37635a932c3-20210201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Ts8m8akIrVg+91beyBWSOTYxOCqFp6KNdG0km01xgtM=; 
 b=Tn01kXE39tF3rHwubc3PkZ34NN2PNTiXcnyhCDEDs/mqdcLB6smX9LaVjOikBP/tiG8ngU0V+cU0j51i5TstrBfdeoWfKCH0rkizUXe7X5gl0CJyTyx/5i8FBoGNHEknJaoqfDyIDxoVbqlTwnq4gtznKtzIMLl7Hdm0kUSIHik=;
X-UUID: 759052afdb0c41c89a27e37635a932c3-20210201
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1609756556; Mon, 01 Feb 2021 22:08:36 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Feb 2021 22:08:28 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 2 Feb 2021 14:08:21 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Feb 2021 14:08:21 +0800
Message-ID: <1612246101.25113.11.camel@mhfsdcap03>
Subject: Re: [next PATCH] usb: xhci-mtk: skip dropping bandwidth of
 unchecked endpoints
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 2 Feb 2021 14:08:21 +0800
In-Reply-To: <CAATdQgCkLxU2ts_dUq5+MnaxQ6RD69zddVKxqPRRZAGG2iq2hA@mail.gmail.com>
References: <1612159064-28413-1-git-send-email-chunfeng.yun@mediatek.com>
 <CAATdQgCkLxU2ts_dUq5+MnaxQ6RD69zddVKxqPRRZAGG2iq2hA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1F8851F34FEEB5FA0BE1BE46698C9D41F9DC20F3F1155939C75CDABE5000BFC12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_010842_355531_929FC048 
X-CRM114-Status: GOOD (  30.58  )
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
Cc: Zhanyong Wang <zhanyong.wang@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 Tianping Fang <tianping.fang@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2021-02-01 at 17:20 +0800, Ikjoon Jang wrote:
> HI Chunfeng,
> 
> On Mon, Feb 1, 2021 at 1:58 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >
> > For those unchecked endpoints, we don't allocate bandwidth for
> > them, so no need free the bandwidth, otherwise will decrease
> > the allocated bandwidth.
> > Meanwhile use xhci_dbg() instead of dev_dbg() to print logs and
> > rename bw_ep_list_new as bw_ep_chk_list.
> >
> > Fixes: 1d69f9d901ef ("usb: xhci-mtk: fix unreleased bandwidth data")
> > Cc: stable <stable@vger.kernel.org>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> 
> Reviewed-and-tested-by: Ikjoon Jang <ikjn@chromium.org>
> 
> > ---
> >  drivers/usb/host/xhci-mtk-sch.c | 61 ++++++++++++++++++---------------
> >  drivers/usb/host/xhci-mtk.h     |  4 ++-
> >  2 files changed, 36 insertions(+), 29 deletions(-)
> >
> > diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> > index a313e75ff1c6..dee8a329076d 100644
> > --- a/drivers/usb/host/xhci-mtk-sch.c
> > +++ b/drivers/usb/host/xhci-mtk-sch.c
> > @@ -200,6 +200,7 @@ static struct mu3h_sch_ep_info *create_sch_ep(struct usb_device *udev,
> >
> >         sch_ep->sch_tt = tt;
> >         sch_ep->ep = ep;
> > +       INIT_LIST_HEAD(&sch_ep->endpoint);
> >         INIT_LIST_HEAD(&sch_ep->tt_endpoint);
> >
> >         return sch_ep;
> > @@ -374,6 +375,7 @@ static void update_bus_bw(struct mu3h_sch_bw_info *sch_bw,
> >                                         sch_ep->bw_budget_table[j];
> >                 }
> >         }
> > +       sch_ep->allocated = used;
> 
> Yes, this is really needed!
> 
> >  }
> >
> >  static int check_sch_tt(struct usb_device *udev,
> > @@ -542,6 +544,22 @@ static int check_sch_bw(struct usb_device *udev,
> >         return 0;
> >  }
> >
> > +static void destroy_sch_ep(struct usb_device *udev,
> > +       struct mu3h_sch_bw_info *sch_bw, struct mu3h_sch_ep_info *sch_ep)
> > +{
> > +       /* only release ep bw check passed by check_sch_bw() */
> > +       if (sch_ep->allocated)
> > +               update_bus_bw(sch_bw, sch_ep, 0);
> 
> So only these two lines really matter.
> 
> > +
> > +       list_del(&sch_ep->endpoint);
> > +
> > +       if (sch_ep->sch_tt) {
> > +               list_del(&sch_ep->tt_endpoint);
> > +               drop_tt(udev);
> > +       }
> > +       kfree(sch_ep);
> > +}
> > +
> >  static bool need_bw_sch(struct usb_host_endpoint *ep,
> >         enum usb_device_speed speed, int has_tt)
> >  {
> > @@ -584,7 +602,7 @@ int xhci_mtk_sch_init(struct xhci_hcd_mtk *mtk)
> >
> >         mtk->sch_array = sch_array;
> >
> > -       INIT_LIST_HEAD(&mtk->bw_ep_list_new);
> > +       INIT_LIST_HEAD(&mtk->bw_ep_chk_list);
> >
> >         return 0;
> >  }
> > @@ -636,29 +654,12 @@ int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
> >
> >         setup_sch_info(udev, ep_ctx, sch_ep);
> >
> > -       list_add_tail(&sch_ep->endpoint, &mtk->bw_ep_list_new);
> > +       list_add_tail(&sch_ep->endpoint, &mtk->bw_ep_chk_list);
> >
> >         return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(xhci_mtk_add_ep_quirk);
> >
> > -static void xhci_mtk_drop_ep(struct xhci_hcd_mtk *mtk, struct usb_device *udev,
> > -                            struct mu3h_sch_ep_info *sch_ep)
> > -{
> > -       struct xhci_hcd *xhci = hcd_to_xhci(mtk->hcd);
> > -       int bw_index = get_bw_index(xhci, udev, sch_ep->ep);
> > -       struct mu3h_sch_bw_info *sch_bw = &mtk->sch_array[bw_index];
> > -
> > -       update_bus_bw(sch_bw, sch_ep, 0);
> > -       list_del(&sch_ep->endpoint);
> > -
> > -       if (sch_ep->sch_tt) {
> > -               list_del(&sch_ep->tt_endpoint);
> > -               drop_tt(udev);
> > -       }
> > -       kfree(sch_ep);
> > -}
> > -
> >  void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
> >                 struct usb_host_endpoint *ep)
> >  {
> > @@ -688,9 +689,8 @@ void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
> >         sch_bw = &sch_array[bw_index];
> >
> >         list_for_each_entry_safe(sch_ep, tmp, &sch_bw->bw_ep_list, endpoint) {
> > -               if (sch_ep->ep == ep) {
> > -                       xhci_mtk_drop_ep(mtk, udev, sch_ep);
> > -               }
> > +               if (sch_ep->ep == ep)
> > +                       destroy_sch_ep(udev, sch_bw, sch_ep);
> 
> not so critical but I've also missed 'break' here.
> Can you please add a break statement here?
Yes, it's better to add 'break' here, thanks

> 
> >         }
> >  }
> >  EXPORT_SYMBOL_GPL(xhci_mtk_drop_ep_quirk);
> > @@ -704,9 +704,9 @@ int xhci_mtk_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
> >         struct mu3h_sch_ep_info *sch_ep, *tmp;
> >         int bw_index, ret;
> >
> > -       dev_dbg(&udev->dev, "%s\n", __func__);
> > +       xhci_dbg(xhci, "%s() udev %s\n", __func__, dev_name(&udev->dev));
> >
> > -       list_for_each_entry(sch_ep, &mtk->bw_ep_list_new, endpoint) {
> > +       list_for_each_entry(sch_ep, &mtk->bw_ep_chk_list, endpoint) {
> >                 bw_index = get_bw_index(xhci, udev, sch_ep->ep);
> >                 sch_bw = &mtk->sch_array[bw_index];
> >
> > @@ -717,7 +717,7 @@ int xhci_mtk_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
> >                 }
> >         }
> >
> > -       list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_list_new, endpoint) {
> > +       list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_chk_list, endpoint) {
> >                 struct xhci_ep_ctx *ep_ctx;
> >                 struct usb_host_endpoint *ep = sch_ep->ep;
> >                 unsigned int ep_index = xhci_get_endpoint_index(&ep->desc);
> > @@ -746,12 +746,17 @@ EXPORT_SYMBOL_GPL(xhci_mtk_check_bandwidth);
> >  void xhci_mtk_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
> >  {
> >         struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
> > +       struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> > +       struct mu3h_sch_bw_info *sch_bw;
> >         struct mu3h_sch_ep_info *sch_ep, *tmp;
> > +       int bw_index;
> >
> > -       dev_dbg(&udev->dev, "%s\n", __func__);
> > +       xhci_dbg(xhci, "%s() udev %s\n", __func__, dev_name(&udev->dev));
> >
> > -       list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_list_new, endpoint) {
> > -               xhci_mtk_drop_ep(mtk, udev, sch_ep);
> > +       list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_chk_list, endpoint) {
> > +               bw_index = get_bw_index(xhci, udev, sch_ep->ep);
> > +               sch_bw = &mtk->sch_array[bw_index];
> > +               destroy_sch_ep(udev, sch_bw, sch_ep);
> >         }
> >
> >         xhci_reset_bandwidth(hcd, udev);
> > diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
> > index 577f431c5c93..cbb09dfea62e 100644
> > --- a/drivers/usb/host/xhci-mtk.h
> > +++ b/drivers/usb/host/xhci-mtk.h
> > @@ -59,6 +59,7 @@ struct mu3h_sch_bw_info {
> >   * @ep_type: endpoint type
> >   * @maxpkt: max packet size of endpoint
> >   * @ep: address of usb_host_endpoint struct
> > + * @allocated: the bandwidth is aready allocated from bus_bw
> >   * @offset: which uframe of the interval that transfer should be
> >   *             scheduled first time within the interval
> >   * @repeat: the time gap between two uframes that transfers are
> > @@ -86,6 +87,7 @@ struct mu3h_sch_ep_info {
> >         u32 ep_type;
> >         u32 maxpkt;
> >         void *ep;
> > +       bool allocated;
> >         /*
> >          * mtk xHCI scheduling information put into reserved DWs
> >          * in ep context
> > @@ -130,8 +132,8 @@ struct mu3c_ippc_regs {
> >  struct xhci_hcd_mtk {
> >         struct device *dev;
> >         struct usb_hcd *hcd;
> > -       struct list_head bw_ep_list_new;
> >         struct mu3h_sch_bw_info *sch_array;
> > +       struct list_head bw_ep_chk_list;
> >         struct mu3c_ippc_regs __iomem *ippc_regs;
> >         bool has_ippc;
> >         int num_u2_ports;
> > --
> > 2.18.0
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
