Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D283BC48BE5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 09:56:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94BD961151
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 09:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94BD961151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dtKEvtdoZNTFDjpMIgbsUvHTaXZn7VwR0cRr78fdSAk=; b=CguqLtSWq1zWb2
	yTMqn3WJDt1ZEV6Lz10SfALeUpe6YrBQa60+pA6WyponcBpcnVFdjOy+f7toI8WYbcAHsq3NhSRYp
	FwFeaCbLmEYRnqviZ16QGYnVWLpPX8KZCBJstDToNJqVpp5+XWy5bswoE4vKmvybKUE6yQR1RKrVe
	l9T+kB5V4TnaczHKyAn955q2xKHB+e7USteSmcQtMWjbWG428N57JNH9OZQWQHCZuyeHgZpnTSqEV
	fpY2EgAay2g8N7Y7w/pKUh3EDZxxxOvmaZgsvC2xCI8wZtTBfFwwHnIXTp8lLPgH1Vs6O1GHhBQvN
	S5Bqo3hIOjup0Qz0p2lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvGem-0031PQ-Uo; Mon, 21 Jun 2021 09:55:52 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvGea-0031Mi-4h
 for linux-mediatek@lists.infradead.org; Mon, 21 Jun 2021 09:55:41 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so12266612pjs.2
 for <linux-mediatek@lists.infradead.org>; Mon, 21 Jun 2021 02:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oQ7NskhnbXklWViZEL8XyKzeNwIivhwrrHIjXsYBvM8=;
 b=GHOD4SnlvcUuuelDbyvF2cnVuT1ZMR9MANNY5zATXwfkhN6SdjPQ4nhi7idTDKXFk1
 BsGCLAM6YBaLt6vYEkPTtTSPY4QF3+UnasKrEApfu4TOydymJE1rIUHTNMrA7XZaMCPq
 kIgg7Oe9AfYugeX6VcLci74Dg4QZyUw0flXY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oQ7NskhnbXklWViZEL8XyKzeNwIivhwrrHIjXsYBvM8=;
 b=W226UQaDaWgg6F/TQQoIzAdxG2w6/e1ohEJhxi2WgZy98uvjaFupIcY2b7WSVmfuhk
 oOiMpNYbbX6/gs6FXKAJMaTq7o+htqIXFXX+OhQzk2vRQHKKG4xbZJG5viJSy7ThdndG
 N6SUjmjaGTbPe92qWf/eYaXkXQOnVV/XbbmHPkKfnnTo7ZprvD20ybnRmFKII3WrylQS
 pLIVfkwGkACIrfnXq8U7mfDgPd8cUMLzsdQk0ZdEC4ul7AMTJ8wLrujuFiWtCHEqLa5X
 aYFiuiNqz5PPi7h9ZbbyklGPJWbZA/XwwuhwnU6zdUrdatcbH7HF7C3k0PvcHQ5sSbTU
 6c6g==
X-Gm-Message-State: AOAM533U9BRqXZ2gtB+ojLuHwo2e1Y5NaF2fuzoKWbsFhCSw6lHxM5rl
 LO1sK/0+bKgZyXWNq+/b0luyRNloNr1EbnG53BMq8w==
X-Google-Smtp-Source: ABdhPJwpCYU0pVWO0m1hybvqrz+OywD+LMB7vqll6xsrBZkjwSgF7nIZy+9sx/OUFkHC5P5D94qJZl9RxwRRQYxwwXk=
X-Received: by 2002:a17:90a:5408:: with SMTP id
 z8mr37361124pjh.144.1624269338658; 
 Mon, 21 Jun 2021 02:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <1623995165-25759-1-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1623995165-25759-1-git-send-email-chunfeng.yun@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Mon, 21 Jun 2021 17:55:27 +0800
Message-ID: <CAATdQgB32Fx-cOc2Uz4mQPE=iVm=6uYjJ7yqeW+Oo888kbQd2Q@mail.gmail.com>
Subject: Re: [PATCH v2] usb: xhci-mtk: allow multiple Start-Split in a
 microframe
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Tianping Fang <tianping.fang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_025540_228491_006DC941 
X-CRM114-Status: GOOD (  23.52  )
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

On Fri, Jun 18, 2021 at 1:46 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> This patch is used to relax bandwidth schedule by allowing multiple
> Start-Split in the same microframe.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-and-Tested-by: Ikjoon Jang <ikjn@chromium.org>

> ---
> v2: fix build warning unused-but-set-variable
> ---
>  drivers/usb/host/xhci-mtk-sch.c | 18 ------------------
>  drivers/usb/host/xhci-mtk.h     |  2 --
>  2 files changed, 20 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> index c07411d9b16f..cffcaf4dfa9f 100644
> --- a/drivers/usb/host/xhci-mtk-sch.c
> +++ b/drivers/usb/host/xhci-mtk-sch.c
> @@ -470,11 +470,9 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
>
>  static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
>  {
> -       struct mu3h_sch_tt *tt = sch_ep->sch_tt;
>         u32 extra_cs_count;
>         u32 start_ss, last_ss;
>         u32 start_cs, last_cs;
> -       int i;
>
>         if (!sch_ep->sch_tt)
>                 return 0;
> @@ -491,10 +489,6 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
>                 if (!(start_ss == 7 || last_ss < 6))
>                         return -ESCH_SS_Y6;
>
> -               for (i = 0; i < sch_ep->cs_count; i++)
> -                       if (test_bit(offset + i, tt->ss_bit_map))
> -                               return -ESCH_SS_OVERLAP;
> -
>         } else {
>                 u32 cs_count = DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
>
> @@ -521,9 +515,6 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
>                 if (cs_count > 7)
>                         cs_count = 7; /* HW limit */
>
> -               if (test_bit(offset, tt->ss_bit_map))
> -                       return -ESCH_SS_OVERLAP;
> -
>                 sch_ep->cs_count = cs_count;
>                 /* one for ss, the other for idle */
>                 sch_ep->num_budget_microframes = cs_count + 2;
> @@ -544,11 +535,9 @@ static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
>         struct mu3h_sch_tt *tt = sch_ep->sch_tt;
>         u32 base, num_esit;
>         int bw_updated;
> -       int bits;
>         int i, j;
>
>         num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
> -       bits = (sch_ep->ep_type == ISOC_OUT_EP) ? sch_ep->cs_count : 1;
>
>         if (used)
>                 bw_updated = sch_ep->bw_cost_per_microframe;
> @@ -558,13 +547,6 @@ static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
>         for (i = 0; i < num_esit; i++) {
>                 base = sch_ep->offset + i * sch_ep->esit;
>
> -               for (j = 0; j < bits; j++) {
> -                       if (used)
> -                               set_bit(base + j, tt->ss_bit_map);
> -                       else
> -                               clear_bit(base + j, tt->ss_bit_map);
> -               }
> -
>                 for (j = 0; j < sch_ep->cs_count; j++)
>                         tt->fs_bus_bw[base + j] += bw_updated;
>         }
> diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
> index cd3a37bb73e6..390cb5a86082 100644
> --- a/drivers/usb/host/xhci-mtk.h
> +++ b/drivers/usb/host/xhci-mtk.h
> @@ -24,12 +24,10 @@
>  #define XHCI_MTK_MAX_ESIT      64
>
>  /**
> - * @ss_bit_map: used to avoid start split microframes overlay
>   * @fs_bus_bw: array to keep track of bandwidth already used for FS
>   * @ep_list: Endpoints using this TT
>   */
>  struct mu3h_sch_tt {
> -       DECLARE_BITMAP(ss_bit_map, XHCI_MTK_MAX_ESIT);
>         u32 fs_bus_bw[XHCI_MTK_MAX_ESIT];
>         struct list_head ep_list;
>  };
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
