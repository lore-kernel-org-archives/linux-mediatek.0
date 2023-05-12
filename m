Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CCFC77B7F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 May 2023 00:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CH4ppR/YImqXRCtEui/eyufHAaFxL08S2yugceeQpQw=; b=zJx9aFPiDK3t/zS+CSfamShhXb
	ayICpVV9DYu61ZY/TZ5tXy6spo2vOv0VJAL3lQcNR9HI2HnOwPzgDK8waSTv8xpm/7jB/v8wYdFO5
	obYNAYjDuAzxVtYeRbTSygVCZ/2eYxUfsSsPK1Nphjm54z3M3okJXKRFBI48nNXS6yxvvbA5eK94i
	/CYvLWZmM0adjKrsG5KFAhaj4BjUO5DzFEgnxSh3dtKv+3zJzyTvoNcceFPDDtpXMlX6PGoRebtcP
	te9ZVxQloSXmGIJ6K8lX1PpKiV7A5JYyBsVNyfGVhA2GbNsE9jdV2RLJToP9lbVPIETtE+91JQWNv
	qYdTNRxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxGpQ-00AWUY-1O;
	Fri, 12 May 2023 00:40:12 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxGpO-00AWTK-0y
	for linux-mediatek@lists.infradead.org;
	Fri, 12 May 2023 00:40:11 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-4536ec953c1so1198523e0c.3
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 17:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683852008; x=1686444008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CH4ppR/YImqXRCtEui/eyufHAaFxL08S2yugceeQpQw=;
        b=aUcCBc3nacUromPCYUcTOUffpMJtnLw224rrn4TS6Bcw/VWfT1LggqJ1FJ16Eefj3R
         Epw0k+jGFP1KZt2HLS8D204u5xiUqSVKTVq+scEZovCd4mdI0XKHTHnJVtEY6/oONSDH
         2qiPekrL4qh6monUKwvmU6uhhq7jN9ycdfBRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683852008; x=1686444008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CH4ppR/YImqXRCtEui/eyufHAaFxL08S2yugceeQpQw=;
        b=AZ+rzSoy9dt0GM9Q4lst+dLP2nnAZgyZFtnOpIcmF5vjKLNy49yzCt7qU0OYTYnuNe
         3h7WkzygW/CY0YPNMzz0rYrLQVphvZFmDJpGWGY7Kd/AK6ylrRgTavQO2OOxFldksgwS
         WloW3SWziFmnaHN4kcqFNuMP9FmTvA2A95cEiQzeIAChR/AMIwvTai55O6m+2H5H+1hs
         56Tqlw0z3ta8DZhgb5f7LPwJAxtvlmbw7gltkh+c4s0A3G9NZxUCbxeQO5q5m+p9hSvx
         0jKNld3ChMsjDgIHsRBz8+KfwYIv00MsJVcZKI8hGYOoyuIGXmdwPNrUsd6pHqQrKHTc
         llbQ==
X-Gm-Message-State: AC+VfDwtYFyZq7G92NHidN7ry8SkIrKvhbEaKc7a9uchbvtDr7om8fWf
	Ujx7ueQkb3uVkx8bzKCudM3vKvmKBWJLz+nk9teWPA==
X-Google-Smtp-Source: ACHHUZ7CJRLkBoOoXB2ebsy/eMzziU9dqHDjIi6dtiQ/z9qVxlIHckT/so67HALGLdwGNm/ISSZScafI9Zz3gusQTLs=
X-Received: by 2002:a1f:5f46:0:b0:440:8b67:dba6 with SMTP id
 t67-20020a1f5f46000000b004408b67dba6mr9468363vkb.4.1683852007778; Thu, 11 May
 2023 17:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230509021214.17105-1-gehao@kylinos.cn>
In-Reply-To: <20230509021214.17105-1-gehao@kylinos.cn>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 May 2023 09:39:56 +0900
Message-ID: <CAGXv+5Gvw0QsOa-7E==61WUiJ-q=9qAqN9E0L9hsmk+t12RJ9A@mail.gmail.com>
Subject: Re: [PATCH] mediatek/clk-mt8173-apmixedsys: use devm_of_iomap to
 avoid resource leak in clk_mt8173_apmixed_probe
To: Hao Ge <gehao@kylinos.cn>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, gehao618@163.com, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_174010_335802_6C84B1C8 
X-CRM114-Status: GOOD (  17.81  )
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

On Tue, May 9, 2023 at 11:12=E2=80=AFAM Hao Ge <gehao@kylinos.cn> wrote:
>
> Use devm_platform_ioremap_resource to take the place of of_iomap for
> avoid that we don't called iounmap when return some error or remove
> device.
>
> Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and=
 allow module build")
> Signed-off-by: Hao Ge <gehao@kylinos.cn>
> ---
>  drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8173-apmixedsys.c
> index 8c2aa8b0f39e..8a2a88c63d15 100644
> --- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> @@ -146,8 +146,8 @@ static int clk_mt8173_apmixed_probe(struct platform_d=
evice *pdev)
>         struct clk_hw *hw;
>         int r;
>
> -       base =3D of_iomap(node, 0);
> -       if (!base)
> +       base =3D devm_of_iomap(&pdev->dev, node, 0, NULL);
> +       if (IS_ERR(base))

From lib/devres.c:

 * Please Note: This is not a one-to-one replacement for of_iomap() because=
 the
 * of_iomap() function does not track whether the region is already mapped.=
  If
 * two drivers try to map the same memory, the of_iomap() function will suc=
ceed
 * but the devm_of_iomap() function will return -EBUSY.

The register range for apmixedsys given in mt8173.dtsi overlaps with
the HDMI phy. I'm concerned that would cause issues.

ChenYu

>                 return PTR_ERR(base);
>
>         clk_data =3D mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
> --
> 2.25.1
>
>
> No virus found
>                 Checked by Hillstone Network AntiVirus

