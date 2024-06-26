Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EEDC30653
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 12:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eiwjhxQC0UJVPlRV7pd2mwMWCbql71ob+FnXjPBeEXQ=; b=RWA3JEFHsrw/rVDh1kHpucdghQ
	xo5j7hQE2YhLar4q74Cj2ZkbUDhFi9BnbWLI+0dlt2y1L7NeRxholHiJOUZI2mvNsf0TJ6WZSVAia
	WBwCw4KypWb7LY3+mPDOyWHOP5RXdYqrZKVPg2dOB3gGH3b0LPb+1i3bNzAwDav3SXrivQPaLjtjq
	WB/Ucy5/X2c4kgONm24JpI0NyIpO/evN2KE14mlSM3+7qYXFPHXsFiGoLuomPpqyNr8i2GIYdXhb/
	pLZ0POiWW8gd10dtDS/dJsaIuYiccc4RFN25KBpnzvVrm1M7s5rJAfL4N4pghBjgSHg7i9duitFPE
	+I191yNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSBp-00000006p86-2zFX;
	Wed, 26 Jun 2024 12:55:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSBf-00000006p44-1cky;
	Wed, 26 Jun 2024 12:55:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DDA91CE21CB;
	Wed, 26 Jun 2024 12:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F8CC4AF07;
	Wed, 26 Jun 2024 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719406534;
	bh=1tyIBZMR+ekYrAbTqKqsmrO9O2uYe8kEwjYxT1NNdOA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ioztycntPJNuQlSpXkgh+4hZqZ4nZFQJZHhjyKJhi0M2GGBR4fYhP1uv9LIqnJPOr
	 QJDs+IUIwx8PWU53l26xnUX/wXDfuzIbnM0Szp5snDM3Ge31FgNup8BNld8N3RZG+T
	 mq7o7WJ9eDANXHNBP71ye/aSkSBbCdvIxSEJHV0zmrEzFlzW1AgXqPvSmfnYiqdLpj
	 vOvVndtGLdnYKTI3TuR1gHGhu2jcrdNSjmiPE8yXGFPYJwmZFyUGdwZeXzshHdFgnM
	 wTG4EL1EcuGrhTVSHDZtN4R2kzvMBOzjeyPAXVQ36tUk7QkA8Q4sHNlNa/KCX+9+X+
	 xH1mn5HS+4KBg==
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2c80637ee79so4709474a91.0;
        Wed, 26 Jun 2024 05:55:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWb6WotcVaDp31w+MN4tqT002OUJycJt2T5WQUE+leNhHueooPZb1aCBSIDjdeLiOCuv7ExwYbE735xxQdZ8aMrcyEztnwjwQNc8f/XU7+pSO9yYMmz47WM5mejONzSQBMXHe3U5frKjSDdiEs+x3Oe+eYHp239Vmk=
X-Gm-Message-State: AOJu0Ywhi/GppFiXsRx8i3i55zZHulp3+Oxkd1+QD9ERNvVUUC4nCviv
	jPYm2OwOtypiMdqgLYlEA7ZCeRMklmhSkCkwfCKmjGLQ6I3iGAEfKf7BVT7f4hOhbN19XAI9kjB
	Gj/SFLk0dohmYrw7giszc2i7EiQ==
X-Google-Smtp-Source: AGHT+IGSRPxyvkKWw3XafvaCtJE8WDZSvpaH/yu3LA/G7Okq6X21Tx5BdLXWvFCNIIUmiLCnuVaO3D2wi3d0datudBg=
X-Received: by 2002:a17:90a:e2d5:b0:2c3:2da1:c8bc with SMTP id
 98e67ed59e1d1-2c8612a9b2amr8585314a91.15.1719406534020; Wed, 26 Jun 2024
 05:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240624095726.18818-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20240624095726.18818-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 26 Jun 2024 20:55:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY__POyCa=wgh30mdcMiF23Xnwba7wjdt-Zj1CfrTiwh=WA@mail.gmail.com>
Message-ID: <CAAOTY__POyCa=wgh30mdcMiF23Xnwba7wjdt-Zj1CfrTiwh=WA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Fix bit depth overwritten for mtk_ovl_set bit_depth()
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Jason-ch Chen <jason-ch.chen@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_055548_012699_A3CAACAE 
X-CRM114-Status: GOOD (  16.56  )
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

Hi, Jason:

Jason-JH.Lin <jason-jh.lin@mediatek.com> =E6=96=BC 2024=E5=B9=B46=E6=9C=882=
4=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=885:57=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Refine the value and mask define of bit depth for mtk_ovl_set bit_depth()=
.
> Use cmdq_pkt_write_mask() instead of cmdq_pkt_write() to avoid bit depth
> settings being overwritten.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: fb36c5020c9c ("drm/mediatek: Add support for AR30 and BA30 overlay=
s")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
> Based on: https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/li=
nux.git/log/?h=3Dmediatek-drm-next
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index 4b370bc0746d..d35f5b4b22c2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -42,7 +42,11 @@
>  #define DISP_REG_OVL_RDMA_CTRL(n)              (0x00c0 + 0x20 * (n))
>  #define DISP_REG_OVL_RDMA_GMC(n)               (0x00c8 + 0x20 * (n))
>  #define DISP_REG_OVL_ADDR_MT2701               0x0040
> -#define DISP_REG_OVL_CLRFMT_EXT                        0x02D0
> +#define DISP_REG_OVL_CLRFMT_EXT                        0x02d0
> +#define OVL_CON_CLRFMT_BIT_DEPTH_MASK(n)               (GENMASK(1, 0) <<=
 (4 * (n)))
> +#define OVL_CON_CLRFMT_BIT_DEPTH(depth, n)             ((depth) << (4 * =
(n)))
> +#define OVL_CON_CLRFMT_8_BIT                           (0)
> +#define OVL_CON_CLRFMT_10_BIT                          (1)
>  #define DISP_REG_OVL_ADDR_MT8173               0x0f40
>  #define DISP_REG_OVL_ADDR(ovl, n)              ((ovl)->data->addr + 0x20=
 * (n))
>  #define DISP_REG_OVL_HDR_ADDR(ovl, n)          ((ovl)->data->addr + 0x20=
 * (n) + 0x04)
> @@ -65,10 +69,6 @@
>                                         0 : OVL_CON_CLRFMT_RGB)
>  #define OVL_CON_CLRFMT_RGB888(ovl)     ((ovl)->data->fmt_rgb565_is_0 ? \
>                                         OVL_CON_CLRFMT_RGB : 0)
> -#define OVL_CON_CLRFMT_BIT_DEPTH_MASK(ovl)     (0xFF << 4 * (ovl))
> -#define OVL_CON_CLRFMT_BIT_DEPTH(depth, ovl)   (depth << 4 * (ovl))
> -#define OVL_CON_CLRFMT_8_BIT                   0x00
> -#define OVL_CON_CLRFMT_10_BIT                  0x01
>  #define        OVL_CON_AEN             BIT(8)
>  #define        OVL_CON_ALPHA           0xff
>  #define        OVL_CON_VIRT_FLIP       BIT(9)
> @@ -273,22 +273,17 @@ static void mtk_ovl_set_bit_depth(struct device *de=
v, int idx, u32 format,
>                                   struct cmdq_pkt *cmdq_pkt)
>  {
>         struct mtk_disp_ovl *ovl =3D dev_get_drvdata(dev);
> -       unsigned int reg;
>         unsigned int bit_depth =3D OVL_CON_CLRFMT_8_BIT;
>
>         if (!ovl->data->supports_clrfmt_ext)
>                 return;
>
> -       reg =3D readl(ovl->regs + DISP_REG_OVL_CLRFMT_EXT);
> -       reg &=3D ~OVL_CON_CLRFMT_BIT_DEPTH_MASK(idx);
> -
>         if (is_10bit_rgb(format))
>                 bit_depth =3D OVL_CON_CLRFMT_10_BIT;
>
> -       reg |=3D OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx);
> -
> -       mtk_ddp_write(cmdq_pkt, reg, &ovl->cmdq_reg,
> -                     ovl->regs, DISP_REG_OVL_CLRFMT_EXT);
> +       mtk_ddp_write_mask(cmdq_pkt, OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, =
idx),
> +                          &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_CLRFMT=
_EXT,
> +                          OVL_CON_CLRFMT_BIT_DEPTH_MASK(idx));
>  }
>
>  void mtk_ovl_config(struct device *dev, unsigned int w,
> --
> 2.18.0
>

