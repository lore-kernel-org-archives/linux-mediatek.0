Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD304C77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 21:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2CJlkAZkKoispCeo2Ty+Rna6L7MTwBlSMpI6/DRymE=; b=0FCb1UjZSZj7/xA/EQvSgoRnBs
	eSEs18ASGwarwGpVaG+rwOIxrcs/ppDj6iKfsSwOAqKEsZJTq0Csq/urdIyHqL4Y3SJbJLpgZm40l
	BajKsAj72iVmLJcLri/HdZbpVdvcPHU9YFRrI4FUSiJacY4XJZmRV9iix1oz0FqdvRjiHtg8VqQrm
	WrklX3tYx6tPOYyH7eXPG5PtHhgLPjl3rayEo0YuZohUyPSjoGRIHWz0lYarBjlzLAt25xw5U1VYA
	rv9JQ6RPJs+i6rimB2+C0kRb91+U+I/F4Ae6fBKlUBEkDYxC4tg69lVp75I2FmxxGBzFKZFbEU7Nr
	kC46Iskw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwrEj-0072of-16;
	Wed, 10 May 2023 21:20:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwrEg-0072ne-0s;
	Wed, 10 May 2023 21:20:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 06BA16140D;
	Wed, 10 May 2023 21:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F40AC433EF;
	Wed, 10 May 2023 21:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683753632;
	bh=6PCycjhSBuykel0Qz6uiSXaWOAyhbmYe/UM3kSHOyqw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=PJgUUjcyrB10GRVmq0OFFRyugnYOVPkCQ1dowRynzI69QTyJYsb4nUojnTfmKR3JJ
	 zqe4E8bf1i0Qy7iu4y4FEmnp/2NSWOZSCCo7a5/WbGdSUIVTlPh7fYNhFau313+jFs
	 0fRwpikC53dpqkhXUCrUaOWJ46sqPhEdj1C+axUNovRKmxJYq/5omxqFEOuD7hR1oh
	 YVqMpbzLhLp13Pr9uXQ6cUuz6bYbb1OKFJoF6ldESfI8zByzZIuPFNzc8X1wU4tU/M
	 RVFWurDzSoTWRJwuk4a2q5UThFYDZXhxzRvoLBBBDw6Y9NN1G4cGpuQjZNK7sMzdTi
	 NwJ4c5eZwFTXA==
Message-ID: <ca1e1df877652808ef76851d7f2ed781.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230505131308.27190-3-runyang.chen@mediatek.com>
References: <20230505131308.27190-1-runyang.chen@mediatek.com> <20230505131308.27190-3-runyang.chen@mediatek.com>
Subject: Re: [PATCH v2 2/2] clk: mediatek: reset: add infra_ao reset support for MT8188
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Runyang Chen <runyang.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Runyang Chen <runyang.chen@mediatek.com>
Date: Wed, 10 May 2023 14:20:28 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_142034_348758_4EAC490A 
X-CRM114-Status: GOOD (  11.09  )
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

Quoting Runyang Chen (2023-05-05 06:13:08)
> @@ -176,9 +177,32 @@ static const struct mtk_gate infra_ao_clks[] =3D {
>                        "infra_ao_aes_msdcfde_0p", "top_aes_msdcfde", 18),
>  };
> =20
> +static u16 infra_ao_rst_ofs[] =3D {

const?

> +       INFRA_RST0_SET_OFFSET,
> +       INFRA_RST1_SET_OFFSET,
> +       INFRA_RST2_SET_OFFSET,
> +       INFRA_RST3_SET_OFFSET,
> +       INFRA_RST4_SET_OFFSET,
> +};
> +
> +static u16 infra_ao_idx_map[] =3D {

const?

> +       [MT8188_INFRA_RST1_THERMAL_MCU_RST] =3D 1 * RST_NR_PER_BANK + 2,
> +       [MT8188_INFRA_RST1_THERMAL_CTRL_RST] =3D 1 * RST_NR_PER_BANK + 4,
> +       [MT8188_INFRA_RST3_PTP_CTRL_RST] =3D 3 * RST_NR_PER_BANK + 5,
> +};
> +
> +static struct mtk_clk_rst_desc infra_ao_rst_desc =3D {
> +       .version =3D MTK_RST_SET_CLR,
> +       .rst_bank_ofs =3D infra_ao_rst_ofs,
> +       .rst_bank_nr =3D ARRAY_SIZE(infra_ao_rst_ofs),
> +       .rst_idx_map =3D infra_ao_idx_map,
> +       .rst_idx_map_nr =3D ARRAY_SIZE(infra_ao_idx_map),
> +};
> +
>  static const struct mtk_clk_desc infra_ao_desc =3D {
>         .clks =3D infra_ao_clks,
>         .num_clks =3D ARRAY_SIZE(infra_ao_clks),
> +       .rst_desc =3D &infra_ao_rst_desc,
>  };

