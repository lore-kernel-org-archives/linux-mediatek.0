Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EB8C7115B
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jun 2025 15:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niIEC24pa2jxdKXkefJ3vkZfAtNqJpvIieuArrIyjOQ=; b=wOPMEM+8Vh55BhQihz1XMPRZmg
	fNbuj6bUnfNkhe4uRyc3BBKFZE8a0Fza74V8qdyMFvNYrtA5NJ1g1vsv9vph0gXLzuyuEOH+k5R0t
	Z8UEqQBV3CUVA+ohfkxDm0qHl69uXQLw0U2YfYlyPelWzszpE9HfIHxwrqepOBueQdnp7+ybt/Nsd
	K8FcaMOalnMK8KPl0fuyBbWIKh8ABx+ELLVEAxkYH0M1OYMRmp6LbEPqKHo115+hvb0l6bLLFom96
	awGfsihwNVr94TrAj0QHz/jHhZ+oHtXmzu+D0r79u4QF+UelH7pRF49z6yplOulMNAwHrKSIBxXE4
	prR6/iWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHRn-0000000DRuH-3zoW;
	Thu, 19 Jun 2025 15:45:03 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDK0-0000000Cqfy-1UnH
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Jun 2025 11:20:45 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e8187601f85so679465276.2
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Jun 2025 04:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750332043; x=1750936843; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=niIEC24pa2jxdKXkefJ3vkZfAtNqJpvIieuArrIyjOQ=;
        b=QZt8lqDvVmkO6EjTJwnRNGre11Cu4SS2KpHTqiesXVT/SJ5P/HtT//1QTGY87/BXx/
         UnID803UoRnuw+1hGeBfpPGbuij398xrws08BN8yoiSfOl6JCPhjrFs19VGKmc1GXgU3
         /s4azL0ILygmWWZzktGcPEdws+yo7VxEOXFY5OBaJU8L+kSYZzT/YeCJTlZ7PcFokAg8
         rwrEPwbmPthntGcrQdjnOP20Ac0SFh2PDVhJCMyalYMJt17iV5esT5I53TxkJSr25kX7
         3Rt+/M0J2r4rfZXlPIlZAHh/TkZmDf4ZEdfXLdYxbB4dF1bi2oVBr0zn1kyYfxdSUvOf
         vvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750332043; x=1750936843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=niIEC24pa2jxdKXkefJ3vkZfAtNqJpvIieuArrIyjOQ=;
        b=nmRjyI34IlR6RCt4TFxYe7tJCn/864lagtMQazky5ocbLkJaTF45+uwz3klnXKiV/H
         sb2IuKdsgGnq+88sIIeviUeWeFAx6ZVnK/m61H+LAw+zM63x2SObnAGS6MS4eSC4D51v
         hGSiMtmTx0CQCnp2A/1R9qXBVlVl4C6JRnSnVuwFU1sqazwNhJp2i9l7tAyc71Iqys8x
         8QDkjj+dw7QGhTFsHRZfdkbf5HVIN45bKEFtCOaDKnIbZIWAGWdj3AeHdpW5kaA75q5u
         uV6xzaRnPZPx3awdesFjVCsOYZ2K7rEn8+byWrcHuo+U3W+C8R0OU8V3GJcwbrQRnfwh
         2QRg==
X-Forwarded-Encrypted: i=1; AJvYcCVsEUFybYuI8c0GaRjSb/Vn8I2ecn2Vr/EHexaINwtmRGGNbNyDLl0Er+QMKn0svwtfTYrrhA3qwv0dNCcP1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzquBliYNk0dg8uK+UESxXKGZii9r3yR4voJdge7vzQJRfaEMDI
	WnTsvOrDlSX5EQ6mTqHrqUvNQxGWdiQ9fxob/AP0EcJI5ejiqTu+JktsS8UVI/7w8fpCqkp/gRp
	p2AVSi2w8O8YB7zqgahEXrgCycbNL6JqEMufsiYLCuA==
X-Gm-Gg: ASbGncvWaby/Zvr9KsIjujATkra5H6muNbHYZ84LE9raMhiRSunfPdKhGwvWqnt8wiB
	4EJ3xDFqXFXziur97XulNPqSZHXNWTHLK9OCN5iQJnT3B4UQ24rNT5/HL6s38Rw18L2vtkaBciP
	g3ushFhhoXDY6fciELUtKoLTh93kHsZkldU0E40nPnLskD
X-Google-Smtp-Source: AGHT+IF2iE0ox/gzxKHz5bI8Q+Pkgb8UWe4OY/z3MjCCMZXinEnzR7Rqk/xTiCIm/KwZ4rpmEsnSRUYX7m4o4AQKZbE=
X-Received: by 2002:a05:6902:cc6:b0:e81:7e16:aad7 with SMTP id
 3f1490d57ef6-e822ac7a461mr27597842276.24.1750332043584; Thu, 19 Jun 2025
 04:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
In-Reply-To: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Jun 2025 13:20:07 +0200
X-Gm-Features: AX0GCFvXjxV2EcT_wfBSHPu57s1TY2VkiQlHaijGThkd0p21SEv0wZoDeoPKInc
Message-ID: <CAPDyKFpCPLCxp54yjBAaLz2tJK6Ouk-ikpvs9uby7aXnic=U7Q@mail.gmail.com>
Subject: Re: [PATCH] mtk-sd: Prevent memory corruption from DMA map failure
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tomasz Figa <tfiga@chromium.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_042044_394785_83A31B7D 
X-CRM114-Status: GOOD (  21.34  )
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

On Thu, 12 Jun 2025 at 13:26, Masami Hiramatsu (Google)
<mhiramat@kernel.org> wrote:
>
> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
>
> If msdc_prepare_data() fails to map the DMA region, the request is
> not prepared for data receiving, but msdc_start_data() proceeds
> the DMA with previous setting.
> Since this will lead a memory corruption, we have to stop the
> request operation soon after the msdc_prepare_data() fails to
> prepare it.
>
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Applied to fixes and by adding a fixes/stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c |   17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 3594010bc229..56b4999fe58f 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -834,6 +834,11 @@ static void msdc_prepare_data(struct msdc_host *host, struct mmc_data *data)
>         }
>  }
>
> +static bool msdc_data_prepared(struct mmc_data *data)
> +{
> +       return data->host_cookie & MSDC_PREPARE_FLAG;
> +}
> +
>  static void msdc_unprepare_data(struct msdc_host *host, struct mmc_data *data)
>  {
>         if (data->host_cookie & MSDC_ASYNC_FLAG)
> @@ -1466,8 +1471,18 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
>         WARN_ON(!host->hsq_en && host->mrq);
>         host->mrq = mrq;
>
> -       if (mrq->data)
> +       if (mrq->data) {
>                 msdc_prepare_data(host, mrq->data);
> +               if (!msdc_data_prepared(mrq->data)) {
> +                       /*
> +                        * Failed to prepare DMA area, fail fast before
> +                        * starting any commands.
> +                        */
> +                       mrq->cmd->error = -ENOSPC;
> +                       mmc_request_done(mmc_from_priv(host), mrq);
> +                       return;
> +               }
> +       }
>
>         /* if SBC is required, we have HW option and SW option.
>          * if HW option is enabled, and SBC does not have "special" flags,
>

