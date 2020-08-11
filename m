Return-Path: <SRS0=N3vC=BV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DE4C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 07:28:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6019E20781
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 07:28:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UYqbWHST";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I4zF9BZf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6019E20781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MMXomeQ9rwE5OZT6+rgc/gi8PVahuSOYHNAs0IC/EUw=; b=UYqbWHSTHm1WggVls1a2iG9g8
	MzhqZAAZsq7VKTkwFewAk7lISwTOMIAgnW9rdYIul/CCm5mDRCIjKjE/jCQFgF9Niwt0W8QQmvx7S
	Tj/mnQbM1Rm8K32Bbw/4bFp3bLrgTxuY/j5mFt5GLlmIu0okdDYCApXNiHWcFLV3iQZ7sWiZM11Ka
	IDwV7jhiRAkQPG0IuwiCUekeFjQ+gYWa+PhkKKuI3hz194aIuR5dOO8legoA8w4XbD0gW87Gw9OuL
	NjKiCnsDrwMUu2t5uHd5EMXhtBrOjmIvGwMGdrkf7cVC1DdTILjxH8j2ab+n/HnqAK8cz85504ZC1
	R9bOzWErg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5OiE-0004s6-CQ; Tue, 11 Aug 2020 07:28:46 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5OiB-0004rD-Af
 for linux-mediatek@lists.infradead.org; Tue, 11 Aug 2020 07:28:44 +0000
Received: by mail-ed1-x541.google.com with SMTP id a14so8301851edx.7
 for <linux-mediatek@lists.infradead.org>; Tue, 11 Aug 2020 00:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VNS8rgxQTsSqkuQvisEfuQkArMcjZwTTMFnULFhcBtc=;
 b=I4zF9BZfsZmsK7v24MOsVh7XvfpQcnthAJ+k+iaowWwFaGJKa8I19900B1KW4J28/g
 QR7nxd0IiU11LQkTVy/3+d7XPpi7vGdQov5nIi0/DWk2Kvl23qwuigMTXNJztOHnjsoM
 /thmEzj30fA5G4XJFAH1TYiYY+DDEeFHE12gU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VNS8rgxQTsSqkuQvisEfuQkArMcjZwTTMFnULFhcBtc=;
 b=k4CU/DGZYzr4f2uvA/4Li66ha4xB0WqyC36rL11QwrOuBW79vXJyBT+JsUvHBm3yUJ
 NLPkWiaA/0iM5z2EZ6ahcpvk79jOF+Kgnrdjhbo0duIdBBLrNDNZGfvIRYdSI3cnkn9n
 izevCcV48zsBrUTf/jI1pwkvtShVFLxy2FJV9bXUlZt7wGqJzPU+yU7/pyKxG+o8WNko
 HvtBoz3gq7jlAAoE+Op+ttQyPvo9EhXtBG1K7H5YoYcM9Vr4o8PKMkgHSQQmJJL8TM+4
 cp0ZV1GbxlWJMpLzgmyI99g1Ba2axXA9V/0zJ/I4m66ZdwIhpucE8IQlKjh/KWfliMq3
 Mk2g==
X-Gm-Message-State: AOAM532i/rFea4ZHcbi4rWUgUcktfCClmNIlpJE7yB1PxNHuXP5q8WmP
 P3dZsECZSGfYPGAHxz9uup41j5j25ro0XYF5Ox68UQ==
X-Google-Smtp-Source: ABdhPJyDCtyNs+EX7nXIu9V8/MaQkjXI0d/Rvgm77fNHd3xXnjpWHunejPSvEPJyZoDtl5sSAwCP/jkQNo8TgvajC7g=
X-Received: by 2002:a50:e004:: with SMTP id e4mr13096018edl.114.1597130919795; 
 Tue, 11 Aug 2020 00:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <1596012277-8448-1-git-send-email-weiyi.lu@mediatek.com>
 <1596012277-8448-5-git-send-email-weiyi.lu@mediatek.com>
 <CANMq1KCG1xUan5-=DBZewvTqmUH=p7=nxy0Va=pdYBhAfYhhjQ@mail.gmail.com>
 <1597128205.20627.14.camel@mtksdaap41>
In-Reply-To: <1597128205.20627.14.camel@mtksdaap41>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 11 Aug 2020 15:28:29 +0800
Message-ID: <CANMq1KDRwwFvR2v6ykpvV6Y72L+Ym+4NcZF0F7wYq2znKy4sqw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] clk: mediatek: Add configurable enable control to
 mtk_pll_data
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200811_032843_672850_36A10D3D 
X-CRM114-Status: GOOD (  13.92  )
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
Cc: Rob Herring <robh@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wendell Lin <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Aug 11, 2020 at 2:43 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> [...]
> > > +       writel(r, pll->en_addr);
> > >
> > >         r = readl(pll->pwr_addr) | CON0_ISO_EN;
> > >         writel(r, pll->pwr_addr);
> > > @@ -327,6 +327,10 @@ static struct clk *mtk_clk_register_pll(const struct mtk_pll_data *data,
> > >                 pll->tuner_addr = base + data->tuner_reg;
> > >         if (data->tuner_en_reg)
> > >                 pll->tuner_en_addr = base + data->tuner_en_reg;
> > > +       if (data->en_reg)
> > > +               pll->en_addr = base + data->en_reg;
> > > +       else
> > > +               pll->en_addr = pll->base_addr + REG_CON0;
> >
> > Don't you need to set pll->data->pll_en_bit to CON0_BASE_EN here?
> > (which probably means that you need to add a pll->en_bit field to
> > struct mtk_clk_pll)
> >
>
> Because all mtk_clk_pll data are static variables, en_bit would be 0 if
> NO value assigned.

Wow, you're right, but this is a little bit subtle. I wonder if it's
worth adding a small comment? (either here or in struct mtk_pll_data)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
