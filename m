Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190ADC76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 16:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EB93KWFVVHsYJcPW2q+9qcCyR1A0d86Bqvk6dO/EHSI=; b=C3XArh8keFJc0+wV5buCPvisbu
	7AfxkF9QYEnLcwamI1LUN+qfTDV8B/feIR6sDtBKRGhnIqQxekz+yHt2dFa6G0dZMksV9NTWxAkqF
	WtS69uFsz5xubHHaUvpc37jsN3Xb5HaVh8PFKggcvqWxfTGka3F/8TS/dWwCZvkRnyF9HnwjzXbN/
	9JQRwWP+istTxtMfn9GoUaZgRI+soYDX4UI/pnS8lh6t6cCSdGapc6XVSvYp0l88ibDqqjPN/N6T/
	WbHZ9yZ9d73cOFixATV4yiBOy3OLTiiSAwJt+iywoi8FXthNlWFaTvimuaht2ORz8QKlor4BVNQqK
	gPou86uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjNAp-00FyiB-0r;
	Mon, 03 Apr 2023 16:36:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjNAl-00Fygw-2H;
	Mon, 03 Apr 2023 16:36:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3E6F0621C3;
	Mon,  3 Apr 2023 16:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C00CC433A7;
	Mon,  3 Apr 2023 16:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680539806;
	bh=Kt9moSViwJx5yBWxvRA4G9k3CxuCk+dcQWzL3AwN3FE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ahWI5wtUMMDF/JK6RX094BK6NZ4T3EfR3FIlVMMZneVIfsnYjpL09ROA1rQ6N5jfQ
	 sRX9euqVfFzODLoLQso+AiLu0FoMjhWvYGA5C7Cdd/+NzJiHkqmP5bCMRxQPmEli69
	 URsh71mUZUFo3QSt1BlR6mhlS4XBNMQXcRgbncFMGYq8HoteBav1rRoR3IrUzF67dp
	 Vs/ZGSfMozsTso9jBogHMNAOICUDN1o7lp1uSHkGCUmL7mxK1k7BW5g/kCsM1bVBFr
	 8dtlBK8VMT8B6Om9g1PGZ+jeQxgi5TI2dbmkKnwTP3tQ7/cI3ydNFRXEp4NS7lXPPF
	 Is0zZPWMKCb/w==
Received: by mail-lj1-f176.google.com with SMTP id o20so28053578ljp.3;
        Mon, 03 Apr 2023 09:36:46 -0700 (PDT)
X-Gm-Message-State: AAQBX9fRNacyGe6iWCzKoSjpU5YHBy3guJ+qfgu20AZuy8FS9jjeS2RX
	om3a56tPXVapx6x33DWe7UZuKD1PVk0OojcoEg==
X-Google-Smtp-Source: AKy350YI8MSRmypV7liUfnAR04I0V60fJ/SJAQ6mMQYLy3vXtuAOgKEuMnQZv1aQSY0uDcu20Z1RIZDPBPLHhmfbBBA=
X-Received: by 2002:a2e:9dda:0:b0:2a6:199a:bd38 with SMTP id
 x26-20020a2e9dda000000b002a6199abd38mr30959ljj.10.1680539804050; Mon, 03 Apr
 2023 09:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230403071929.360911-1-jstephan@baylibre.com> <20230403071929.360911-3-jstephan@baylibre.com>
In-Reply-To: <20230403071929.360911-3-jstephan@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 4 Apr 2023 00:36:32 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-cd0gQ6AEK_bLZf6m87M0G7Ag_AYKKPBFyBXGgh-2y1g@mail.gmail.com>
Message-ID: <CAAOTY_-cd0gQ6AEK_bLZf6m87M0G7Ag_AYKKPBFyBXGgh-2y1g@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: mtk-mipi-csi: add driver for CSI phy
To: Julien Stephan <jstephan@baylibre.com>
Cc: Phi-bang Nguyen <pnguyen@baylibre.com>, Louis Kuo <louis.kuo@mediatek.com>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Andy Hsieh <andy.hsieh@mediatek.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"moderated list:ARM/Mediatek USB3 PHY DRIVER" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek USB3 PHY DRIVER" <linux-mediatek@lists.infradead.org>, 
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_093647_817443_A1600D58 
X-CRM114-Status: GOOD (  13.53  )
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

Hi, Julien:

Julien Stephan <jstephan@baylibre.com> =E6=96=BC 2023=E5=B9=B44=E6=9C=883=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:20=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> From: Phi-bang Nguyen <pnguyen@baylibre.com>
>
> This is a new driver that supports the MIPI CSI CD-PHY for mediatek
> mt8365 soc
>
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> [Julien Stephan: use regmap]
> [Julien Stephan: use GENMASK]
> Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../bindings/phy/mediatek,csi-phy.yaml        |   9 +-
>  MAINTAINERS                                   |   1 +
>  drivers/phy/mediatek/Kconfig                  |   8 +
>  drivers/phy/mediatek/Makefile                 |   2 +
>  .../phy/mediatek/phy-mtk-mipi-csi-rx-reg.h    | 435 ++++++++++++++++++
>  drivers/phy/mediatek/phy-mtk-mipi-csi.c       | 392 ++++++++++++++++
>  6 files changed, 845 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-rx-reg.h
>  create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi.c
>

[snip]

> +
> +#define REGMAP_BIT(map, reg, field, val) \
> +       regmap_update_bits((map), reg, reg##_##field##_MASK, \
> +                          (val) << reg##_##field##_SHIFT)
> +

Use FIELD_PREP() macro  so you can drop the definition of SHIFT symbol.

Regards,
Chun-Kuang.

