Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE02E668A7
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Dec 2025 01:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvfEcA4ngmwX8Z/ReyrjfSyYYOfbBzOa2QWavuhPe1g=; b=QnUx3UiS9kT86t6FI/NokXf7ML
	4UlL7B+/X7SIe9haJYSLOhF0YgkS5XP+uc6sTrLfmHom4X5KMXwF1EOyIXFbDgeiuG1EnYW9tPoAf
	JAuVRZNOtasb88LPdvqqMwdI+zWgckat+lYo1f4G1UItc0j/nkqkTBuNya9HFcJyMvOZbTTcxzvvU
	CvYNANiylw/41saHQIRxL9RG0/pwFSyp3HZTIg2Fs6rqAzw705EETyPc4cVZVqHlE0boLJB34QdeZ
	Hirlo07e81iGEBMOBI6hyXsERNsWBKPshQwtAaSIvvWd16hicJJ6IqVN/kxi0E5Mhodwivb3RlML6
	XDWtI8lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWlOg-0000000B9Tk-1CNJ;
	Sat, 20 Dec 2025 01:04:38 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWlOd-0000000B9T4-00P3
	for linux-mediatek@lists.infradead.org;
	Sat, 20 Dec 2025 01:04:36 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-6447743ce90so2117689d50.2
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Dec 2025 17:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766192673; x=1766797473; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvfEcA4ngmwX8Z/ReyrjfSyYYOfbBzOa2QWavuhPe1g=;
        b=WnysS1FN0KRNayr7jH7iqY/URVydj/pNCXY3vYnErlEBNK7byhjI4QxHsh6Vkb53Mj
         x0njkr0cM4CrogeikJLrj7COd6xDydHxU1k6X4BRaX3s12Xw++Fon10O4yMfDqmSzSyV
         8OPd09eYkqb6b0bIPXijjnDZmmkOX+RdbwJ4gfvN05GgXOQ08modGzaqbirrFuYKdEXo
         DwA6RahIAQDoWz2SXH/eerrKOlblwlPcYDl0LK8BqikIEdA1caQyNIJSVTBpYeB0YTY8
         8is+nrXgpFupkjULh9EX9x4L/k4oF1wfssOFKVOkA6C857Olt+SOiYCFgE1cE52rDbhm
         yDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766192673; x=1766797473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uvfEcA4ngmwX8Z/ReyrjfSyYYOfbBzOa2QWavuhPe1g=;
        b=l0+maLmJDBCKddqrIrEKzjnAUkWLNRwvzKMJnTh6hqdZu7E2paGZSRNlKcPbcbOSqY
         D7NqCS8LnqO8vwe9+xaccHq8sBvg1bVTyY+PJ87LFgjB2HhHUhs57/fz3hT4s8qo/pAo
         ruRCufhs2QumAaNaEQirY8QIcvc/zLB09mJW4gxfTa42rK/Pg+N/inRRNlfemSvHDlg5
         lxEQ/zlOhm2mD3zsKEOkbY/haCEyaDkL7Zh6+jlm72mcX2LKdJKAJsYe2iU1Ep0FnqiU
         yP11Z5AJ2QSXn4dT/6O+5kIbC3CAhOKH6O4CQfjV4KgljWo5khU78TZaUQPv05Uj5cXC
         l7hw==
X-Forwarded-Encrypted: i=1; AJvYcCUHZz+8v6W3eV3MtnK7A/dUttu0ms3A7315gl1OHy+kvoqZCZ0YBBsks6ZV1mnSOrpQRUonQUHIym3m2tWf6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyET79IL3aj8avSX5f4AGTa+4LJKs3s2B9HpSnbMoU9pWfofOaw
	53PIdBFzLENkcrLu0r4+f+sjWkNkVFg2OFwDq8JUyfzsCulRHyY8+irRdN44uBs0uPTiK35BCaV
	aay3xHF3T1eMfOb/ot9W4tg4rUgcAIQ8=
X-Gm-Gg: AY/fxX6AfG2anTWUgYIHN8JEKFlkK7Ckvk4h3mlC5GzIA17LRLIwsENtc+RrdaQit+8
	aFZapFlHuC+W7adzTt6kOERqfPKuGXQAJvB4clW/RGRRCPN+yPW7CkE5lLpthkkGUY/Up+N/Epc
	xMs10fWbevEUESuq8H2GdeP5b97T4Mdxv3SswLgG5RUXSJ5UolKmUT+XwjW9eKSBdzZz8T6I0nL
	UsBlI2bDG1v/uLtbb1a0l0MRpQwl1DsvskliXQoiVuCcVNDqerEM+2l/AisNs1XEFOUssakKzvS
	du5cwO6Df5HIiZ5aHriRhqxQG8sC
X-Google-Smtp-Source: AGHT+IEnRAac6u07uzA3LUk5jCrz4OGRvCsnGojqOSsZK7RLqvjo5JYP+wh5edVRUn03IOrbdzCAkAqdhNZxSYFsGbc=
X-Received: by 2002:a05:690e:3c9:b0:645:5467:29f3 with SMTP id
 956f58d0204a3-6466a859780mr2828699d50.39.1766192673550; Fri, 19 Dec 2025
 17:04:33 -0800 (PST)
MIME-Version: 1.0
References: <20251217-mt8196-shader-present-v1-0-f6f8f3aa1e93@collabora.com> <20251217-mt8196-shader-present-v1-4-f6f8f3aa1e93@collabora.com>
In-Reply-To: <20251217-mt8196-shader-present-v1-4-f6f8f3aa1e93@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 19 Dec 2025 17:04:22 -0800
X-Gm-Features: AQt7F2pOYJ6wtBd4hNgFJlclGwmWabkkUpx6tjcAEWdTtCs7JRe062F7FH3q2go
Message-ID: <CAPaKu7TVeaEFRWBt7rF_uVUyYO72GHqFwKi7D52juPTRAk7URw@mail.gmail.com>
Subject: Re: [PATCH 4/4] pmdomain: mediatek: mtk-mfg: Expose shader_present as
 nvmem cell
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_170435_145270_BC52D89B 
X-CRM114-Status: GOOD (  21.84  )
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

On Wed, Dec 17, 2025 at 9:04=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> Implement nvmem-provider functionality in mtk-mfg-pmdomain, such that it
> can expose its GF_REG_SHADER_PRESENT value in the shared memory as an
> nvmem cell for panthor.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 57 ++++++++++++++++++++++=
++++++
>  1 file changed, 57 insertions(+)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdom=
ain/mediatek/mtk-mfg-pmdomain.c
> index 9bad577b3ae4..725ebc678f1b 100644
> --- a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> +++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> @@ -10,6 +10,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/container_of.h>
>  #include <linux/iopoll.h>
> +#include <linux/nvmem-provider.h>
>  #include <linux/mailbox_client.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -872,6 +873,58 @@ static int mtk_mfg_init_clk_provider(struct mtk_mfg =
*mfg)
>         return 0;
>  }
>
> +static int mtk_mfg_read_nvmem(void *priv, unsigned int offset, void *val=
, size_t bytes)
> +{
> +       struct mtk_mfg *mfg =3D priv;
> +       u32 *buf =3D val;
> +
> +       if (bytes !=3D 4)
> +               return -EINVAL;
> +
> +       if (!mfg->shared_mem)
> +               return -ENODEV;
> +
> +       if (offset + bytes >=3D mfg->shared_mem_size)
> +               return -EINVAL;
> +
> +       *buf =3D readl(mfg->shared_mem + offset);
> +
> +       return 0;
> +}
> +
> +static int mtk_mfg_init_nvmem_provider(struct mtk_mfg *mfg)
> +{
> +       struct device *dev =3D &mfg->pdev->dev;
> +       struct nvmem_cell_info cell =3D {};
> +       struct nvmem_config config =3D {};
> +       struct nvmem_device *nvdev;
> +       int ret;
> +
> +       config.reg_read =3D mtk_mfg_read_nvmem;
> +       config.dev =3D dev;
> +       config.read_only =3D true;
> +       config.priv =3D mfg;
> +       config.size =3D 4;
> +       config.word_size =3D 4;
> +
> +       nvdev =3D devm_nvmem_register(dev, &config);
> +       of_node_put(config.of_node);
This looks like a dead line.
> +       if (IS_ERR(nvdev))
> +               return dev_err_probe(dev, PTR_ERR(nvdev), "Couldn't regis=
ter nvmem provider\n");
> +
> +       cell.name =3D "shader-present";
> +       cell.offset =3D GF_REG_SHADER_PRESENT;
> +       cell.bytes =3D 4;
> +       cell.np =3D of_get_child_by_name(dev->of_node, cell.name);
> +
> +       ret =3D nvmem_add_one_cell(nvdev, &cell);
> +       /* cell.np purposefully not put as nvmem_add_one_cell does not in=
crease refcount */
I think you still need to of_node_put on errors.
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Couldn't add cell %s\n", =
cell.name);
> +
> +       return 0;
> +}
> +
>  static int mtk_mfg_probe(struct platform_device *pdev)
>  {
>         struct mtk_mfg *mfg;
> @@ -984,6 +1037,10 @@ static int mtk_mfg_probe(struct platform_device *pd=
ev)
>         if (ret)
>                 goto err_power_off;
>
> +       ret =3D mtk_mfg_init_nvmem_provider(mfg);
> +       if (ret)
> +               goto err_power_off;
> +
>         ret =3D of_genpd_add_provider_simple(dev->of_node, &mfg->pd);
>         if (ret) {
>                 dev_err_probe(dev, ret, "Failed to add pmdomain provider\=
n");
>
> --
> 2.52.0
>

