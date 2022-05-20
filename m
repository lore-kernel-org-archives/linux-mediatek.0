Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC595C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 15:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qisVAoQAmpbgxJunY+foH2sPJRUC7z7rfSRTjlCdzbQ=; b=crfdnWdgvL4eng
	C9NDyvQRFqU0rvgxjqkwfu50gOjeV/czFJUWLE5qB5c5GNCRu4E4d+TlLuklpR+MwnGSSxxzaekuZ
	V5ZE1PWKifWC7gW0O8FzttIzNYQBr+xKP6lcW5oRQgU0JxZyKtEO3lS36WLabf96mHXL+HhWA8heU
	H2XB0BqHCum1QMMD2iyZ6bF2Zo0ub+xGtoq+tYgghVopUjIVO27xjjxGxHtiII7KI0OzTB2KW1u4K
	WLILj53di8k+lbJRtecilOhiDRTmPoet9iGNJcgmD6BHvmoLXQHaMkfVyePU0k5jYdvtGgYH5xVhb
	hi+Lqh62Y/oopMOfabEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns4Iq-00D6H7-VU; Fri, 20 May 2022 15:12:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns4Ic-00D6CZ-VI; Fri, 20 May 2022 15:12:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id D6FFA1F46045
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653059537;
 bh=dM+dtww2MjUV3EO6VLGR/tvde0qsMUnXBPbKpDoQ3xs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qb5Bkom9rqi1bHDGk7du6o4c58uBM1hqdlfe6uY6M8LUyEPi0b0iRFKmGxRuFys2K
 3Y08v7welt57mQDEjS39tiRdSCgWKjg6fyJ5/zCAqmQOX5PPdadT3M1kKC0hJsV0QM
 w+b/obwU3zIlURh1ygNWq8N5vFknX5CbNXEHXmRBXK3ukBEEjCIIw0gb5pblqxRamw
 3pFxM4XT7j8NJcslhc7NVxqLw2NAlwQ2y7KS5L2+WUSssjEb7lSgNb7X55gY+H4bkE
 GIVPivKRFAudr52IE85Wf/gyHaAdljblNbtuUmtWbrIGe/r8KmIlo5zDWv1nlJZRmR
 10X6f+xMkcmUQ==
Date: Fri, 20 May 2022 11:12:12 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 chun-jie.chen@mediatek.com, wenst@chromium.org,
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v7 05/19] clk: mediatek: reset: Merge and revise reset
 register function
Message-ID: <20220520151212.rrrtekst7uhnojds@notapiano>
References: <20220519125527.18544-1-rex-bc.chen@mediatek.com>
 <20220519125527.18544-6-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220519125527.18544-6-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_081219_218987_2CDF801E 
X-CRM114-Status: GOOD (  21.68  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rex,

On Thu, May 19, 2022 at 08:55:13PM +0800, Rex-BC Chen wrote:
> There are two versions for clock reset register control for MediaTek
> SoCs. The old hardware is one bit per reset control, and does not
> have separate registers for bit set, clear and read-back operations.
> This matches the scheme supported by the simple reset driver.
> =

> However, because we need to use different data structure from
> reset_simple_data, we can not use the operation of simple reset
> driver.
> For this reason, we keep the original functions and name this version
> as "MTK_RST_SIMPLE".
> =

> In this patch:
> - Add a version enumeration to separate different reset hardware.
> - Merge the reset register function of simple and set_clr into one
>   function "mtk_register_reset_controller".
> - Rename input variable "num_regs" to "rst_bank_nr" to avoid
>   confusion. This variable is used to define the quantity of reset bank.
> - Document mtk_reset_version and mtk_register_reset_controller.
> =

> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

<snip>

> index 764a8affe206..2a39eec9cff7 100644
> --- a/drivers/clk/mediatek/reset.h
> +++ b/drivers/clk/mediatek/reset.h
> @@ -9,16 +9,32 @@
>  #include <linux/reset-controller.h>
>  #include <linux/types.h>
>  =

> +/**
> + * enum mtk_reset_version - Version of MediaTek clock reset controller.
> + * @MTK_RST_SIMPLE: Use the same registers for bit set and clear.
> + * @MTK_RST_SET_CLR: Use separate registers for bit set and clear.
> + * @MTK_RST_MAX: Total quantity of version for MediaTek clock reset cont=
roller.
> + */
> +enum mtk_reset_version {
> +	MTK_RST_SIMPLE =3D 0,
> +	MTK_RST_SET_CLR,
> +	MTK_RST_MAX,
> +};
> +
>  struct mtk_reset {
>  	struct regmap *regmap;
>  	int regofs;
>  	struct reset_controller_dev rcdev;
>  };
>  =

> +/**
> + * mtk_register_reset_controller - Register MediaTek clock reset control=
ler
> + * @np: Pointer to device node.
> + * @rst_bank_nr: Quantity of reset bank.
> + * @reg_ofs: Base offset of the reset register.
> + * @version: Version of MediaTek clock reset controller.
> + */
>  void mtk_register_reset_controller(struct device_node *np,
> -				   unsigned int num_regs, int regofs);
> -
> -void mtk_register_reset_controller_set_clr(struct device_node *np,
> -					   unsigned int num_regs, int regofs);
> +				   u32 rst_bank_nr, u16 reg_ofs, u8 version);

Why not use 'enum mtk_reset_version' instead of a generic u8? Same thing wh=
en
you move it to a struct in patch 6.

Thanks,
N=EDcolas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
