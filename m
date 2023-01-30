Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A130C636D3
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 19:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cniiBDl1y+zqkOnOrL32lbve9hMgXoJ7efZaThZ1Wtk=; b=ZJdB3v4cAnJFv0qQs2qNgzS7FN
	Rgr3Uc/3MpwnZLwpBsGLgGiZf6hRFy3SMt8ju2P2EmmnTQkIh59URzb3m8vmlS9ZLAUyG7nuFkqYl
	ESaD21bIUoGJ+0ysGxBlZ8D34dtDshhW8JJYsJwts8TgOTAooewrJdNkxeQ9rfqs4tv/fhymo2QsS
	MqCxHcJTmgR3impNSCDfkSn7PYwdjcK0prKsXlh6FFASv3krHqDTXs/fSPv2x4ePCazUlGjVhZLvJ
	1eUBTap30joGJ8nqqzoC6CAeKTkpUIi7p1JpkQBIazvmOHRafh2GgfBTV+vzaYgSchshzzQA7pBIn
	mUN8EKDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMZx2-005E1O-Dp; Mon, 30 Jan 2023 19:36:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMZws-005DzH-4h; Mon, 30 Jan 2023 19:36:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C993461242;
	Mon, 30 Jan 2023 19:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CAF4C433D2;
	Mon, 30 Jan 2023 19:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675107371;
	bh=sxcQJN3nO52mu5E7zYArOshdkoV/Yy47NYqmC/yXgMc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iGEDjJbTIJCG6wk51YNxxblRvJKJ5aHae5BywXrzG+wPODAcqzkjYRoAKOlsZq/CH
	 TpYHquNsbvp5Web5wTPWvy5qXRQUAGfMXtdPa88sIcwyCvOjykciy+2nJzLsJNoZJf
	 3RPKjEF+VYa8qJHt5dXN5XAh3lP0khElNyFfwZO3kJJ/YHuLUFy4oN5N63tyOxDQLR
	 MVF6PKK3z1y3abGE0WzIKlFhXJPMNULyqQ4579gfAwpXvIMZ5rSBEHPqX3r0IJZUzT
	 /PiW6Kf21xoWdIeRgo5tzc5/EampojjPZigKJwtsRGib8W1HuPQ7iuuQMNZq9hyPWv
	 b47D52LTmG1cw==
Message-ID: <fe49e8b642c4c33fee37e97d957c37a3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230118031509.29834-4-moudy.ho@mediatek.com>
References: <20230118031509.29834-1-moudy.ho@mediatek.com> <20230118031509.29834-4-moudy.ho@mediatek.com>
Subject: Re: [PATCH v6 3/4] clk: mediatek: remove MT8195 vppsys/0/1 simple_probe
From: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Moudy Ho <moudy.ho@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Date: Mon, 30 Jan 2023 11:36:09 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_113614_256313_BC0F9879 
X-CRM114-Status: GOOD (  15.75  )
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

Quoting Moudy Ho (2023-01-17 19:15:08)
> diff --git a/drivers/clk/mediatek/clk-mt8195-vpp0.c b/drivers/clk/mediate=
k/clk-mt8195-vpp0.c
> index bf2939c3a023..6d5800f69f6c 100644
> --- a/drivers/clk/mediatek/clk-mt8195-vpp0.c
> +++ b/drivers/clk/mediatek/clk-mt8195-vpp0.c
> @@ -86,26 +86,54 @@ static const struct mtk_gate vpp0_clks[] =3D {
>         GATE_VPP0_2(CLK_VPP0_WARP1_MDP_DL_ASYNC, "vpp0_warp1_mdp_dl_async=
", "top_wpe_vpp", 3),
>  };
> =20
> -static const struct mtk_clk_desc vpp0_desc =3D {
> -       .clks =3D vpp0_clks,
> -       .num_clks =3D ARRAY_SIZE(vpp0_clks),
> -};
> +static int clk_mt8195_vpp0_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *node =3D dev->parent->of_node;
> +       struct clk_onecell_data *clk_data;
> +       int r;
> =20
> -static const struct of_device_id of_match_clk_mt8195_vpp0[] =3D {
> -       {
> -               .compatible =3D "mediatek,mt8195-vppsys0",
> -               .data =3D &vpp0_desc,
> -       }, {
> -               /* sentinel */
> -       }
> -};
> +       clk_data =3D mtk_alloc_clk_data(CLK_VPP0_NR_CLK);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       r =3D mtk_clk_register_gates(node, vpp0_clks, ARRAY_SIZE(vpp0_clk=
s), clk_data);

This API is wrecked by a patch from AngeloGioacchino. Can you resend, or
tell me which device should be used here?

