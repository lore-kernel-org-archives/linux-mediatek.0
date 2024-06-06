Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01190C27C54
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 11:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5ZoxAX3V1yyCIWyUHQ5fGq0S6iu0NHXAY8T8ZAPKRM=; b=0gMtzRlnKDWESprF/Ul0+RQNKl
	yVvrl0gtDxBS0M+BRrcknYR+ei7E6V5SkGpbPQgA3ixv3FeYhlaX9EzRJTXyKPieRkwtESUj8B2ap
	eGBSnBtRPQ/ntjMi9swUL+LfsbXiGwUNtGYMm44IUmBASnH0ZGHtagd7aNTPz+P+f90x0sz6F7mwP
	kgXW68p/7M+20ecIDapmqvfjgZLFNkeh8FQiDVN0txHriGIvkQkDMpqwQhO4ENKp4L/BvwChmO/bg
	aXLfAQqVSW6QvI7mupFtKOgXM91ibfnic4s580eP6/c0HDwWJ3ZJfJVQKSK4XVfo6HOnvPg93Phjn
	hud2GVJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFB84-00000009VDs-1ySY;
	Thu, 06 Jun 2024 11:18:00 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFB80-00000009VD2-0c16;
	Thu, 06 Jun 2024 11:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717672674;
	bh=VJsGuflgVuhkEcQET0ZB89PBSUmSGzHB3ghc2Wmgec8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=xfhWE7cGqHJp6FaBCB/mR3Fq6vVXwZyKdvV85SdYhY1sF1PXdIL02BTKb0a+LJUgK
	 Io6nQXNsqONsLSuB2gPLWMiAUf2YO9Kj5mgN7xDqTCWpyS7mFiivEj1uiH8bSweep6
	 nqG77iq2rRCdiZpTOVS7ay3m77Epewd4Q4LeM3sIWs0Afixnmm88p1k/z+jkckd+Ij
	 yLT0U3J+LpIavfvnUfd8QRmypC4Hwk2BcDFpjxStQ4LGfMn2kA3hb2I/Q+QfkhJZss
	 1XP6Y4ezRjZ2xv5aEJTI4y/8gIAktDsyhVBDbZTSGeWk9Ixb/iA37vlWjwqIPmZSAd
	 +AmLnTxeMx6ug==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DF855378061A;
	Thu,  6 Jun 2024 11:17:53 +0000 (UTC)
Message-ID: <53ca5125-53d7-446a-aeb4-a506549be1f4@collabora.com>
Date: Thu, 6 Jun 2024 13:17:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.10/5.15/6.1] clk: mediatek: Add memory allocation fail
 handling in clk_mt2712_top_init_early()
To: Aleksandr Mishin <amishin@t-argos.ru>, Weiyi Lu <weiyi.lu@mediatek.com>,
 stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sasha Levin <sashal@kernel.org>, Markus Schneider-Pargmann
 <msp@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 lvc-project@linuxtesting.org
References: <20240606110955.35313-1-amishin@t-argos.ru>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240606110955.35313-1-amishin@t-argos.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_041756_756099_213BA33A 
X-CRM114-Status: GOOD (  16.94  )
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

Il 06/06/24 13:09, Aleksandr Mishin ha scritto:
> No upstream commit exists for this commit.
> 
> The issue was introduced with commit e2f744a82d72 ("clk: mediatek:
> Add MT2712 clock support")
> 
> In case of memory allocation fail in clk_mt2712_top_init_early()
> 'top_clk_data' will be set to NULL and later dereferenced without check.
> Fix this bug by adding NULL-return check.
> 
> Upstream branch code has been significantly refactored and can't be
> backported directly.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 

...the fixes tag is still missing.

Regards,
Angelo

> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> ---
>   drivers/clk/mediatek/clk-mt2712.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
> index a0f0c9ed48d1..1830bae661dc 100644
> --- a/drivers/clk/mediatek/clk-mt2712.c
> +++ b/drivers/clk/mediatek/clk-mt2712.c
> @@ -1277,6 +1277,11 @@ static void clk_mt2712_top_init_early(struct device_node *node)
>   
>   	if (!top_clk_data) {
>   		top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
> +		if (!top_clk_data) {
> +			pr_err("%s(): could not register clock provider: %d\n",
> +				__func__, -ENOMEM);
> +			return;
> +		}
>   
>   		for (i = 0; i < CLK_TOP_NR_CLK; i++)
>   			top_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);



