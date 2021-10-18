Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06055C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 03:39:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C464A60174
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 03:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C464A60174
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BgxLE22jFUHfE0zBru6g5esfBlPAY9VgWo2HMpLaPS4=; b=CnMvc5SKM2v2q1
	JHTlBl8EsyV8C82NMkcbA0x0IvGu5bzWHuntJvwHLpTLySjkaiVDdqdLrj67EC5ELzSoWH95Rtsn5
	1GNziiUguzGLZLH8TPi7d/K6yQFPq6rBdOdWcG8ssEBk9tgTuJwBzy+UX47HxJqxhoiK1rBXukvKe
	n4F3RG/W8Wk2oenbynfJB9O6cYZN7WHoVAmaYSwBUxIhBK75P2nlkFVxda2o2pD+TEC6TwEUdqkPI
	DpSiEMDL3azR1EAqP78JIDTEnSwiYR5cA708+y78OhgpZyJNn4eBQap8FLVoQ+OlTpJ2OOXtKjcnb
	NcEVCZx/3X1oHBSWOt0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcJU7-00DupW-96; Mon, 18 Oct 2021 03:38:47 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcJU3-00Duo1-G2
 for linux-mediatek@lists.infradead.org; Mon, 18 Oct 2021 03:38:44 +0000
Received: by mail-lf1-x132.google.com with SMTP id y26so64582133lfa.11
 for <linux-mediatek@lists.infradead.org>; Sun, 17 Oct 2021 20:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Viwd7ANX416+8/ScF5bPasbghx1RgTJkrR17d6lCqck=;
 b=cOss8UMjm8u5At7QCwBuCldQAuU81snSCUVfCFeWgKRMqSf0DCsQz7siTH0U1Ro1IT
 FIhT7D8sWKBuY3xAqgVXx8PvYWHmK1LT9Ad4iHeYSINobQbkGHRCTSat3nTnACQJHkHI
 z1biYPooBEMwIRTUxuhj/MLofDV280icyOCC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Viwd7ANX416+8/ScF5bPasbghx1RgTJkrR17d6lCqck=;
 b=EFoAU1VugaVPHapByxUz8rYuBcUEEfPqb401VAx/q+h8rmrXBrroFbkcQnOpH7dDnc
 tVI7mRvSfA1yx0UzFylXkosN8VTAnw0qyp2arc+KId2VkINTHOcKNsXlk/FqzzERhfV8
 KIigzl/GuKeUK3C8K2WHHDGcU0f6gmSkvmKqi+fjKKfYdBP0ZwQD94Rf9PcJUiTbAEud
 VoiGEu7HnkczhlaP0vzZv5puDKgcJAn2WdGMMNbMoJzNGKjx8lWVJbXK8ayUMT86eT0u
 9Qs/VYJF2cv+AQ5I8eVKb0IHjW08d5rLOD7+BshjrBRacZt+rLd4x+pF5+e2gRedJnFY
 S44w==
X-Gm-Message-State: AOAM530hDoIeBN7lcuEOzzZv1AYlxEtNldhzTOCnias72lG9/jPOI8O6
 3q9JTtQfedgoHh4fSttao3feEMYo5HxglRM1ncTVVQ==
X-Google-Smtp-Source: ABdhPJwbqTTbxycWuW5Xz1CaF6uHYs50lpEYQFXSNoEJO51YoQ1Hbke6gK1K0igAWLtI/xW+tGlUpkeJLW0OObOd3DI=
X-Received: by 2002:ac2:4c49:: with SMTP id o9mr28370086lfk.482.1634528317739; 
 Sun, 17 Oct 2021 20:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211005065948.10092-1-mark-pk.tsai@mediatek.com>
 <163425869104.1688384.2477307279117424281@swboyd.mtv.corp.google.com>
In-Reply-To: <163425869104.1688384.2477307279117424281@swboyd.mtv.corp.google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 18 Oct 2021 11:38:26 +0800
Message-ID: <CAGXv+5HM07is85SyBEQ07TbvpAsi72qYJXtFEsyFcK2WSO=SsA@mail.gmail.com>
Subject: Re: [PATCH] clk: make clk_core_lookup faster by using clk name hash
To: Stephen Boyd <sboyd@kernel.org>
Cc: Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 yj.chiang@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-clk <linux-clk@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211017_203843_586336_5024E3CE 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

On Fri, Oct 15, 2021 at 8:44 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Mark-PK Tsai (2021-10-04 23:59:49)
> > Compare hash value before strcmp the full name to make
> > clk_core_lookup faster.
> >
> > It make clk driver probe 30 percent faster on the platform
> > have 1483 registered clks and average clock name length 20.
>
> Why is clk_core_lookup() a fast path for you?

Maybe because the Mediatek clock driver still does global clk name matching
to resolve parents?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
