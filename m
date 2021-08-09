Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D001AC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 09:42:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E6A460F8F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 09:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E6A460F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VhSKnLPuAbFpSpIBdv55ae29NqGa/tIAa8xz3MHtBM=; b=s5DYTTX1g3OEi+
	G5FFE8KT78ofYxn5P6idLuR/7Gpda96VmJQzylFZOx+qfCEcItd3C/ISzqRg9vYVD+pN5MSfGKeUm
	GY3pgTbegl9wyd44rfR1VP3lvp/hA0W01S//jycK3jZEwv5FNq96TA1sbhVGe2LuKO0rRnv/Zqg+8
	HW2uXrEIql9ecsazoLhB8IMfEU9hL5fc9k4N+X33rgfolNJTITL3exd2z1G9F+scUdqSLysOMnECs
	EMn/fdAGgprC4PgVtGvEc/HSZh3IVNI5jw7jReViFe+IMyRCl8YjM0N+0WjfAQY8MKYNRNsV1fxJZ
	KAG4WeNXnjtz3q+qnrcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD1nY-0003Lh-1D; Mon, 09 Aug 2021 09:42:20 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD1nV-0003Kb-1V
 for linux-mediatek@lists.infradead.org; Mon, 09 Aug 2021 09:42:18 +0000
Received: by mail-pl1-x62c.google.com with SMTP id a20so15798596plm.0
 for <linux-mediatek@lists.infradead.org>; Mon, 09 Aug 2021 02:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A+KAi3dOJuuXd/Qn6cacTVo6xH3AW7xPjOFYRrz7Uok=;
 b=HymP0PD2B0cGVjnMKzIUkUNnIY+q8voQCdep9RSZJP0rhHG+lzU47AL/ksz8la8qDT
 ROPMbY8e9eOtI20PzVcxAUx7Z2MOEU0oxI5YdRQlekp97dEmylrRvQrzzmpiHwOK2CdZ
 0+e/b0xFJgPZRRRdDWQ1rAhnthQkeuCeTmaKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A+KAi3dOJuuXd/Qn6cacTVo6xH3AW7xPjOFYRrz7Uok=;
 b=PUufh5FD5vUwotbfW3LCFKaFFO/4P0L/tmqvBvmCYhs0ANF1i7PvEeDSDLfr3yV/zv
 a26n2Iltw5cwNmfPdSwd76EgxwxOfZw7xNZJRFBf7iUQ8Jn5+qdeXGrqxwQ+LxKzQ6M+
 xaZwTESV4yu+oEAflXCxyHxYO0dkocek9Md1HpelEShMt0fiZSqBrZ/8e4vRPKw+BSqV
 sWPRdkqMyIS3QL9yeHHGj66BarhDcc+4zrF9FgHh3+eGJpnTvb4SJ0lOBOU2ccRYpx2v
 NBeZAaE7YE+uAL0EEIRdJ4/LjeGdXzM7sgcqpN79OXsJCSf5ztoZFnJ7/Yy4UHRqiP2A
 Z6Pw==
X-Gm-Message-State: AOAM530YsSvXCTiMyazRfW0kzyF4JAXBHjp47rklIIOg9rJW1+yWEdQX
 6MZ2yg0R32Wq/ChbTBxSMwveoMuYrrG7NjTG4HYcBA==
X-Google-Smtp-Source: ABdhPJwRNv1bYkHAya2aLwiLdoTT5Z3Wow97kzaNiR834PT5Mj0uvowBEIf7DGlFoiv/Uu/Nnd6z8yYjrp74f4fs4XI=
X-Received: by 2002:a17:90b:102:: with SMTP id p2mr674822pjz.126.1628502135890; 
 Mon, 09 Aug 2021 02:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210809165904.RFC.1.I5165a4a8da5cac23c9928b1ec3c3a1a7383b7c23@changeid>
 <YRDxTodNNqtnpPpn@kroah.com>
In-Reply-To: <YRDxTodNNqtnpPpn@kroah.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Mon, 9 Aug 2021 17:42:05 +0800
Message-ID: <CAATdQgDSCzZtiDSQk94CYHfSb9Mq28OH7-RdaTZNv3oPrW3nkQ@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: xhci-mtk: handle bandwidth table rollover
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_024217_148296_7C877FBE 
X-CRM114-Status: GOOD (  19.09  )
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

On Mon, Aug 9, 2021 at 5:11 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Aug 09, 2021 at 04:59:29PM +0800, Ikjoon Jang wrote:
> > xhci-mtk has 64 slots for periodic bandwidth calculations and each
> > slot represents byte budgets on a microframe. When an endpoint's
> > allocation sits on the boundary of the table, byte budgets' slot
> > should be rolled over but the current implementation doesn't.
> >
> > This patch applies a 6 bits mask to the microframe index to handle
> > its rollover 64 slots and prevent out-of-bounds array access.
> >
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> > ---
> >
> >  drivers/usb/host/xhci-mtk-sch.c | 79 +++++++++------------------------
> >  drivers/usb/host/xhci-mtk.h     |  1 +
> >  2 files changed, 23 insertions(+), 57 deletions(-)
>
> Why is this "RFC"?  What needs to be addressed in this change before it
> can be accepted?

sorry, I had to mention why this is RFC:

I simply don't know about the details of the xhci-mtk internals.
It was okay from my tests with mt8173 and I think this will be harmless
as this is "better than before".

But when I removed get_esit_boundary(), I really have no idea why
it was there. I'm wondering if there was another reason of that function
other than just preventing out-of-bounds. Maybe chunfeng can answer this?

Thanks!

>
> thanks,
>
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
