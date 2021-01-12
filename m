Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21022C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 05:49:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C455E22CB2
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 05:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C455E22CB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xdGGRD58/dlos1I8dkaDpUCCNUnTB6IXe10NTJVpSb8=; b=mEqvteYOYorpbfIKBwT72gZur
	sFa8Rn+MX8MAphQtm5a9HNKBpiOT4yYvIqNtH3PKelq9mS7Z/Cku93ykHhOxu47h0v3lsV3LZisct
	yBSYn4ms37aeYccrwU9umRZyzP+L6kbwBCocT+aggW9oYgxd7NokyLHdiyrLYOYvDal99BZJpPDhI
	H7jhaC8ioZQZC8zz0rWcTb3sPws34+mow1EZbFHhnaLlR7Q9kNM26USIQWE1hdcTkeT8k3/tg89gN
	FNDLZ+KYnYpZOFtFB/muH1MTPX/7OCHQLMkLvr1NpRmsAO1hnW8vZfhGH8QldpCDQY5WDNWCr7xEX
	hZ2SVUJIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzCYD-0005an-Tf; Tue, 12 Jan 2021 05:49:05 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzCY2-0005Wi-S8
 for linux-mediatek@lists.infradead.org; Tue, 12 Jan 2021 05:48:56 +0000
Received: by mail-pl1-x62f.google.com with SMTP id r4so798586pls.11
 for <linux-mediatek@lists.infradead.org>; Mon, 11 Jan 2021 21:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z+UuZJMzg7vrix92H8yNvymjWYn4v4tuh1SrKJzSLm8=;
 b=JQsTmcLPoTaeeli611Tt6mGBNg5TJNkKTfXLDKVEnoX/OOqLNikQE4Ip2Rw6MA9Yuz
 KemfmMaptOX/ZNgHeDXdIN72y0gMJ44Dj2zLYwZ6eAwiDN9a7SPJjT4Vn3yO4vLV00pL
 DOY6W8keINeAjRVcriy8igeimSynyNmMITakQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z+UuZJMzg7vrix92H8yNvymjWYn4v4tuh1SrKJzSLm8=;
 b=cD2tY1G5ewpa/cx2fWBrSxFqwLV4ybHAbTpdyeU6Vmi58XdR5gjL1HLKFnmjLNgMwm
 fDa/59IaI8h/OMcH7VJN2ei1cvknoNzwFXmFXUQPFbwBqXh+szVEUrg6z97U5gTvnlpw
 Q9zLJf4V5XIDsSdbNIruyH3ei7tvgiB4p/yEXxPhNztqOWlytB8C9dx6dnC5oFOsnPOk
 Du1h8s7OBr3MhW27hLazcCuZQpj62IO3oB1zQY8AL8v7yUhHeUvPxALEwbeDJY5RPZNn
 3mXRshFkABKGKQV4+Sxjzq7TDZoFKRP+VubdzwaDvtegQHd7hyQxN1rlCoZwOlpN19qe
 c4nA==
X-Gm-Message-State: AOAM532Uf6FWu93YpXNjgQ6zTSTm6WZFQjKjz92s3+69kpcgMjSs9fxh
 btVfwcWhy2uIEhBRguEDBSIKtvFnLp/tkldvqnw91Q==
X-Google-Smtp-Source: ABdhPJz9iIQLZymh1Is42qGoVxhqbm83qoS8/tq7zs4AGxjPBu/MVfIrFA556/ppn3JB78x6W6Xh7UezS/ywc0QGduM=
X-Received: by 2002:a17:902:a501:b029:dc:3e1d:4ddb with SMTP id
 s1-20020a170902a501b02900dc3e1d4ddbmr3151522plq.60.1610430530661; Mon, 11 Jan
 2021 21:48:50 -0800 (PST)
MIME-Version: 1.0
References: <20201229142406.v5.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
 <2aea44f0-85e7-fd55-2c35-c1d994f20e03@linux.intel.com>
 <1610086308.24856.30.camel@mhfsdcap03>
 <e43632e2-08b3-7a1a-8272-1d493e25fc67@linux.intel.com>
In-Reply-To: <e43632e2-08b3-7a1a-8272-1d493e25fc67@linux.intel.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 12 Jan 2021 13:48:39 +0800
Message-ID: <CAATdQgD2OAmf7_NWSVwzyJE7mF0vngzE=QeE79PS7MJsgPhbtA@mail.gmail.com>
Subject: Re: [PATCH v5] usb: xhci-mtk: fix unreleased bandwidth data
To: Mathias Nyman <mathias.nyman@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_004855_285891_E4770AD4 
X-CRM114-Status: GOOD (  25.12  )
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
 open list <linux-kernel@vger.kernel.org>,
 Tianping Fang <tianping.fang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 8, 2021 at 10:44 PM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 8.1.2021 8.11, Chunfeng Yun wrote:
> > On Thu, 2021-01-07 at 13:09 +0200, Mathias Nyman wrote:
> >> On 29.12.2020 8.24, Ikjoon Jang wrote:
> >>> xhci-mtk has hooks on add_endpoint() and drop_endpoint() from xhci
> >>> to handle its own sw bandwidth managements and stores bandwidth data
> >>> into internal table every time add_endpoint() is called,
> >>> so when bandwidth allocation fails at one endpoint, all earlier
> >>> allocation from the same interface could still remain at the table.
> >>>
> >>> This patch adds two more hooks from check_bandwidth() and
> >>> reset_bandwidth(), and make mtk-xhci to releases all failed endpoints
> >>> from reset_bandwidth().
> >>>
> >>> Fixes: 08e469de87a2 ("usb: xhci-mtk: supports bandwidth scheduling with multi-TT")
> >>> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> >>>
> >>
> >> ...
> >>
> >>>
> >>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> >>> index d4a8d0efbbc4..e1fcd3cf723f 100644
> >>> --- a/drivers/usb/host/xhci.c
> >>> +++ b/drivers/usb/host/xhci.c
> >>> @@ -2882,6 +2882,12 @@ static int xhci_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
> >>>     xhci_dbg(xhci, "%s called for udev %p\n", __func__, udev);
> >>>     virt_dev = xhci->devs[udev->slot_id];
> >>>
> >>> +   if (xhci->quirks & XHCI_MTK_HOST) {
> >>> +           ret = xhci_mtk_check_bandwidth(hcd, udev);
> >>> +           if (ret < 0)
> >>> +                   return ret;
> >>> +   }
> >>> +
> >>
> >> Just noticed that XHCI_MTK_HOST quirk is only set in xhci-mtk.c.
> >> xhci-mtk.c calls xhci_init_driver(..., xhci_mtk_overrides) with a .reset override function.
> >>
> >> why not add override functions for .check_bandwidth and .reset_bandwidth to xhci_mtk_overrides instead?
> >>
> >> Another patch to add similar overrides for .add_endpoint and .drop_endpoint should probably be
> >> done so that we can get rid of the xhci_mtk_add/drop_ep_quirk() calls in xhci.c as well
> > You mean, we can export xhci_add/drop_endpoint()?
>
> I think so, unless you have a better idea.
> I prefer exporting the generic add/drop_endpoint functions rather than the vendor specific quirk functions.
>

When moving out all MTK_HOST quirks and unlink xhci-mtk-sch from xhci,
xhci-mtk-sch still needs to touch the xhci internals, at least struct
xhci_ep_ctx.

My naive idea is just let xhci export one more function to expose xhci_ep_ctx.
But I'm not sure whether this is acceptable:

+struct xhci_ep_ctx* xhci_get_ep_contex(struct xhci_hcd *xhci, struct
usb_host_endpoint *ep)
+{ ... }
+EXPORT_SYMBOL(xhci_get_ep_context);

But for v6, I'm going to submit a patch with {check|reset}_bandwidth()
quirk function
 switched into xhci_driver_overrides first. (and preserve existing
MTK_HOST quirk functions).

Thanks!

> -Mathias
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
