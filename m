Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFF0C77B7D
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 May 2023 02:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dptqg8r0UsWrR3n0HKBRHqVrggh1ivQ7IQr3yU5eDRA=; b=yUZ26hd+MDSokWOLzKy1eUmR/+
	O0iviBuoCYLbSRkksA6ytWX18nAoQp5Ek9XE0a9tC0fR/6HViGlXaJZpAprab9lpsbWf5rGMfWHdX
	GJ2J56/JcATsobbEifcRP1j+KfJHzmwPHn5t7Qoa2bnP2YdPgshSMAIcSCVpVewcjrlvoV8dR7FCH
	knnVqvXNCp6kLvwkcd2TVA7SzKjOyi0Q+89aHse0v7UvXNIGsKl8zuajFXeIbPyeL80Jzdv4QpS9u
	6/kHDxWFAgy20vlCwFV+1ScI/LsI6KBZqJI9TRhrvoTN8Qo7huoFLhzL3tBQwv4ryCOralypw6XTh
	Z8Emxj+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvqjt-00H2Kp-01;
	Mon, 08 May 2023 02:36:37 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvqjp-00H2Jy-2s
	for linux-mediatek@lists.infradead.org;
	Mon, 08 May 2023 02:36:35 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-43278f6d551so1300971137.1
        for <linux-mediatek@lists.infradead.org>; Sun, 07 May 2023 19:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683513392; x=1686105392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dptqg8r0UsWrR3n0HKBRHqVrggh1ivQ7IQr3yU5eDRA=;
        b=ABTrz6Kj/Gn2qx7IKb+RJD9gjgl2klGp6PIajxFslkI7N+K3PdelDUbcnk+mL+cywm
         878ElpMOODX9eaTWjRh6k7XadkTUhqbpSexVNnjzRNotq9TZVozK8oczY60o0a4Tyb4Q
         fyUqIO+KGn9QKm49zoSyVRHOfuQMjOG6sw9XM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683513392; x=1686105392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dptqg8r0UsWrR3n0HKBRHqVrggh1ivQ7IQr3yU5eDRA=;
        b=gMPrYJ28hzYwgbfRLIP+2q7Nfn37IjO0PYU6MQ+4MZx6tydh1jKVeCzUxO3kjQ2uqk
         6spVRvPBvfQmByOAFa1m/MbskApIXmN6+chVMokbSRMhyapF5DIkZUcWoXB8Jazv7hrB
         0DsCBafLvY0ffQzwwmf3HEz+oK6YPbTh60kfwvvEEPNDcehhJJBuAS4GmOUmT/3t/xMr
         tjrAlCcXsdx/7fEwIPCEFMq1U0XqzEm+D/DYKRcH6+0SZvmMe07QaSnfmRabkNm2XYJM
         DFjy1drvYAMs3Q0scMl+2DgQLjuzPxwwVJ1+seH2JtjQN7TjIHB830RCsVZvq2cgRB+h
         GrUg==
X-Gm-Message-State: AC+VfDyMDN6K6qh2bmDSFxd/ILJTwLGBpc3mM092dALLSsVozRb6ZAQy
	8O1jUh4/Nz2xX0TxI3ZnaRQLUYQjYICQYiB2wbCaEg==
X-Google-Smtp-Source: ACHHUZ50gsiXHy03kBM5uO2R7gxdLyM9XFldG88yruZf0Axm2n6Ko9rRM3MEf/5h29DiqpiBoLZjjoiG7pZ94fUBcuw=
X-Received: by 2002:a67:f353:0:b0:434:8479:1812 with SMTP id
 p19-20020a67f353000000b0043484791812mr2281063vsm.18.1683513392157; Sun, 07
 May 2023 19:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech> <20221018-clk-range-checks-fixes-v4-29-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-29-971d5077e7d2@cerno.tech>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 8 May 2023 10:36:21 +0800
Message-ID: <CAGXv+5E7pi5_R1u=dpTSVdBPhG6_GFnJpatbExhB2W2dhue9cQ@mail.gmail.com>
Subject: Re: [PATCH v4 29/68] clk: mediatek: cpumux: Add a determine_rate hook
To: Maxime Ripard <maxime@cerno.tech>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_193633_961982_930C739E 
X-CRM114-Status: GOOD (  23.17  )
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

On Fri, May 5, 2023 at 7:27=E2=80=AFPM Maxime Ripard <maxime@cerno.tech> wr=
ote:
>
> The Mediatek cpumux clock implements a mux with a set_parent hook, but
> doesn't provide a determine_rate implementation.
>
> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. However, the most likely candidates to
> trigger that parent change are either the assigned-clock-parents device
> tree property or a call to clk_set_rate(), with determine_rate()
> figuring out which parent is the best suited for a given rate.
>
> The other trigger would be a call to clk_set_parent(), but it's far less
> used, and it doesn't look like there's any obvious user for that clock.
>
> Similarly, it doesn't look like the device tree using that clock driver
> uses any of the assigned-clock properties on that clock.
>
> So, the set_parent hook is effectively unused, possibly because of an
> oversight. However, it could also be an explicit decision by the
> original author to avoid any reparenting but through an explicit call to
> clk_set_parent().

The consumer, the cpufreq driver, assumes the original parent to be
the dedicated PLL that drives it. It gets a reference to the original
parent with clk_get_parent(). It also gets an intermediate (stable) clock
via DT. It does explicit clk_set_parent() calls to switch to/from the
stable clock, and does clk_set_rate() on the dedicated PLL in between.

So yeah, they only use set_parent hook.

> The latter case would be equivalent to setting the determine_rate
> implementation to clk_hw_determine_rate_no_reparent(). Indeed, if no
> determine_rate implementation is provided, clk_round_rate() (through
> clk_core_round_rate_nolock()) will call itself on the parent if
> CLK_SET_RATE_PARENT is set, and will not change the clock rate
> otherwise.
>
> And if it was an oversight, then we are at least explicit about our
> behavior now and it can be further refined down the line.
>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

