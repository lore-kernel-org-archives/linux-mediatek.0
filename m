Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED15ECD128A
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 15:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=buNYP7p7u2SjN+B3Y9aoQObdwXquT6XXRaxxD1OD6hQ=; b=VbKPcc7Suh2W6gAvAEZKyE3cWS
	eao1EqyXsu9B+UkTdfFukrkp2mlcvR2397UiEBao2k/3bswC0kC9+N7o4ARVW+k4V6CDeiGDillXR
	35sDa6tGqCssmjd8fCF53Eh7eHoU/kh+3A96Ke5I5Cgj8Y8+2ERcc/Ex/7yUF5W1Lcg/8ydR7kACh
	W/SRbmp+PLoubUdxMG7t3liYciMFQaxE0h+/J1aaNoLpEL22HCZ8wTQ5rIcdxIv9n+WEGqyHRRHL6
	n2vQM0kDgVEw59lGXlNbvwtEY8AAJ31YYPP13iNA6ThkYJO747RFQLWTR6JSlu9WAnnYnLO7KaFOc
	HPeOKm5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruDfW-00000002m0J-0EGf;
	Tue, 09 Apr 2024 15:45:54 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruDfT-00000002lzE-3CRb
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 15:45:53 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6153d85053aso50108247b3.0
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 08:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712677550; x=1713282350; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=buNYP7p7u2SjN+B3Y9aoQObdwXquT6XXRaxxD1OD6hQ=;
        b=YzZ4lezXKNIbK394aENSYoJWoG7YoRy4lpR13Mn98qhpfWYpAdJMKb2ZTGeiO0j3qH
         7zJ5nHhDs1r6pDeuWlvT87/uiPynr0KDTJ7GqzOHnfVCAawPP6IiQLc0o4CMEbuUNZFT
         JdpvSxFiZRlAAoKpzm2UenZor5574/V25CBwUwTOQK2M6zzQ/w+iGySsbrswXXxMpH6Q
         cZPpjXRm8IcBnniCCsxn5+dANIu3eY9kGs4Sqbw4g6z9/SfK7xCv0N8srqaDMH7EpKnU
         maFY2yWdd//iReu36PyF4MihkAwteosEmBsaGBPi7cOC779brM8LCOWjEiGfkLqaCFIH
         kzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712677550; x=1713282350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=buNYP7p7u2SjN+B3Y9aoQObdwXquT6XXRaxxD1OD6hQ=;
        b=DCiiPrNAW30/11x/H3PtXP0hgGoIIYvqW7Jte9R/Bbwc16soGj+2Pz4fJZAnCG7wHz
         JblUd4cOf0Dv1wIYx7iy+RIcihBexhfIF6ncd6YwimtQwyDgGBXPiPATLOpY4/Wv0S5x
         M13uEy8unWtDt6wdLg9FPPuetZTdSaPBcAojGz8eMVcUA+vzCRxkymuU8s6urSNpF7Qp
         cNCBEU5GBNZ7Kg1QYvzB/ICF4hLTWXlWOAqMs9h6NtEoqEN63+I9XtNatecHwmUOokqF
         YIzipjkFIpCyFL7FMYo88LeITl6SNqzr668cZ1EHphN0SGXMEDPJyzZn07bTEtgNF92I
         o8rw==
X-Forwarded-Encrypted: i=1; AJvYcCWyIg1PBh6LAtwS7/rNq4qnyKbsGuDBhBISinvCFVHzZSm0+lrPXNuoemGP4iAg5C+RdQDtGqxQZMZzbv27RdinMrcGEGXjAD/40i7hi/vjFaI+
X-Gm-Message-State: AOJu0Yy60PQzdzs7Bz6zeSQlDXVePiC+1h5y6es8e0ab/6RS6byjx/7j
	RPy7xQdgDdYY+lKxeQ0zPHMQBVUqvftjpng8dTjhWAg0MXonN3advTVIXtAbIz2JtAj77eHISyE
	aTPzvZxRbVS1A4ng8P8pPkA4UHM+TPlmGvKMMIw==
X-Google-Smtp-Source: AGHT+IFQASAOVayyeXCcdEPsB1W5n+ToWptOioZCwSqIVanbm2a6TPbaXGP3/tSGH/lVzMnrpwjM9UGuBvHRJ7f07U4=
X-Received: by 2002:a25:ce05:0:b0:dcc:1dc4:15e4 with SMTP id
 x5-20020a25ce05000000b00dcc1dc415e4mr122551ybe.47.1712677550216; Tue, 09 Apr
 2024 08:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com>
 <20240409120211.321153-2-angelogioacchino.delregno@collabora.com>
 <oe75tx35rd27r2a24ofdxfaqwr53tylfp5fwz3nrwc2uz6nmrs@vwc2krbpy3fh> <8600acf8-7b51-456b-8a81-4233cfd6f121@collabora.com>
In-Reply-To: <8600acf8-7b51-456b-8a81-4233cfd6f121@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Apr 2024 18:45:39 +0300
Message-ID: <CAA8EJpo68f=9ZyNnVY=+q+drHu9xJMSGk1kNCBa=HM442Jth8g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: mediatek: Add OF graph
 support for board path
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com, 
	ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	wenst@chromium.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_084551_836364_1849EADF 
X-CRM114-Status: GOOD (  24.21  )
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

On Tue, 9 Apr 2024 at 18:41, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 09/04/24 17:20, Dmitry Baryshkov ha scritto:
> > On Tue, Apr 09, 2024 at 02:02:09PM +0200, AngeloGioacchino Del Regno wrote:
> >> The display IPs in MediaTek SoCs support being interconnected with
> >> different instances of DDP IPs (for example, merge0 or merge1) and/or
> >> with different DDP IPs (for example, rdma can be connected with either
> >> color, dpi, dsi, merge, etc), forming a full Display Data Path that
> >> ends with an actual display.
> >>
> >> The final display pipeline is effectively board specific, as it does
> >> depend on the display that is attached to it, and eventually on the
> >> sensors supported by the board (for example, Adaptive Ambient Light
> >> would need an Ambient Light Sensor, otherwise it's pointless!), other
> >> than the output type.
> >
> > With the color and gamma being in play, should the configuration be
> > board-driver or rather use-case driven with the driver being able to
> > reroute some of the blocks at runtime?
> >
>
> The driver can already set some blocks to "BYPASS MODE" at runtime, meaning
> that those will work as simple pass-through, performing *no* processing at
> all, so that's addressed from the very beginning.
>
> This doesn't mean that a specific pipeline must always support the "DISP_GAMMA"
> or the "DISP_CCOLOR" block(s) alone, or together, or in combination with another
> specific block.

I was thinking about slightly different case: do you have enough
colour blocks to drive all outputs or do you have to select them for
the particular output only?

(excuse me, I didn't check the platform details).

> For any other question, clarification, etc, I'm here :-)
>
> Cheers!
>
> >>
> >> Add support for OF graphs to most of the MediaTek DDP (display) bindings
> >> to add flexibility to build custom hardware paths, hence enabling board
> >> specific configuration of the display pipeline and allowing to finally
> >> migrate away from using hardcoded paths.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >
>


-- 
With best wishes
Dmitry

