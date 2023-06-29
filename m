Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC947EB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jun 2023 07:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5XW0exCS9z+Hy0fRQZ5/K6ds6wj/L09NJ5d7OC64KA=; b=tWi5Cjxe19XYYP3r5Pf+NNYeh3
	3HgVe3dzKZfzJwzK1Ovhb0ig9VEwTWJooQfiuzjKdJ44sOXZM5UnpjdSPoRgGwWAvEyL7btkHYiBT
	dC4nw6sDtW5quYNXFkkbyDOy3LHze2l8GUhphS5ZR43QnNUVROHS2rdL0o6nMw/vkop4uzTIIhJ2j
	XAtI1Q7wtSFjGp8HSEvFOPwhokX1zF6tK6Ivpf8rfCATshWlmGvd400YJTKGq8sc19eWaH3inj3rs
	wf21RFgWrnXdZys6sLGah8+zuuKef289qptbgv6V7zv1ZrLe5oFZ4jg4C3XjIpCZ95nIbDgkRXo3c
	nYLPtlVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qElqW-000BS8-1E;
	Thu, 29 Jun 2023 07:13:40 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qElqT-000BRP-12
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Jun 2023 07:13:38 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4008d810c28so3667281cf.3
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Jun 2023 00:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688022816; x=1690614816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l5XW0exCS9z+Hy0fRQZ5/K6ds6wj/L09NJ5d7OC64KA=;
        b=lU7gTej3xVjrNBXTU09iLSzYWoNF/qevLHKMhZxbv/Kj2VOUrkOIag5U5I4UPmFSrZ
         Y3+p/RAcucZjt8wYaUzbdpsL7ZV6cuJAJL+T72IlQz5+0JnQGpCbRP2/TUxJHok9AwqA
         Bfc4Y3bGDcTbZ2t34F7AT8sOAi10rC6wekEjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688022816; x=1690614816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5XW0exCS9z+Hy0fRQZ5/K6ds6wj/L09NJ5d7OC64KA=;
        b=bG7dtYgNld95ucrhHHhZ8gL0/HQpn5VxdgIt46I/xlkS9hJ47NVi9DyAdu7fNhbAni
         yEoq4VCCjaWrczxCevK/mxlZVcHL3D/okSEidzNxRIAT5BFfpe/UweddHIGRWnXkNXpt
         4vAgZXaLYEd4BSpOQG+v4ZitaDovpOiW5r3C7EAC7t0VNssJ89YBD3TBUnkmtbhTUY4L
         CROoS6DAO9Wnv41pOmAgyT/kZvHNIJNYnBth5+Oy3G+dkcGlVHrk9qfrUD076990VTeq
         3hagSDNz/d31Kt2mu974njcLXK0/0C3oo7lO9ZdW7RCyO423jgN4vRYKhC5JIOOzGqgc
         4G5A==
X-Gm-Message-State: AC+VfDzcrLN/LCZf9bSt5iUFr0xYIo02K8iQG8P3D4oOz5RRMgkrRt8H
	dLpZ553Gi0M7eu7dMuiajz2DkbcDpvw3MgLvoZvbgw==
X-Google-Smtp-Source: ACHHUZ7VILfICjeL4b6+6H18zR4LPIVn8YFg2lV7vCIOLxKGJOXGG21VPpI/jreHOE6rW9PkwYpQhA==
X-Received: by 2002:ac8:5c91:0:b0:3f5:19e4:34ce with SMTP id r17-20020ac85c91000000b003f519e434cemr47023786qta.48.1688022815679;
        Thu, 29 Jun 2023 00:13:35 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id ga9-20020a05622a590900b0040327381dbcsm1503336qtb.19.2023.06.29.00.13.35
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 00:13:35 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-635e5b06aaeso3458426d6.0
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Jun 2023 00:13:35 -0700 (PDT)
X-Received: by 2002:ad4:5c47:0:b0:635:f546:83c4 with SMTP id
 a7-20020ad45c47000000b00635f54683c4mr8987873qva.54.1688022814565; Thu, 29 Jun
 2023 00:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230628-mtk-usb-v1-1-3c5b2ea3d6b9@chromium.org>
 <CANiDSCsAgD33gMk9-CTGHuUv_b4KfRnO02ETEt6jFtQvw+6cag@mail.gmail.com> <ZJystxdl0jVoe5b6@google.com>
In-Reply-To: <ZJystxdl0jVoe5b6@google.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 29 Jun 2023 09:13:23 +0200
X-Gmail-Original-Message-ID: <CANiDSCu3WOqK9wdLDXmW+zbckq15gmxKjtFA4Aghv6uoidO_3Q@mail.gmail.com>
Message-ID: <CANiDSCu3WOqK9wdLDXmW+zbckq15gmxKjtFA4Aghv6uoidO_3Q@mail.gmail.com>
Subject: Re: [PATCH] usb: xhci-mtk: set the dma max_seg_size
To: Zubin Mithra <zsm@chromium.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_001337_358415_63FAF3F0 
X-CRM114-Status: GOOD (  11.57  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Zubin

On Wed, 28 Jun 2023 at 23:57, Zubin Mithra <zsm@chromium.org> wrote:
>
> On Wed, Jun 28, 2023 at 11:04:20PM +0200, Ricardo Ribalda wrote:
> > On Wed, 28 Jun 2023 at 23:00, Ricardo Ribalda <ribalda@chromium.org> wrote:
> > >
> > > Allow devices to have dma operations beyond 64K, and avoid warnings such
> > > as:
> > >
> > > DMA-API: xhci-mtk 11200000.usb: mapping sg segment longer than device claims to support [len=98304] [max=65536]
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > Reported-by: Zubin Mithra <zsm@chromium.org>
>
> Should this be cc'd to stable@ as well?

Not sure, in most of the cases this is "just" a warning fix. Let the
maintainer decide:

Fixes: 0cbd4b34cda9 ("xhci: mediatek: support MTK xHCI host controller")
Cc: stable@vger.kernel.org

