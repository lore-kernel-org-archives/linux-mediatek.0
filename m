Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8020ECD13CF
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Sep 2023 22:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:Mime-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9MD/frOYatXvnTs5iG7mBs2PH8/IlXgMFq6W02dlmo=; b=1lHYANi7A4htR4bXDoVS+EXiQd
	ToJD75QBE0xsf5/5gJTlFkDS9ZiXqv/jjhpTP3iEZHk2pUaqvmUibki/g2ZLZ5w3T0S5lKhtq/jcC
	dOa5ItMCkdDrpUrqPHvkX8T8n/PQpZ3ivejSxO9BYuLeBQvoqPNXthXlGYEAKabs0Y0XU7rDXY1IT
	vrt4PUSLzsAq4mM8gEU2KcMkeDQ1+PXDko+KOTPIn3itY77esDiAo3TqAoTH9M/MSUAbmBWaLFQQZ
	pEEJdiM/OdUpFgvxTY750fm0Rz9W4+hgoGkoY9QcQsPk6hoxYQKtmQUkaS0e1yeNDS84nZe/VLRrW
	ILgTdyNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi0DL-00E47S-39;
	Sun, 17 Sep 2023 22:26:04 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi0DH-00E45i-0v
	for linux-mediatek@lists.infradead.org;
	Sun, 17 Sep 2023 22:26:02 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id ACD4F3F314
	for <linux-mediatek@lists.infradead.org>; Sun, 17 Sep 2023 22:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1694989556;
	bh=I9MD/frOYatXvnTs5iG7mBs2PH8/IlXgMFq6W02dlmo=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=NmQRKRhi0LohoPlWsC0Tzix0+bVD7BtHqObbtgxvQ/+GycprG3wYcIoMLZqE8AiqF
	 k5oIzFDC0M+zXmVKJWGViVC+ZbXccz+sQRfqlMvdMRGxfWXdaP0Fnntn7DSfyDO1o6
	 kqziQ/bOoIBUcT8160q880Hhkv07Dzz4A/pEicwM7CzSajWc2c5jZ9XL3znRlpk+LS
	 U4Fwf/Ua60DpxiL0kyS1OmwQyA2r0/LoSPa1QKIP2TMa2dNm371Pia9Bohv/JrKTKu
	 o38QfEE+s1bYz57xAULK0IN0heugS3zHgR2H8Nsi/LwLzSbkHkIIz9SizYX5aIebp2
	 de38Fzd7zSxTw==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-412eee4b64cso47692851cf.1
        for <linux-mediatek@lists.infradead.org>; Sun, 17 Sep 2023 15:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694989555; x=1695594355;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I9MD/frOYatXvnTs5iG7mBs2PH8/IlXgMFq6W02dlmo=;
        b=pqjyeodqor6b0a4Olb9dq/jr22qN7TAs/7EHmxWJtjqoTkgcYpxU/PeJKSkjdy/wxg
         eXgJ13+99waQWi0+F0IYTKS0OfLTn6bK8vXMRqjCfTeDHesuyNALzCI+brjOR+UffXTV
         I40yUJAn25ZMJUJnJadaG0gFKtQ5kzIA1idpqgg/W720UACevlK7fk+fZFcdShvBPaqY
         XDi1SEZWm042cCJu8/ey31ApOoJPBr5TPE3431C53hSWp7Wvd05Oyha4TvS9ltNZ6cPc
         be0RLNC5mdj8uitX5dXMqnFP5sjtVvwASr1OhyoLSLN8zd0ACYML+CL/W3HrNsn62Ni1
         QYcA==
X-Gm-Message-State: AOJu0YxRUAajidUGR6z+C/YZcurw07HXKhCNIjOHumPGoVT8Zk2qZv2P
	j9CVJWUg1CsddORTtikC3On2ibR4RWYWJN9/vYk8HId7EWiGv1Spz+JcqdUoxAybP7vzqM1FCKQ
	+BzJ8N1jQ4LmwsvCNqHNdMKJLThaI/wVazPp8ehoBAK3ivkxoGzd+Z0xunHRqcRz0mw==
X-Received: by 2002:ac8:7f91:0:b0:416:db70:2653 with SMTP id z17-20020ac87f91000000b00416db702653mr8876096qtj.38.1694989555289;
        Sun, 17 Sep 2023 15:25:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFezqxmfqtGhS2FxPCsYpubnTNK6tACbhkhYR/40Y08aycFwHOLWJhOoCYZSF3ud4i1i0EL+r/CXjLeOYzof7Y=
X-Received: by 2002:ac8:7f91:0:b0:416:db70:2653 with SMTP id
 z17-20020ac87f91000000b00416db702653mr8876059qtj.38.1694989554976; Sun, 17
 Sep 2023 15:25:54 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 Sep 2023 15:25:54 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>
References: <20230916075829.1560-1-jszhang@kernel.org>
Mime-Version: 1.0
Date: Sun, 17 Sep 2023 15:25:54 -0700
Message-ID: <CAJM55Z-_yq3DrOC2KxQf8j5y_iDD7ejEReP4XajUz74iVp02LQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 00/22] convert to devm_stmmac_probe_config_dt
To: Jisheng Zhang <jszhang@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Samin Guo <samin.guo@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Russell King <linux@armlinux.org.uk>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_152559_477474_D5EFD916 
X-CRM114-Status: GOOD (  11.70  )
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

Jisheng Zhang wrote:
> Russell pointed out there's a new devm_stmmac_probe_config_dt()
> helper now when reviewing my starfive gmac error handling patch[1].
> After greping the code, this nice helper was introduced by Bartosz in
> [2], I think it's time to convert all dwmac users to this helper and
> finally complete the TODO in [2] "but once all users of the old
> stmmac_pltfr_remove() are converted to the devres helper, it will be
> renamed back to stmmac_pltfr_remove() and the no_dt function removed."

Thanks for doing this.

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

>
> Link: https://lore.kernel.org/netdev/ZOtWmedBsa6wQQ6+@shell.armlinux.org.uk/ [1]
> Link: https://lore.kernel.org/all/20230623100417.93592-1-brgl@bgdev.pl/  [2]
>
> Since v1:
>  - rebase on new net-next
>  - add make stmmac_{probe|remove}_config_dt static as suggested by Russell.
>
> Jisheng Zhang (23):
>   net: stmmac: dwmac-anarion: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-dwc-qos-eth: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-generic: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-generic: use devm_stmmac_pltfr_probe()
>   net: stmmac: dwmac-imx: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-ingenic: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-intel-plat: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-ipq806x: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-lpc18xx: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-mediatek: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-meson: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-meson8b: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-rk: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-socfpga: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-starfive: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-sti: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-stm32: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-sun8i: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-sunxi: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-tegra: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-visconti: use devm_stmmac_probe_config_dt()
>   net: stmmac: rename stmmac_pltfr_remove_no_dt to stmmac_pltfr_remove
>   net: stmmac: make stmmac_{probe|remove}_config_dt static
>
>  .../ethernet/stmicro/stmmac/dwmac-anarion.c   | 10 +--
>  .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 15 +---
>  .../ethernet/stmicro/stmmac/dwmac-generic.c   | 15 +---
>  .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 13 ++--
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 33 +++------
>  .../stmicro/stmmac/dwmac-intel-plat.c         | 25 +++----
>  .../ethernet/stmicro/stmmac/dwmac-ipq806x.c   | 27 +++----
>  .../ethernet/stmicro/stmmac/dwmac-lpc18xx.c   | 19 ++---
>  .../ethernet/stmicro/stmmac/dwmac-mediatek.c  |  6 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-meson.c | 25 ++-----
>  .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 53 +++++---------
>  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 14 ++--
>  .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 16 ++---
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 10 +--
>  .../net/ethernet/stmicro/stmmac/dwmac-sti.c   | 14 ++--
>  .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 17 ++---
>  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  6 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c | 23 +++---
>  .../net/ethernet/stmicro/stmmac/dwmac-tegra.c | 10 ++-
>  .../ethernet/stmicro/stmmac/dwmac-visconti.c  | 18 ++---
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 70 ++++++-------------
>  .../ethernet/stmicro/stmmac/stmmac_platform.h |  5 --
>  22 files changed, 127 insertions(+), 317 deletions(-)
>
> --
> 2.40.1

