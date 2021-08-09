Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A21B5C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 07:32:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A5BC61055
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 07:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A5BC61055
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zDv6iOHJI/rR4fj+ocSY4bupzh6RUxr7QI90FPIgGxA=; b=OTf/IKCmWga1p2
	1/GvW2x/ubFPPx0iSexDE5kw0oa6YL7C7VzdFf6IVeZie1Z1hOXUnzPVMNKRyeOUcGz79WwnTrrRh
	7Y1cZa8xJPgxXyWCKU3/8XgDZALPp1p0Zb3KBl8SKq6aFWfS2MOqjIYPP29mQmK8PaqvrVw2BFnEQ
	uc3ZKRQsujtjTqunVeeHQm15f0RuCtWLzP4/QgGfx8q7/JNGwRkBnCbKHLMUbbmC4mcyEIjRuyXdr
	zzAYQqk6GAr/rpEeiinRdtpFUIZbs2DDJmDytTuSpK2xn0JTfrn5eIBWTSEWTJSwqxACcoVWNHKQc
	Z/O2WKasyDTVHEwJN1RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCzmB-00HMdT-83; Mon, 09 Aug 2021 07:32:47 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCzm8-00HMc8-VS
 for linux-mediatek@lists.infradead.org; Mon, 09 Aug 2021 07:32:46 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 w13-20020a17090aea0db029017897a5f7bcso5084823pjy.5
 for <linux-mediatek@lists.infradead.org>; Mon, 09 Aug 2021 00:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NVCCSnIXYykkg2R7yVA5Ld91gUKOn2zITwPVLJyBQvQ=;
 b=JJ0xgqBnD9h/5UXKJJkdIH5qjmoVw6ZhAxv2ayd+S0yB+m/LShHqM8AynrVtiYUuPD
 alwnu+6AGSPiAaPuawgIIconPh0TGQkupInxxbQwuXXiLrMagcGMZJzAZPpnexiGg+6Q
 yKPYKw7FJTDbtEkvB2KSnDDzvYmbkM/E5jEWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NVCCSnIXYykkg2R7yVA5Ld91gUKOn2zITwPVLJyBQvQ=;
 b=tDjx+fhq9Qh57hKitpmS+SZLl9xJpTLz021LSeNocbw0WbSBGhdGCw/5/F2W7bcvDo
 4dYfK1XrAJLXzFozxkYooRz5KGedI8oXL9289TAWm8q6hC7UhABFDMkiDnSU/AjrYThw
 cLOZ/B7VLKPWnmTh6SecUf9Qvt9CXdTAjJItQuFjXQE4U3AHV5cSSTBJ4i54NigR+5v1
 /jP6kQlnVi10hZ+iiQvEJhOTlbvj2IfQqpReC/Iwn/DroM0Ro5rbRs0zvwFuaG6QuWV8
 liwc/6x2mIHw8hrZc/3g7bh/QkwFY1v1ZLigZKua7zaalhZTXNSICsrE8qamv/Sg2L6M
 H4CQ==
X-Gm-Message-State: AOAM532KSFtiwEYiA8aupphFGZZOoK3CY/JBZpf/BfIuYCFvOGU+HsM4
 MuMFou4WHVXF7Itw7mH4gifKHJcQcKr4qg4DIpkQLw==
X-Google-Smtp-Source: ABdhPJzPT1GiwQpBd6U/85ILPMLMrLPdsU7/6fuodJb9JGdW/fcRu0XqgpdJcPoOgwhC12HFQLmJTOHVjKPOQOD+oQ8=
X-Received: by 2002:a17:90b:102:: with SMTP id p2mr150614pjz.126.1628494362683; 
 Mon, 09 Aug 2021 00:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <1627635002-24521-1-git-send-email-chunfeng.yun@mediatek.com>
 <1627635002-24521-9-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1627635002-24521-9-git-send-email-chunfeng.yun@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Mon, 9 Aug 2021 15:32:31 +0800
Message-ID: <CAATdQgA4qwKb=Uee1pUj-Fk8G31zA40OD7o49W1YLUhZh7BHWA@mail.gmail.com>
Subject: Re: [PATCH 09/11] usb: xhci-mtk: check boundary before check tt
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
X-CRM114-CacheID: sfid-20210809_003245_077911_540A8E2D 
X-CRM114-Status: GOOD (  17.53  )
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

On Fri, Jul 30, 2021 at 4:50 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> check_sch_tt() will access fs_bus_bw[] array, check boundary
> firstly to avoid out-of-bounds issue.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/host/xhci-mtk-sch.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> index 10c0f0f6461f..c2f13d69c607 100644
> --- a/drivers/usb/host/xhci-mtk-sch.c
> +++ b/drivers/usb/host/xhci-mtk-sch.c
> @@ -600,13 +600,14 @@ static int check_sch_bw(struct mu3h_sch_bw_info *sch_bw,
>          * and find a microframe where its worst bandwidth is minimum.
>          */
>         for (offset = 0; offset < sch_ep->esit; offset++) {
> -               ret = check_sch_tt(sch_ep, offset);
> -               if (ret)
> -                       continue;
>
>                 if ((offset + sch_ep->num_budget_microframes) > esit_boundary)
>                         break;

Instead of dropping it,
I'm wondering if it should be checked against (offset & 63) == 0 when it's 64?

>
> +               ret = check_sch_tt(sch_ep, offset);
> +               if (ret)
> +                       continue;
> +
>                 worst_bw = get_max_bw(sch_bw, sch_ep, offset);
>                 if (worst_bw > bw_boundary)
>                         continue;
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
