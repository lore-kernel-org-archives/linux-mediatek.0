Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE7AEE020B
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Dec 2025 15:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZARmaZEXZR6ZbEbjtniLOp7yqHmUCZXPgdI02BKjmo=; b=A7T+RN6F2042QjVpZjk6oE0vBR
	HGHO5hfqbiTxMmLkaoDk4ftWSQa4hYFLpaVm5l/vBo94T3FaNEI7CoKmsSpIGlEiDN3vOJCygRQ7p
	oZD6Gkpe++K5nooknYJvXN96aISpLrJgOQECyYGSOjygHuaV4g0r4+7zJpSSm/SNMQVumEVljV5jY
	BRrzLZN1S0pd81H4Jc/UisfcqyMcSLcqRTorO9zdcTDxgkzMSCCYWnEP5Bx8oB5yPWzgTqDVZov97
	RbY0wAgHKoqjXvyS34wBzJdBHqg4ZXgF8U56Fjj8jyWP2I0XGU7niIeyNUGJ3MPqDY0+8CF1VkEu1
	IJgOwJ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabHr-00000004yX1-1Arm;
	Tue, 30 Dec 2025 15:05:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabHn-00000004yUc-3wvs
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Dec 2025 15:05:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 31BCE43EC0
	for <linux-mediatek@lists.infradead.org>; Tue, 30 Dec 2025 15:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14141C116C6
	for <linux-mediatek@lists.infradead.org>; Tue, 30 Dec 2025 15:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767107123;
	bh=k+sfLAHZ4od5Go1hQ8/E7tdBiePwz8C12d3QEmnz21s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IWeL+CazloE2GVpmEgHFbu+APCjhkwe1/RQoBa5IW36hA+pIBWUGVL3iSE96X1gGm
	 TgraxXB8YGTQIOCU0QyiP0PNmAuKjhxowbEA7ugLkg74sTOJEPR2Ri9O8AJ8KnSUXt
	 VARl/oegQIrJGjn3fJMgMAgmbZV0tySVlHdNLzYlFbibzzwAl8cuooIYQRBQ7ZmyvX
	 7SnbtmkwoLFfxra6i99fDd8F+51p3b6eZHJsfT2Uf0b5MnWD4m7qQFpBHUhU6eZlpg
	 9aryvNXJXfjY7CvSHzR4fsbkp6zoBsSr/Rv/3j62M3Ve3kH4KwK819bNbJ/jSS2utU
	 7vT4lcz01svAQ==
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7f121c00dedso13445639b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Dec 2025 07:05:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWuDjv5/GM2JrSsipqGSagDTGAO8J0PVinAGZ0RxfhR2OjAncY/V7ewW35LJQfpqBO2r0qopZx8YU9nB5H7aA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzK8ZAzo/WqnpkDo8NnRXwp1UTHmrf7Sb7Hbi5bfar3PzXl3JcB
	OuedvqdP4TqIx+d5oHMV6q1HFswea41z1JSKy8q5jG6ePnqfUCDkLIjC7ToSU5JtbfUyLCks0wy
	ROw1KSjw4s+SozJ6kmaYwQvpQsMr/uw==
X-Google-Smtp-Source: AGHT+IHOLydLmmcmWVVnPVsyVGqwhF4/f5HUKm8mx3LlEuS0RmP9LmzBmhVmJflNaj+6zrgVN2DSmF0vgYG2pNCTGVo=
X-Received: by 2002:a05:7022:3a83:b0:11c:b397:2657 with SMTP id
 a92af1059eb24-121722be81emr36781711c88.22.1767107119963; Tue, 30 Dec 2025
 07:05:19 -0800 (PST)
MIME-Version: 1.0
References: <20250924103708.19071-1-angelogioacchino.delregno@collabora.com>
 <20250924103708.19071-4-angelogioacchino.delregno@collabora.com>
 <fb2c7169b3c3e2e376ee0b092699735dc38bcbb6.camel@mediatek.com> <51af30ea-dce9-49b8-a5e1-0ee8e9644879@collabora.com>
In-Reply-To: <51af30ea-dce9-49b8-a5e1-0ee8e9644879@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 30 Dec 2025 15:05:06 +0000
X-Gmail-Original-Message-ID: <CAAOTY_-y6QTu7txOQZoDrYih_0tH4MATku0orOKAqU5cL7oFcw@mail.gmail.com>
X-Gm-Features: AQt7F2oOXBIit7sf6BOjsCE3xqBbn0Bu_G1yunIHCL6bSDsyps9snFVRQRZ00vI
Message-ID: <CAAOTY_-y6QTu7txOQZoDrYih_0tH4MATku0orOKAqU5cL7oFcw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/mediatek: mtk_disp_rdma: Enable/disable interrupt
 on bind/unbind
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, Alexandre Mergnat <amergnat@baylibre.com>, 
	"simona@ffwll.ch" <simona@ffwll.ch>, 
	"dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>, 
	"kernel@collabora.com" <kernel@collabora.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"djkurtz@chromium.org" <djkurtz@chromium.org>, "granquet@baylibre.com" <granquet@baylibre.com>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	=?UTF-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>, 
	"airlied@gmail.com" <airlied@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "littlecvr@chromium.org" <littlecvr@chromium.org>, 
	=?UTF-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_070524_246250_E72FBB44 
X-CRM114-Status: GOOD (  32.36  )
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

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2025=E5=B9=B410=E6=9C=8828=E6=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=883:4=
9=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Il 28/10/25 10:49, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) ha scritto:
> > On Wed, 2025-09-24 at 12:37 +0200, AngeloGioacchino Del Regno wrote:
> >> External email : Please do not click links or open attachments until y=
ou have verified the sender or the content.
> >>
> >>
> >> The RDMA driver is installing an ISR in the probe function but, if
> >> the component is not bound yet, the interrupt handler may call the
> >> vblank_cb ahead of time (while probing other drivers) or too late
> >> (while removing other drivers), possibly accessing memory that it
> >> should not try to access by reusing stale pointers.
> >>
> >> In order to fix this, like done in the OVL driver, add a new `irq`
> >> member to struct mtk_disp_ovl and then set the NOAUTOEN flag to
> >> the irq before installing the ISR to manually disable and clear
> >> the hwirqs with register writes, and enable_irq() and disable_irq()
> >> in the bind and unbind callbacks respectively.
> >>
> >> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT=
8173.")
> >> Link: https://lore.kernel.org/r/20250402083628.20111-6-angelogioacchin=
o.delregno@collabora.com
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@c=
ollabora.com>
> >> ---
> >>   drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 34 ++++++++++++++--------=
--
> >>   1 file changed, 20 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/dr=
m/mediatek/mtk_disp_rdma.c
> >> index c9d41d75e7f2..9fd9bb1ee544 100644
> >> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> >> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> >> @@ -81,6 +81,7 @@ struct mtk_disp_rdma_data {
> >>   struct mtk_disp_rdma {
> >>          struct clk                      *clk;
> >>          void __iomem                    *regs;
> >> +       int                             irq;
> >>          struct cmdq_client_reg          cmdq_reg;
> >>          const struct mtk_disp_rdma_data *data;
> >>          void                            (*vblank_cb)(void *data);
> >> @@ -295,13 +296,23 @@ void mtk_rdma_layer_config(struct device *dev, u=
nsigned int idx,
> >>   static int mtk_disp_rdma_bind(struct device *dev, struct device *mas=
ter,
> >>                                void *data)
> >>   {
> >> -       return 0;
> >> +       struct mtk_disp_rdma *priv =3D dev_get_drvdata(dev);
> >> +
> >> +       /* Disable and clear pending interrupts */
> >> +       writel(0x0, priv->regs + DISP_REG_RDMA_INT_ENABLE);
> >> +       writel(0x0, priv->regs + DISP_REG_RDMA_INT_STATUS);
> >> +
> >> +       enable_irq(priv->irq);
> >>
> >> +       return 0;
> >>   }
> >>
> >>   static void mtk_disp_rdma_unbind(struct device *dev, struct device *=
master,
> >>                                   void *data)
> >>   {
> >> +       struct mtk_disp_rdma *priv =3D dev_get_drvdata(dev);
> >> +
> >> +       disable_irq(priv->irq);
> >>   }
> >>
> >>   static const struct component_ops mtk_disp_rdma_component_ops =3D {
> >> @@ -313,16 +324,15 @@ static int mtk_disp_rdma_probe(struct platform_d=
evice *pdev)
> >>   {
> >>          struct device *dev =3D &pdev->dev;
> >>          struct mtk_disp_rdma *priv;
> >> -       int irq;
> >>          int ret;
> >>
> >>          priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> >>          if (!priv)
> >>                  return -ENOMEM;
> >>
> >> -       irq =3D platform_get_irq(pdev, 0);
> >> -       if (irq < 0)
> >> -               return irq;
> >> +       priv->irq =3D platform_get_irq(pdev, 0);
> >> +       if (priv->irq < 0)
> >> +               return priv->irq;
> >>
> >>          priv->clk =3D devm_clk_get(dev, NULL);
> >>          if (IS_ERR(priv->clk))
> >> @@ -345,21 +355,17 @@ static int mtk_disp_rdma_probe(struct platform_d=
evice *pdev)
> >>          if (ret && (ret !=3D -EINVAL))
> >>                  return dev_err_probe(dev, ret, "Failed to get rdma fi=
fo size\n");
> >>
> >> -       /* Disable and clear pending interrupts */
> >> -       writel(0x0, priv->regs + DISP_REG_RDMA_INT_ENABLE);
> >> -       writel(0x0, priv->regs + DISP_REG_RDMA_INT_STATUS);
> >
> > Pending interrupt is cleared here, and interrupt is disabled here.
> > So the problem you mention would not happen.
> >
>
> When unbinding the component, the interrupt is not cleared nor disabled.
>
> If there is any pending interrupt while unbinding (or if the HW raises an=
 interrupt
> after rdma gets unbound) the ISR will produce a use-after-free issue.

In mtk_drm_kms_deinit(), it call drm_atomic_helper_shutdown() before
component_unbind_all().
I think hardware should be disabled when drm_atomic_helper_shutdown().
If hardware is not disabled, we should find out the reason.
I like a symmetry design. After bind all sub driver, then enable
hardware. disable hardware before unbind sub driver.
This assume that hardware is disabled when boot up.
If the hardware is enabled in bootloader stage, the tricky way is to
disable interrupt before request irq in probe.

Regards,
Chun-Kuang.

>
> I wrote this after experiencing the issue that I described in the commit =
message,
> didn't just go and casually write code.
>
> I also want to remind you that use-after-free may also be a security conc=
ern.
>
> Regards,
> Angelo
>
> > Regards,
> > CK
> >
> >> -
> >> -       ret =3D devm_request_irq(dev, irq, mtk_disp_rdma_irq_handler,
> >> -                              IRQF_TRIGGER_NONE, dev_name(dev), priv)=
;
> >> -       if (ret < 0)
> >> -               return dev_err_probe(dev, ret, "Failed to request irq =
%d\n", irq);
> >> -
> >>          priv->data =3D of_device_get_match_data(dev);
> >>
> >>          platform_set_drvdata(pdev, priv);
> >>
> >>          pm_runtime_enable(dev);
> >>
> >> +       ret =3D devm_request_irq(dev, priv->irq, mtk_disp_rdma_irq_han=
dler,
> >> +                              IRQF_NO_AUTOEN, dev_name(dev), priv);
> >> +       if (ret < 0)
> >> +               return dev_err_probe(dev, ret, "Failed to request irq =
%d\n", priv->irq);
> >> +
> >>          ret =3D component_add(dev, &mtk_disp_rdma_component_ops);
> >>          if (ret) {
> >>                  pm_runtime_disable(dev);
> >> --
> >> 2.51.0
> >>
> >>
> >
>
>

