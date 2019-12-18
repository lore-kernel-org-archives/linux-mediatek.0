Return-Path: <SRS0=QBl7=2I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF9DC43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 02:46:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4AE321775
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 02:46:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pzeCiieg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4AE321775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=869N8Xt7fhKDQ1MZn6RvAxMje7SC5QnuDQUf25iVsA8=; b=pzeCiiegDVeTB3
	mJg8qcryjTHR5PGUG/L9HP7AqCwEcGWvglbB+BZh3hd8WW9FxCOZ/o+QxbVEe70kBCtiZhvcWx2aK
	6BwwrGsIOrI7izv65iksY7RZQDuCfqcMnP8xTlcBZJENeulfvb3pOQFK4RPWHZHCDbMbI+Za73DUo
	Vo3uvrtVr+VIHXw2Oz1xKJMLOnVdJAX7mjaZOsQFa0/wIZYHi2v42cbj56BWb9mZHmNkHr8n7Eey7
	ZgPV+CyjJgN7H7wZLtCdY4D064exTJWhaggFImo35+puYx2/Kahyf/PBvsa1iVYvoiaJ3p7zhjESS
	bgRF6yGFi8OH5zL86vng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihPLx-00029Z-Fh; Wed, 18 Dec 2019 02:46:21 +0000
Received: from mail-ed1-f68.google.com ([209.85.208.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihPLk-0001wB-2A; Wed, 18 Dec 2019 02:46:09 +0000
Received: by mail-ed1-f68.google.com with SMTP id c26so372312eds.8;
 Tue, 17 Dec 2019 18:46:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vxwj4gd/9Empd7D3FvHODrnvOnRhpeyanogRcG726ys=;
 b=N9w2qj4FVyUPDpeE0hfN5gphda3dQ0fYT8kK2GT+xiFtyqC0DoJbkd3/MMIw0YiNdD
 zr50D9/VgDE0zJo1hbj4XjcSNgGUzpMp4+c0ytF/Hmx/d7AyTAxFlK6LQ58V/K0h3CaP
 aDE8vH0vceZrcMOLK90V1JTVQLzzlghRRzyco7WogvST1qsz7LFUNywAcaG4L/OCeqpX
 N1GTk6oYG23DXI3RTWkO7wSzgxlsn6eWWwmMDfk8AifP+Oq07khMids8tyik4PTUUkLv
 ALhCZxU2nDNInW0lL5+Fa3EOT+sVUMaAacVDvUTwEvJQJK293UsEnCaPtaenLTfNxbPt
 /1xw==
X-Gm-Message-State: APjAAAUppxtEwIrmoj3iX4LW8LXbvDf5uccB5B0nxP6eeO8wjVZnZ1go
 1CZq0QiRCv7IDYUjzLMt2POOpLwlv7w=
X-Google-Smtp-Source: APXvYqwJSuCj7yXW5zQ1fzUvytfkh6teQkiqVhGTdxYgtt7zdbGI3edhTDLrLn4/mjn+5YS1SE1Edw==
X-Received: by 2002:a50:9e01:: with SMTP id z1mr1037183ede.232.1576637165200; 
 Tue, 17 Dec 2019 18:46:05 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49])
 by smtp.gmail.com with ESMTPSA id s12sm36898eja.79.2019.12.17.18.46.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 18:46:04 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id g17so615959wro.2;
 Tue, 17 Dec 2019 18:46:04 -0800 (PST)
X-Received: by 2002:adf:81e3:: with SMTP id 90mr1136437wra.23.1576637164034;
 Tue, 17 Dec 2019 18:46:04 -0800 (PST)
MIME-Version: 1.0
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
In-Reply-To: <20191214175447.25482-1-tiny.windzz@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 18 Dec 2019 10:45:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v67kgMcV5hhURYzMCggeTSnOoupmYKDPViS0tiYFSxOfjA@mail.gmail.com>
Message-ID: <CAGb2v67kgMcV5hhURYzMCggeTSnOoupmYKDPViS0tiYFSxOfjA@mail.gmail.com>
Subject: Re: [PATCH 01/10] soc: sunxi: convert to
 devm_platform_ioremap_resource
To: Yangtao Li <tiny.windzz@gmail.com>, Maxime Ripard <mripard@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191217_184608_108660_5A3AFED4 
X-CRM114-Status: GOOD (  14.57  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, leoyang.li@nxp.com,
 "moderated list:ARM/SAMSUNG EXYNO..." <linux-samsung-soc@vger.kernel.org>,
 Andy Gross <agross@kernel.org>, khalasa@piap.pl, Kukjin Kim <kgene@kernel.org>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jun Nie <jun.nie@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Dec 15, 2019 at 1:54 AM Yangtao Li <tiny.windzz@gmail.com> wrote:
>
> Use devm_platform_ioremap_resource() to simplify code.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/soc/sunxi/sunxi_sram.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
> index 1b0d50f36349..f73fbcc73f51 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -320,7 +320,6 @@ static struct regmap_config sunxi_sram_emac_clock_regmap = {
>
>  static int sunxi_sram_probe(struct platform_device *pdev)
>  {
> -       struct resource *res;
>         struct dentry *d;
>         struct regmap *emac_clock;
>         const struct sunxi_sramc_variant *variant;
> @@ -331,8 +330,7 @@ static int sunxi_sram_probe(struct platform_device *pdev)
>         if (!variant)
>                 return -EINVAL;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       base = devm_ioremap_resource(&pdev->dev, res);
> +       base = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(base))
>                 return PTR_ERR(base);
>
> --
> 2.17.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
