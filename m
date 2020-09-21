Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0F7C43463
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 06:55:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 455B7207BC
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 06:55:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fbKeMfjt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YBxfWLO9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 455B7207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MgZLhm3HQuqXMB2jhyGC98dDa4RaWqvkcuZ8ugChFYs=; b=fbKeMfjtq17EWbF1djBszTS9e
	seToIplThfWo2/+wCLmKewYAyED6K4M5PsUB7hpeJua4eoKlz1o47kH2EpmEcleu0ddR7NL8krRHW
	YgnlkOqixFcDQChSmcrKH4pfq+6gZxXKVHXlvIl2JwmXK0yWKR8vzBeuXL0+MhdNaHHEJgeaFvdnl
	BlP9GBuuyJXoYhfqaOj3nQZ5VpPKSMvcdhFrwy8kmiX1SD6djQB0AFUVD7Z+qSfD2OGStSoJmFlmB
	rv3AKfNqmYf3sqr6s4PdpGyOC1DG2ih1Ui+Mp2l1NvCizTJ9upZ03PzyZ48R96/8D6z75hwKM+R7g
	yr1O9qeVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKFit-00034y-4z; Mon, 21 Sep 2020 06:54:51 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKFin-000333-Fy
 for linux-mediatek@lists.infradead.org; Mon, 21 Sep 2020 06:54:46 +0000
Received: by mail-vs1-xe41.google.com with SMTP id j3so7481420vsm.0
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Sep 2020 23:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mtQqkf0DOg7SDhcAIXUbdE0JhrrbIB/Y7A8QqESS0bc=;
 b=YBxfWLO9xyiBxANQCD7TGEWzgQnCUtV/3967x5NsoR9xd+xMaC5dtXLtLl5dA9JR4e
 HrNSMTXNiwdIR1l1WPg3Z6LYpMdLk1dnXRJvSEBcnilzj696HtkRuH35V8kl6cD9xoMV
 IWBWYH69TRpKUnGsnuBl8MCPPLhODstYnLtqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mtQqkf0DOg7SDhcAIXUbdE0JhrrbIB/Y7A8QqESS0bc=;
 b=D3lsYHfH+gA4XfyykwNzWLHDIhkTcI96MMxXjXzlyYK/GalvLIS0ZV6B8Ry6Dz+Afh
 yIUbLM8vXaqYezVs7w8+rPwRIF5JFDoRAaJz5YrKnA6a0qX9u0Dkzao4p8HBqZrtDvhG
 vewlLlIjPM34fwjicuF8bLJLgTi5JCFBHwMVPTixLGKPNYQF4sPsYmjQvmOZk4P3jNy8
 ECok0psBEAMI4fTaoCsZaiaV/gBudEcz2xM+bY3VsRCoVDMmnoupOq4lOI8Lv3d9bNxZ
 cKz6QE/KO1jwO4inS0MFxQQrbo5inAAeQHzf8E/nZ5WvfcDbvlWpxVqJsZGVUXADjh0g
 t1NQ==
X-Gm-Message-State: AOAM530eQim/VhNdU7DxnIgzKji3ocFxigMsJk02aOJmbZZd1dueKMRI
 qDzAV8uqLzxl7oBlAGTD0bYUNBZjn6aW2sUCNs+IfQ==
X-Google-Smtp-Source: ABdhPJxJMZSII0e7AryQCVgZiyLLcBbUBiHsQPI0JYgGmO2/Nidf+iXorrmdf5Tda6KXV0TQQMPb75c5vYVzyh7WnqA=
X-Received: by 2002:a67:db87:: with SMTP id f7mr17600470vsk.31.1600671283955; 
 Sun, 20 Sep 2020 23:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200918083124.3921207-1-ikjn@chromium.org>
 <20200918162834.v2.4.Id1cb208392928afc7ceed4de06924243c7858cd0@changeid>
 <1600529204.7002.0.camel@mtksdaap41>
In-Reply-To: <1600529204.7002.0.camel@mtksdaap41>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Mon, 21 Sep 2020 14:54:32 +0800
Message-ID: <CAATdQgBOdEAFvsf-mukzmU0Z9MevMzPvtnuX2mJjLGU9VivDUQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] spi: spi-mtk-nor: support 36bit dma addressing to
 mediatek
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_025445_572246_8EC94050 
X-CRM114-Status: GOOD (  12.10  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Sep 19, 2020 at 11:26 PM Yingjoe Chen <yingjoe.chen@mediatek.com> wrote:
>
> On Fri, 2020-09-18 at 16:31 +0800, Ikjoon Jang wrote:
> > This patch enables 36bit dma address support to spi-mtk-nor.
> > Currently 36bit dma addressing is enabled only for mt8192-nor.
[snip]
>
> Do we need to set sp->high_dma when we have >32bits DMA?
>

Yes, to do so, you need to add new compatible strings if there are
more SoCs support >32bit other than mt8192
or just ust mt8192-nor for binding.

> Joe.C

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
