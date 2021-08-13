Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8816AC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 05:27:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C8B96103E
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 05:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C8B96103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MHs/K727LarQAmwMDWne18bPWmtzbcTW7T6dSCSD440=; b=sleJd7gQXx1Ygt
	GZG5Z+ilOsPXIPV/cmhRBI9gRSdovG1GfraYQ/EdwDAxPShkK1QcLmcg5DiNOPZAyLxJ20hZegNqP
	9//TnV02FUF/glSrM+/jq5d6YKI5opReq7F/ywOSOZsh8kUJg1YkTheBbR09eeu9wbOHerSs8c+rl
	PorLp5ECNFZApXqAegp7qQQ1gu8/LOds3w1lrkPm82mNMLcBWpFbp4V2PTOQe88XS3jqr8ulxSFt6
	wB6j3H0vIQ0f8HFrPGi1stsJpGWOQQAVVOGCRLelAuRFBtB10eZ1qa2DSKkr0Kb7/E90ttBPkyZR6
	25FTppZEDrExtGYVUK/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEPiS-00Bjrw-Ak; Fri, 13 Aug 2021 05:26:48 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEPiM-00Bjqp-Sd
 for linux-mediatek@lists.infradead.org; Fri, 13 Aug 2021 05:26:47 +0000
Received: by mail-pl1-x636.google.com with SMTP id l11so10408942plk.6
 for <linux-mediatek@lists.infradead.org>; Thu, 12 Aug 2021 22:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ocdM6c2cinlXX1kZNnF83LUMUxlQMibTtFjKC/p0qQ=;
 b=R+AVgrUdAT0DO61zcf2nNP6YwLVeEH+xYBgVGH2ye7tbv2+LN/mtkD2DBac6fUdKyO
 iE7rqZZACC/Za5jIIuAaiAFFHcx45bf0+VrfEc2nDoiZk8tLtpxx3g7J4erxBSNNzVzg
 HSLpxfDNUdVNkHCqYG6NDmEH7faLalmesZdIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ocdM6c2cinlXX1kZNnF83LUMUxlQMibTtFjKC/p0qQ=;
 b=TS2eTNG47MzZxmv3NbGQEVFL9QucNRZUjyJxxmvAlybgldLwG51hfNHrYQlMstfKre
 ucp4w1cwrj+8PzxwV5NaUMcKcqNWbIwfBptQoIf0vhOGL7jdoC2DOJiIgs5WO4s5Z6DK
 qJXIF7zynxhGPOI9PHEJ8eC6PM+95tN3NwlH9gnlyMXemN7PRU9gmHTIyrIZb8pX+z3R
 9jyezHBqB8aqsXhL3LZz2KHPMndikIiA1KzhxYGO7IZFy4E9KaBJ59CSUg//xPEWXKJL
 FH82UFa9ujfS6XvH0o0zniB/Mohw8aY3RKlgZarRqPpkNaJzNMzdwSKQ0xzj+vRfqsln
 fh/Q==
X-Gm-Message-State: AOAM530ukZKDhDgbb5s+wi9VlzPzqL0lHBLR4wSziPa+CIS8KZfQKTHe
 xY9lNFAkUk52mhJIIQ9dtavbX9MfTP6DYmyjPOXwSQ==
X-Google-Smtp-Source: ABdhPJyQaVIf1p9CcXmskDZyungHHN1Ox9/AmjAJTBtnxFY1rjsASN0ix1i9LxTbcmzwWe60qju7DBet2NbT00eBwMU=
X-Received: by 2002:a63:682:: with SMTP id 124mr713904pgg.299.1628832402140;
 Thu, 12 Aug 2021 22:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <1627635002-24521-1-git-send-email-chunfeng.yun@mediatek.com>
 <1627635002-24521-4-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1627635002-24521-4-git-send-email-chunfeng.yun@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Fri, 13 Aug 2021 13:26:30 +0800
Message-ID: <CAATdQgBeFHJV+=phaEBaXpKwMJygtGVzxJ0yC5hfvijpgwVMAg@mail.gmail.com>
Subject: Re: [PATCH 04/11] usb: xhci-mtk: fix use-after-free of mtk->hcd
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
X-CRM114-CacheID: sfid-20210812_222643_234943_22842F17 
X-CRM114-Status: GOOD (  16.66  )
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

On Fri, Jul 30, 2021 at 4:50 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
>  BUG: KASAN: use-after-free in usb_hcd_is_primary_hcd+0x38/0x60
>  Call trace:
>   dump_backtrace+0x0/0x3dc
>   show_stack+0x20/0x2c
>   dump_stack+0x15c/0x1d4
>   print_address_description+0x7c/0x510
>   kasan_report+0x164/0x1ac
>   __asan_report_load8_noabort+0x44/0x50
>   usb_hcd_is_primary_hcd+0x38/0x60
>   xhci_mtk_runtime_suspend+0x68/0x148
>   pm_generic_runtime_suspend+0x90/0xac
>   __rpm_callback+0xb8/0x1f4
>   rpm_callback+0x54/0x1d0
>   rpm_suspend+0x4e0/0xc84
>   __pm_runtime_suspend+0xc4/0x114
>   xhci_mtk_probe+0xa58/0xd00
>
> This may happen when probe fails, needn't suspend it synchronously,
> fix it by using pm_runtime_put_noidle().
>
> Reported-by: Pi Hsun <pihsun@google.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-and-Tested-by: Ikjoon Jang <ikjn@chromium.org>


> ---
>  drivers/usb/host/xhci-mtk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index 2548976bcf05..cb27569186a0 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -569,7 +569,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
>         xhci_mtk_ldos_disable(mtk);
>
>  disable_pm:
> -       pm_runtime_put_sync_autosuspend(dev);
> +       pm_runtime_put_noidle(dev);
>         pm_runtime_disable(dev);
>         return ret;
>  }
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
