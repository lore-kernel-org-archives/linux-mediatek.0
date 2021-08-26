Return-Path: <SRS0=zgIi=NR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6D3C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 11:54:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2CA56102A
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 11:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2CA56102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/4kFcfB8M8MQ1e0aoZ1R722C+T8KNfcxrO+H9FCaHY=; b=j6VOeVgE44Czrb
	dDN4bnsOljtK1imhebmg0IxOWEPIXcx5/zSdKktgHeV+OxBShhWblW+rIpdY/7lNLNMUvAdqKKtFn
	nIKKVyuxRtRv/Jcvu4g9LMIHDLZsQIsTZye6RjlsOedgMfWamdb985NgGp8tH3T/byxX2cFpY0idV
	eb2ZdE53cdqQt5y2iWtPD7eHAWPuSO8mKSTKjmqqzdf/aOgC3GdvjZ/66XvzDXtjxaMBrnFHwkKdJ
	uaHeFWSqVq29nO8mLwsBCQC1guQjtRs3XVp08NYpA3seAvRxj7MsanW9LRfDw1zhWUHvK8y9QstiM
	h+574mjEYoD9RZs6I98g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJDxp-009zEc-25; Thu, 26 Aug 2021 11:54:33 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJDxZ-009zCF-MJ
 for linux-mediatek@lists.infradead.org; Thu, 26 Aug 2021 11:54:21 +0000
Received: by mail-pl1-x629.google.com with SMTP id q3so1645464plx.4
 for <linux-mediatek@lists.infradead.org>; Thu, 26 Aug 2021 04:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GF9cA6HWm73PdcnhQrBWb0JMD23t4eWrYuwcNebBzhg=;
 b=BOLP6Ete/5M3jts/uWuAymRzOu8DrhtLuaCJjWI6HJPL7OVKD5Sswq0Ir/Ml8zxiWp
 sRpiHOy5vrltsG0dygRRhglM4AN+Tp8c5s0LpKJOFDYjOpRpq3jZK8SgY5u5aNdP+sUk
 kPoAzc+OBpyviSNC3b3vRX0ZXey/cvs089ptA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GF9cA6HWm73PdcnhQrBWb0JMD23t4eWrYuwcNebBzhg=;
 b=QV4fbqC/pf203Jf++Yex+4mVjzaByfdUBdfAkHzvNoXCENO9DtJAU5+nsBx52DjYhv
 s6ETeIM++BHwp6Ub0UMvXIoD4/CirWB8UeONZfrcnoR8pA+BME8SzWRH7LkME0hM+yPq
 ni6qlAT5aAaiEkJAdPOE2iutzD4v4PT9+uLvf6dZEQro5tBF1WQbDhPCWCcHCMVsSo8h
 9IQwNcFXoqhgA82szXehb0HmjvidBAEgUEjrLBpCvQ/yIcPZrmyzcu9+BvfwPuekX/ou
 H4XBUfSg96KwVvZ9RqwQJGcMi7RR2CXiwSAtQFB4gxxy+OQavGWbqAe7SZRRzYDe0ktK
 mByA==
X-Gm-Message-State: AOAM530i5XfqDTmMNmldbJmI/zWdVTJiX44ygTuP2FEaCBt+1dW5ttP8
 NSoWC6d2YUEyl1vISBMzR3J463SxWJI/yB2lBR6QNQ==
X-Google-Smtp-Source: ABdhPJyPJt6SUmiZLSQD+XbEIBZ8IKTak4j4QZ8Oj8fxfMRxk7v8EqBMuHWZ5SQ/bfQzG0hm7oZTmwF44/dS0Jgya64=
X-Received: by 2002:a17:903:32ce:b0:138:7c09:1178 with SMTP id
 i14-20020a17090332ce00b001387c091178mr3215013plr.60.1629978855791; Thu, 26
 Aug 2021 04:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210826025144.51992-1-chunfeng.yun@mediatek.com>
 <20210826025144.51992-3-chunfeng.yun@mediatek.com>
In-Reply-To: <20210826025144.51992-3-chunfeng.yun@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Thu, 26 Aug 2021 19:54:04 +0800
Message-ID: <CAATdQgBD+dTtBie-cNKRJbfxEpc3haqjfUu1k26mTk8pCSOEww@mail.gmail.com>
Subject: Re: [PATCH next v2 3/6] usb: xhci-mtk: update fs bus bandwidth by
 bw_budget_table
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>,
 Yaqii wu <yaqii.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_045417_760103_6E4B1B9C 
X-CRM114-Status: GOOD (  23.08  )
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

On Thu, Aug 26, 2021 at 10:52 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> Use @bw_budget_table[] to update fs bus bandwidth due to
> not all microframes consume @bw_cost_per_microframe, see
> setup_sch_info().
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: new patch, move from another series
> ---
>  drivers/usb/host/xhci-mtk-sch.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> index cffcaf4dfa9f..83abd28269ca 100644
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

I'm worrying about this case with two endpoints,
* EP1OUT: isochronous, maxpacket=192: bw_budget_table[] = { 188, 188, 0, ... }
* EP2IN: interrupt, maxpacket=64: bw_budget_table[] = { 0, 0, 64, 64, ... }
(Is this correct bw_budget_table contents for those eps?)

I'm not sure if it's okay for those two endpoints to be allocated
on the same u-frame slot.
Can you please check if this is okay for xhci-mtk?
(I feel like I already asked the same questions many times.)


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
