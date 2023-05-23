Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADF7C77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 12:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXiSekeK0+dNYQ7Rl2lu7vRoSGRXoE72FsEwh/pkNec=; b=gYK5kHHFfHYmzxZc7C9PeLsWpS
	OSLgOIO4hgWHychdCWKsxaQD/U5OdJXgzhLlJAkIapJONEEHF2JWUer2ao9Bh774jDpKjdJ9ZlGeJ
	EvN7Qtia4PIINcgP2rzii4bRL0xOcLiVmTzmxvC06nLhg/RmUOL48S1GZqf+jA2lK30kJ5MZBGz9T
	qucXczpNlYNfmT6xjb+ElQT4JwzuiC6qTj0KBdMdzXqJW26gewuLCr79Yj3vMYkf2uC/+UDbLMobA
	Hc09kEviz2xet25n5cgXUBwliME1czWzjY3wmWPJJ3Wz2lOVpmN1OxCkDP/DsVCbcZwc7/mp9p5gr
	sGm1WCyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1RSh-00AIQa-3B;
	Tue, 23 May 2023 12:49:59 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1QTA-00A7mQ-0S
	for linux-mediatek@lists.infradead.org;
	Tue, 23 May 2023 11:46:26 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-30a1fdde3d6so3408763f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 23 May 2023 04:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684842380; x=1687434380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wXiSekeK0+dNYQ7Rl2lu7vRoSGRXoE72FsEwh/pkNec=;
        b=t+w5SJpb+2rMXjGSrr+ycYAAGx3jSe8ZceNk2+WtAc/Sr1DyRn6buZJ1jzbRtn7zho
         xGL4A42tPWO2M2/8+rUPZiO25rWJ8jQHwfM+AOrPG0ADTxM9ph3ThMrRLEKW5XAHpdDi
         A83Joe5XH2/cQVUJoA+HwPS3S/obukDQo0SY2UjxHZEz4mDrU1dCojbSqWQo0nugyFcT
         ZCPDGkkyyouOas7o+JuldkAx407Zo2PuAfqHDCIb1x+NlfQuJzEpSpQ9O53lEvPdVsd5
         TlL0h2hmPIGc7rX69ilptpzz/OEQNnQiXbp5M1rEUbK22g2/Kg0pnsVSp4Dg8VL73JBb
         qpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684842380; x=1687434380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXiSekeK0+dNYQ7Rl2lu7vRoSGRXoE72FsEwh/pkNec=;
        b=W5l6Zz3z1gDiLLtfQIM1AV6TWjbWZ4208b2opWLloFytAEjdWf3dp7iwce8vf5aLX8
         o56krp+Qyo9Krmkk1sb4z4MINb6tuFvPo5DoX0WmrSw2Y6QFavsVc93PU7NzyrgEhlPG
         ro4MAWauT+ge+kvUwIbDrFMNZPezYzvDAd/nGd8YEA23w3S+CIh59F7bUZfcWd7M3UWF
         JfSlb89XgbCqJugCY5TxUu3C5n1iqGUVNyoGFsTIkk9m36rMvZkQNDXYINnRFtBh+sOA
         bqNOX5XSGUxFUHLYcw3pZACFiZzXjogkHBTaY7WWA0yF1Oxa24kzkibM3wqQiL1EPN9w
         f9eQ==
X-Gm-Message-State: AC+VfDxfc8f30IU+N1NIlD2VuLZuev1VEfw2ij44iKtlHcI//i9sEaiF
	tcgP8pOX28vSOn2gO4OVyB7/pA==
X-Google-Smtp-Source: ACHHUZ4vJR8IdN6rXRgEnWf9szojVeR1Ubr3de6/rFKhcPiTu8ggdv+zZEpWXWPQvFRZK8+eQJV04A==
X-Received: by 2002:adf:dd09:0:b0:2f6:208d:2234 with SMTP id a9-20020adfdd09000000b002f6208d2234mr10158434wrm.2.1684842379718;
        Tue, 23 May 2023 04:46:19 -0700 (PDT)
Received: from blmsp ([2001:4090:a245:802c:7f03:2fe0:bd27:d746])
        by smtp.gmail.com with ESMTPSA id i18-20020adffc12000000b0030631a599a0sm10805590wrr.24.2023.05.23.04.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 04:46:19 -0700 (PDT)
Date: Tue, 23 May 2023 13:46:18 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH] clk: mediatek: mt8365: Fix inverted topclk operations
Message-ID: <20230523114618.laajn2et5nbcxszv@blmsp>
References: <20230511133226.913600-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230511133226.913600-1-msp@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_044624_175130_ABEF17BB 
X-CRM114-Status: GOOD (  19.01  )
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

Hi,

just wanted to ask if I need to do something specific for it to go into
a rc? Sorry if I missed doing something for that, I haven't had to fix
something in an rc that often before.

Best,
Markus

On Thu, May 11, 2023 at 03:32:26PM +0200, Markus Schneider-Pargmann wrote:
> The given operations are inverted for the wrong registers which makes
> multiple of the mt8365 hardware units unusable. In my setup at least usb
> did not work.
> 
> Fixed by swapping the operations with the inverted ones.
> 
> Reported-by: Alexandre Mergnat <amergnat@baylibre.com>
> Fixes: 905b7430d3cc ("clk: mediatek: mt8365: Convert simple_gate to mtk_gate clocks")
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  drivers/clk/mediatek/clk-mt8365.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8365.c b/drivers/clk/mediatek/clk-mt8365.c
> index 6b4e193f648d..6d785ec5754d 100644
> --- a/drivers/clk/mediatek/clk-mt8365.c
> +++ b/drivers/clk/mediatek/clk-mt8365.c
> @@ -583,15 +583,15 @@ static const struct mtk_gate_regs top2_cg_regs = {
>  
>  #define GATE_TOP0(_id, _name, _parent, _shift)			\
>  	GATE_MTK(_id, _name, _parent, &top0_cg_regs,		\
> -		 _shift, &mtk_clk_gate_ops_no_setclr_inv)
> +		 _shift, &mtk_clk_gate_ops_no_setclr)
>  
>  #define GATE_TOP1(_id, _name, _parent, _shift)			\
>  	GATE_MTK(_id, _name, _parent, &top1_cg_regs,		\
> -		 _shift, &mtk_clk_gate_ops_no_setclr)
> +		 _shift, &mtk_clk_gate_ops_no_setclr_inv)
>  
>  #define GATE_TOP2(_id, _name, _parent, _shift)			\
>  	GATE_MTK(_id, _name, _parent, &top2_cg_regs,		\
> -		 _shift, &mtk_clk_gate_ops_no_setclr)
> +		 _shift, &mtk_clk_gate_ops_no_setclr_inv)
>  
>  static const struct mtk_gate top_clk_gates[] = {
>  	GATE_TOP0(CLK_TOP_CONN_32K, "conn_32k", "clk32k", 10),
> -- 
> 2.40.1
> 

