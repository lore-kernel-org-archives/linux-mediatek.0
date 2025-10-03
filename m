Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B443ACCA471
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Oct 2025 21:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UUYFCqYZ++M1SNLRvfnBEMc8eDA11OJCrWneq89QMU=; b=bOyfoGf6xeKSsjPF/VMzeK9q6L
	0tf2v12wpuRxJlRzd9wo+SxkZvioGmVi6AkQRuwVbyunh4feuIlEL+nryqHYlV5Qcmy+DasAiGcGK
	U5yByKzH94nmheDcMU4k/vc2X58bwsKmkg5pRa7fCBUGoi/FZpn+/KbA+MEw5bIvMJdu9A4BnG+l2
	uu3zHXfjXwY3hi/T+QCUfe5H80RADPPyJTzbFtr4bbG0fL3sSoR9FRBikYBDJfJ1Qgc3dGbdquE1z
	PbA7MqftqRSAsKJ6QUBev+5Y7utCQr1sH4dg9OLUfVqR6d4T3d1YQaAyGuMitdRziAjPVyRbI+j09
	CPxWNpEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4nWu-0000000DAgm-0wDC;
	Fri, 03 Oct 2025 21:41:32 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4nWq-0000000DAfc-3qhT
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Oct 2025 21:41:30 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-6354af028c6so2669332d50.3
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Oct 2025 14:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759527688; x=1760132488; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UUYFCqYZ++M1SNLRvfnBEMc8eDA11OJCrWneq89QMU=;
        b=kfSg8naELjRCkHIvCTQ0ayWP0OEre1FYa9Wy9R5yEPDBDvket7BdTuh9lVS7tojmLM
         EvcCNB1nd0wQ1Tu4Mz/Rl9Cd5TscCHi4Hz5YjdpWDalKEpmYKXd995NYvzTkVd+M6TY5
         rP1QZ5LTrzDrDLqJ5NUB0jEpw3UIxWLsVUQR+YtiMEfiq+5ttO3Lm7aYiUIbof6S1qMw
         /4CURTBw5jZgpzAHyqQuV0IVR1te5o0AbkskftAudo03CsXrPeGpl/l5GKxYkeF/forp
         0e8w84B4KrqUy+rImykCW/zzeOxtK9KPXmhjefm/1gu0rai0dNSrHv1+QvtipFCubjdK
         /TMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759527688; x=1760132488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UUYFCqYZ++M1SNLRvfnBEMc8eDA11OJCrWneq89QMU=;
        b=AT6Pry+xBZSKEKmbT1ThQmMsFr8cDIQRulOvMg4KNP6kXQ81/oTCUaviRN2C45lo4W
         TjTIoHZkEVECVC2HyJ72wCRym74VMYw0xVtvehtGXf1pUHgr/0QKzjemLySB/gg1Vm34
         c6/RTyxQHjb5NczwEf4zG777zhoS4Ipc9xi75+jWPCCnXbpeBWYcaHFmeiOiGG2PXFuW
         V3BQwmcj4BZ860MVZl9RHSFs3UuVqEzFyrdOthiM1p0iKSy0fH+JOWV6ccWfwQNABWne
         vISot5Pc0lFMAs3r5BJzr+2IG9kMRlmeAv1vvRgxoCxW8rvDxlmUclezgV/7aLrj1G0x
         Wbng==
X-Forwarded-Encrypted: i=1; AJvYcCVgLg7oVwutMWqPj+bqSNX8va8JtpWBiYc+L8sSn5aMiEla7sv2AU9Qcsx4PVi7wR0u74x3vbDDK1LzzGZ/pg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJIVKOjifOKLtK6jtHAv6qUjXGN7PoKCmEsbP5rMxc3ZQ3DY6m
	KyO3cFBDPgBrYDcJ9/kFdsh4CHF3yDxngYmk54RIcAx0YdbWgCP19BOkSqoHJeUTXmbP9QBSVH3
	Mif4WdiJZSnXVR/uUwAEKvZKGgknml3Q=
X-Gm-Gg: ASbGncu4yAqxFJAdos9A93Us7RLm75NyRMvAy5QpfBRbjxI+E1G7GjVfaYWCj5+K5R+
	MHb9EAr/nXQHP4aByln0Rdm3lHNjk4sK1ERpCz6cqEskE1jpAymmLwNQERMduKXxSZOx+IIR/Cc
	oiYW+vIsrUWgvgMVqx11vo4NELIRdIdR8ueoM2zRRgkcnHcqMmcPCqGFosSupQyTQxC7Cxpt0oP
	ZUhJH2blwnjaaocv7PLjdT959al8YBuK7vxp8aDLSVJwe/QIUchnegeMqxvUSH4MzjL1yFHDfx3
	+58ePCcgRdZZjElA5FwXwR3fHA2djRYSm7L9roEep6I=
X-Google-Smtp-Source: AGHT+IFsEBPVzXvwHuM4QLRckQ1pwH09RM2qcZ+I8xh8RlXcjUu54Stm4Ca7trrl5nG3IQUJmBvrF+RgEH/+4vhA4Po=
X-Received: by 2002:a53:ca11:0:b0:62c:70de:7cba with SMTP id
 956f58d0204a3-63b9a0a7345mr3380422d50.22.1759527687648; Fri, 03 Oct 2025
 14:41:27 -0700 (PDT)
MIME-Version: 1.0
References: <20251003-mt8196-gpufreq-v6-0-76498ad61d9e@collabora.com> <20251003-mt8196-gpufreq-v6-7-76498ad61d9e@collabora.com>
In-Reply-To: <20251003-mt8196-gpufreq-v6-7-76498ad61d9e@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 3 Oct 2025 14:41:16 -0700
X-Gm-Features: AS18NWBtZLeN2JMlM8B0j97iXzqvvw6RLai7sdHK1_VKcIavLpBYUP0KgralcMQ
Message-ID: <CAPaKu7QWBShwr+YhFi+nUFo0kJ06k4PK3zggcCefWGjqUmTx5w@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] pmdomain: mediatek: Add support for MFlexGraphics
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_144128_996683_C55C59C9 
X-CRM114-Status: GOOD (  27.74  )
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

On Fri, Oct 3, 2025 at 1:16=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> Various MediaTek SoCs use GPU integration silicon named "MFlexGraphics"
> by MediaTek. On the MT8196 and MT6991 SoCs, interacting with this
> integration silicon is required to power on the GPU.
>
> This glue silicon is in the form of an embedded microcontroller running
> special-purpose firmware, which autonomously adjusts clocks and
> regulators.
>
> Implement a driver, modelled as a pmdomain driver with a
> set_performance_state operation, to support these SoCs.
I like this model a lot. Thanks!

panthor might potentially need to interact with this driver beyond
what pmdomain provides. I am thinking about querying
GF_REG_SHADER_PRESENT. Not sure if we've heard back from the vendor.
Have you considered moving this to drivers/soc/mediatek such that we
can provide include/linux/mtk-mfg.h to panthor?

>
> The driver also exposes the actual achieved clock rate, as read back
> from the MCU, as common clock framework clocks, by acting as a clock
> provider as well.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/pmdomain/mediatek/Kconfig            |   16 +
>  drivers/pmdomain/mediatek/Makefile           |    1 +
>  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 1027 ++++++++++++++++++++=
++++++
>  3 files changed, 1044 insertions(+)
[...]
> +static int mtk_mfg_init_shared_mem(struct mtk_mfg *mfg)
> +{
> +       struct device *dev =3D &mfg->pdev->dev;
> +       struct mtk_mfg_ipi_msg msg =3D {};
> +       int ret;
> +
> +       dev_dbg(dev, "clearing GPUEB shared memory, 0x%X bytes\n", mfg->s=
hared_mem_size);
> +       memset_io(mfg->shared_mem, 0, mfg->shared_mem_size);
> +
> +       msg.cmd =3D CMD_INIT_SHARED_MEM;
> +       msg.u.shared_mem.base =3D mfg->shared_mem_phys;
> +       msg.u.shared_mem.size =3D mfg->shared_mem_size;
> +
> +       ret =3D mtk_mfg_send_ipi(mfg, &msg);
> +       if (ret)
> +               return ret;
> +
> +       if (readl(mfg->shared_mem) !=3D GPUEB_MEM_MAGIC) {
Add the offset GF_REG_MAGIC, even though it is 0.

> +               dev_err(dev, "EB did not initialise shared memory correct=
ly\n");
> +               return -EIO;
> +       }
> +
> +       return 0;
> +}
[...]
> +static int mtk_mfg_mt8196_init(struct mtk_mfg *mfg)
> +{
> +       void __iomem *e2_base;
> +
> +       e2_base =3D devm_platform_ioremap_resource_byname(mfg->pdev, "hw-=
revision");
> +       if (IS_ERR(e2_base))
> +               return dev_err_probe(&mfg->pdev->dev, PTR_ERR(e2_base),
> +                                    "Couldn't get hw-revision register\n=
");
> +
> +       if (readl(e2_base) =3D=3D MFG_MT8196_E2_ID)
> +               mfg->ghpm_en_reg =3D RPC_DUMMY_REG_2;
> +       else
> +               mfg->ghpm_en_reg =3D RPC_GHPM_CFG0_CON;
> +
> +       return 0;
> +};
Extraneous semicolon.

> +static int mtk_mfg_init_mbox(struct mtk_mfg *mfg)
> +{
> +       struct device *dev =3D &mfg->pdev->dev;
> +       struct mtk_mfg_mbox *gf;
> +       struct mtk_mfg_mbox *slp;
> +
> +       gf =3D devm_kzalloc(dev, sizeof(*gf), GFP_KERNEL);
> +       if (!gf)
> +               return -ENOMEM;
> +
> +       gf->rx_data =3D devm_kzalloc(dev, GPUEB_MBOX_MAX_RX_SIZE, GFP_KER=
NEL);
It looks like gfx->rx_data can simply be "struct mtk_mfg_ipi_msg rx_data;".

> +       if (!gf->rx_data)
> +               return -ENOMEM;
> +
> +       gf->mfg =3D mfg;
> +       init_completion(&gf->rx_done);
> +       gf->cl.dev =3D dev;
> +       gf->cl.rx_callback =3D mtk_mfg_mbox_rx_callback;
> +       gf->cl.tx_tout =3D GPUEB_TIMEOUT_US / USEC_PER_MSEC;
> +       gf->ch =3D mbox_request_channel_byname(&gf->cl, "gpufreq");
> +       if (IS_ERR(gf->ch))
> +               return PTR_ERR(gf->ch);
> +
> +       mfg->gf_mbox =3D gf;
> +
> +       slp =3D devm_kzalloc(dev, sizeof(*slp), GFP_KERNEL);
> +       if (!slp)
> +               return -ENOMEM;
> +
> +       slp->mfg =3D mfg;
> +       init_completion(&slp->rx_done);
> +       slp->cl.dev =3D dev;
> +       slp->cl.tx_tout =3D GPUEB_TIMEOUT_US / USEC_PER_MSEC;
> +       slp->cl.tx_block =3D true;
> +       slp->ch =3D mbox_request_channel_byname(&slp->cl, "sleep");
> +       if (IS_ERR(slp->ch))
> +               return PTR_ERR(slp->ch);
Free gf->ch.
> +
> +       mfg->slp_mbox =3D slp;
> +
> +       return 0;
> +}
> +
> +static int mtk_mfg_init_clk_provider(struct mtk_mfg *mfg)
> +{
> +       struct device *dev =3D &mfg->pdev->dev;
> +       struct clk_hw_onecell_data *clk_data;
> +       int ret;
> +
> +       clk_data =3D devm_kzalloc(dev, struct_size(clk_data, hws, 2), GFP=
_KERNEL);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       clk_data->num =3D 2;
> +
> +       mfg->clk_core_hw.init =3D &mtk_mfg_clk_gpu_init;
> +       mfg->clk_stack_hw.init =3D &mtk_mfg_clk_stack_init;
> +
> +       ret =3D devm_clk_hw_register(dev, &mfg->clk_core_hw);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Couldn't register GPU cor=
e clock\n");
> +
> +       ret =3D devm_clk_hw_register(dev, &mfg->clk_stack_hw);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Couldn't register GPU sta=
ck clock\n");
> +
> +       clk_data->hws[0] =3D &mfg->clk_core_hw;
> +       clk_data->hws[1] =3D &mfg->clk_stack_hw;
> +
> +       ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, c=
lk_data);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Couldn't register clock p=
rovider\n");
> +
> +       return 0;
> +}
> +
> +static int mtk_mfg_probe(struct platform_device *pdev)
> +{
> +       struct device_node *shmem __free(device_node);
> +       struct mtk_mfg *mfg;
> +       struct device *dev =3D &pdev->dev;
> +       const struct mtk_mfg_variant *data =3D of_device_get_match_data(d=
ev);
> +       struct resource res;
> +       int ret, i;
> +
> +       mfg =3D devm_kzalloc(dev, sizeof(*mfg), GFP_KERNEL);
> +       if (!mfg)
> +               return -ENOMEM;
> +
> +       mfg->pdev =3D pdev;
> +       mfg->variant =3D data;
> +
> +       dev_set_drvdata(dev, mfg);
> +
> +       mfg->gpr =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(mfg->gpr))
> +               return dev_err_probe(dev, PTR_ERR(mfg->gpr),
> +                                    "Couldn't retrieve GPR MMIO register=
s\n");
> +
> +       mfg->rpc =3D devm_platform_ioremap_resource(pdev, 1);
> +       if (IS_ERR(mfg->rpc))
> +               return dev_err_probe(dev, PTR_ERR(mfg->rpc),
> +                                    "Couldn't retrieve RPC MMIO register=
s\n");
> +
> +       mfg->clk_eb =3D devm_clk_get(dev, "eb");
> +       if (IS_ERR(mfg->clk_eb))
> +               return dev_err_probe(dev, PTR_ERR(mfg->clk_eb),
> +                                    "Couldn't get 'eb' clock\n");
> +
> +       mfg->gpu_clks =3D devm_kcalloc(dev, data->num_clks, sizeof(*mfg->=
gpu_clks),
> +                                    GFP_KERNEL);
> +       if (!mfg->gpu_clks)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < data->num_clks; i++)
> +               mfg->gpu_clks[i].id =3D data->clk_names[i];
> +
> +       ret =3D devm_clk_bulk_get(dev, data->num_clks, mfg->gpu_clks);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Couldn't get GPU clocks\n=
");
> +
> +       mfg->gpu_regs =3D devm_kcalloc(dev, data->num_regulators,
> +                                    sizeof(*mfg->gpu_regs), GFP_KERNEL);
> +       if (!mfg->gpu_regs)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < data->num_regulators; i++)
> +               mfg->gpu_regs[i].supply =3D data->regulator_names[i];
> +
> +       ret =3D devm_regulator_bulk_get(dev, data->num_regulators, mfg->g=
pu_regs);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Couldn't get GPU regulato=
rs\n");
> +
> +       ret =3D of_reserved_mem_region_to_resource(dev->of_node, 0, &res)=
;
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Couldn't get GPUEB shared=
 memory\n");
> +
> +       mfg->shared_mem =3D devm_ioremap(dev, res.start, resource_size(&r=
es));
> +       if (!mfg->shared_mem)
> +               return dev_err_probe(dev, -ENOMEM, "Can't ioremap GPUEB s=
hared memory\n");
> +       mfg->shared_mem_size =3D resource_size(&res);
> +       mfg->shared_mem_phys =3D res.start;
> +
> +       if (data->init) {
> +               ret =3D data->init(mfg);
> +               if (ret)
> +                       return dev_err_probe(dev, ret, "Variant init fail=
ed\n");
> +       }
> +
> +       mfg->pd.name =3D dev_name(dev);
> +       mfg->pd.attach_dev =3D mtk_mfg_attach_dev;
> +       mfg->pd.detach_dev =3D mtk_mfg_detach_dev;
> +       mfg->pd.power_off =3D mtk_mfg_power_off;
> +       mfg->pd.power_on =3D mtk_mfg_power_on;
> +       mfg->pd.set_performance_state =3D mtk_mfg_set_performance;
> +       mfg->pd.flags =3D GENPD_FLAG_OPP_TABLE_FW;
> +
> +       ret =3D pm_genpd_init(&mfg->pd, NULL, false);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to initialise powe=
r domain\n");
We need to clean up mgf->md on errors from this point on. Maybe we can
move this to a later point?

> +
> +       ret =3D mtk_mfg_init_mbox(mfg);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Couldn't initialise mailb=
ox\n");
We need to free the mboxes from this point on.

> +       ret =3D mtk_mfg_power_on(&mfg->pd);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to power on MFG\n"=
);
> +
> +       ret =3D mtk_mfg_init_shared_mem(mfg);
> +       if (ret) {
> +               dev_err_probe(dev, ret, "Couldn't initialize EB shared me=
mory\n");
> +               goto out;
> +       }
> +
> +       ret =3D mtk_mfg_read_opp_tables(mfg);
> +       if (ret) {
> +               dev_err_probe(dev, ret, "Error reading OPP tables from EB=
\n");
> +               goto out;
> +       }
> +
> +       ret =3D mtk_mfg_init_clk_provider(mfg);
> +       if (ret)
> +               goto out;
> +
> +       ret =3D of_genpd_add_provider_simple(dev->of_node, &mfg->pd);
> +       if (ret) {
> +               dev_err_probe(dev, ret, "Failed to add pmdomain provider\=
n");
> +               goto out;
> +       }
> +
> +       return 0;
> +
> +out:
> +       mtk_mfg_power_off(&mfg->pd);
> +       return ret;
> +}

