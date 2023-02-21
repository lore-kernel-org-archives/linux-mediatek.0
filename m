Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30003C61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 12:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ueMcPyVImz9cpfurZM9ATdM8rr4FlZ3uotbL1JWr8HM=; b=2PzEuYuoT2keWvxu1d+J5GEHR0
	5WpJpBr9DSW/rI09mtaH+A6SMU+sO1vua82G90xIbCyhQc+zKLh+loLixNR8ZiHpxd7YTkFurF+eG
	JvpQzQ4gmLtPzfKMMR16lj+8Nt6vZ8iv/wnlluIj3pGue6Fu/FaM5qE/LVhnsNHTnOoE8cAAT2lzj
	532EO67fhLC8Hq+IO+Mvs6aaTDCdLXkXq26JF+kxh0J8KXReqegubU4t8DZZvfxdI4ridkxE9QXQi
	8WYfzdGUyaUhPxtAH0WDbnRyqSodLv7igw+pXM/uZQ2OLvZX++q/TSgkmMreLBXIDCEQLggB/EnsG
	8MGFJD5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pURvV-0085Su-3f; Tue, 21 Feb 2023 12:39:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pURIx-007lWB-UV
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 11:59:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676980770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ueMcPyVImz9cpfurZM9ATdM8rr4FlZ3uotbL1JWr8HM=;
	b=T+dE/oZGROIvceaK+3Wp3m2YOCUYx62kx8k/umImu7NwAlnA1T/chQEGPy1xqw9DhZaKqn
	AHsaMyQEgQATFjjyW2zg67YDGsTa700W0bjm9HgRaHqORE8nu2pF5w899cvDr/SoILkjVV
	8mGrsm6RahTl951nW+wk1TRirtCwUn4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-126-9IttQJxeMMmYAu1xgwcBrQ-1; Tue, 21 Feb 2023 06:59:29 -0500
X-MC-Unique: 9IttQJxeMMmYAu1xgwcBrQ-1
Received: by mail-wr1-f72.google.com with SMTP id m7-20020a056000008700b002c7047ea429so341853wrx.21
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Feb 2023 03:59:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ueMcPyVImz9cpfurZM9ATdM8rr4FlZ3uotbL1JWr8HM=;
        b=xj0dI7A4oCNRxr5CoxHFJ3JvK74zKBmESeS28jdwXbL2i5aenQxKDgASoB7lyZyb7s
         25TDyKJEfvxaPGXwrwVJGWd8BGpjrkgpeYtlmduIjBGkYvk30Y++89YmRWcmzPVOxiDk
         a2eXTk1ZrTUVaDl7H4cn8T2nnv5E8c/jz8CWT004CLZYf6sTrhp+nTs7UEXnGF6lKGUJ
         eLVXExj+vDOgpDeupevYA0jzU495IIA6Cs8omqOFIHCaVzOGbEPVtO5zUqyk1HBHFoHu
         EWfRdJhnMtfuiS9B4qRHlGBaK3I80z80lZ4RGXYepX5L5Qp/fXcK1gkXacjl3KsrGZYc
         LHlQ==
X-Gm-Message-State: AO0yUKV3MpjzP3qprj4BDyrHPPTpjymxnbqU1ATkIc3M7mUzkBVVjwYi
	44uRicOdSqZfNFEEK4J8XU4bFSQGJKOuszYcFTAleAk/BfIA8D03CYKp1Nx2dqazTGEKdMkkJZ1
	2/5lZQGzNQUf9Iau6sxXvvnUrexWdCh4w
X-Received: by 2002:a05:600c:319a:b0:3dc:5b88:e706 with SMTP id s26-20020a05600c319a00b003dc5b88e706mr3432751wmp.1.1676980768040;
        Tue, 21 Feb 2023 03:59:28 -0800 (PST)
X-Google-Smtp-Source: AK7set9/y3GWYFDjk83DDi2agWds5UsLqjyHuOZHo4YSWP+L1MT5uBLFjcUtMLjAIHbcdUqV8+nX8w==
X-Received: by 2002:a05:600c:319a:b0:3dc:5b88:e706 with SMTP id s26-20020a05600c319a00b003dc5b88e706mr3432713wmp.1.1676980767741;
        Tue, 21 Feb 2023 03:59:27 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-121-8.dyn.eolo.it. [146.241.121.8])
        by smtp.gmail.com with ESMTPSA id ay14-20020a05600c1e0e00b003e20cf0408esm5177202wmb.40.2023.02.21.03.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 03:59:27 -0800 (PST)
Message-ID: <3cf5c962768651adb2c1a7fa95aff7517d821bd6.camel@redhat.com>
Subject: Re: [PATCH net-next v10 00/12] net: ethernet: mtk_eth_soc: various
 enhancements
From: Paolo Abeni <pabeni@redhat.com>
To: Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Heiner
 Kallweit <hkallweit1@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, John Crispin <john@phrozen.org>, 
 Felix Fietkau <nbd@nbd.name>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, DENG Qingfang <dqfext@gmail.com>, Landen Chao
 <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Jakub
 Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, "David S.
 Miller" <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Jianhui Zhao <zhaojh329@gmail.com>, =?ISO-8859-1?Q?Bj=F8rn?= Mork
	 <bjorn@mork.no>
Date: Tue, 21 Feb 2023 12:59:25 +0100
In-Reply-To: <cover.1676933805.git.daniel@makrotopia.org>
References: <cover.1676933805.git.daniel@makrotopia.org>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_035932_137956_29C088EF 
X-CRM114-Status: GOOD (  22.61  )
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

On Tue, 2023-02-21 at 11:39 +0000, Daniel Golle wrote:
> This series brings a variety of fixes and enhancements for mtk_eth_soc,
> adds support for the MT7981 SoC and facilitates sharing the SGMII PCS
> code between mtk_eth_soc and mt7530.
>=20
> Note that this series depends on commit 697c3892d825
> ("regmap: apply reg_base and reg_downshift for single register ops") to
> not break mt7530 pcs register access.
>=20
> The whole series has been tested on MT7622+MT7531 (BPi-R64),
> MT7623+MT7530 (BPi-R2) and MT7981+GPY211 (GL.iNet GL-MT3000).
>=20
> Changes since v9:
>  * fix path in mediatek,sgmiisys dt-binding
>=20
> Changes since v8:
>  * move mediatek,sgmiisys dt-bindings to correct net/pcs folder
>  * rebase on top of net-next/main so series applies cleanly again
>=20
> Changes since v7:
>  * move mediatek,sgmiisys.yaml to more appropriate folder
>  * don't include <linux/phylink.h> twice in PCS driver, sort includes
>=20
> Changes since v6:
>  * label MAC MCR bit 12 in 08/12, MediaTek replied explaining its functio=
n
>=20
> Changes since v5:
>  * drop dev pointer also from struct mtk_sgmii, pass it as function
>    parameter instead
>  * address comments left for dt-bindings
>  * minor improvements to commit messages
>=20
> Changes since v4:
>  * remove unused dev pointer in struct pcs_mtk_lynxi
>  * squash link timer check into correct follow-up patch
>=20
> Changes since v3:
>  * remove unused #define's
>  * use BMCR_* instead of #define'ing our own constants
>  * return before changing registers in case of invalid link timer
>=20
> Changes since v2:
>  * improve dt-bindings, convert sgmisys bindings to dt-schema yaml
>  * fix typo
>=20
> Changes since v1:
>  * apply reverse xmas tree everywhere
>  * improve commit descriptions
>  * add dt binding documentation
>  * various small changes addressing all comments received for v1
>=20
>=20
> Daniel Golle (12):
>   net: ethernet: mtk_eth_soc: add support for MT7981 SoC
>   dt-bindings: net: mediatek,net: add mt7981-eth binding
>   dt-bindings: arm: mediatek: sgmiisys: Convert to DT schema
>   dt-bindings: arm: mediatek: sgmiisys: add MT7981 SoC
>   net: ethernet: mtk_eth_soc: set MDIO bus clock frequency
>   net: ethernet: mtk_eth_soc: reset PCS state
>   net: ethernet: mtk_eth_soc: only write values if needed
>   net: ethernet: mtk_eth_soc: fix RX data corruption issue
>   net: ethernet: mtk_eth_soc: ppe: add support for flow accounting
>   net: pcs: add driver for MediaTek SGMII PCS
>   net: ethernet: mtk_eth_soc: switch to external PCS driver
>   net: dsa: mt7530: use external PCS driver
>=20
>  .../arm/mediatek/mediatek,sgmiisys.txt        |  25 --
>  .../devicetree/bindings/net/mediatek,net.yaml |  52 ++-
>  .../bindings/net/pcs/mediatek,sgmiisys.yaml   |  55 ++++
>  MAINTAINERS                                   |   7 +
>  drivers/net/dsa/Kconfig                       |   1 +
>  drivers/net/dsa/mt7530.c                      | 277 ++++------------
>  drivers/net/dsa/mt7530.h                      |  47 +--
>  drivers/net/ethernet/mediatek/Kconfig         |   2 +
>  drivers/net/ethernet/mediatek/mtk_eth_path.c  |  14 +-
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c   |  67 +++-
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h   | 105 +++---
>  drivers/net/ethernet/mediatek/mtk_ppe.c       | 114 ++++++-
>  drivers/net/ethernet/mediatek/mtk_ppe.h       |  25 +-
>  .../net/ethernet/mediatek/mtk_ppe_debugfs.c   |   9 +-
>  .../net/ethernet/mediatek/mtk_ppe_offload.c   |   8 +
>  drivers/net/ethernet/mediatek/mtk_ppe_regs.h  |  14 +
>  drivers/net/ethernet/mediatek/mtk_sgmii.c     | 192 ++---------
>  drivers/net/pcs/Kconfig                       |   7 +
>  drivers/net/pcs/Makefile                      |   1 +
>  drivers/net/pcs/pcs-mtk-lynxi.c               | 302 ++++++++++++++++++
>  include/linux/pcs/pcs-mtk-lynxi.h             |  13 +
>  21 files changed, 801 insertions(+), 536 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediat=
ek,sgmiisys.txt
>  create mode 100644 Documentation/devicetree/bindings/net/pcs/mediatek,sg=
miisys.yaml
>  create mode 100644 drivers/net/pcs/pcs-mtk-lynxi.c
>  create mode 100644 include/linux/pcs/pcs-mtk-lynxi.h
>=20
>=20
> base-commit: 3fcdf2dfefb6313ea0395519d1784808c0b6559b

# Form letter - net-next is closed

The merge window for v6.3 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations.
We are currently accepting bug fixes only.

Please repost when net-next reopens after Mar 6th.

RFC patches sent for review only are obviously welcome at any time.


