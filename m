Return-Path: <SRS0=fB7w=DM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294F8C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 13:44:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B624420756
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 13:44:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jJGL1zAc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="b7vdGNYe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B624420756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6F9vpYuxyFdSj8+IdqLfdbV7oW1YRiA70ahCSoy/4CY=; b=jJGL1zAcXPqNDNXzptR2R41Go
	r6xTnX4Kg68avjHbTzErpnmzZB0PjFMY1UJa7SUrPrGf3vSRp8WN5FvPUV4TOPGMgLJGxrDeK9HBK
	FxX5upXqydjIFnYYW0IcOlQfnQLq4ZeDCAGzR3th2hCtquB16t6R1pSysMlAF2L2cFek3FtXqe1tf
	zrjHFLFLEsvXUrzo57wcKuE607klfVWPugPQBwewA5tw5uHThaGbvdwoFHuTbP6Z5O4NC7o6/gQSR
	S9qQgd2Si5FmIdCBZpvIBhyicv2UnkWe1RUdWEmLBdPevKQxhKuK2J3rvFGjZjx1pu7TK7dcDLdBw
	we5CXC0qA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPQmz-0003gh-1W; Mon, 05 Oct 2020 13:44:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPQmu-0003ex-H7; Mon, 05 Oct 2020 13:44:25 +0000
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F3EB820756;
 Mon,  5 Oct 2020 13:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601905463;
 bh=Ib7GBdL7Wn9bocJo9NyhUcUy9MsfqzsQOqA6NxORkCs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=b7vdGNYeBNhV5kCPpU9VCAAr6jQnSqGyHEL3iKdrOKtJIBiqbytO9h3rUZX6d0zrG
 L2L0zizKezD2U3etwiBVc8DLLjWHXVlZ1pbobjbvzPTmXyxSrXST9oD/iWmykppjxk
 /csmwNNMjYPw1A1qPlX76PJGkaEkGnhAA9sxku3U=
Received: by mail-oi1-f171.google.com with SMTP id 16so1111660oix.9;
 Mon, 05 Oct 2020 06:44:22 -0700 (PDT)
X-Gm-Message-State: AOAM5314Kh/Sq+3OGLZbnb8qOc4FugKlF4bIcPRTc4mU2A+S2D4It5uv
 Pb9ZyAvYpqHX0dzX5g+d0ryCeSNCeML+R7TeHg==
X-Google-Smtp-Source: ABdhPJz+mQ/NS0sS4uvyu/c0LAt/s/xUYDXx+vCNQnX96Z0KUl55MOK1OCcrE3Hy8xpROafH3uekNkVrqfJk3kun5m4=
X-Received: by 2002:aca:4c52:: with SMTP id z79mr9074939oia.147.1601905462390; 
 Mon, 05 Oct 2020 06:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20201004055024.23542-1-phil.chang@mediatek.com>
In-Reply-To: <20201004055024.23542-1-phil.chang@mediatek.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 5 Oct 2020 08:44:11 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ4rTChMpn7F--fh1A6bOTZxR4rEM9bbA1rdetXmPDeVA@mail.gmail.com>
Message-ID: <CAL_JsqJ4rTChMpn7F--fh1A6bOTZxR4rEM9bbA1rdetXmPDeVA@mail.gmail.com>
Subject: Re: [PATCH] [PATCH] of_reserved_mem: Increase the number of reserved
 regions
To: Phil Chang <phil.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_094424_636798_83DD15F5 
X-CRM114-Status: GOOD (  18.73  )
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
Cc: devicetree@vger.kernel.org, Alix Wu <alix.wu@mediatek.com>,
 YJ Chiang <yj.chiang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Joe Liu <joe.liu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Oct 4, 2020 at 12:50 AM Phil Chang <phil.chang@mediatek.com> wrote:
>
> Certain SoCs need to support large amount of reserved memory
> regions, especially to follow the GKI rules from Google.
> In MTK new SoC requires more than 68 regions of reserved memory
> for each IP's usage, such as load firmware to specific sapce,

typo

> so that need to reserve more regisions

typo. Missing punctuation.

>
> Signed-off-by: Joe Liu <joe.liu@mediatek.com>
> Signed-off-by: YJ Chiang <yj.chiang@mediatek.com>
> Signed-off-by: Alix Wu <alix.wu@mediatek.com>
> Signed-off-by: Phil Chang <phil.chang@mediatek.com>
> ---
>  drivers/of/of_reserved_mem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 46b9371c8a33..595f0741dcef 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -22,7 +22,7 @@
>  #include <linux/slab.h>
>  #include <linux/memblock.h>
>
> -#define MAX_RESERVED_REGIONS   64
> +#define MAX_RESERVED_REGIONS   128

At some point, this starts to feel like abuse of reserved regions.
Please provide details on what the regions are.

Also, this probably just needs to be dynamic. I think we're at that point.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
