Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A3CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 03:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hbirHHGrM9O/jBsnRyKoZ8jog7Y1W37JXbawPNYyJU8=; b=EaTzIBF8JAxubx
	tQ1/cJlx5xgrdpXfodAmY/Ozvm99HECAKtolc8K8otrgQ/xp2bYMNSe1hqsfQrueWETW7cNNUx2vr
	c75BYphCgVrvAS0dnDjxPjoyLJQJIu2hkP7e1nTk27xm7pRnermZBTxzB8eOpM/DQ28DGcIp/+Bxj
	LQVM6KrnAIgJGJuTOJ8CC1ulsID3FFWwOPTbedlBP+QlSzP5BNrz8GX/RJ7KIiKvOFUp42tmTzcHV
	i8ltJ7FomQ9RqWngk5Qt+CvRV75OAB6eSmUyvGl9C/9RTNcSMbaEqvNSJp+yUkq86unf0YsuUJ+pX
	WkOoZSkdbcoK3VjpoeHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHHWr-00CNPU-0J; Tue, 08 Feb 2022 03:50:57 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHHWo-00CNOh-PP
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 03:50:56 +0000
Received: by mail-yb1-xb35.google.com with SMTP id y203so5639794yby.11
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Feb 2022 19:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gGJv0AFVdfHzUa0yHqnma3btGQlzXWk1wSqSnWWw9Dk=;
 b=mJm2SUkp44PAeoyfQimwj06GljPK6ZlqDXI5AuQfTSigjQ8pV5o1ebijkpLq4WG/Gp
 IMzFiyeYTiPnV9e/8k+G2x9dJnUo4cXsJQZN66aXlRdWYuZXJrMfHg7zybpBtcAi6Xqn
 kL1U1hw+GGReC6MiCpqdsZ/N7V4pxLg3Zj3Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gGJv0AFVdfHzUa0yHqnma3btGQlzXWk1wSqSnWWw9Dk=;
 b=p0/I387EieYYOY2uieymK7vkPR5OFI+BuZ8AQlUQdAK/DpB3lDF32pUGwxg2TqRdVu
 937Nr4zWpIvMdNsq+wuKKMB00xkXiei3jfxGl1uzX9pRbVLi2tMynXQMvqiQGd6IR/8v
 2X3cwVO9JzAIQa8wNXlIeCpqCfBUg4N/HteAkLWv8H3ZPbj6zeyVL0p8MeK8r/X6HSSy
 6ik3xTP5Za2Ylmd6sBG84NfrTjPJ+vVkCAURDlddnSzm2xWDNk1ovgxlL/5v57fKDx+T
 d6dMuPGbubs9FPPRYVdfshrq3B68V5jUKx//DAxKCpJ1KrbeDcZnt5dL3Tx1xlDDkcB1
 IaEA==
X-Gm-Message-State: AOAM531PY5EoGGDoZykZGZe/9bVQUGES+adJiZcOfP55YmU3gnpEyi5w
 GB7VmV/b5moOC+xQY3ldRKitOFU2x3SVx85g/1t8Mg==
X-Google-Smtp-Source: ABdhPJzBnKRYSQxz0sUuAXLlIdIIDiufeVnpjx8TXskOYyz1WTj3X8uhPzwU+v2jw3moTuLJEUn06yrPSPGxjYtAf04=
X-Received: by 2002:a81:1b4e:: with SMTP id b75mr2986110ywb.295.1644292253418; 
 Mon, 07 Feb 2022 19:50:53 -0800 (PST)
MIME-Version: 1.0
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-16-wenst@chromium.org>
 <752d5d00-4e05-1bd6-564f-3bce21a35713@collabora.com>
In-Reply-To: <752d5d00-4e05-1bd6-564f-3bce21a35713@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Feb 2022 11:50:42 +0800
Message-ID: <CAGXv+5HSLh0OgJc=EU=wvB4DaOMDLjsgJ6qnHY423d1L5+DixQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/31] clk: mediatek: Implement
 mtk_clk_unregister_fixed_clks() API
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_195054_858137_20C238B1 
X-CRM114-Status: GOOD (  17.02  )
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

Hi,

On Thu, Feb 3, 2022 at 5:47 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 02/02/22 14:48, Chen-Yu Tsai ha scritto:
> > mtk_clk_register_fixed_clks(), as the name suggests, is used to register
> > a given list of fixed rate clks. However it is lacking a counterpart
> > unregister API.
> >
> > Implement said unregister API so that the various clock platform drivers
> > can utilize it to do proper unregistration, cleanup and removal.
> >
> > In the header file, the register function's declaration is also
> > reformatted to fit code style guidelines.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > Reviewed-by: Miles Chen <miles.chen@mediatek.com>
>
> Hello Chen-Yu,
>
> I like this entire series, but I had to manually apply this patch (and some of
> the other ones)...

This was based on linux-next, which already has a couple clk patches queued
up.

> Especially for the ones that will be touching MT8195 clock drivers, can you
> please rebase over series [1] by Chun-Jie?

I think this series supersedes the first patch in that series? As for the
other two, I think the discussion about the bindings is ongoing, which
might affect the third patch as well?

ChenYu

> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=603955
>
> Thanks,
> Angelo
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
