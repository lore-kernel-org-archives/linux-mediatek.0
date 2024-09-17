Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B566FCAC58E
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Sep 2024 16:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOViShtMlEZDSnvKkZ21snYzhKVQ7eVObFNfJXc64zE=; b=MD2Hdk69/EMXNzQFm5oLblvPZb
	Hr38az+aBG2thHv940EZSoP6RP9aqfecMvjc4eJpaUHtckLHXZ4iUJJER5OFmMQldM7HH7S+JyiQI
	fiOaKinIWRCYu1d816VNi0/nYMays/CRV2x+0GnLkKrarRaGbBoAi3ev48V4OrgQbmVeFs9xNBYLM
	DoZiFonFOCAQl0HWTKaCPpEx3ciRjX/PwS5oCMdWU9yXdpdyE21czrTLJoBQrvx2Z3dbAO8EX5ewE
	VdbOphHUlYsbldRGpQCadaYlByyro2HStUAdwLeu4in0GngwaaV/DHNOEQlXV6y1mdm6x6HjRMQGY
	9XiAYjpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqas6-00000006TyW-1jNG;
	Tue, 17 Sep 2024 16:16:10 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqas4-00000006Txq-0UWE
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Sep 2024 16:16:09 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3e049185cfeso1475331b6e.1
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Sep 2024 09:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726589765; x=1727194565; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOViShtMlEZDSnvKkZ21snYzhKVQ7eVObFNfJXc64zE=;
        b=odui5qWBVKe5fAOQGJTRRx189ju7ttfD84Q1EY6gK0AdPSCqByLY5urBTIfjahXD4C
         xIhi/VDiYir4xTH3wNVXSQ3U8bzrnuk+8ahnPCXPULIswQyQJA0iXQAPFplVR0LuC+KY
         KzeZfKBoTPh2er51o+5+hWkTtxu0k6JmV1/gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726589765; x=1727194565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOViShtMlEZDSnvKkZ21snYzhKVQ7eVObFNfJXc64zE=;
        b=TWVw0f9jganfLvpjo60wb6dQzs5/oQcbfx+OrzKm1chh529H8DBaD0jnK8xDnz9gfF
         hxFcnd1uGAaBKMguetK/rG8X2h3wX+7htStXQ1xM52VNsExT07aazHTkT/mxXsoUIB3J
         49ehHnmteuNVIx881G8Pg6U5WsbkChfOmyyAeVZiWedtQv1wn82+ZKF2Y7YI16FqXcTu
         z44y8PD/L54yM+b4VCHY34MCZjAmegWnj8jCU7iziwZfprrfcgIrWO0XlJifQZQ6QATo
         b4stYe/Bzs42qsAgVifbVk6vuhgCGnQeKuYrb0OgB9xRAfSg/7tlc24Ltglt1z70dDEo
         kt5A==
X-Forwarded-Encrypted: i=1; AJvYcCW1BrprG8wzTENbf9zugHpIwH0fDFjZufBDGoyHS4oegozxHdiAORITuQ/YKoLhFAOPkzheZ672yhlpRp8uVA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4YTwYTvC5cahpKTKxRcRf68ry2rdQwZiAR/NpojOvnZFj3zhk
	Ju2gJFaumG980IbfAzg9PZDGkQ6Au18bnSD48hcqOsYWwwHtiMrck0NypNsarY5DlM5GhpQg1YM
	=
X-Google-Smtp-Source: AGHT+IEOZUiFUNM98/ti775EUW0YJkzxzDzVs8DXW31H7PkaJut2NuXjLhK/F41yC1ZeNr3XqKFnfw==
X-Received: by 2002:a05:6808:229e:b0:3e0:3fa1:29ee with SMTP id 5614622812f47-3e07a11e38fmr8773445b6e.26.1726589765461;
        Tue, 17 Sep 2024 09:16:05 -0700 (PDT)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com. [209.85.210.43])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e166f8a06asm1465596b6e.39.2024.09.17.09.16.04
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2024 09:16:05 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-710dad96bf7so1093883a34.0
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Sep 2024 09:16:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULIlupYLabc7RLrCpcSWeI53PcRu1jd+Fhqw93lPn1gql1kQso0kebhs4MVT9C67v6vSjOhW16ZYY4R9EmaA==@lists.infradead.org
X-Received: by 2002:a05:6830:65c1:b0:710:fbce:8b5e with SMTP id
 46e09a7af769-71116bd1b24mr10727787a34.11.1726589763706; Tue, 17 Sep 2024
 09:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240917091132.286582-1-angelogioacchino.delregno@collabora.com> <20240917091132.286582-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240917091132.286582-2-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 18 Sep 2024 00:15:26 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhp_3EfG7g7GyLHQGPk_2mrfzj3Kqgi4u_gsA7-Wq8Zgg@mail.gmail.com>
Message-ID: <CAC=S1nhp_3EfG7g7GyLHQGPk_2mrfzj3Kqgi4u_gsA7-Wq8Zgg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] PCI: mediatek-gen3: Add support for setting
 max-link-speed limit
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com, 
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kw@linux.com, 
	robh@kernel.org, bhelgaas@google.com, matthias.bgg@gmail.com, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_091608_210860_53F366D7 
X-CRM114-Status: GOOD (  29.09  )
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

On Tue, Sep 17, 2024 at 5:13=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add support for respecting the max-link-speed devicetree property,
> forcing a maximum speed (Gen) for a PCI-Express port.
>
> Since the MediaTek PCIe Gen3 controllers also expose the maximum
> supported link speed in the PCIE_BASE_CFG register, if property
> max-link-speed is specified in devicetree, validate it against the
> controller capabilities and proceed setting the limitations only
> if the wanted Gen is lower than the maximum one that is supported
> by the controller itself (otherwise it makes no sense!).
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 55 ++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/co=
ntroller/pcie-mediatek-gen3.c
> index 66ce4b5d309b..e1d1fb39d5c6 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -28,7 +28,11 @@
>
>  #include "../pci.h"
>
> +#define PCIE_BASE_CFG_REG              0x14
> +#define PCIE_BASE_CFG_SPEED_MASK       GENMASK(15, 8)
> +
>  #define PCIE_SETTING_REG               0x80
> +#define PCIE_SETTING_GEN_SUPPORT_MASK  GENMASK(14, 12)
>  #define PCIE_PCI_IDS_1                 0x9c
>  #define PCI_CLASS(class)               (class << 8)
>  #define PCIE_RC_MODE                   BIT(0)
> @@ -125,6 +129,9 @@
>
>  struct mtk_gen3_pcie;
>
> +#define PCIE_CONF_LINK2_CTL_STS                0x10b0
> +#define PCIE_CONF_LINK2_LCR2_LINK_SPEED        GENMASK(3, 0)
> +
>  /**
>   * struct mtk_gen3_pcie_pdata - differentiate between host generations
>   * @power_up: pcie power_up callback
> @@ -160,6 +167,7 @@ struct mtk_msi_set {
>   * @phy: PHY controller block
>   * @clks: PCIe clocks
>   * @num_clks: PCIe clocks count for this port
> + * @max_link_speed: Maximum link speed (PCIe Gen) for this port
>   * @irq: PCIe controller interrupt number
>   * @saved_irq_state: IRQ enable state saved at suspend time
>   * @irq_lock: lock protecting IRQ register access
> @@ -180,6 +188,7 @@ struct mtk_gen3_pcie {
>         struct phy *phy;
>         struct clk_bulk_data *clks;
>         int num_clks;
> +       u8 max_link_speed;
>
>         int irq;
>         u32 saved_irq_state;
> @@ -381,11 +390,27 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pc=
ie *pcie)
>         int err;
>         u32 val;
>
> -       /* Set as RC mode */
> +       /* Set as RC mode and set controller PCIe Gen speed restriction, =
if any*/

NIt: one space before ending the comment.

>         val =3D readl_relaxed(pcie->base + PCIE_SETTING_REG);
>         val |=3D PCIE_RC_MODE;
> +       if (pcie->max_link_speed) {
> +               val &=3D ~PCIE_SETTING_GEN_SUPPORT_MASK;
> +
> +               /* Can enable link speed support only from Gen2 onwards *=
/
> +               if (pcie->max_link_speed >=3D 2)
> +                       val |=3D FIELD_PREP(PCIE_SETTING_GEN_SUPPORT_MASK=
,
> +                                         GENMASK(pcie->max_link_speed - =
2, 0));
> +       }
>         writel_relaxed(val, pcie->base + PCIE_SETTING_REG);
>
> +       /* Set Link Control 2 (LNKCTL2) speed restriction, if any */
> +       if (pcie->max_link_speed) {
> +               val =3D readl_relaxed(pcie->base + PCIE_CONF_LINK2_CTL_ST=
S);
> +               val &=3D PCIE_CONF_LINK2_LCR2_LINK_SPEED;

I guess it needs a bitwise NOT operator over the mask.
    val &=3D ~PCIE_CONF_LINK2_LCR2_LINK_SPEED;

Apart from that, I think appending _MASK to the name makes its usage
clearer and consistent with other masks.
(although the name gets even more lengthy...)

> +               val |=3D FIELD_PREP(PCIE_CONF_LINK2_LCR2_LINK_SPEED, pcie=
->max_link_speed);
> +               writel_relaxed(val, pcie->base + PCIE_CONF_LINK2_CTL_STS)=
;
> +       }
> +
>         /* Set class code */
>         val =3D readl_relaxed(pcie->base + PCIE_PCI_IDS_1);
>         val &=3D ~GENMASK(31, 8);
> @@ -1004,9 +1029,21 @@ static void mtk_pcie_power_down(struct mtk_gen3_pc=
ie *pcie)
>         reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie-=
>phy_resets);
>  }
>
> +static int mtk_pcie_get_controller_max_link_speed(struct mtk_gen3_pcie *=
pcie)
> +{
> +       u32 val;
> +       int ret;
> +
> +       val =3D readl_relaxed(pcie->base + PCIE_BASE_CFG_REG);
> +       val =3D FIELD_GET(PCIE_BASE_CFG_SPEED_MASK, val);
> +       ret =3D fls(val);
> +
> +       return ret > 0 ? ret : -EINVAL;
> +}
> +
>  static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
>  {
> -       int err;
> +       int max_speed, err;
>
>         err =3D mtk_pcie_parse_port(pcie);
>         if (err)
> @@ -1031,6 +1068,20 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pc=
ie)
>         if (err)
>                 return err;
>
> +       err =3D of_pci_get_max_link_speed(pcie->dev->of_node);
> +       if (err > 0) {
> +               /* Get the maximum speed supported by the controller */
> +               max_speed =3D mtk_pcie_get_controller_max_link_speed(pcie=
);
> +
> +               /* Set max_link_speed only if the controller supports it =
*/
> +               if (max_speed >=3D 0 && max_speed <=3D err) {
> +                       pcie->max_link_speed =3D err;
> +                       dev_dbg(pcie->dev,
> +                               "Max controller link speed Gen%u, overrid=
e to Gen%u",
> +                               max_speed, pcie->max_link_speed);

Convert max_speed to an unsigned type to avoid potential typecheck warnings=
?

Regards,
Fei


> +               }
> +       }
> +
>         /* Try link up */
>         err =3D mtk_pcie_startup_port(pcie);
>         if (err)
> --
> 2.46.0
>
>

