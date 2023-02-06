Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31017C05027
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 11:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGHFyTcXjv8iNfdtTbr4AjszKwZaLlLqNsZLgUMcwgg=; b=qO5XqZCajqEa2jLE9BWeaxAmea
	OFqnFiaF5xprFnZAPFlKp0N+NIGwUpEVLF8c0ylT/dPiE8C6jkOjzek1MR3dPOMMa1mHASolNwjTj
	ilojTRIWxQ+3XmXChofBDoNv/GJ+AfXPdCvP8l+e0HfglC1L0X4rT6yO/BR0FJMuHZggvAq7WB144
	C9cwjr/7VFwOinfthdR46LOdKDTq4/TxNLjnFTqaG1/18x8AtXQabA0Cws4lylrABTzPqbEsyBVY5
	JzI7umuN6SsaVlMquqpDu0BTVcayNn91L6WLTr8E2XuwHKIZjIjxHJmqg7b1vTnVKMR+vjdWZmvCD
	pZvAieZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOzSi-008Fv5-SH; Mon, 06 Feb 2023 11:15:04 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOzSY-008Fqk-Vm
	for linux-mediatek@lists.infradead.org; Mon, 06 Feb 2023 11:14:56 +0000
Received: by mail-vk1-xa33.google.com with SMTP id s76so5906573vkb.9
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 03:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NGHFyTcXjv8iNfdtTbr4AjszKwZaLlLqNsZLgUMcwgg=;
        b=fJi7xo7rAQpGc5beT3G6uxHlyPXbm8EBAmZGqtAxOIkhN+KOdSG+tU5L1XQLpQEo5W
         MU/qSaKWCv6/mJnTd8Izbda1mbNB6ORd4LaZFSGNNZztZ9EBnAVAqNxYm+jWsdMctk6k
         KoeLvLO9FA6MlmGsQCJPGDYJrC/aIx0cYMytQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGHFyTcXjv8iNfdtTbr4AjszKwZaLlLqNsZLgUMcwgg=;
        b=GQsqaSnJ2gtLGFFtJnCBCpvPFn6yzGVHJU/NRjVtLg6ytaTOeVCGzEe6y0UShpZIra
         FOFID0Ixhl5/4fMjFsKePUC5EqpFpsS0V6y7ModXqip5zJxzXeMjCpztdL9zas9X7zoP
         bE0YwIbav5waf+fbbQnhv4CVCMgQN2x7tthwHzhAd777ww/8X6r9oKeceEFfTPAZrOuC
         GPKqitGYziCBQ0BStax5pKZff+4SH4aZAz86RRIRwFeRpnKJjyctTYvFdlBqpwr0Sfga
         Ysju6Qm4GW/8fa10NpVPEv/LyBH8P5Z+daWa5/8RRbddnjUB0AhhJWkfShsxAtu9iRH7
         CaSg==
X-Gm-Message-State: AO0yUKX5EGpWBbQjP5UiCP+36mWcFdaFMvSlgzmhuRn5s9LEidiryXZd
	1gODUrzOXvq5aRLaFaw/NW8gjBSQrtW0W7iYG67vgg==
X-Google-Smtp-Source: AK7set8Q/DuqU17rY4kMXr59FonOJqAzSVrz1tGjeFvBuiw+sVUO7B//FvH662hX89b8oClO3AoUxF7YZY9Z+PrN6Ac=
X-Received: by 2002:ac5:c744:0:b0:3ea:94ea:110b with SMTP id
 b4-20020ac5c744000000b003ea94ea110bmr2750821vkn.22.1675682085091; Mon, 06 Feb
 2023 03:14:45 -0800 (PST)
MIME-Version: 1.0
References: <20230206091109.1324-1-moudy.ho@mediatek.com> <20230206091109.1324-4-moudy.ho@mediatek.com>
In-Reply-To: <20230206091109.1324-4-moudy.ho@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 6 Feb 2023 19:14:34 +0800
Message-ID: <CAGXv+5E2U+vu4ZCwUxP5zTxSrV=H9JEL5+UB6LokGcjeH+roOQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/6] arm64: dts: mediatek: mt8195: add MUTEX
 configuration for VPPSYS
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-clk@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_031455_027257_D9971735 
X-CRM114-Status: UNSURE (   8.86  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Feb 6, 2023 at 5:11 PM Moudy Ho <moudy.ho@mediatek.com> wrote:
>
> In MT8195, the MMSYS has two Video Processor Pipepline Subsystems
> named VPPSYS0 and VPPSYS1, each with specific MUTEX to control
> Start of Frame(SOF) and End of Frame (EOF) signals.
> Before working with them, the addresses, interrupts, clocks and power
> domains need to be set up in dts.
>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Probe tested only. I assume further testing requires the MDP3 driver.

