Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B5CECAAD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 11:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Y6slmLiEStk3SAV5P2VBUiGfRCGd21AEadH/l3GXUg=; b=xpdalnQi7kjrOIVUWatD8YaqHn
	/e93dmId7cgwpJXJl3ZbAzY0PbW/Fiz4L7vk5xWUBjBAd4ezoAbGaibwWBzku6qsNfBrTsY3xoZxU
	PX/UQfFes08FCfVzEhzOBpNt2T3gUbtUTYCnjvZiXkmuJarvPVcL0q1qABfPcM4wJYVNfPBH9XWhO
	26ZTG4b0EYn3MYesS+W+MiPvGDWYuO1AAFpPdN6TYtCA+ElvnOCyS4i1Vr3mYg57g/mMuaN5aNav5
	tzr/EgVxmRMcIMRa4cauQRnRo4OUrDo5r8qqCwIVABSmt+B1lki7TTe+9Oy1ed6gjtX2xss29XSdo
	+qBZoAjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oScnH-0081pe-J3; Mon, 29 Aug 2022 11:19:03 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oScn0-0081c0-5L; Mon, 29 Aug 2022 11:18:51 +0000
Received: by mail-wr1-x42b.google.com with SMTP id b5so9742492wrr.5;
        Mon, 29 Aug 2022 04:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=6Y6slmLiEStk3SAV5P2VBUiGfRCGd21AEadH/l3GXUg=;
        b=KLBfc+M/JLXURCR3AOZ3shzI4eXZOAoneqUu0gAJca1EcbP7U3snYwCyrFyj8zZ9Vs
         Z0q6ZvRwX76HwYowuMtf0QzxuAuxRE9d2nkGXLVO/x6jwhELI9bJTihTTvk+GM4CQ7pt
         q5NEJrQluBi6i7tpAgjVtYaSuafdrA3UJUZ47ZUnKivtkpxs3q7orVa7IJLfA6k0BCdG
         lGVsuX7uH1A1LWoiSMuMVfgbaWBX59//A4ryyxMnlCqZUdPXyhnadwx1dWhV8+yH3FKL
         14Tc3a2ob2TlXSwXAEVulvBTN6b8pbwrJYYcZNSUUL/1uNqs3xxDE9X3keYdMOMmeb65
         vytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=6Y6slmLiEStk3SAV5P2VBUiGfRCGd21AEadH/l3GXUg=;
        b=qsLKX3z7xd1Ht+u87QPwT6C5Gq16Tnr/QS/VhN/8c/Qpm1Nhg4snVKS+kYU8kzjCL+
         /C832GsqBztcG4dTXAOYeaF1aw/yzIOcX4/odgZbx9f5cR675yGSDi9ddyptWPHLw0Lk
         VoEH5HSMTbGHX+bQOaPeFgPnyFTiBXN7lxos0JWwWqm60r8UMOC+hEnNMoJAL76ChXtc
         qamPYpA6+ro6Ly2+i+45sHbgE8s0DiqBl5zLuo4UOOKcXgpA5rJ57yoFNB06wpx4LfKc
         VEufrKLnz0enIAgWGTFoJyWqHQN3sYsgg69QXpVRe4oIylaqvcWCXtYtCypHFnnbWDCY
         b6eQ==
X-Gm-Message-State: ACgBeo2cJPwwJjBiY5RUrIpJg04hL8EAPVrozRAjj6Sgd2Ar7Lxso++J
	jYbqV7tyNZNUwv4ryGlxy4c=
X-Google-Smtp-Source: AA6agR7wUOBv831RR9vPXNVN1xlDyiMTFsmanmANwV+5egTSjVEgQmKduYuE3lZVG+8ZkGMeNnGbZQ==
X-Received: by 2002:adf:ed50:0:b0:225:4c37:5346 with SMTP id u16-20020adfed50000000b002254c375346mr6030765wro.207.1661771919256;
        Mon, 29 Aug 2022 04:18:39 -0700 (PDT)
Received: from [192.168.0.30] ([47.62.125.55])
        by smtp.gmail.com with ESMTPSA id j18-20020a05600c191200b003a5c1e916c8sm30268815wmq.1.2022.08.29.04.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 04:18:38 -0700 (PDT)
Message-ID: <a8c87417-f37e-7c7a-a4a4-c5a01118e7a8@gmail.com>
Date: Mon, 29 Aug 2022 13:18:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 4/4] spi: mt7621: Remove 'clk' from 'struct mt7621_spi'
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, broonie@kernel.org,
 gregkh@linuxfoundation.org, neil@brown.name, blogic@openwrt.org
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <cover.1661599671.git.christophe.jaillet@wanadoo.fr>
 <76ed0ef91479498b9a2d5ef539f80851cffdb4ea.1661599671.git.christophe.jaillet@wanadoo.fr>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <76ed0ef91479498b9a2d5ef539f80851cffdb4ea.1661599671.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_041849_767374_06663B59 
X-CRM114-Status: GOOD (  16.05  )
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



On 27/08/2022 13:42, Christophe JAILLET wrote:
> The 'clk' field in 'struct mt7621_spi' is useless, remove it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

IMHO should be part of patch 2/4.

Regards,
Matthias

> ---
>   drivers/spi/spi-mt7621.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/spi/spi-mt7621.c b/drivers/spi/spi-mt7621.c
> index 114f98dcae5e..c4cc8e2f85e2 100644
> --- a/drivers/spi/spi-mt7621.c
> +++ b/drivers/spi/spi-mt7621.c
> @@ -55,7 +55,6 @@ struct mt7621_spi {
>   	void __iomem		*base;
>   	unsigned int		sys_freq;
>   	unsigned int		speed;
> -	struct clk		*clk;
>   	int			pending_write;
>   };
>   
> @@ -361,9 +360,8 @@ static int mt7621_spi_probe(struct platform_device *pdev)
>   
>   	rs = spi_controller_get_devdata(master);
>   	rs->base = base;
> -	rs->clk = clk;
>   	rs->master = master;
> -	rs->sys_freq = clk_get_rate(rs->clk);
> +	rs->sys_freq = clk_get_rate(clk);
>   	rs->pending_write = 0;
>   	dev_info(&pdev->dev, "sys_freq: %u\n", rs->sys_freq);
>   

