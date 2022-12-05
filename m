Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7754DC47089
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 23:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDF/gKKPFFdYm1Z2aXrfOeQfBC1PEKz8UeufAaOXx9E=; b=lG0U8tgxnY7Xc0kcjgbLP6ihiW
	LRnZujqmQxM+bERR7FaH4Y0NsvmEha0whheeuHj6gQ59EOByvfxuJBPRMpiU8ZXxuber2LAtFpOLZ
	ENMhIiIoSIsv64OA6dHu1Yc6HFU5Zr4IM6bHlkqNMdPMJBXF62Cn79WI+MSfac4HnWVXvolbtCwZk
	8NwuLqOjyfKJ+Bdme10V/KzKl1coKyrdWQ3xkm8CuEcr4lFK9iydgtXvl8t/3xGfj+2fpdKgoMP/E
	OrA+GBLtW+jYjbDVxqdmRHnH7UoLvAsWo0rWmMitBJgmkjnlfJQO/+T8y02x4h/WQW9qRxLvIIPxW
	Z0HTCOmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2KhG-00BzFd-OV; Mon, 05 Dec 2022 23:16:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Kh5-00Bz8k-G9; Mon, 05 Dec 2022 23:16:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5C952614C3;
	Mon,  5 Dec 2022 23:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C006FC433B5;
	Mon,  5 Dec 2022 23:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670282173;
	bh=tTj6xlqwZkkawn6eAfGzgzhH58kjDBepMPSTaEkO1+o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZY/GeL7d56Z67JgEQuUyLY6Vqk/2mg/lRDQfmu9taP+IPjTF2dez5CemaGs4DPpYL
	 CgyKfBXI+PqKJRC83bS6qkJfpHd/OzMbTBFn3+l80OxFvLe0BK1sPfEeZUifZZyEdE
	 rvpR/Kt12dVHkYg+waOl98VivJ0ehO/vGyL6mU09EoTvIIemI5onOJFhyncIVpU1i2
	 JtoJ5GkzOVP26LCAAfv3dEFLvoxqkzmuJek6SYtu6LGcP6cvJ9AYBdKzaMobtt98b4
	 sfY87Zjv0psr4D33dFMKY8U9uGj8l5ivstsDoDLky8TPELLx6Nf2RynaYJE/JXrZeD
	 PQTjYxbdOYcWg==
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-12c8312131fso15369866fac.4;
        Mon, 05 Dec 2022 15:16:13 -0800 (PST)
X-Gm-Message-State: ANoB5plepGbGQhRNv/I3l3C6kTE4NtdvGhWeomEzYcVDDrwE+JQKXf4O
	MLSSXlUf9MDZvIib0D1bDs1+kZnVBt5C0bnndg==
X-Google-Smtp-Source: AA0mqf7VhWuGDHZgIsW7euFPqGB81veoXwRhbmr7m/MxNUsi4J+BsvBrNEz7hgNDnExfLJ6wGZ3fogI8TRhYee8qtkQ=
X-Received: by 2002:a05:6870:b00f:b0:13a:f4fd:7d81 with SMTP id
 y15-20020a056870b00f00b0013af4fd7d81mr39025319oae.139.1670282172886; Mon, 05
 Dec 2022 15:16:12 -0800 (PST)
MIME-Version: 1.0
References: <20221125-mtk-mailbox-v3-0-c4b635052b65@chromium.org>
In-Reply-To: <20221125-mtk-mailbox-v3-0-c4b635052b65@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 6 Dec 2022 07:16:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY__8uYdjFHGTrtq-ZTqvt7gaXeEKv9T3X0e=v4iZ52EE9g@mail.gmail.com>
Message-ID: <CAAOTY__8uYdjFHGTrtq-ZTqvt7gaXeEKv9T3X0e=v4iZ52EE9g@mail.gmail.com>
Subject: Re: [PATCH v3] mailbox: mtk-cmdq: Do not request irq until we are ready
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_151615_637225_FD40C5C9 
X-CRM114-Status: GOOD (  21.73  )
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

Ricardo Ribalda <ribalda@chromium.org> =E6=96=BC 2022=E5=B9=B411=E6=9C=8830=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E6=99=9A=E4=B8=8A8:59=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> If the system comes from kexec() the peripheral might trigger an IRQ
> befoe we are ready for it. Triggering a crash due to an access to
> invalid memory.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> To: Jassi Brar <jassisinghbrar@gmail.com>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> ---
> Changes in v3:
> - Rebase on top of https://patchwork.kernel.org/project/linux-mediatek/pa=
tch/20221102100736.37815-1-angelogioacchino.delregno@collabora.com/
> - Link to v2: https://lore.kernel.org/r/20221125-mtk-mailbox-v2-0-886f70c=
7173c@chromium.org
>
> Changes in v2:
> - I have managed to repro a different panic. Moving the irq enabling to t=
he very end of probe.
> - Link to v1: https://lore.kernel.org/r/20221125-mtk-mailbox-v1-0-2e3ee12=
0850c@chromium.org
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmd=
q-mailbox.c
> index a460ee26eb11..b18d47ea13a0 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -569,12 +569,6 @@ static int cmdq_probe(struct platform_device *pdev)
>         }
>
>         cmdq->irq_mask =3D GENMASK(cmdq->pdata->thread_nr - 1, 0);
> -       err =3D devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_S=
HARED,
> -                              "mtk_cmdq", cmdq);
> -       if (err < 0) {
> -               dev_err(dev, "failed to register ISR (%d)\n", err);
> -               return err;
> -       }
>
>         dev_dbg(dev, "cmdq device: addr:0x%p, va:0x%p, irq:%d\n",
>                 dev, cmdq->base, cmdq->irq);
> @@ -641,6 +635,13 @@ static int cmdq_probe(struct platform_device *pdev)
>
>         cmdq_init(cmdq);
>
> +       err =3D devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_S=
HARED,
> +                              "mtk_cmdq", cmdq);
> +       if (err < 0) {
> +               dev_err(dev, "failed to register ISR (%d)\n", err);
> +               return err;
> +       }
> +
>         return 0;
>  }
>
>
> ---
> base-commit: 1642107db81361b4339643eb90af4839e2cf229f
> change-id: 20221125-mtk-mailbox-ba6cbd1d91b6
>
> Best regards,
> --
> Ricardo Ribalda <ribalda@chromium.org>
>

