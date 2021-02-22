Return-Path: <SRS0=FZAz=HY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF49C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Feb 2021 03:13:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04E0A64EB2
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Feb 2021 03:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04E0A64EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lKaSqHKSwbi06IpdgH+Z09j2OpcUqPDrLff2k5qzm0k=; b=BlLM+K1Voim6cUGVBKNkPo+ko
	quqcCaMb3q7V2BawyLYAHgsDY2rAv3vd7qXm3raK3wcrxSMm4K5d+nEfkTJBJVQ3dwILMULlRAOxC
	2Ub0uNaTw6KSbcw+viTL0IUZpqlfbKm9tU6FhIRHl0SGTsYq11T4iEVx6LeTWRGWAl+yF3YM2xD9K
	PtgZIGYf2mssEBdzFGrC1KpFB9fokI6CrpcBUJEKTbi2LOUMCKBYsmmdGzFYPF64nKH1iN1OY4Jmh
	3uiO7bj62Diq4WB7tpAi5MuVS6fFx/stqEJShmRzbAqgHqc/6XnR9A3Ab68TBzvzPw7odXCB5kgiI
	GP1scTWkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lE1en-0002kl-Cq; Mon, 22 Feb 2021 03:13:09 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lE1el-0002kI-8l
 for linux-mediatek@lists.infradead.org; Mon, 22 Feb 2021 03:13:08 +0000
Received: by mail-pl1-x633.google.com with SMTP id d11so1918472plo.8
 for <linux-mediatek@lists.infradead.org>; Sun, 21 Feb 2021 19:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TDJaTmGJfVov+XHM9aIiQpRbKPrMrxeVkA+mFBbUP4o=;
 b=WKnmVfspMyZIjjLTJe2HhDIYYzIU9KfKVtnaBBdB3WnGdo1Z6IXRx/LYGD+0l5j256
 TAvqlCa7Zcw9pLNufLG5IPpf7YRhyBV4VVbjH75K3+nbndv/8YnNV1etVNDltlILvohe
 sBmgtv76LKwvNvRv4NJHB/xXNn9MYEKb7Hrhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TDJaTmGJfVov+XHM9aIiQpRbKPrMrxeVkA+mFBbUP4o=;
 b=lZv38eeEoLm0QZsXcrzkNHUY87dGomQ+/FmEYf7M95/7yvNIaN8aBwb1xnHtjDlnUr
 pRp05wTEjCMuXuJHq4yBxXDiiATfbOWH8HCmwUnsmBGYIWg9GeLZ2und5k+k8tWjKm3F
 o7W6R61IRu7/LHq7mumYUZVpMkno0B5Mp0dKY/rz48IeikLTe92a77PVBPTPPJOdNdcs
 4cw5RINTfKo5Js2nFF+Jb4n7UGZcTULjSaXdOOdvqhIztaJNkg6KjXqd3TfqMYAgcO33
 p9UNm47wFKsdRtXSlUZkHXBcmeI5YHUlQR684wbsjHo7JCn2e51easXWLzhAZAUM0NXg
 o8ng==
X-Gm-Message-State: AOAM533fiV7oHhhB3LjJzS0g3BUFRh23GZmz4LpULe7kg9lpSV2LWNyy
 00MtD16mIlRMFa2iLLOBvQkw+KSy1bqyFyRqdCKym97pAgU=
X-Google-Smtp-Source: ABdhPJw5V15oNchwCeqqBmESK7MR1E5+LBpEGbROSttysVM5QokevyUZoCY5sJmjTYDcetAfJqYd/PpoDEaD6woUyKc=
X-Received: by 2002:a17:902:7288:b029:e3:f907:8b9 with SMTP id
 d8-20020a1709027288b02900e3f90708b9mr2587803pll.67.1613963583066; Sun, 21 Feb
 2021 19:13:03 -0800 (PST)
MIME-Version: 1.0
References: <20210208032716.20247-1-chunfeng.yun@mediatek.com>
In-Reply-To: <20210208032716.20247-1-chunfeng.yun@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Mon, 22 Feb 2021 11:12:52 +0800
Message-ID: <CAATdQgD2rRFo-YmyeQp=WEs0b4gT29agzq4QJL42cSvRwPfyUw@mail.gmail.com>
Subject: Re: [RFC v4 PATCH] usb: xhci-mtk: improve bandwidth scheduling with TT
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210221_221307_386065_E37DDBD2 
X-CRM114-Status: GOOD (  26.91  )
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
Cc: Yaqii Wu <yaqii.wu@mediatek.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>,
 Tianping Fang <tianping.fang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Feb 8, 2021 at 11:27 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> When the USB headset is plug into an external hub, sometimes
> can't set config due to not enough bandwidth, so need improve
> LS/FS INT/ISOC bandwidth scheduling with TT.
>
> Fixes: 08e469de87a2 ("usb: xhci-mtk: supports bandwidth scheduling with multi-TT")
> Signed-off-by: Yaqii Wu <yaqii.wu@mediatek.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Tested-by: Ikjoon Jang <ikjn@chromium.org>

> ---
>  drivers/usb/host/xhci-mtk-sch.c | 270 +++++++++++++++++++++++---------
>  drivers/usb/host/xhci-mtk.h     |   8 +-
>  2 files changed, 201 insertions(+), 77 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> index b45e5bf08997..f3cdfcf4e5bf 100644
> --- a/drivers/usb/host/xhci-mtk-sch.c
> +++ b/drivers/usb/host/xhci-mtk-sch.c
> @@ -32,6 +32,35 @@
>  #define EP_BOFFSET(p)  ((p) & 0x3fff)
>  #define EP_BREPEAT(p)  (((p) & 0x7fff) << 16)
>
> +enum mtk_sch_err_type {
> +       SCH_SUCCESS = 0,
> +       SCH_ERR_Y6,
> +       SCH_SS_OVERLAP,
> +       SCH_CS_OVERFLOW,
> +       SCH_BW_OVERFLOW,
> +       SCH_FIXME,
> +};
> +
> +static char *sch_error_string(enum mtk_sch_err_type error)
> +{
> +       switch (error) {
> +       case SCH_SUCCESS:
> +               return "Success";
> +       case SCH_ERR_Y6:
> +               return "Can't schedule Start-Split in Y6";
> +       case SCH_SS_OVERLAP:
> +               return "Can't find a suitable Start-Split location";
> +       case SCH_CS_OVERFLOW:
> +               return "The last Complete-Split is greater than 7";
> +       case SCH_BW_OVERFLOW:
> +               return "Bandwidth exceeds the max limit";
> +       case SCH_FIXME:
> +               return "FIXME, to be resolved";
> +       default:
> +               return "Unknown error type";
> +       }
> +}
> +
>  static int is_fs_or_ls(enum usb_device_speed speed)
>  {
>         return speed == USB_SPEED_FULL || speed == USB_SPEED_LOW;
> @@ -81,11 +110,22 @@ static u32 get_esit(struct xhci_ep_ctx *ep_ctx)
>         return esit;
>  }
>
> +static u32 get_bw_boundary(enum usb_device_speed speed)
> +{
> +       switch (speed) {
> +       case USB_SPEED_SUPER_PLUS:
> +               return SSP_BW_BOUNDARY;
> +       case USB_SPEED_SUPER:
> +               return SS_BW_BOUNDARY;
> +       default:
> +               return HS_BW_BOUNDARY;
> +       }
> +}
> +
>  static struct mu3h_sch_tt *find_tt(struct usb_device *udev)
>  {
>         struct usb_tt *utt = udev->tt;
>         struct mu3h_sch_tt *tt, **tt_index, **ptt;
> -       unsigned int port;
>         bool allocated_index = false;
>
>         if (!utt)
> @@ -107,10 +147,9 @@ static struct mu3h_sch_tt *find_tt(struct usb_device *udev)
>                         utt->hcpriv = tt_index;
>                         allocated_index = true;
>                 }
> -               port = udev->ttport - 1;
> -               ptt = &tt_index[port];
> +
> +               ptt = &tt_index[udev->ttport - 1];
>         } else {
> -               port = 0;
>                 ptt = (struct mu3h_sch_tt **) &utt->hcpriv;
>         }
>
> @@ -125,8 +164,7 @@ static struct mu3h_sch_tt *find_tt(struct usb_device *udev)
>                         return ERR_PTR(-ENOMEM);
>                 }
>                 INIT_LIST_HEAD(&tt->ep_list);
> -               tt->usb_tt = utt;
> -               tt->tt_port = port;
> +
>                 *ptt = tt;
>         }
>
> @@ -206,6 +244,15 @@ static struct mu3h_sch_ep_info *create_sch_ep(struct usb_device *udev,
>         return sch_ep;
>  }
>
> +static void delete_sch_ep(struct usb_device *udev, struct mu3h_sch_ep_info *sch_ep)
> +{
> +       if (sch_ep->sch_tt)
> +               drop_tt(udev);
> +
> +       list_del(&sch_ep->endpoint);
> +       kfree(sch_ep);
> +}
> +
>  static void setup_sch_info(struct usb_device *udev,
>                 struct xhci_ep_ctx *ep_ctx, struct mu3h_sch_ep_info *sch_ep)
>  {
> @@ -375,21 +422,55 @@ static void update_bus_bw(struct mu3h_sch_bw_info *sch_bw,
>                                         sch_ep->bw_budget_table[j];
>                 }
>         }
> -       sch_ep->allocated = used;
>  }
>
> -static int check_sch_tt(struct usb_device *udev,
> -       struct mu3h_sch_ep_info *sch_ep, u32 offset)
> +static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
> +{
> +       struct mu3h_sch_tt *tt = sch_ep->sch_tt;
> +       u32 num_esit, base;
> +       u32 i, j;
> +       u32 tmp;
> +
> +       num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
> +
> +       for (i = 0; i < num_esit; i++) {
> +               base = offset + i * sch_ep->esit;
> +
> +               /*
> +                * Compared with hs bus, no matter what ep type
> +                * The hub will always delay one uframe to send
> +                * data for us. As described in the figure below.
> +                */
> +               if (sch_ep->ep_type == ISOC_OUT_EP) {
> +                       for (j = 0; j < sch_ep->num_budget_microframes; j++) {
> +                               tmp = tt->fs_bus_bw[base + 1 + j]
> +                                       + sch_ep->bw_cost_per_microframe;
> +
> +                               if (tmp > FS_PAYLOAD_MAX)
> +                                       return SCH_BW_OVERFLOW;
> +                       }
> +               } else {
> +                       for (j = 0; j < sch_ep->cs_count; j++) {
> +                               tmp = tt->fs_bus_bw[base + 1 + j]
> +                                       + sch_ep->bw_cost_per_microframe;
> +
> +                               if (tmp > FS_PAYLOAD_MAX)
> +                                       return SCH_BW_OVERFLOW;
> +                       }
> +               }
> +       }
> +       return SCH_SUCCESS;
> +}
> +
> +static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, int offset)
>  {
>         struct mu3h_sch_tt *tt = sch_ep->sch_tt;
>         u32 extra_cs_count;
> -       u32 fs_budget_start;
>         u32 start_ss, last_ss;
>         u32 start_cs, last_cs;
> -       int i;
> +       u32 i;
>
>         start_ss = offset % 8;
> -       fs_budget_start = (start_ss + 1) % 8;
>
>         if (sch_ep->ep_type == ISOC_OUT_EP) {
>                 last_ss = start_ss + sch_ep->cs_count - 1;
> @@ -399,12 +480,12 @@ static int check_sch_tt(struct usb_device *udev,
>                  * must never schedule Start-Split in Y6
>                  */
>                 if (!(start_ss == 7 || last_ss < 6))
> -                       return -ERANGE;
> -
> -               for (i = 0; i < sch_ep->cs_count; i++)
> -                       if (test_bit(offset + i, tt->split_bit_map))
> -                               return -ERANGE;
> +                       return SCH_ERR_Y6;
>
> +               for (i = 0; i < sch_ep->cs_count; i++) {
> +                       if (test_bit(offset + i, tt->ss_bit_map))
> +                               return SCH_SS_OVERLAP;
> +               }
>         } else {
>                 u32 cs_count = DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
>
> @@ -413,27 +494,36 @@ static int check_sch_tt(struct usb_device *udev,
>                  * must never schedule Start-Split in Y6
>                  */
>                 if (start_ss == 6)
> -                       return -ERANGE;
> +                       return SCH_ERR_Y6;
>
>                 /* one uframe for ss + one uframe for idle */
>                 start_cs = (start_ss + 2) % 8;
>                 last_cs = start_cs + cs_count - 1;
>
>                 if (last_cs > 7)
> -                       return -ERANGE;
> +                       return SCH_CS_OVERFLOW;
>
> +               /*
> +                * usb_20 spec section11.18, the bottom of page 378:
> +                * For interrupt endpoints, the maximum size of the LS/FS
> +                * transaction guarantees that it can never require more than
> +                * two complete-split transactions.
> +                */
>                 if (sch_ep->ep_type == ISOC_IN_EP)
>                         extra_cs_count = (last_cs == 7) ? 1 : 2;
>                 else /*  ep_type : INTR IN / INTR OUT */
> -                       extra_cs_count = (fs_budget_start == 6) ? 1 : 2;
> +                       extra_cs_count = 1;
>
>                 cs_count += extra_cs_count;
>                 if (cs_count > 7)
>                         cs_count = 7; /* HW limit */
>
> -               for (i = 0; i < cs_count + 2; i++) {
> -                       if (test_bit(offset + i, tt->split_bit_map))
> -                               return -ERANGE;
> +               if (test_bit(offset, tt->ss_bit_map))
> +                       return SCH_SS_OVERLAP;
> +
> +               if (sch_ep->ep_type == INT_OUT_EP) {
> +                       if (test_bit(offset, tt->idle_bit_map))
> +                               return SCH_FIXME;
>                 }
>
>                 sch_ep->cs_count = cs_count;
> @@ -448,41 +538,88 @@ static int check_sch_tt(struct usb_device *udev,
>                         sch_ep->num_budget_microframes = sch_ep->esit;
>         }
>
> -       return 0;
> +       return check_fs_bus_bw(sch_ep, offset);
>  }
>
> -static void update_sch_tt(struct usb_device *udev,
> -       struct mu3h_sch_ep_info *sch_ep)
> +static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
>  {
>         struct mu3h_sch_tt *tt = sch_ep->sch_tt;
>         u32 base, num_esit;
> -       int i, j;
> +       u32 i, j;
>
>         num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
> +
>         for (i = 0; i < num_esit; i++) {
>                 base = sch_ep->offset + i * sch_ep->esit;
> -               for (j = 0; j < sch_ep->num_budget_microframes; j++)
> -                       set_bit(base + j, tt->split_bit_map);
> +
> +               if (sch_ep->ep_type == ISOC_OUT_EP) {
> +                       for (j = 0; j < sch_ep->num_budget_microframes; j++) {
> +                               if (used) {
> +                                       set_bit(base + j, tt->ss_bit_map);
> +                                       tt->fs_bus_bw[base + 1 + j] +=
> +                                               sch_ep->bw_cost_per_microframe;
> +                               } else {
> +                                       clear_bit(base + j, tt->ss_bit_map);
> +                                       tt->fs_bus_bw[base + 1 + j] -=
> +                                               sch_ep->bw_cost_per_microframe;
> +                               }
> +                       }
> +               } else {
> +                       if (used)
> +                               set_bit(base, tt->ss_bit_map);
> +                       else
> +                               clear_bit(base, tt->ss_bit_map);
> +
> +                       if (sch_ep->ep_type == INT_OUT_EP) {
> +                               if (used)
> +                                       set_bit(base + 1, tt->idle_bit_map);
> +                               else
> +                                       clear_bit(base + 1, tt->idle_bit_map);
> +                       }
> +
> +                       for (j = 0; j < sch_ep->cs_count; j++) {
> +                               if (used)
> +                                       tt->fs_bus_bw[base + 1 + j] +=
> +                                               sch_ep->bw_cost_per_microframe;
> +                               else
> +                                       tt->fs_bus_bw[base + 1 + j] -=
> +                                               sch_ep->bw_cost_per_microframe;
> +                       }
> +               }
> +       }
> +}
> +
> +static int load_ep_bw(struct mu3h_sch_bw_info *sch_bw,
> +                     struct mu3h_sch_ep_info *sch_ep, bool loaded)
> +{
> +       struct mu3h_sch_tt *tt = sch_ep->sch_tt;
> +
> +       if (sch_ep->sch_tt) {
> +               update_sch_tt(sch_ep, loaded);
> +               if (loaded)
> +                       list_add_tail(&sch_ep->tt_endpoint, &tt->ep_list);
> +               else
> +                       list_del(&sch_ep->tt_endpoint);
>         }
>
> -       list_add_tail(&sch_ep->tt_endpoint, &tt->ep_list);
> +       /* update bus bandwidth info */
> +       update_bus_bw(sch_bw, sch_ep, loaded);
> +       sch_ep->allocated = loaded;
> +       return 0;
>  }
>
>  static int check_sch_bw(struct usb_device *udev,
>         struct mu3h_sch_bw_info *sch_bw, struct mu3h_sch_ep_info *sch_ep)
>  {
>         u32 offset;
> -       u32 esit;
>         u32 min_bw;
>         u32 min_index;
>         u32 worst_bw;
>         u32 bw_boundary;
> +       u32 boundary;
>         u32 min_num_budget;
>         u32 min_cs_count;
> -       bool tt_offset_ok = false;
> -       int ret;
> -
> -       esit = sch_ep->esit;
> +       int ret = 0;
>
>         /*
>          * Search through all possible schedule microframes.
> @@ -492,16 +629,20 @@ static int check_sch_bw(struct usb_device *udev,
>         min_index = 0;
>         min_cs_count = sch_ep->cs_count;
>         min_num_budget = sch_ep->num_budget_microframes;
> -       for (offset = 0; offset < esit; offset++) {
> -               if (is_fs_or_ls(udev->speed)) {
> -                       ret = check_sch_tt(udev, sch_ep, offset);
> -                       if (ret)
> +
> +       if (is_fs_or_ls(udev->speed) && sch_ep->ep_type != ISOC_OUT_EP)
> +               boundary = sch_ep->esit + 1;
> +       else
> +               boundary = sch_ep->esit;
> +
> +       for (offset = 0; offset < sch_ep->esit; offset++) {
> +               if (sch_ep->sch_tt) {
> +                       ret = check_sch_tt(sch_ep, offset);
> +                       if (ret != SCH_SUCCESS)
>                                 continue;
> -                       else
> -                               tt_offset_ok = true;
>                 }
>
> -               if ((offset + sch_ep->num_budget_microframes) > sch_ep->esit)
> +               if ((offset + sch_ep->num_budget_microframes) > boundary)
>                         break;
>
>                 worst_bw = get_max_bw(sch_bw, sch_ep, offset);
> @@ -515,33 +656,22 @@ static int check_sch_bw(struct usb_device *udev,
>                         break;
>         }
>
> -       if (udev->speed == USB_SPEED_SUPER_PLUS)
> -               bw_boundary = SSP_BW_BOUNDARY;
> -       else if (udev->speed == USB_SPEED_SUPER)
> -               bw_boundary = SS_BW_BOUNDARY;
> -       else
> -               bw_boundary = HS_BW_BOUNDARY;
> -
> +       bw_boundary = get_bw_boundary(udev->speed);
>         /* check bandwidth */
> -       if (min_bw > bw_boundary)
> +       if (min_bw > bw_boundary) {
> +               if (ret) {
> +                       dev_err(&udev->dev, "%s %s\n", __func__,
> +                               sch_error_string(ret));
> +                       return -ret;
> +               }
> +
>                 return -ERANGE;
> +       }
>
>         sch_ep->offset = min_index;
>         sch_ep->cs_count = min_cs_count;
>         sch_ep->num_budget_microframes = min_num_budget;
> -
> -       if (is_fs_or_ls(udev->speed)) {
> -               /* all offset for tt is not ok*/
> -               if (!tt_offset_ok)
> -                       return -ERANGE;
> -
> -               update_sch_tt(udev, sch_ep);
> -       }
> -
> -       /* update bus bandwidth info */
> -       update_bus_bw(sch_bw, sch_ep, 1);
> -
> -       return 0;
> +       return load_ep_bw(sch_bw, sch_ep, true);
>  }
>
>  static void destroy_sch_ep(struct usb_device *udev,
> @@ -549,23 +679,17 @@ static void destroy_sch_ep(struct usb_device *udev,
>  {
>         /* only release ep bw check passed by check_sch_bw() */
>         if (sch_ep->allocated)
> -               update_bus_bw(sch_bw, sch_ep, 0);
> +               load_ep_bw(sch_bw, sch_ep, false);
>
> -       list_del(&sch_ep->endpoint);
> -
> -       if (sch_ep->sch_tt) {
> -               list_del(&sch_ep->tt_endpoint);
> -               drop_tt(udev);
> -       }
> -       kfree(sch_ep);
> +       delete_sch_ep(udev, sch_ep);
>  }
>
>  static bool need_bw_sch(struct usb_host_endpoint *ep,
>         enum usb_device_speed speed, int has_tt)
>  {
>         /* only for periodic endpoints */
> -       if (usb_endpoint_xfer_control(&ep->desc)
> -               || usb_endpoint_xfer_bulk(&ep->desc))
> +       if (usb_endpoint_xfer_control(&ep->desc) ||
> +           usb_endpoint_xfer_bulk(&ep->desc))
>                 return false;
>
>         /*
> diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
> index cbb09dfea62e..81e9b56958c5 100644
> --- a/drivers/usb/host/xhci-mtk.h
> +++ b/drivers/usb/host/xhci-mtk.h
> @@ -26,10 +26,10 @@
>   * @tt_port: TT port number
>   */
>  struct mu3h_sch_tt {
> -       DECLARE_BITMAP(split_bit_map, XHCI_MTK_MAX_ESIT);
> +       DECLARE_BITMAP(ss_bit_map, XHCI_MTK_MAX_ESIT);
> +       DECLARE_BITMAP(idle_bit_map, XHCI_MTK_MAX_ESIT);
> +       u32 fs_bus_bw[XHCI_MTK_MAX_ESIT + 1];
>         struct list_head ep_list;
> -       struct usb_tt *usb_tt;
> -       int tt_port;
>  };
>
>  /**
> @@ -84,9 +84,9 @@ struct mu3h_sch_ep_info {
>         struct list_head endpoint;
>         struct list_head tt_endpoint;
>         struct mu3h_sch_tt *sch_tt;
> +       struct usb_host_endpoint *ep;
>         u32 ep_type;
>         u32 maxpkt;
> -       void *ep;
>         bool allocated;
>         /*
>          * mtk xHCI scheduling information put into reserved DWs
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
