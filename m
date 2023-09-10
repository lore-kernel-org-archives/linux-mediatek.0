Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5857FEE57CD
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Sep 2023 13:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3yiYILhEuCNUQeqPmsTOJF5pdnP1MyjjDZaseeFDik=; b=Fkk1bxypuDsDAiglldRgFEm+za
	cFtiJzcahQjixlsuuo68dEx6Agz/xOJdp0IGK56RxqJrCszGoOow4JdYq+2vvnVMSvKwJHyne+mBW
	2GMUt9ffq6rJIHUdJb4sOiMv+zpX3lZWtjacJfHe0LdnrhgXQgocyYRuPs9OjT5unEEmV3m+Ryn3L
	OAoctXOxaLlPDLoF81w0jF4qrpQ74SqNPsMj/SfqrLhVYmzRo4WTNTU+2zWpEXg5fT0ay31bGOVQq
	Beh+dbROM9sVP9r6L31wCAeSyEYTxIrwGUpc5BPfQuxezG/A7R3i6i4udHzbT0+UGZ8iyNowKS0t8
	OutIjDlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfKO1-00GdJc-2i;
	Sun, 10 Sep 2023 13:22:01 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfKNu-00GdGb-0W;
	Sun, 10 Sep 2023 13:21:59 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31f6ddb3047so3357522f8f.1;
        Sun, 10 Sep 2023 06:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694352105; x=1694956905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3yiYILhEuCNUQeqPmsTOJF5pdnP1MyjjDZaseeFDik=;
        b=mnyGLyViapmBQaLOXbO09X0p438/h8dlQXPdQEHM/vMZ9sTImCyqcyhnqDG9+YacMB
         F4KhEkopOrWrTrIXmGrTTcXK6Od3VJ0A1Za48b4TsAkizrpkTV/Zn9dYT4JAvGlWnGFk
         YGpYla1MmLSTqP6fiXVQmqrMAXV8hmp+8ZhihXQFbOQ2Flt0m96G4ph9dhFv/sdGzYdA
         aUfNiwwbWtp948Vh3/JghhDSgOND/W5ZV1YFbbBHWAUDG+NSy1VkSAYz09hNrrRIGvFa
         gOmMtsJGKlOuj4UGcNLDDkpJt6qmQwZGwJONyfheytfP4ibBtFxIZpAwfTVQ+a8zZXRo
         4UsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694352105; x=1694956905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3yiYILhEuCNUQeqPmsTOJF5pdnP1MyjjDZaseeFDik=;
        b=SE9LSfd41JQkjEMc4Q+6FijmOSHv/J4tXoDLoywWQlrAGGBkW/b6D3TX61c0WFO0dK
         cg9vgvkhxPmCBPd7x83D07ykoMuVyEzl7rkw3B4V59hGDrBv+wimaw4EbyU9jzeAVcHr
         642gHgk6bemDDmFs6uSMvQ3jgeOeVa24yfjEGNfQDuKimHx/X5aeRHfTnaK3aPZLqTdK
         iUFyjHw10a4Mxms9b+TEWxZsoM41xqo8pe3r/u0EAXY2LjBrd4euX7hglVzXZOjGUVAB
         G/6kRnkenITWg7dOqZifONLWhfrkkKIf9aP4CNFzn7lfCxSZawP8IfLVuoKczAgfvnKE
         Wpiw==
X-Gm-Message-State: AOJu0YyBpxsFKAmPkA7PtP7qLgesF8Oq+3RvzOuLjwfY4aCnK0TOn7Mg
	ntORrpjB7HB5dXZhGZR/WTs=
X-Google-Smtp-Source: AGHT+IHBW5u0oYJcRGEvrYuxS4KJf+ofoX9BINJgRqjlcAtgbTBDPybxSD7j2EjBbYgPCuTfVGTdFA==
X-Received: by 2002:a5d:4809:0:b0:317:73d3:441a with SMTP id l9-20020a5d4809000000b0031773d3441amr5628694wrq.46.1694352104814;
        Sun, 10 Sep 2023 06:21:44 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id d22-20020aa7ce16000000b005233609e39dsm3358895edv.30.2023.09.10.06.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 06:21:44 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
 ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v6 14/18] media: verisilicon: vp9: Use destination buffer height
 to compute chroma offset
Date: Sun, 10 Sep 2023 15:21:41 +0200
Message-ID: <4856958.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230901124414.48497-15-benjamin.gaignard@collabora.com>
References: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
 <20230901124414.48497-15-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_062154_199464_07C5E111 
X-CRM114-Status: GOOD (  14.46  )
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

Hi Benjamin!

Dne petek, 01. september 2023 ob 14:44:10 CEST je Benjamin Gaignard 
napisal(a):
> Source and destination buffer height may not be the same because
> alignment constraint are different.
> Use destination height to compute chroma offset because we target
> this buffer as hardware output.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Fixes: e2da465455ce ("media: hantro: Support VP9 on the G2 core")
> ---
>  drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c index
> 6db1c32fce4d..1f3f5e7ce978 100644
> --- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> @@ -93,9 +93,7 @@ static int start_prepare_run(struct hantro_ctx *ctx, const
> struct v4l2_ctrl_vp9_ static size_t chroma_offset(const struct hantro_ctx
> *ctx,
>  			    const struct v4l2_ctrl_vp9_frame 
*dec_params)
>  {
> -	int bytes_per_pixel = dec_params->bit_depth == 8 ? 1 : 2;
> -
> -	return ctx->src_fmt.width * ctx->src_fmt.height * bytes_per_pixel;
> +	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / 
8;

Commit message doesn't mention bit_depth change at all. While I think there is 
no difference between dec_params->bit_depth and ctx->bit_depth, you shouldn't 
just use ordinary division. If bit_depth is 10, it will be rounded down. And 
if you decide to use bit_depth from context, please remove dec_params 
argument.

Best regards,
Jernej

>  }
> 
>  static size_t mv_offset(const struct hantro_ctx *ctx,





