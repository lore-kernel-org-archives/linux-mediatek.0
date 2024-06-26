Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02027C30653
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 10:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHbQKOiYe+Ibua4xAi15PJl+V4d0EJrIgF7ce4mlbFQ=; b=2VQR43vwQAPamK9HhDZD2IpX8h
	klU/w7PzXWI5LG2Xy6WUs4aCj7BOSVEP1Ilkrzq9Tf02h0m2NVXv7CMy2j2sKHS6xekpVtGhLx3yV
	+M1z21JbokSo0gFO9EsJRSlxZLu/y4Nf+jBOKPNEiIfTqxKWw78/XeLD+Ry1JWA+AmC2Vs3VDDtWJ
	Cxr5ggBQY5Y27YvfrTq4p6OndLGKl9BPAgS2pFcEKKrPgyil8FChinDx4ojnjJ92MQIn3CU48udCt
	KqAoyFTeapFsr+oBg+AmTnFSdQ+27oMOQ+1SxHrsX94SxYgSk7PrgM3HQzSJmirKS+vhRlIp5Y0k/
	wngpMrzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMQ5C-00000006Ngn-2FvU;
	Wed, 26 Jun 2024 10:40:58 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMQ55-00000006Ndy-2owz
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jun 2024 10:40:55 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e02c4983bfaso6508648276.2
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jun 2024 03:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719398451; x=1720003251; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHbQKOiYe+Ibua4xAi15PJl+V4d0EJrIgF7ce4mlbFQ=;
        b=wATRUmnSALzCnyzXDRw78IYMtccWBCWvs3qe80V/PQFTkoQEch2xmgJIl4UPAFSIR1
         PGzTvl9QTC6FPoFWcFRjpTH0JuIyKNeb0LLPN4WyjJCkmL+TOBLQV1b9Pcfuq+GlisEv
         qZQTn1GzuN3pjsuBYavwjWm3gsBb0aThuAb6nlPpwuCmEa1VBgksFjtAnyNc0Byzw/RA
         85xkU9SxFUygo9yktHu/FMOBYrgHcqjL084xGDc4INc3Rx3XVQByH6mCbSZcFLheV2Wt
         jnbdZYg5WkwSZA28F70fGgFpIYp89KxwPfolo6KvW4cV0nGNyS8aXdUHp82N4wgpjinY
         MTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719398451; x=1720003251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHbQKOiYe+Ibua4xAi15PJl+V4d0EJrIgF7ce4mlbFQ=;
        b=Vh7OJt20lazOfVTU0DJADpwmvYFqxoRhJdXMTkNbcKRoD6heq+oXkE/ICB473Dl7E7
         Q2zQsUgD/3ailJM3W/dP29ghwEIh1QdIjQXQbf91X7i3QEQV7qBRyRp4w2MEDosqmClP
         /YtbKVwz+hHJo8c104dKPELskZNwpd5exUlc3h6Qf/E6sRnbNr+AHs/jTkuZBwRz5oa/
         hL89UaWL972mhkwzlPIRQYrrVPph99d5+gIxGbnwlvbE7SqlH75KUqe4mWLMhrv6OCuf
         0H+5wwm5TlVVkzb3M7r2b61K1QuRRz33bBpT8eHNk5mb0lhZA+gA5+y7wIOV79+hvXGP
         Ws8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3pZJwCVF9nz7qw28sFFak4pM+O2IyzvPea+4sOPYfyHEYfPkVUCqS8REoHl8MuyJpuMBzIblnwZ8tGGockc6ZQCnnFI3dvRu14Bp9QoXt+/AZ
X-Gm-Message-State: AOJu0YybvlQYBAJI1WZH8GCSfoX22Jr9T8hCGbrIoaPhOli986mIYhHb
	RdoTqYggN0RdkJlsMA/LDxy2WjxVTCbW564b5wcsydp9r7ZKbBUocHpuamvDUQewhMwd272bpFD
	eZjA1v3l4BEbu1uxWaPopRnDDULvKcuFU+GFRlQ==
X-Google-Smtp-Source: AGHT+IGAQdQECALwFQiRgkrKA/rZBEJOAnkCpPbedoTQq7/jt7W9vOb6wQcj2qKoWUKoPCAEcM15HUQq3HQFJjgWzyA=
X-Received: by 2002:a25:c553:0:b0:dfa:6e39:95b0 with SMTP id
 3f1490d57ef6-e030107f616mr10069878276.49.1719398450656; Wed, 26 Jun 2024
 03:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-20-26c5f2dc1181@nxp.com> <171939733731.25849.13373950874840419376.b4-ty@linaro.org>
In-Reply-To: <171939733731.25849.13373950874840419376.b4-ty@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:40:36 +0200
Message-ID: <CACRpkdastCME_0BWjcaNc0Fw8qsLAGgoQUMi7g8sEP+xT=T_tQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 20/20] pinctrl: samsung: Use scope based
 of_node_put() cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, 
	Damien Le Moal <dlemoal@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>, 
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_034051_842056_D9985DE4 
X-CRM114-Status: UNSURE (   9.01  )
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

On Wed, Jun 26, 2024 at 12:22=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On Sat, 04 May 2024 21:20:18 +0800, Peng Fan (OSS) wrote:
> > Use scope based of_node_put() cleanup to simplify code.
> >
> >
>
> Applied, thanks!
>
> [20/20] pinctrl: samsung: Use scope based of_node_put() cleanups
>         https://git.kernel.org/pinctrl/samsung/c/707807f4c1128e39442519e8=
49e4ce0b7c29b110

OK I dropped it from my queue!

Yours,
Linus Walleij

