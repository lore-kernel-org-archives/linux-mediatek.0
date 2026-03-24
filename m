Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6526FF532F6
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 08:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npDd530fJxsPD1tz+PH0aZPhJF217S6JmKkun0w5HYU=; b=bRFO+HXJX5uazWO1MJHWBpZYuo
	3zdR9ksp6aWLp4Wjk6K7ZWZg9XK1orIO08Zu+7uzYj5dC32TKbjEkfbiliT9x1NREHsOfwWRg+/6V
	s57WVcP1tq2fxvFaiVhRnp2zROF84nFl3drvK+B4mptVp+uehcbHtKcTXRstykhV49uIL+GuPaa4Y
	ty9tDbsBJ40F77Znc+SRsc8YN6lOi8d66aggbusSloKUfJSMfi9BMgs2ptNhH/euSN/2OeH4KnYSJ
	JCJ5C1vDLciBdFPymPp36QACDt0JxiAfUCDRlGoGRUsaeT7KgCLP/9fzzshXpS/Muw7Lofk+IMz6q
	dulrlr2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xYS-000000011tz-0GnV;
	Tue, 24 Mar 2026 08:56:04 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xYP-000000011tW-1JEd
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 08:56:02 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so3952290e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Mar 2026 01:56:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774342559; cv=none;
        d=google.com; s=arc-20240605;
        b=QrXt1zIVCCYKSWbi4K39wBF/qCXJZm1BKlAw1AO+rMmbz4wovHglYMYJTI5tdPAIFT
         RI049SGcymsJ728iEKQJ20SmxdmEZihJBNQ/oPck+rMyJ9K6IJzr0sgOP3e/GXZ1w3Dw
         veQH4bzV0sGBF3zJHhW0fUhgJcerpTI2qGD8dOPO1vy04Gw+jdABX2ZhH5KZMIu7M8PC
         JtxaViTrwLeTOX4k2ByW61HU8mqmeCF0wJ84p+qxMmInz5ybQ87t2YarXsVE3JWdatXf
         OcasZrMNAi4TZ5sUsupkxpIlkdvD2mClzTqyHI4+/7QVbehI5aM7lu3e9SQu5nEEReCD
         Na9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=npDd530fJxsPD1tz+PH0aZPhJF217S6JmKkun0w5HYU=;
        fh=ixB2vRixjk8TKtXmKOwVP4FvI1StwWUMbVq0J6KSnaI=;
        b=bb/weyOLcQ/2rd292si8byvq1Rl/AthFxRbNOSBmA3GwEpuACs4Tr/nKqJNAsZtWGR
         JALrjaFbIkP0lZaQ2JKxhcAtBd/O65Kb6FoKQItgV/2uhsiOxSRN6kuofkSyu9+bDUPi
         Qx1xKQ0ktWQcYdz/MARyr2iDhm4yTh24DAuTuXdyMbJc7NduR6nGK7P0FDHS0H5jpjtO
         1XQzFzwktjyEORbMnyGFJfD0uk3JfvTTxd0rqLMvipJNwoFoP7LaxkyYo3vX1ERi/Whw
         1+axDbO0UI0sdNLLy9+BI8q32hwiI99t/z/SDsPTakqk3KveBMkjcTHKW/DHxux2ozfi
         kJEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774342559; x=1774947359; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npDd530fJxsPD1tz+PH0aZPhJF217S6JmKkun0w5HYU=;
        b=TXzjeKyGDwY2yTx5mbJ4U+QgTyHFBAliJWIx17Utv51aZIQIJnDrwez7bcbQli2ju7
         Spp+dXdq490IYJPh50O0sUyg+INyOScKvacHxd3lQ0ahI9350/7KEXvnL4oapZayYQVQ
         tydGJkRwf3746ew1kJ0PRnikw88stLV7wOsZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774342559; x=1774947359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=npDd530fJxsPD1tz+PH0aZPhJF217S6JmKkun0w5HYU=;
        b=BTrSULubCroBNeZ+9+wIET+6LgTswIUTdvmKzx2iAl2eV8U2Z3uG1ogzpVtWZbFhtx
         1ceq/btTEsxJFeJIznCpxa+jSK6PgbY6JHSXUaKkeuAo4j9C5yKKBFIBHdUic+4VJZVl
         45vG6C1L/sLtncbvKyrWqc91LemhBv49Di2DoROpmHWGT4yRHqcGI1AXNZAQYe0wJhES
         9uer9IV44gjG3UHpvojnlz3CjP88NX5QqKcz8WAdG7iS9fJaeAPsRKji4qKzzHypJ2ND
         Snqto/4PWvPTKe+EYyIIRSRu+j08T+AgwNioQpFElIM/HvAOGl1MXBA7ZMzJ5H3PBww3
         MV5g==
X-Forwarded-Encrypted: i=1; AJvYcCWDwg3MbFAW+iclekW8mKybsQbNDys5JkqbbRY+vX4lwmKa4FzHAcvAd0Z9xVCRktNYFAy6XJT6erc8NoG+Gg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyetsASbN1ANvUel0V9e7DFt4g1mYWZKvwEtKy69Uy+M2oS4Z3j
	9db5tQ5MgzPkNM1E7RfJS1taV3ox7+5fj5w2ZWvtPWA6NGFE+F0qVIFhIPug7iS1WRd9toXr7/i
	THd/oP0gRDqeixP2M4BCTiLMl22+2p6vsvWckVKPG
X-Gm-Gg: ATEYQzy/nC8r22Onbp06DaoXI3MsyfJh4cHD0PEBGDnxVvyEG3/BmnAsm9SDsdgOzqP
	/TVUrN+VlsBHb6jhpz1fsIeWsVFZyKKaoXKqdwgjg/rm0D+NYdTr6EQkf0bLxYJCKFEG58/zjAZ
	3akDiRVHx6t8RDON5A5+DkFA+XrsM7s6AAZ1iNSB09Cc+dmjU18DRhF/BMg4eq62WzseuXJ6HSm
	+eKUF3hIDNczODsRv7uAnDgdl9Gc8rwbsIMR7eZGpCMpFrydOk1cj6Nypkn0oli5eVmD3n/Dt6L
	RAVph/yVeLZ6Dvff27dMMVG+PKMeuVljlNEfUg==
X-Received: by 2002:a05:6512:615:10b0:5a2:86a5:99bb with SMTP id
 2adb3069b0e04-5a286a59a60mr3605567e87.21.1774342558506; Tue, 24 Mar 2026
 01:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260324052002.4072430-1-wenst@chromium.org> <20260324052002.4072430-6-wenst@chromium.org>
In-Reply-To: <20260324052002.4072430-6-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 24 Mar 2026 16:55:47 +0800
X-Gm-Features: AQROBzDtsFjuWuhP_OPV3b4K-uNoyhsBQxaUmf0C6sBX9QxTV8gpdW8yF1FtVHE
Message-ID: <CAGXv+5Gg90cDAV5ntBet9QTnyxrpzoMSNTvJJs0da2C32AFE1w@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] PCI: mediatek-gen3: Split out device power helpers
To: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_015601_463079_F099EA1D 
X-CRM114-Status: GOOD (  27.63  )
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

On Tue, Mar 24, 2026 at 1:20=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> In preparation for adding full power on/off control with the pwrctrl
> API, split out the existing code that only partially deals with device
> power sequencing into separate helper functions. The existing code only
> handles PERST#.
>
> This is purely moving code around, and brings no functional changes.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 87 ++++++++++++---------
>  1 file changed, 52 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/co=
ntroller/pcie-mediatek-gen3.c
> index 22a16e4ebc76..526db8815401 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -403,6 +403,54 @@ static void mtk_pcie_enable_msi(struct mtk_gen3_pcie=
 *pcie)
>         writel_relaxed(val, pcie->base + PCIE_INT_ENABLE_REG);
>  }
>
> +static int mtk_pcie_devices_power_up(struct mtk_gen3_pcie *pcie)
> +{
> +       int err;

Sashiko pointed out that this addition would cause an unused variable
warning. This line should be added in the last patch instead.

Do you want me to respin? Or is it fine since the end result is the same?

Sorry about this.


ChenYu


> +       u32 val;
> +
> +       /*
> +        * Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB si=
gnal
> +        * causing occasional PCIe link down. In order to overcome the is=
sue,
> +        * PCIE_RSTB signals are not asserted/released at this stage and =
the
> +        * PCIe block is reset using en7523_reset_assert() and
> +        * en7581_pci_enable().
> +        */
> +       if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
> +               /* Assert all reset signals */
> +               val =3D readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> +               val |=3D PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
> +                      PCIE_PE_RSTB;
> +               writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> +
> +               /*
> +                * Described in PCIe CEM specification revision 6.0.
> +                *
> +                * The deassertion of PERST# should be delayed 100ms (TPV=
PERL)
> +                * for the power and clock to become stable.
> +                */
> +               msleep(PCIE_T_PVPERL_MS);
> +
> +               /* De-assert reset signals */
> +               val &=3D ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB =
|
> +                        PCIE_PE_RSTB);
> +               writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> +       }
> +
> +       return 0;
> +}
> +
> +static void mtk_pcie_devices_power_down(struct mtk_gen3_pcie *pcie)
> +{
> +       u32 val;
> +
> +       if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
> +               /* Assert the PERST# pin */
> +               val =3D readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> +               val |=3D PCIE_PE_RSTB;
> +               writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> +       }
> +}
> +
>  static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>  {
>         struct resource_entry *entry;
> @@ -489,33 +537,9 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pci=
e *pcie)
>                         return err;
>         }
>
> -       /*
> -        * Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB si=
gnal
> -        * causing occasional PCIe link down. In order to overcome the is=
sue,
> -        * PCIE_RSTB signals are not asserted/released at this stage and =
the
> -        * PCIe block is reset using en7523_reset_assert() and
> -        * en7581_pci_enable().
> -        */
> -       if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
> -               /* Assert all reset signals */
> -               val =3D readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> -               val |=3D PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
> -                      PCIE_PE_RSTB;
> -               writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> -
> -               /*
> -                * Described in PCIe CEM specification revision 6.0.
> -                *
> -                * The deassertion of PERST# should be delayed 100ms (TPV=
PERL)
> -                * for the power and clock to become stable.
> -                */
> -               msleep(PCIE_T_PVPERL_MS);
> -
> -               /* De-assert reset signals */
> -               val &=3D ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB =
|
> -                        PCIE_PE_RSTB);
> -               writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> -       }
> +       err =3D mtk_pcie_devices_power_up(pcie);
> +       if (err)
> +               return err;
>
>         /* Check if the link is up or not */
>         err =3D readl_poll_timeout(pcie->base + PCIE_LINK_STATUS_REG, val=
,
> @@ -1270,7 +1294,6 @@ static int mtk_pcie_suspend_noirq(struct device *de=
v)
>  {
>         struct mtk_gen3_pcie *pcie =3D dev_get_drvdata(dev);
>         int err;
> -       u32 val;
>
>         /* Trigger link to L2 state */
>         err =3D mtk_pcie_turn_off_link(pcie);
> @@ -1279,13 +1302,7 @@ static int mtk_pcie_suspend_noirq(struct device *d=
ev)
>                 return err;
>         }
>
> -       if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
> -               /* Assert the PERST# pin */
> -               val =3D readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> -               val |=3D PCIE_PE_RSTB;
> -               writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> -       }
> -
> +       mtk_pcie_devices_power_down(pcie);
>         dev_dbg(pcie->dev, "entered L2 states successfully");
>
>         mtk_pcie_irq_save(pcie);
> --
> 2.53.0.983.g0bb29b3bc5-goog
>

