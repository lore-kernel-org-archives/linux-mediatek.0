Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F004BC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 09:20:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E1E464E41
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 09:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E1E464E41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=owLaUJlZFZqFZtA3QCwjnAMzaBAN0UiXdBWipTlHLqY=; b=fPd7duYbJPxPZi9igvTMLMqWI
	EU5yhyEyWMDevdtwcqOSPwCa+b5m9RJ/8aa12KTpn2Ti0VvNtkxRHiZKUKTYQC5CURRF+wLdOuvL1
	RcTaVQl0dPmoNBm0oI3JCX55M5Ui3Z+WX0vwV/kSaWkUA/XJSf3FIE79Y2jbHLyq81Wr7Ss2QZb28
	oX5+LJtOFHxpI4PMEqL1VujEO56/EPDXeRLvyRC2AKUzKc+FXT76jGmdOg63y7E2+ODrgx8Ri1y6y
	Zb+SMiM/8wHA+3JpfdOVjKl3YegaByL5/5g57WFK74c55B/c03JGJsTEa4UMc+rMoXiRDsjH/DFR0
	+XylWNZSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6VO6-0006M4-Jj; Mon, 01 Feb 2021 09:20:50 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6VO2-0006L0-0T
 for linux-mediatek@lists.infradead.org; Mon, 01 Feb 2021 09:20:47 +0000
Received: by mail-pf1-x42b.google.com with SMTP id e19so11160080pfh.6
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Feb 2021 01:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SbMuFSgh3hr3dFklO+f875czdlYyM5GeImwLmAoRm6w=;
 b=ifgKEbl2qJf4cTm77gAQDroic8ArAi72Bw5NaKOmairtEYamHEnBR6T/1YJzNntWrW
 J9VRUdimGea0Dumgw08zuSTRcIBK/J78suy+/732mrFeMUwzits0NxVpsoS2hV7bDmwR
 ocFx60xoUbw4gCcm8Vhw1MYVB6yKItNQSk63s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SbMuFSgh3hr3dFklO+f875czdlYyM5GeImwLmAoRm6w=;
 b=N36J3OjiwjW8w+anvzsRJHz6HWw3NCpMeb3uMpQ8XE3nhdQsrw+lTRteU9QnNKn4L3
 6gE0HKF2utS2iw49Gm56XH5kAur5j5BeqcKjNgJP68DLFw7H6JlhtQgsTuyDsazTGxZ4
 WC+SXr6SCmofrpEEmyFMMRUMqE5phI/JkN4kBOUKy+T/mfQj+OX68JEimW2hZ9iWWtcB
 f5jhKGZsu8IPttwEKLHvGDruoMEFOajVi/W2PM252w3t2V46+qhe5Rd42890tdVe9meG
 RveXN4A8Fb18xeVKWSASyZEjhdkDwZx/IpCEn2RiAUeoI/1VdQ3C42i+Jqa1lb39Jtpc
 L4gA==
X-Gm-Message-State: AOAM531+Yd3K4NzQFw8Z9lzjksAvPy49Hhq7wKYEthCthKwgIrEO0ziP
 vN2o+/n3b7oInm4fB3llYkl+w4l4eFjaqfX7FQdRzQ==
X-Google-Smtp-Source: ABdhPJzSYnS1s6DdHuyZOGevPBj5cK11OSvI0fuN6o/tNl92e+pA2OwmRQgGtb5EyAYza9zj9EE6xURZmN8TYzSx4zc=
X-Received: by 2002:a05:6a00:a8f:b029:1bd:bb89:5911 with SMTP id
 b15-20020a056a000a8fb02901bdbb895911mr15412045pfl.42.1612171241505; Mon, 01
 Feb 2021 01:20:41 -0800 (PST)
MIME-Version: 1.0
References: <1612159064-28413-1-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1612159064-28413-1-git-send-email-chunfeng.yun@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Mon, 1 Feb 2021 17:20:30 +0800
Message-ID: <CAATdQgCkLxU2ts_dUq5+MnaxQ6RD69zddVKxqPRRZAGG2iq2hA@mail.gmail.com>
Subject: Re: [next PATCH] usb: xhci-mtk: skip dropping bandwidth of unchecked
 endpoints
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_042046_134210_8A9D0983 
X-CRM114-Status: GOOD (  27.17  )
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

HI Chunfeng,

On Mon, Feb 1, 2021 at 1:58 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> For those unchecked endpoints, we don't allocate bandwidth for
> them, so no need free the bandwidth, otherwise will decrease
> the allocated bandwidth.
> Meanwhile use xhci_dbg() instead of dev_dbg() to print logs and
> rename bw_ep_list_new as bw_ep_chk_list.
>
> Fixes: 1d69f9d901ef ("usb: xhci-mtk: fix unreleased bandwidth data")
> Cc: stable <stable@vger.kernel.org>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-and-tested-by: Ikjoon Jang <ikjn@chromium.org>

> ---
>  drivers/usb/host/xhci-mtk-sch.c | 61 ++++++++++++++++++---------------
>  drivers/usb/host/xhci-mtk.h     |  4 ++-
>  2 files changed, 36 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> index a313e75ff1c6..dee8a329076d 100644
> --- a/drivers/usb/host/xhci-mtk-sch.c
> +++ b/drivers/usb/host/xhci-mtk-sch.c
> @@ -200,6 +200,7 @@ static struct mu3h_sch_ep_info *create_sch_ep(struct usb_device *udev,
>
>         sch_ep->sch_tt = tt;
>         sch_ep->ep = ep;
> +       INIT_LIST_HEAD(&sch_ep->endpoint);
>         INIT_LIST_HEAD(&sch_ep->tt_endpoint);
>
>         return sch_ep;
> @@ -374,6 +375,7 @@ static void update_bus_bw(struct mu3h_sch_bw_info *sch_bw,
>                                         sch_ep->bw_budget_table[j];
>                 }
>         }
> +       sch_ep->allocated = used;

Yes, this is really needed!

>  }
>
>  static int check_sch_tt(struct usb_device *udev,
> @@ -542,6 +544,22 @@ static int check_sch_bw(struct usb_device *udev,
>         return 0;
>  }
>
> +static void destroy_sch_ep(struct usb_device *udev,
> +       struct mu3h_sch_bw_info *sch_bw, struct mu3h_sch_ep_info *sch_ep)
> +{
> +       /* only release ep bw check passed by check_sch_bw() */
> +       if (sch_ep->allocated)
> +               update_bus_bw(sch_bw, sch_ep, 0);

So only these two lines really matter.

> +
> +       list_del(&sch_ep->endpoint);
> +
> +       if (sch_ep->sch_tt) {
> +               list_del(&sch_ep->tt_endpoint);
> +               drop_tt(udev);
> +       }
> +       kfree(sch_ep);
> +}
> +
>  static bool need_bw_sch(struct usb_host_endpoint *ep,
>         enum usb_device_speed speed, int has_tt)
>  {
> @@ -584,7 +602,7 @@ int xhci_mtk_sch_init(struct xhci_hcd_mtk *mtk)
>
>         mtk->sch_array = sch_array;
>
> -       INIT_LIST_HEAD(&mtk->bw_ep_list_new);
> +       INIT_LIST_HEAD(&mtk->bw_ep_chk_list);
>
>         return 0;
>  }
> @@ -636,29 +654,12 @@ int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
>
>         setup_sch_info(udev, ep_ctx, sch_ep);
>
> -       list_add_tail(&sch_ep->endpoint, &mtk->bw_ep_list_new);
> +       list_add_tail(&sch_ep->endpoint, &mtk->bw_ep_chk_list);
>
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(xhci_mtk_add_ep_quirk);
>
> -static void xhci_mtk_drop_ep(struct xhci_hcd_mtk *mtk, struct usb_device *udev,
> -                            struct mu3h_sch_ep_info *sch_ep)
> -{
> -       struct xhci_hcd *xhci = hcd_to_xhci(mtk->hcd);
> -       int bw_index = get_bw_index(xhci, udev, sch_ep->ep);
> -       struct mu3h_sch_bw_info *sch_bw = &mtk->sch_array[bw_index];
> -
> -       update_bus_bw(sch_bw, sch_ep, 0);
> -       list_del(&sch_ep->endpoint);
> -
> -       if (sch_ep->sch_tt) {
> -               list_del(&sch_ep->tt_endpoint);
> -               drop_tt(udev);
> -       }
> -       kfree(sch_ep);
> -}
> -
>  void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
>                 struct usb_host_endpoint *ep)
>  {
> @@ -688,9 +689,8 @@ void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
>         sch_bw = &sch_array[bw_index];
>
>         list_for_each_entry_safe(sch_ep, tmp, &sch_bw->bw_ep_list, endpoint) {
> -               if (sch_ep->ep == ep) {
> -                       xhci_mtk_drop_ep(mtk, udev, sch_ep);
> -               }
> +               if (sch_ep->ep == ep)
> +                       destroy_sch_ep(udev, sch_bw, sch_ep);

not so critical but I've also missed 'break' here.
Can you please add a break statement here?

>         }
>  }
>  EXPORT_SYMBOL_GPL(xhci_mtk_drop_ep_quirk);
> @@ -704,9 +704,9 @@ int xhci_mtk_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
>         struct mu3h_sch_ep_info *sch_ep, *tmp;
>         int bw_index, ret;
>
> -       dev_dbg(&udev->dev, "%s\n", __func__);
> +       xhci_dbg(xhci, "%s() udev %s\n", __func__, dev_name(&udev->dev));
>
> -       list_for_each_entry(sch_ep, &mtk->bw_ep_list_new, endpoint) {
> +       list_for_each_entry(sch_ep, &mtk->bw_ep_chk_list, endpoint) {
>                 bw_index = get_bw_index(xhci, udev, sch_ep->ep);
>                 sch_bw = &mtk->sch_array[bw_index];
>
> @@ -717,7 +717,7 @@ int xhci_mtk_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
>                 }
>         }
>
> -       list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_list_new, endpoint) {
> +       list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_chk_list, endpoint) {
>                 struct xhci_ep_ctx *ep_ctx;
>                 struct usb_host_endpoint *ep = sch_ep->ep;
>                 unsigned int ep_index = xhci_get_endpoint_index(&ep->desc);
> @@ -746,12 +746,17 @@ EXPORT_SYMBOL_GPL(xhci_mtk_check_bandwidth);
>  void xhci_mtk_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
>  {
>         struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
> +       struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> +       struct mu3h_sch_bw_info *sch_bw;
>         struct mu3h_sch_ep_info *sch_ep, *tmp;
> +       int bw_index;
>
> -       dev_dbg(&udev->dev, "%s\n", __func__);
> +       xhci_dbg(xhci, "%s() udev %s\n", __func__, dev_name(&udev->dev));
>
> -       list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_list_new, endpoint) {
> -               xhci_mtk_drop_ep(mtk, udev, sch_ep);
> +       list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_chk_list, endpoint) {
> +               bw_index = get_bw_index(xhci, udev, sch_ep->ep);
> +               sch_bw = &mtk->sch_array[bw_index];
> +               destroy_sch_ep(udev, sch_bw, sch_ep);
>         }
>
>         xhci_reset_bandwidth(hcd, udev);
> diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
> index 577f431c5c93..cbb09dfea62e 100644
> --- a/drivers/usb/host/xhci-mtk.h
> +++ b/drivers/usb/host/xhci-mtk.h
> @@ -59,6 +59,7 @@ struct mu3h_sch_bw_info {
>   * @ep_type: endpoint type
>   * @maxpkt: max packet size of endpoint
>   * @ep: address of usb_host_endpoint struct
> + * @allocated: the bandwidth is aready allocated from bus_bw
>   * @offset: which uframe of the interval that transfer should be
>   *             scheduled first time within the interval
>   * @repeat: the time gap between two uframes that transfers are
> @@ -86,6 +87,7 @@ struct mu3h_sch_ep_info {
>         u32 ep_type;
>         u32 maxpkt;
>         void *ep;
> +       bool allocated;
>         /*
>          * mtk xHCI scheduling information put into reserved DWs
>          * in ep context
> @@ -130,8 +132,8 @@ struct mu3c_ippc_regs {
>  struct xhci_hcd_mtk {
>         struct device *dev;
>         struct usb_hcd *hcd;
> -       struct list_head bw_ep_list_new;
>         struct mu3h_sch_bw_info *sch_array;
> +       struct list_head bw_ep_chk_list;
>         struct mu3c_ippc_regs __iomem *ippc_regs;
>         bool has_ippc;
>         int num_u2_ports;
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
