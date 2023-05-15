Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D492EC77B7D
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 14:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0DiisSo683m3i0CtQ3yQWMKcJ8Co/s5M4sF/kacxHs=; b=ulOM+xiThSVG8ZHsWZS1H/f5rh
	JhMZ4Tlb7TmlV5OgtrGd5KcBS0EpSPaG692lymxOl2L/SLILVnbZP6BarA3jtOKxcxp6l4KvmokOX
	SdqcphpFEiGSD1bupN6Ta1DdTyIoO5d9ItQFFK6Ing72rDa8k/dUAT4yBIscvvVB20WgNecDSzz66
	ge8TuRaOsIx41O4ms6tm5gm/ZrA+qZLGjW7y00uDoFrkVvNjyqov9aR5CKz/7te0grl/OXD09+A4f
	D3VOF7FJz3YpD2FbxUZSLW33gtA4as9xJDqaUPIeRqrOp89TmzeKAtmQOCz4d678H6pGP8WJxRjNy
	MDTJoOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyYnG-002LSN-2k;
	Mon, 15 May 2023 14:03:18 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyYnD-002LQC-2w
	for linux-mediatek@lists.infradead.org;
	Mon, 15 May 2023 14:03:17 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50bc4ba28cbso22737524a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 May 2023 07:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684159383; x=1686751383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z0DiisSo683m3i0CtQ3yQWMKcJ8Co/s5M4sF/kacxHs=;
        b=hIyeq/mPeDlCaya/kKezu+rqFTtatpC901dim+Ujyz0g+bz8yMHx4Jweh8MWvJZUjH
         yxQZBWKvDb9Nd78PTR+MC0aQ7cdvDHA1qL7l/4O0Y1vY5l2zPPEC1CPZipLEiy6b4+sX
         Er7K2alvATSLEQg2fLhPYB7m9WiATe4qBtyAI85iCsGAQif6VVjOoRwHGIkk2dIvwccb
         6xiZ0lD9KINRaxe/n1yPwz661NcQJSWI1CEdL1Cws6WQf1h+KfmD/U1zOAaYGXD94fuI
         OxngoTY4F28ujeYCUR3tWoUjyYYEPmj0hC4zc+RtbR4IvUVKCEH0yl6SEkRsclVMZQPC
         bK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684159383; x=1686751383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z0DiisSo683m3i0CtQ3yQWMKcJ8Co/s5M4sF/kacxHs=;
        b=c3DRjzwhNaUjuoqfVhYlI2lRuAJNdAZDwZNXixCVp/E1cYCxDfiTZUKCPjPg1xjXE4
         vgK6wi9Ad8Zo7KjG01qAin/dAf+8itKdPo/QOi7cNFc1SKfQOc8u6x2xTF9+bOvRtSKM
         ZpsuutozOG6o4l9bmmn2Nf0vJ8yoKq6ZEDUFVuWoc9uS4QnZ5WA9AwSLNQL0pzuQdO/y
         Vu7snzgm5WYd/qUslmsyvn05YFWUDdjesmJOO9gVNe4YO2ZqsMuhnJeUzzkYaJBz27Vv
         Re5b/iNw2U8fSz01Yv4GYzzA4gqMlI6fw6KOw3T1AHCOEOi7PsegoO4lCFEvVTmaD9+f
         I3TA==
X-Gm-Message-State: AC+VfDxFT9n8GsD4wSsdug0fx9Np6acGsy5MxKVYJMm9v9tifuzcQ++P
	XNiu5mVNfwIIP76BKEY9rquF6w==
X-Google-Smtp-Source: ACHHUZ6jy8PlGoDXknS54H8Fbgy6cRaFw0JExzPbUPci3eXrUJzDLcT1vD+HtAvXFBb0dXQeDs8qDQ==
X-Received: by 2002:a05:6402:61a:b0:506:82b7:10c3 with SMTP id n26-20020a056402061a00b0050682b710c3mr26792321edv.41.1684159382974;
        Mon, 15 May 2023 07:03:02 -0700 (PDT)
Received: from blmsp ([2001:4090:a246:80f3:8aa8:d43a:eac2:eb38])
        by smtp.gmail.com with ESMTPSA id h21-20020aa7c615000000b0050bcaedc299sm7329847edq.33.2023.05.15.07.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 07:02:23 -0700 (PDT)
Date: Mon, 15 May 2023 16:01:53 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH] clk: mediatek: mt8365: Fix inverted topclk operations
Message-ID: <20230515140153.ppjl4zyshscvcbuu@blmsp>
References: <20230511133226.913600-1-msp@baylibre.com>
 <8603c2b2-2a5b-48f6-9b08-9b3b518b716b@gmail.com>
 <aa383909-7a03-eb24-3a61-397f2a6adb54@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa383909-7a03-eb24-3a61-397f2a6adb54@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_070315_950094_5024CC41 
X-CRM114-Status: GOOD (  19.96  )
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

On Mon, May 15, 2023 at 01:49:54PM +0200, AngeloGioacchino Del Regno wrote:
> Il 12/05/23 13:51, Matthias Brugger ha scritto:
> > 
> > 
> > On 11/05/2023 15:32, Markus Schneider-Pargmann wrote:
> > > The given operations are inverted for the wrong registers which makes
> > > multiple of the mt8365 hardware units unusable. In my setup at least usb
> > > did not work.
> > > 
> > > Fixed by swapping the operations with the inverted ones.
> 
> ...with the not inverted ones, you mean!

Actually now I am not sure how to express it correctly, maybe I should
have just left that sentence out of the commit message.

I meant replacing the no_setclr_inv with no_setclr for TOP0 and no_setclr with
no_setclr_inv for TOP1/2.

Best,
Markus

> 
> Anyway,
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> > > 
> > > Reported-by: Alexandre Mergnat <amergnat@baylibre.com>
> > > Fixes: 905b7430d3cc ("clk: mediatek: mt8365: Convert simple_gate to
> > > mtk_gate clocks")
> > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > 
> > > ---
> > >   drivers/clk/mediatek/clk-mt8365.c | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/clk/mediatek/clk-mt8365.c b/drivers/clk/mediatek/clk-mt8365.c
> > > index 6b4e193f648d..6d785ec5754d 100644
> > > --- a/drivers/clk/mediatek/clk-mt8365.c
> > > +++ b/drivers/clk/mediatek/clk-mt8365.c
> > > @@ -583,15 +583,15 @@ static const struct mtk_gate_regs top2_cg_regs = {
> > >   #define GATE_TOP0(_id, _name, _parent, _shift)            \
> > >       GATE_MTK(_id, _name, _parent, &top0_cg_regs,        \
> > > -         _shift, &mtk_clk_gate_ops_no_setclr_inv)
> > > +         _shift, &mtk_clk_gate_ops_no_setclr)
> > >   #define GATE_TOP1(_id, _name, _parent, _shift)            \
> > >       GATE_MTK(_id, _name, _parent, &top1_cg_regs,        \
> > > -         _shift, &mtk_clk_gate_ops_no_setclr)
> > > +         _shift, &mtk_clk_gate_ops_no_setclr_inv)
> > >   #define GATE_TOP2(_id, _name, _parent, _shift)            \
> > >       GATE_MTK(_id, _name, _parent, &top2_cg_regs,        \
> > > -         _shift, &mtk_clk_gate_ops_no_setclr)
> > > +         _shift, &mtk_clk_gate_ops_no_setclr_inv)
> > >   static const struct mtk_gate top_clk_gates[] = {
> > >       GATE_TOP0(CLK_TOP_CONN_32K, "conn_32k", "clk32k", 10),
> 
> 

