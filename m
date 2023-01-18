Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D10C004D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 06:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmoYt118ZjTHWWMfOpKXtSTl5dODMUSot4Q7h7871aQ=; b=XRkEsW74Gb/SjhMwMnquEFrOVw
	9Q0/ORXPlpR1UX+QxVGwW/Bt7sbJBFIoc2BW7VKxICHDSMpedLFeM1b7vMspBGCgTYI6MoQaedeC7
	Hoj/bN3xNzUtKqcLPZtjmXeGlag6d7B7orz3mG6oIuuXpq80FVUR4Tyt98vK1uCEHU10vc4Dw+gYx
	2An3f9bD2PLJ091aS1wZphFMf+/OxTIb9Os6H6oL31UY768njulnGHeBXUuRDV5oj4yyRXhr+vW8Y
	/xtpqe6BIPQDhRmm3im7/u0KGKCs0CYagFfkSzIxRLfAAag/dzv7CbjycixHDlRoBAlRvwHK+a38W
	GIrq0mtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI1n7-00H3XT-3V; Wed, 18 Jan 2023 06:19:21 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI1n4-00H3VT-O4
	for linux-mediatek@lists.infradead.org; Wed, 18 Jan 2023 06:19:20 +0000
Received: by mail-vs1-xe29.google.com with SMTP id n190so30810084vsc.11
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Jan 2023 22:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HmoYt118ZjTHWWMfOpKXtSTl5dODMUSot4Q7h7871aQ=;
        b=Nl9KinkqXcxjT/e+vkrm94TpWxXCeABRQjFPm4BbkjeBjvPpMA1T7v8HnCkyMX3tec
         FOs2nwRLTNzQ/72sj1uJXZ30hKqTJyy7x6i02+TyVLAWZKXTx03SjKmsO6skCknyjPcF
         FhiU50qVq/3HCzPUw5RrTRIMjpMC6jMzt8H/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmoYt118ZjTHWWMfOpKXtSTl5dODMUSot4Q7h7871aQ=;
        b=MyWZBqX3OoYydpnnR8jlA5P6SyJ1KG2OWkT4/XWkk3z2dB+wZWng27HGmHBjnWd45Y
         vJlCOIeBQ5NXyIRhabOZ4FthUO+PeuOIewvaejpjj8TfqqK0oQDk4+qZQV/nkSZ844rb
         Se57vhaXuR4wLE2HcqO+0D2iCvFwE19nBI5sIN6jt0Ltqk6OvT2hYKOm62joB6OHOkc6
         ilupRW8pLx+gJ1IOmBMiOft6fafJ9w4guinVAiV8D4eWMtoUKq0ih9bVG5QVbP6WGtGW
         LpPC1ApLS1PVBtf4usrXZpZFEg26w6IiitDpjjVRN2cwoWHTWo2YKi6eKZkfmJiv5CB8
         9EUw==
X-Gm-Message-State: AFqh2koowU7xnH+BbNKFWXZM7+sK0/8L1AATMlqpBECbntfm7xF132s4
	RslG8tuouuH1ZT6c7Y21lQQmV5iBtNsGeCm62t3MsA==
X-Google-Smtp-Source: AMrXdXu3q/Ccd/qwHpRaUkE33G8Umu51qE1leIZFT1QPLDHfxoeiG1OZzkV74A4nrlHy6l8ynvVuYlLo+T6KY38jv74=
X-Received: by 2002:a05:6102:54ac:b0:3d0:af13:3b6 with SMTP id
 bk44-20020a05610254ac00b003d0af1303b6mr744236vsb.65.1674022754865; Tue, 17
 Jan 2023 22:19:14 -0800 (PST)
MIME-Version: 1.0
References: <20230117172644.3044265-1-arnd@kernel.org>
In-Reply-To: <20230117172644.3044265-1-arnd@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 18 Jan 2023 14:19:03 +0800
Message-ID: <CAGXv+5HzDXoCNLQAEZ9u0wc82Qqd4vTA=RahQ=dXb-Y-ySvWWA@mail.gmail.com>
Subject: Re: [PATCH] media: mtk_jpeg_core: avoid unused-variable warning
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bin Liu <bin.liu@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, kyrie wu <kyrie.wu@mediatek.com>, 
	irui wang <irui.wang@mediatek.com>, Dan Carpenter <error27@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Colin Ian King <colin.i.king@gmail.com>, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_221918_825297_BFD03A6A 
X-CRM114-Status: GOOD (  13.68  )
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

On Wed, Jan 18, 2023 at 1:27 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The only reference to mtk8195_jpegenc_drvdata is inside of an #ifdef:
>
> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1879:32: error: 'mtk8195_jpegenc_drvdata' defined but not used [-Werror=unused-variable]
>  1879 | static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
>       |                                ^~~~~~~~~~~~~~~~~~~~~~~
>
> Fix this by just removing the #ifdef and the corresponding
> of_match_ptr(). They don't actually serve any purpose here since the
> driver is only usable when CONFIG_OF is enabled, and build testing
> without that is not a problem.
>
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

