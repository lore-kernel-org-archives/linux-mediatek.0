Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70665C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 02:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XGGKtACjKIo7kRPSegv2x3RcK367wleHC6S2fGMPcM=; b=HA5vnORp6a6Y5HnyFsrpIb/F9r
	vJZWzOgITXNtyfNCbChfTth9UMr6sexNiisdGvFaKZQR0nU7UyIcYpqTnlETAyB/shGe8GXf4h48W
	2vt6ZjZWuyBqU5FUdE0MHnF7XpORFfWLae+k2hGEa/HQcLqXojkBb1u4BARL0BN3TD7qv6HgtwPIg
	S3TjYahRlXMab0Se8o5iJuHDqyTvOOhnDOzNvhO+URU3qfocwiz5W1AToCDy0RssWgoojYSIA4tD3
	X9vGiF7bz/zWJtAerkEjDt30wKQ6YsXgkrrGUV8DeStfk5hfG2WJaaeWfswo0GUuxhKEn8xqERlcw
	Y0UYD2NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1erK-00HYvy-Gx; Thu, 16 Jun 2022 02:03:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1eo4-00HXHq-2Z; Thu, 16 Jun 2022 02:00:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 97CF6B8216D;
	Thu, 16 Jun 2022 02:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 389C2C3411A;
	Thu, 16 Jun 2022 02:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655344821;
	bh=9PD8GVQU2JU+YsQ6LA98xQo4CJYHlIziBU/qLQY5GWM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=RvNNnvTOwFz4RgfFhTrNbrXm6PR8txEubpwAoZVKLkpm4Jni1LMEsv+9Tci16UP5V
	 Swfnzc7zf7RR/5dbdEGYe3pXf1K5K1OMnz8N7YjwoWI4/zO2ME9okGmrXzfPIBlTlo
	 PxQg7bqiZVbdWrxKC7HrS/ehB8XCJFrdSRCURsvyudvAtkm2KZKQMjytxlBorr0ms2
	 DQGgl/RHa1DqWGm4mv0LHHPiseUElV005HA0w7+UQU2Lxp7H63A5P9kEYKyLk+jDfA
	 2VeAOXtkHBFk4R+bih2USx6eFRtB61HMpd04TThd8m1/GEU5e7GxRk1wPlP5OO+PYQ
	 ksD3FnSA9NTcQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220527090355.7354-1-rex-bc.chen@mediatek.com>
References: <20220527090355.7354-1-rex-bc.chen@mediatek.com>
Subject: Re: [RFC PATCH] reset: mediatek: Move mediatek system clock reset to reset folder
From: Stephen Boyd <sboyd@kernel.org>
Cc: runyang.chen@mediatek.com, miles.chen@mediatek.com, wenst@chromium.org, angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de
Date: Wed, 15 Jun 2022 19:00:17 -0700
User-Agent: alot/0.10
Message-Id: <20220616020021.389C2C3411A@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_190024_310917_F1971644 
X-CRM114-Status: GOOD (  13.08  )
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

Quoting Bo-Chen Chen (2022-05-27 02:03:55)
> diff --git a/drivers/clk/mediatek/clk-mt2701-eth.c b/drivers/clk/mediatek=
/clk-mt2701-eth.c
> index edf1e2ed2b59..84ea1591257e 100644
> --- a/drivers/clk/mediatek/clk-mt2701-eth.c
> +++ b/drivers/clk/mediatek/clk-mt2701-eth.c
> @@ -36,14 +36,6 @@ static const struct mtk_gate eth_clks[] =3D {
>         GATE_ETH(CLK_ETHSYS_CRYPTO, "crypto_clk", "ethif_sel", 29),
>  };
> =20
> -static u16 rst_ofs[] =3D { 0x34, };
> -
> -static const struct mtk_clk_rst_desc clk_rst_desc =3D {
> -       .version =3D MTK_RST_SIMPLE,
> -       .rst_bank_ofs =3D rst_ofs,
> -       .rst_bank_nr =3D ARRAY_SIZE(rst_ofs),
> -};
> -
>  static const struct of_device_id of_match_clk_mt2701_eth[] =3D {
>         { .compatible =3D "mediatek,mt2701-ethsys", },
>         {}
> @@ -66,7 +58,7 @@ static int clk_mt2701_eth_probe(struct platform_device =
*pdev)
>                         "could not register clock provider: %s: %d\n",
>                         pdev->name, r);
> =20
> -       mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
> +       mtk_rst_init(&pdev->dev, node, "mt2701-eth-rst");


Instead of making direct calls, please use the auxiliary bus and create
full fledged devices that are probed through the driver core. That way
we can see the relationship in sysfs between devices and they're "real"
device drivers for the reset component of the device.

