Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D391D5B16C
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Dec 2025 15:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jD2gSrbwz8qwRcQAUIoCa/YtmLX1qZ3zgXWUCARLWUM=; b=vcZW+sxDAR9/hikNykJKe0Vabm
	B02yJflveZklF3Tt+Foq9QCV7i/HDUxiAohfOGxEvB9TQRVM7xKn96zgKswpKEjNEyoKnem9OB50u
	0+9g93c5dYcuQj9SiFNW+R+k28bRUdg8Ok4asq3j8pI2GjG54Q3STCvhUQDlHQi7U0SKetQIfrz3V
	2DGQ3hIk2jVtRafK9zT5IAHhOGQFC4Pg9kKQRqj4GG8zlwENe0s17egNaF5VJXTDhvCC3i9kS3Gd6
	4Waq/5zoDXUu38XsM8xntR6goA2b5wie4CMYTqdjU0PsFfnhwMurFrhrusXzKy6UdvkN/VBYAMu5F
	q1CA+tJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAxG-00000003wgz-05h3;
	Mon, 15 Dec 2025 15:57:46 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAxC-00000003wfb-2Rlf
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Dec 2025 15:57:44 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-64470c64c1bso4992522d50.1
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Dec 2025 07:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765814261; x=1766419061; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jD2gSrbwz8qwRcQAUIoCa/YtmLX1qZ3zgXWUCARLWUM=;
        b=rMols9/mrUSbTUddwKN6k9wAc8Dt/pNmqUaHDu0ZTG1sZtAxOWKyAwFF2TZf6P2nyw
         jTspD+lUxPHM11WMnCjtHk54BWdOczpBisKNP4pbGr2+OoS9lv3IZCgwfzi+UYsa8Qss
         nbFaCwXZce5sZQe1EA66uCobTembjpAyLffG03uPnT+6nw98uViPN0UQLwvDQn/SIMDS
         xFMbTQ360SBf2BRZcBACyjoJP0dWptoJiMPdvfxB7x0yUKf5tskaIrczDmbDwBTSN78w
         7o8eIitn/JWPniC/yUr1e4kJOsXjLPGN+RvQor4kouN8TA3yrsujhnm9qR3FS/oLW2al
         kSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765814261; x=1766419061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jD2gSrbwz8qwRcQAUIoCa/YtmLX1qZ3zgXWUCARLWUM=;
        b=M8/rHZBtA93mIdHbWQhFOxvpNTwG+z+S/fXBwk4NOfKVQkaCduBFFk2l90WknT7DJD
         dtIlGXjAd1hM8mDk6wUQt7K7iXfdmGI2CqNv4cBzr+fsfMcVJkJ0uTvRrnQYtI78NF/P
         kvkVZ2LWX2BmyKiNYLxp4IIx2NAXimuRXIlDUCIklEfwn8D2pm9ydil8C0jlI6WsmpY/
         eFbmx9nXv+jFdRe32SxpCdXGLc5+kojElNOJVITmaM5p2dnfPsWj4eyNGkGBQ6VSzbt1
         gx8J4xJ+j411Inb2ls2J4hG+ShDZuXi1AUVWrrMIuvlcAU3WWpyT7mbJU6QUmdTBLMvo
         EySw==
X-Forwarded-Encrypted: i=1; AJvYcCUiCgfIRlPWKmFPMvnuscCpAsSksAO3Axud2Dhb7sh1vCkN+tuhgXf1CVHIH2pOiMOjuVmeV/AVd/ahQfPwHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNLty0B42I5+njspiS2KZe2Q1eXx41de/w4pzkOM2yJYUizA2y
	aY84UiFA9JGDa/yDU/aFvlfpBbj3vd9rwji04rhDy+q5ec3wXc1xRBYxy+F4mw74AdJ7eJr8A/u
	alTizllX7WuZAS2vnuOjzeSHqY2qGqkAaeqflPhsa8w==
X-Gm-Gg: AY/fxX7zeiWm5/jVRELbWF+4BjZpVEVsbsRXM+w+kZW08MCGj3mPatbNQ8UGPXdI8rF
	KumPQhRU9OeY3jHOqvtJvSkypT5KUEbzfcQy+68GDEF2KpIastftA7Ujfx56smBaEypyzRUSfYY
	DPaexIAVrnzWQ1KsRJ3e4G3fwfWx5mOcoy5aWTWOy9mPFYo6K6beWiXJG7A5vGpX1yCs/WWqMu2
	5L4WQKR4W98VKwz2bjLRx4sc9RVO80i5G7ckZSkLh7L5hDZf2GFOyfoOA1aBBfRVFzvJY0d
X-Google-Smtp-Source: AGHT+IHnzK21TfrVLiBrKEfsBY0yy3nNModkqTwvqLIVjQPjpPnPxA37IWTaMsN5LsanoFGI3JzdpIiVMlmjMLIYn+0=
X-Received: by 2002:a53:acc2:0:20b0:63f:af94:79d2 with SMTP id
 956f58d0204a3-6447a58f4a3mr9014275d50.34.1765814261319; Mon, 15 Dec 2025
 07:57:41 -0800 (PST)
MIME-Version: 1.0
References: <20251215034944.2973003-1-irving-ch.lin@mediatek.com>
In-Reply-To: <20251215034944.2973003-1-irving-ch.lin@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 15 Dec 2025 16:57:03 +0100
X-Gm-Features: AQt7F2pOE88ysP1TXeUkBFRRwGo0OeDBvPna4LwWc08y3UTdwUmGokrHz2XyogY
Message-ID: <CAPDyKFrsRTmvc4JmFAT_mCEEaG9yGkZn_JJqqyqCnB-AmpZgsQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/21] Add support for MT8189 clock/power controller
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Richard Cochran <richardcochran@gmail.com>, Qiqi Wang <qiqi.wang@mediatek.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	netdev@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_075742_650711_B9C8BFE1 
X-CRM114-Status: GOOD (  19.04  )
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

On Mon, 15 Dec 2025 at 04:50, irving.ch.lin <irving-ch.lin@mediatek.com> wrote:
>
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
>
> Changes since v4:
> - Fix dt_binding_check warning.
> - Check prepare_enable before set_parent to ensure our reference clock is ready.
> - Enable fhctl in apmixed driver.
> - Refine clock drivers:
>   - Change subsys name, regs base/size (clock related part, instead of whole subsys).
>   - Simply code with GATE_MTK macro.
>   - Add MODULE_DEVICE_TABLE, MODULE_DESCRIPTION
>   - Register remove callback mtk_clk_simple_remove.
>   - Remove most of CLK_OPS_PARENT_ENABLE and CLK_IGNORE_UNUSED which may block bringup,
>       but some subsys will power off before we disable unused clocks, so still need here.

I assume I can pick the pmdomain related changes (patch2, patch20 and
patch21) from this series, as they are independent from the clock
changes, right?

Kind regards
Uffe


>
> changes since v3:
> - Add power-controller dt-schema to mediatek,power-controller.yaml.
> - Separates clock commit to small parts (by sub-system).
> - Change to mtk-pm-domains for new MTK pm framework.
>
> changes since v2:
> - Fix dt-schema checking fails
> - Merge dt-binding files and dt-schema files into one patch.
> - Add vendor information to dt-binding file name.
> - Remove NR define in dt-binding header.
> - Add struct member description.
>
>   This series add support for the clock and power controllers
> of MediaTek's new SoC, MT8189. With these changes,
> other modules can easily manage clock and power resources
> using standard Linux APIs, such as the Common Clock Framework (CCF)
> and pm_runtime on MT8189 platform.
>
> Irving-CH Lin (21):
>   dt-bindings: clock: mediatek: Add MT8189 clock definitions
>   dt-bindings: power: mediatek: Add MT8189 power domain definitions
>   clk: mediatek: clk-mux: Make sure bypass clk enabled while setting MFG
>     rate
>   clk: mediatek: Add MT8189 apmixedsys clock support
>   clk: mediatek: Add MT8189 topckgen clock support
>   clk: mediatek: Add MT8189 vlpckgen clock support
>   clk: mediatek: Add MT8189 vlpcfg clock support
>   clk: mediatek: Add MT8189 bus clock support
>   clk: mediatek: Add MT8189 cam clock support
>   clk: mediatek: Add MT8189 dbgao clock support
>   clk: mediatek: Add MT8189 dvfsrc clock support
>   clk: mediatek: Add MT8189 i2c clock support
>   clk: mediatek: Add MT8189 img clock support
>   clk: mediatek: Add MT8189 mdp clock support
>   clk: mediatek: Add MT8189 mfg clock support
>   clk: mediatek: Add MT8189 dispsys clock support
>   clk: mediatek: Add MT8189 scp clock support
>   clk: mediatek: Add MT8189 ufs clock support
>   clk: mediatek: Add MT8189 vcodec clock support
>   pmdomain: mediatek: Add bus protect control flow for MT8189
>   pmdomain: mediatek: Add power domain driver for MT8189 SoC
>
>  .../bindings/clock/mediatek,mt8189-clock.yaml |   90 ++
>  .../clock/mediatek,mt8189-sys-clock.yaml      |   58 +
>  .../power/mediatek,power-controller.yaml      |    1 +
>  drivers/clk/mediatek/Kconfig                  |  146 +++
>  drivers/clk/mediatek/Makefile                 |   14 +
>  drivers/clk/mediatek/clk-mt8189-apmixedsys.c  |  192 ++++
>  drivers/clk/mediatek/clk-mt8189-bus.c         |  196 ++++
>  drivers/clk/mediatek/clk-mt8189-cam.c         |  108 ++
>  drivers/clk/mediatek/clk-mt8189-dbgao.c       |   94 ++
>  drivers/clk/mediatek/clk-mt8189-dispsys.c     |  172 +++
>  drivers/clk/mediatek/clk-mt8189-dvfsrc.c      |   54 +
>  drivers/clk/mediatek/clk-mt8189-iic.c         |  118 ++
>  drivers/clk/mediatek/clk-mt8189-img.c         |  107 ++
>  drivers/clk/mediatek/clk-mt8189-mdpsys.c      |   91 ++
>  drivers/clk/mediatek/clk-mt8189-mfg.c         |   53 +
>  drivers/clk/mediatek/clk-mt8189-scp.c         |   73 ++
>  drivers/clk/mediatek/clk-mt8189-topckgen.c    | 1020 +++++++++++++++++
>  drivers/clk/mediatek/clk-mt8189-ufs.c         |   89 ++
>  drivers/clk/mediatek/clk-mt8189-vcodec.c      |   93 ++
>  drivers/clk/mediatek/clk-mt8189-vlpcfg.c      |  111 ++
>  drivers/clk/mediatek/clk-mt8189-vlpckgen.c    |  280 +++++
>  drivers/clk/mediatek/clk-mux.c                |    9 +-
>  drivers/pmdomain/mediatek/mt8189-pm-domains.h |  485 ++++++++
>  drivers/pmdomain/mediatek/mtk-pm-domains.c    |   36 +-
>  drivers/pmdomain/mediatek/mtk-pm-domains.h    |    5 +
>  .../dt-bindings/clock/mediatek,mt8189-clk.h   |  580 ++++++++++
>  .../dt-bindings/power/mediatek,mt8189-power.h |   38 +
>  27 files changed, 4306 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8189-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8189-sys-clock.yaml
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-apmixedsys.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-bus.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-cam.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-dbgao.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-dispsys.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-dvfsrc.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-iic.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-img.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-mdpsys.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-mfg.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-scp.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-topckgen.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-ufs.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-vcodec.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-vlpcfg.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-vlpckgen.c
>  create mode 100644 drivers/pmdomain/mediatek/mt8189-pm-domains.h
>  create mode 100644 include/dt-bindings/clock/mediatek,mt8189-clk.h
>  create mode 100644 include/dt-bindings/power/mediatek,mt8189-power.h
>
> --
> 2.45.2
>

