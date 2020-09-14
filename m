Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BD8C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 17:28:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12D1F20771
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 17:28:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y0HjUL87";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dBMfqyJE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12D1F20771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LScXPvmVdEB0PxEevtG5yrlsmTcoxLbsne5BPZ97aLM=; b=y0HjUL87pH0e5T5FwcuAbEP0Z
	2ESqVQkRGHXP8hx++IdR5+Ikh6dMTvr961H5gsNjmVI1vx2zu9XTmP8fnlNcE8CM+WUV7oWpcN7C4
	9iO5jCOKk2LnV1vd4Kk5Y6431HaMkhqzZXDvbNm75B1unSeHrnjqlGoW2IdLoAFzYXSdtngfj7f6q
	SLMcDy4PBhqHhNR2SfvkR+Q0+UMbB5VEOx1UDfNK3FI8c3wcspNFTqDzoSkfLrOtrETnFA0qFqSbd
	jp8BRwKeVOt+QdgQcj2E6n/dQseDTK9LTI0CO+u4+A0c8LTzHo4j2hEqcY47FlmtLyfJ8pFJIvEGO
	80q+0Pnuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHsGh-0000VM-I7; Mon, 14 Sep 2020 17:27:55 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHsGc-0000Tn-Ms
 for linux-mediatek@lists.infradead.org; Mon, 14 Sep 2020 17:27:51 +0000
Received: by mail-io1-xd42.google.com with SMTP id m17so994017ioo.1
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2020 10:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BwPANE+A16n6RMiw9JBF2S1Ck+UsVna++YTmzFcao5Y=;
 b=dBMfqyJEEiWN4OVGlLXbaiuqZYwZT7kTphrfPQbmvVtaOCEeAQHT0S35u5yn2VaIWs
 JrJSjswPV0J9jGvc8wWbv1L3gpVZR+Zf5HNyVRcQO5G6eszgbCCLNgMoPH2IpDxWxRfb
 QMPqN9BeUkRu652EFTslhoIrQ6KirXsVOPsUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BwPANE+A16n6RMiw9JBF2S1Ck+UsVna++YTmzFcao5Y=;
 b=d0d7QtTx+tIOq7mcc0i5FZzFBqVSIdtsYpK4OMwGVzbCZ8T7U75joziXf813RO30O3
 w6VWKXm0lQcZk9056EykDa5mg4e39kOA6asR1OTU8Q7u30NkydQk1yoA0/NgObSeICdc
 IfjlEWF5CvwGCil52x57B/oXWcXJbwIUk0FjaTueLhf6EeYMDAfgqQBt0EsFtZJFDi7+
 YPUnLpgRSk+7JgpcX7siG8kgh8O+Iuz7WxPgPZeZCP5MSYA583FM9I3ih3aNWYrcqPs6
 ul5Q/JqkfP9bdpt122camuljfHxMJkvnRB7IsaakURYQ95vN4z8pUxu9ZR/ep1KlzPHv
 AAkg==
X-Gm-Message-State: AOAM530KDy5MOORatRSMRcR4Qpg3VbhPBtqwo2pt/KJYd/nUUMA4SowI
 NsLJEljsBmOtU5xvLvfKMA12r5huZZ4nf9HjgyH+Dg==
X-Google-Smtp-Source: ABdhPJzzsrEOkoCkxg8Yh/J7cKJRF1A17Py12eYnhGz+i/Q7pBRKtKs7wKw18KJI8Ko8jLZpDN+sPg8WNaiXkMUy5ik=
X-Received: by 2002:a02:c942:: with SMTP id u2mr13818959jao.114.1600104466981; 
 Mon, 14 Sep 2020 10:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200911093927.608024-1-hsinyi@chromium.org>
 <20200914160634.GL3956970@smile.fi.intel.com>
In-Reply-To: <20200914160634.GL3956970@smile.fi.intel.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 15 Sep 2020 01:27:20 +0800
Message-ID: <CAJMQK-iL6xvn96=WkRBwCeyV2NEe9uTJGY2Tntomnpouern5+A@mail.gmail.com>
Subject: Re: [PATCH 1/2] tty: serial: print earlycon info after match->setup
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_132750_806844_1E165BB3 
X-CRM114-Status: GOOD (  14.34  )
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
Cc: Changqi Hu <changqi.hu@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 lkml <linux-kernel@vger.kernel.org>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-serial@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 15, 2020 at 12:06 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Sep 11, 2020 at 05:39:26PM +0800, Hsin-Yi Wang wrote:
> > 8250 devices may modify iotype in their own earlycon setup. For example:
> > 8250_mtk and 8250_uniphier force iotype to be MMIO32. Print earlycon info
> > after match->setup to reflect actual earlycon info.
>
> But this means you do something which user didn't ask for...
>
8250_uniphier states that it can only use mmio32
https://elixir.bootlin.com/linux/v5.9-rc4/source/drivers/tty/serial/8250/8250_uniphier.c#L46

For MTK, may be the same case. So they are set in the driver.

> > +static void __init earlycon_info(struct earlycon_device *device)
>
> Can it be earlycon_pr_info() or earlycon_print_info() ?
>
Sure. I'll send a v2.

> --
> With Best Regards,
> Andy Shevchenko
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
