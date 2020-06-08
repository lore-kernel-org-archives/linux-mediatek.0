Return-Path: <SRS0=8MsW=7V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE30C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 12:56:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A05D52076C
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 12:56:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R1u8eBnt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnKDm+e2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A05D52076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8D+l8EhVe1WRUg1McwTAjUAVXcyA4xZ24pgnsjxdv38=; b=R1u8eBntd6Gdgi
	LhZv51cmQo0FqpWHNChcayMMgOZbY1nK6T0I9/PoRX6ewz2NiXL2jY8tVh+xNsxiBunLk60Z+cVhZ
	z2bUskrV9cvmcw9+Sz9IXkNg7pysPRY714Yhs2Ilbvl/Q48UsIyGYnDO1e2aTZ16xe763midYe4RK
	XpMQfGM3m+rjGdVL+3CEs44rDXvkb7ffrV4aWsfcCBBLjttz7Wjd8KoBuNtXlDrQFMhjjNpkfuetg
	G8wBsGEk1Eczrq4//8UbuF0MALcnH/xPzJ51hdDUK+KqudAsv8aVql1jvstgIQPEetuCDv8A1f9sS
	Qv25wuGT2Di2JKcd2VIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiHKY-0001mC-Cm; Mon, 08 Jun 2020 12:56:46 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiHKP-0001TT-Vw; Mon, 08 Jun 2020 12:56:39 +0000
Received: by mail-ej1-x644.google.com with SMTP id k11so18178361ejr.9;
 Mon, 08 Jun 2020 05:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3UgnuIt4eUiizz8RKz+CLNlYY+s+snxRvwn2Nqiv8mA=;
 b=hnKDm+e2wot8X7hijnXlTxsjlMzVZArEMQbqShrDH6BDk82Q6ZkDZvU9ieBAB3VXsj
 Sw0/GsjulOpiufvM9GBWh1bFGDpFygFoqIVcxFSAjZM45cWJlpjXeL3ePl5g9RD8bIUE
 6kukCAywLyQ19gqgsYBKwAflTXhxGLjdSh6Qu5fd7mVBJcgM/hi6VHnCyjb4HRe4RrZy
 b7Xkpjf9ogah8/JARCAT5p5Bda1Tbhh3iZXkAF7tgNeBS2mNErfLjAunjpd1wV42eyaD
 jlhLAZCSQMmZxrLezsMEjlvIQMNG9UB2EDzN+3DlOz9LBfzIXnFM0tw49prqWFSt6U+1
 JmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3UgnuIt4eUiizz8RKz+CLNlYY+s+snxRvwn2Nqiv8mA=;
 b=mUnZYOhn4qsq+OgjstuX1AgpDR4jorvCF/2J1+j5iQzaPBUTm6DzYs1vvKMZqGN16S
 AWgG+jQxXS6q+emdWU2PHB3x8lKj9tAfVNjZCkEX2OGjUrats315tJpr+5DmhuH5XAq+
 8zS0xc9bMRqOpQgvOUEOI8sko2osgc8uPSwAJbd36AvsZnKl3axT1/6I5y5j3w3rstQS
 qtIV9iWWpXKyQ4reDq+ztm31BowQtsJFLzg7i+ELw4qv98NI/MyCxDIs3paaEazTr9RX
 YYwtvQi08Ry+HqkWgv9rRGDkRfPbvdaZLFbTkMzle7jSvBsrrWlpahHkuAOANGhm1mNc
 pRhw==
X-Gm-Message-State: AOAM530e7dasKJhY6bJWPk/LXKBDEYuiun+yOq3Y5nerRjZrx3rYr1JZ
 U/57lNRvc2x6rFVdsdo7rf6MXjm4hlD+RR+bYvo=
X-Google-Smtp-Source: ABdhPJyghfSi7+bGOS7SQqFDAcG804xFwgxwAKvBvSPJfgOsYDUEIS+KYDI19lMl7J6498uIrMhJhNEBfHuxmhpBMek=
X-Received: by 2002:a17:906:160a:: with SMTP id
 m10mr21575123ejd.170.1591620995724; 
 Mon, 08 Jun 2020 05:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200605125545.31974-1-frank@allwinnertech.com>
 <20200605151810.vmgnnzp7cadfwsu5@gilmour.lan>
In-Reply-To: <20200605151810.vmgnnzp7cadfwsu5@gilmour.lan>
From: Frank Lee <tiny.windzz@gmail.com>
Date: Mon, 8 Jun 2020 20:54:51 +0800
Message-ID: <CAEExFWuoHhLqt4aukmP30SSXmwnmYuRq2t5HWKUBvreeABg=XQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: sunxi-mmc: do not hide address in sunxi_mmc_irq()
To: Maxime Ripard <maxime@cerno.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_055638_030436_02AEAF24 
X-CRM114-Status: GOOD (  13.62  )
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
Cc: marex@denx.de, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, rmfrfs@gmail.com,
 Chen-Yu Tsai <wens@csie.org>, linux-mediatek@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Frank Lee <frank@allwinnertech.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 chaotian.jing@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jun 5, 2020 at 11:18 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Fri, Jun 05, 2020 at 08:55:44PM +0800, Frank Lee wrote:
> > From: Yangtao Li <tiny.windzz@gmail.com>
> >
> > Using %px to show the actual address in sunxi_mmc_irq()
> > to help us to debug issue.
> >
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > Signed-off-by: Frank Lee <frank@allwinnertech.com>
>
> I'm fairly sure this hash is on purpose, and both the commit log of the
> %px introduction (ad67b74d2469) and the checkpatch message are pretty
> explicit about it.
>
> What issue were you trying to solve here?

There doesn't seem to be a strong requirement to force this to be printed out,
I just think that ____ptrval____ is very unpleasant.

Or delete %p directly?

Yangtao

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
