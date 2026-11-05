Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FA0606A329
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 09:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JbLodki8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gp+XvZ8u5ZE7X4dajdQ+NYbiZBnTVLgwCjJL4l80lxA=; b=JbLodki8sACSVfpTK/8f97j96D
	kTSlzQxv197Bo+BHWTDacKunfIS/wrEpkOC7SkSdA5iFZrybxnetONlIQv8Kc3gVvXWjl11qDunAN
	HTSCacfVV70jUzsP8/4nza6m93eFTE0Sgs5Mx7hHoyJ6WgavTO5IkdAxczDSOAUGG4SVcU27DcJW+
	doaVyofTrZ4i3lMonoana8vfs3MqV+9AfDtPCJH9W6xWBTxinYQM/Y5nP3gOcj6bP8FCuCgYpwOS8
	+EJYPYlx53VkaqHId84VwPTqTbQEL9euOjYPYE1TnfhR8ZW7tU4Jw5Th4DVu/INTehfWc/UzGQVj4
	SPLXQCtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtZE-00000008Gn5-0CPX;
	Thu, 05 Nov 2026 09:15:32 +0000
Received: from mail-qk1-f170.google.com ([209.85.222.170])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtZB-00000008GmW-3m1b
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Nov 2026 09:15:30 +0000
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93e7ad9f78dso196012585a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2026 01:15:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870128; x=1794474928;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gp+XvZ8u5ZE7X4dajdQ+NYbiZBnTVLgwCjJL4l80lxA=;
        b=DZS6jMTS+LaPDpI9gf+pGcHQ/EMhtQ4Ny8O3XiTlR7ZdiJ4oMVBSdQSgQ5jlZBFAsk
         9VuedLwf+Q8gXxPCynplBd+DXStl7S0N+5EchxGm4UOx4a9GW/7Kt67Bb3bN5ryxQi7l
         lUvz5J1BXoG0ml5HjPfLos2odgn8sMoF0/2KeCaf+ZqtkS7JpeaiP25N2SagR8iMl+7G
         dXvPhlzeUn0d4wK2csdIiqO98Dm2jLaGLeA2kPg+LRZEtU1VJi7BfZj0gBEHt2s2sogd
         AimBqvblIlZT8Qm+IGvDEHufpiJjZCUQrqOOer+nIUc9f8ZfDtf5Rit11F045/Jjuv4X
         bJmQ==
X-Forwarded-Encrypted: i=1; AKwUvByUIbaeMM/jqTQOJ2ZBeD4YrYANq/Gj9maqpL1OxPX81aM4HaIW5ZMRFPBMaGH5kDWah8/EHN4aKIyJoS7k+g==@lists.infradead.org
X-Gm-Message-State: APuU4Z+Q20dl/Rg97l97o14/CL1K2ak+SvGs8C9c08Okp7rw67bD1bwC
	0toGw3ze+7cKRJNZVbybsLL9x0GFy4bNeGtAZGICCKiX/41+e7mmdesgxU4lESntddQ=
X-Gm-Gg: AYBFou1Nlx9LNPoOpTBxf4NUzJ5NW5eRRsrcVYIaxALXT8Qn4kDOWfbYhew3M52yQ47
	s+5GcWFV2r7YfUlfNPB3mytB1eCTNjJcooev5kDlj2tNMSqW8sL4T9ZSmPzE5c6brQz8G7D9ZRn
	Ne14xgdUcZXciJ4362kie1yGVFyQL3rL8QX17P9O05eUywUp2GdTi1swaklPQYgDwKBxyKdsIIT
	guzAwtIljWycbgaw6Ah4LmQhKw5xyzrzszMj3djXNjdT1vJiS5gNsOaaY7wo1INHNn6RgiXFrCW
	nTXAs18VwWagWIoj0ElCQGbPrTU9FO+4YFB+ndTdDPA406V2zWym+MDW+LukngSNvKfgbZMAyT4
	xYh2PVN2gErfE2c3tXxFNZUt0kWiWz77cenlOjvoqQQPgQu3FlEpSoaoX4UE8yumKycweZi2QG5
	OyNy+RbcLvn3MyvdOr4aq+aJP3qIMM2pBaeR4i0lZvac/kekJYqb2oJpg8pXy+mIEssiZ+04a3M
	F5EytfLQqroIozY9QhfK4vjb/9/ScJsQY9NFbw5RCtwr2ebOnAZ0202E0v3Kt7VGfLP4lSHCmAt
	vnLAeN3Yc74KPawZh7peXSsCN1zToHwob6jVf0GPTikvsVIF2oGc+rCxYETTwwV5qk/TyyuJnFC
	hfB0eFXGb0BpGi8g=
X-Received: by 2002:a05:620a:2901:b0:93f:2f48:c9e5 with SMTP id af79cd13be357-9442173e2c4mr3206926985a.34.1793870128427;
        Thu, 05 Nov 2026 01:15:28 -0800 (PST)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d479cc7esm421540085a.11.2026.11.05.01.15.27
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:15:27 -0800 (PST)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-945ae2daa3eso198869785a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2026 01:15:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwVHLQ+tRZ/LK1rVllH4tm1jkanBCr77vDhOy5HKmnT16YmgNElMNHQsLd6kcXJMncmtmfFrUx30IE3uW2Dog==@lists.infradead.org
X-Received: by 2002:a05:6102:c4f:b0:7cc:3eb0:6ece with SMTP id
 ada2fe7eead31-7d072d53fa3mr9146730137.33.1793869733877; Thu, 05 Nov 2026
 01:08:53 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:08:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHyQhJwFHd5dguORb0=KTeQPT8AwMr0Uo6UAJRcn-fsg@mail.gmail.com>
X-Gm-Features: AclHuK-Joxo1A4dnmlO7hQLoxC6QCg3Be9nelvt7mgpbpsg01EIWZ9Dok6aJ4CQ
Message-ID: <CAMuHMdWHyQhJwFHd5dguORb0=KTeQPT8AwMr0Uo6UAJRcn-fsg@mail.gmail.com>
Subject: Re: [PATCH 1/1] tty: serial: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Russell King <linux@armlinux.org.uk>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Cunhao Lu <1579567540@qq.com>, 
	Raul E Rangel <rrangel@chromium.org>, Yenchia Chen <yenchia.chen@mediatek.com>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, Carlo Caione <ccaione@baylibre.com>, 
	Moteen Shah <m-shah@ti.com>, Kendall Willis <k-willis@ti.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kartik Rajput <kkartik@nvidia.com>, 
	Fan Wu <fanwu01@zju.edu.cn>, Nicolai Buchwitz <nb@tipi-net.de>, 
	Karl Mehltretter <kmehltretter@gmail.com>, =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Sherry Sun <sherry.sun@nxp.com>, John Ogness <john.ogness@linutronix.de>, 
	Pan Chuang <panchuang@vivo.com>, Petr Mladek <pmladek@suse.com>, Robin Gong <yibin.gong@nxp.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Zhaoyang Yu <2426767509@qq.com>, 
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>, Haoxiang Li <haoxiang_li2024@163.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Myeonghun Pak <mhun512@gmail.com>, 
	Wenhua Lin <Wenhua.Lin@unisoc.com>, Cixi Geng <cixi.geng@linux.dev>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <imx@lists.linux.dev>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_011529_968525_1AD52E33 
X-CRM114-Status: GOOD (  18.87  )
X-Spam-Score: -1.6 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2 Nov 2026 at 18:56, <Frank.Li@oss.nxp.com> wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across serial drivers.
>
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

>  drivers/tty/serial/sh-sci.c         | 9 +++------

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # sh-sci

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

