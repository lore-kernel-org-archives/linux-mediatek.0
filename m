Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83862C7EE29
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 10:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGXnOGM1R/yyJPY7joLo9berBrtUwFJ+ERQSRj++wKw=; b=Xw/4eoTb21SwhaxdRTxylfDA6t
	KCwkHWqFzkdg8f8d3mYJ1co0kIH2oSiWGMRMTjf8yIAarVYd5fih+NuHhJ4eUktRKYUg4f+5yolke
	q8/ly4MChBgUcqCUbWUrPUCp0y2QNTsECijESZ3dWu7v9lSMcKap7MPDj1htqus7hXLeZmX1XOhRo
	Ppxa9ieaEwHk/HpDg70XnghwWFU3SHgfgbw5mjzC+rxGofcYwvw1in2H6aaVKo0uEmlp5WRJLyr9v
	gOxMQ/dhLTEHMAO7l3ceg1Wc3POvK8CoAn5znnZcXzU6PsBlrs7mKCPdsT5ygWhK1NMz6UZEKB6r9
	IV9ZyT8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4f8i-002pSP-10;
	Thu, 01 Jun 2023 10:02:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4f8e-002pRP-3B;
	Thu, 01 Jun 2023 10:02:38 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C6E326602242;
	Thu,  1 Jun 2023 11:02:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685613755;
	bh=c9/JGj6n9dQavUzDKtvwfUUsDE5SYT/ikxE7N8P47Gc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eCSKJqgTXeHjGfxPPBH7NmCGLB7aQXG2i+QZ7NQPEk90733Fxr/8IrwTvYjDwg/3n
	 A6I9v3o+KtI0ezHRvI5edsGItxp7nqX/pNLsNuHUsHZn2wKYvTeDniTiMDIGwmtnO/
	 T2N6LOBB7SQXhBHubU8KC606oyVJMiqZdfFsDNkXdCIzBzfnT4bAtzm3uhxZgRqMe6
	 SJ6xdxuj851PTiA92EoeLkrSGtA81q7k4Uo7lK5R/ddO88Gv3Aev1nj1foQspVv16Z
	 b9w56KfyRH6Rbmld0pnivpFT91rwnBvCecFVrrn29eo3q0OTHKrH0tS7Rlbjmskhe4
	 EWuWe7HyQ0/Kw==
Message-ID: <86e1ee74-72b7-fc89-08ee-562980f2a4e9@collabora.com>
Date: Thu, 1 Jun 2023 12:02:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: mt8188: fix use-after-free in
 driver remove path
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com
Cc: dianders@chromium.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230601033318.10408-1-trevor.wu@mediatek.com>
 <20230601033318.10408-2-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230601033318.10408-2-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_030237_146810_C2BCCBFB 
X-CRM114-Status: GOOD (  11.12  )
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

Il 01/06/23 05:33, Trevor Wu ha scritto:
> During mt8188_afe_init_clock(), mt8188_audsys_clk_register() was called
> followed by several other devm functions. The caller of
> mt8188_afe_init_clock() utilized devm_add_action_or_reset() to call
> mt8188_afe_deinit_clock(). However, the order was incorrect, causing a
> use-after-free issue during remove time.
> 
> At probe time, the order of calls was:
> 1. mt8188_audsys_clk_register
> 2. afe_priv->clk = devm_kcalloc
> 3. afe_priv->clk[i] = devm_clk_get
> 
> At remove time, the order of calls was:
> 1. mt8188_audsys_clk_unregister
> 3. free afe_priv->clk[i]
> 2. free afe_priv->clk
> 
> To resolve the problem, it's necessary to move devm_add_action_or_reset()
> to the appropriate position so that the remove order can be 3->2->1.
> 
> Fixes: f6b026479b13 ("ASoC: mediatek: mt8188: support audio clock control")
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



