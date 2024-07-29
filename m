Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5AEC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 07:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wldZjhWnzQg5dQ5Yjwp1BBLS7PyB7vQg3HldfNd+Asw=; b=X2w42OWKKieeCzCrWdUHefZfKj
	Iur8UDY67nDaodCdnaj4Mf7Uvgh1j7Pi9O1eb1xHEL8a1UfpGHEIvzRB3CEIJ2c2VxX16xyxoCPLd
	zlJzNQ2kDlPBPOfzv8XhjPauzwCiZl+WhfgbhGvNplVJCIZZVmsecrdGxvbVqLkZyY6Q91dOARxNo
	t1swXInwRAvBeqJc/lS/LKmrKPtGMmZlMMNoiHfu+tniEQ87YyGNyVec9HFLDguOQyfYLM8kZXufd
	FIM5xU2+aFs9nFw0y1/QljWjmw1ZhM8T1LtqKLSlfiH6Cg11Cq0sC4oGlfRQhy+9v6KTh24sNkRkM
	O21Vtr4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYL8C-0000000AQHF-1rE1;
	Mon, 29 Jul 2024 07:49:20 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYL7Z-0000000AQ3V-2CB0;
	Mon, 29 Jul 2024 07:48:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722239320;
	bh=A8Z6Mxp06bKeJRw0NTJSBTiE6BVE4kHHuIOZ1xZxo+E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y3qXOj+QQnmdaG9dKCCYDmsA+fwTcvEjrrGuhkIHfggudxrLT2sRIhFE27GAaEekt
	 Rx85dhLyGzv6FKFCbaJY6qrAiyt6ckSa017F6Xb4HPJTdidyc+O0o3Kef4w+9qiDIJ
	 1bKoZKnFQKbTB+JkM33VSY4oC2o+V9ysDgPeqU2ZVSEnOgFWguTEq9+2Zbdf2Uffbn
	 jvZ003zAKna8f8qbtPXDQFJUG3yPOspncCjqZKiP/OjffD+kX1fcMD5uAHo5XPW5PT
	 R559Pie+PgcPGlnecLnPl62kYY10GbABLJhrxmIW0ag1nGV9FPMeE0DMalvuYqWs38
	 6h0We8gp67FIg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B66B8378148F;
	Mon, 29 Jul 2024 07:48:38 +0000 (UTC)
Message-ID: <6cc155fd-c4e6-4c5c-b3c2-d1a3e7b70bf9@collabora.com>
Date: Mon, 29 Jul 2024 09:48:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] soc: mediatek: mtk-pmic-wrap: Drop CAP reset in
 MT6765
To: Arseniy Velikanov <me@adomerle.xyz>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, sean.wang@kernel.org,
 linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, frank.li@vivo.com, jiasheng@iscas.ac.cn,
 mars.cheng@mediatek.com, owen.chen@mediatek.com, macpaul.lin@mediatek.com,
 zh.chen@mediatek.com, argus.lin@mediatek.com
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20240729073428.28983-1-me@adomerle.xyz>
 <20240729073428.28983-6-me@adomerle.xyz>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240729073428.28983-6-me@adomerle.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_004841_796561_CF6104D0 
X-CRM114-Status: GOOD (  15.13  )
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

Il 29/07/24 09:34, Arseniy Velikanov ha scritto:
> None of the MT6765 reset-controllers have PWRAP reset,
> so remove the requirement of it

Sorry, but that's not true. There is indeed a reset bit for the PWRAP on MT6765.

Which one and where - I have no idea, but I'm sure that there is one :-)

Cheers,
Angelo

> 
> Fixes: 12b079b0fe8b ("soc: mediatek: pwrap: add pwrap driver for mt6765 SoCs")
> Signed-off-by: Arseniy Velikanov <me@adomerle.xyz>
> ---
>   drivers/soc/mediatek/mtk-pmic-wrap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index efd9cae212dc..30d74279e27f 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -2288,7 +2288,7 @@ static const struct pmic_wrapper_type pwrap_mt6765 = {
>   	.int_en_all = 0xffffffff,
>   	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
>   	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
> -	.caps = PWRAP_CAP_RESET | PWRAP_CAP_DCM,
> +	.caps = PWRAP_CAP_DCM,
>   	.init_reg_clock = pwrap_common_init_reg_clock,
>   	.init_soc_specific = NULL,
>   };



