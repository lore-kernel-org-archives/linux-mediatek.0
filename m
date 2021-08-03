Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1655C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 06:05:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 691F560F94
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 06:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 691F560F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UMKSswHekUUBKmqyPt+jIFJz2DXXGy0ib/1mWCqtCMI=; b=ZE6MDYGk/w/3RO
	DPLtpsLlUNbVyYzrvwza2E4dcWUBbAgR86VwzP1Elh9PNNgBhjjZrklgpD36uZ1fKxJaxDr9QtVbs
	BNjj0D8RNLgVWs1j86FJZsbecHMTmibD0KEZCzGjll5D6CwwRVJxm3Yicqg8CvVxA+nH+klrhApHJ
	s270T/QUCafO0DmIPQdiJkfjFfKpehtk0vl9DeybDjh/eCODyOXdd2Def6g0/ZlSA9QhoH5RO5Jit
	sguTKGH+IuuEqYPxHFkKv6XC8EVurw3HwT0c7W9v3yIYBoMVh352964RSp2jZh7AJhxBprHral16d
	nbrWzlMfm3sQM/8H3Waw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAnYT-001G3J-06; Tue, 03 Aug 2021 06:05:33 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAnYP-001G2B-Ex
 for linux-mediatek@lists.infradead.org; Tue, 03 Aug 2021 06:05:30 +0000
Received: by mail-pl1-x62e.google.com with SMTP id a20so22487652plm.0
 for <linux-mediatek@lists.infradead.org>; Mon, 02 Aug 2021 23:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=51/WH4H+3K8+t696XglQpyQZW1lNoES93JPrqYKsZxg=;
 b=G/fRC/zb3uF4kvM88E14wVxtUeT1gTTqB5861RuWAB1JZ4mQfVqvH+6iwK0b0Y//ou
 q6rUewplkkZCvg5FeMxUAWu+KI6j0006uvaZVtak3ITzYmvONdH5ZlYnIbu1hNfQm0mh
 HrfWotlfyYJTEIlsN6nEn7mcxuL9Up7SORWW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=51/WH4H+3K8+t696XglQpyQZW1lNoES93JPrqYKsZxg=;
 b=jOe3e/keK2ek6P1tpfxBdFGe+FI0xUcyTg66DoUNrNF6aDLdfAiTYpuYqIGI4oCjsV
 SWHhWCG/DTSSU85OMb6PP1EDSqqSYjtQu5TKu+MF7GJF+YdPFbmew2qhoTbM0pmVcrFM
 VhMEHDfj0MSgFB7J4kaHqqM5fcG7KPxtL/Goe0lm7JEZYI4n+JfuRm8xll8R0vO6Kr8/
 seIFetQKvpC0yXP5L7b9TYQ6+IfcDfWySqhWHzsDf0/vyLMnprD2w+SgWZ8iN64513D+
 IBb8J8LYh+UcvCZG6vprT+Uh9474uOIjLrh9hfQSXfcVzzVsrzmbJQxb3gDn9xrOm1de
 tYhg==
X-Gm-Message-State: AOAM532rZgtaWHw5DLqpFpFmG+5Nf3ey8KI/eHqXbZDp28YyvCQplLj9
 8lsL/RUzIVCGIDQo7P86tep+fnF9k2MWhICmYvMgHQ==
X-Google-Smtp-Source: ABdhPJy1HSMVKjdSljKukA9eioaRaXtN/w+0zAqgpjTq1m0pUhY96LCQ34rv0gbfZIf1jp6S9+Pn+bscR1D75OqUKWQ=
X-Received: by 2002:a17:902:b788:b029:12c:2888:9589 with SMTP id
 e8-20020a170902b788b029012c28889589mr17410188pls.60.1627970728797; Mon, 02
 Aug 2021 23:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <1627635002-24521-1-git-send-email-chunfeng.yun@mediatek.com>
 <1627635002-24521-8-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1627635002-24521-8-git-send-email-chunfeng.yun@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 3 Aug 2021 14:05:18 +0800
Message-ID: <CAATdQgDWkohpzgr=z+uzro4m9Bd=v88DNnJ-M88-5-0annhH_w@mail.gmail.com>
Subject: Re: [PATCH 08/11] usb: xhci-mtk: update fs bus bandwidth by
 bw_budget_table
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
 Eddie Hung <eddie.hung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_230529_567124_C65D58C0 
X-CRM114-Status: GOOD (  24.34  )
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

Hi Chunfeng,

On Fri, Jul 30, 2021 at 4:51 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> Use @bw_budget_table[] to update fs bus bandwidth due to
> not all microframes consume @bw_cost_per_microframe, see
> setup_sch_info().
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/host/xhci-mtk-sch.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> index 0bb1a6295d64..10c0f0f6461f 100644
> --- a/drivers/usb/host/xhci-mtk-sch.c
> +++ b/drivers/usb/host/xhci-mtk-sch.c
> @@ -458,8 +458,8 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
>                  * Compared with hs bus, no matter what ep type,
>                  * the hub will always delay one uframe to send data
>                  */
> -               for (j = 0; j < sch_ep->cs_count; j++) {
> -                       tmp = tt->fs_bus_bw[base + j] + sch_ep->bw_cost_per_microframe;
> +               for (j = 0; j < sch_ep->num_budget_microframes; j++) {
> +                       tmp = tt->fs_bus_bw[base + j] + sch_ep->bw_budget_table[j];
>                         if (tmp > FS_PAYLOAD_MAX)
>                                 return -ESCH_BW_OVERFLOW;
>                 }
> @@ -534,21 +534,18 @@ static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
>  {
>         struct mu3h_sch_tt *tt = sch_ep->sch_tt;
>         u32 base, num_esit;
> -       int bw_updated;
>         int i, j;
>
>         num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
>
> -       if (used)
> -               bw_updated = sch_ep->bw_cost_per_microframe;
> -       else
> -               bw_updated = -sch_ep->bw_cost_per_microframe;
> -
>         for (i = 0; i < num_esit; i++) {
>                 base = sch_ep->offset + i * sch_ep->esit;
>
> -               for (j = 0; j < sch_ep->cs_count; j++)
> -                       tt->fs_bus_bw[base + j] += bw_updated;
> +               for (j = 0; j < sch_ep->num_budget_microframes; j++)
> +                       if (used)
> +                               tt->fs_bus_bw[base + j] += sch_ep->bw_budget_table[j];
> +                       else
> +                               tt->fs_bus_bw[base + j] -= sch_ep->bw_budget_table[j];

I agree that xhci-mtk-sch still has more rooms for tt periodic bandwidth
but I think this approach could trigger a problem.

for example, if there are two endpoints scheduled in the same u-frame index,
* ep1out  = iso 192bytes bw_budget_table[] = { 188, 188, 0, ...} --> y0
* ep2in = int 64bytes, bw_budget_table[] = { 0, 0, 64, ... }  --> y0

(If this is possible allocation from this patch),
I guess xhci-mtk could have some problems on internal scheduling?

>         }
>
>         if (used)

> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
