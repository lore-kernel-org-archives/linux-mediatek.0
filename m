Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98F2C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 16:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Stc6mbLg+CejExDJsmXQAlaQp1xZpU6qMtjhAUI387Y=; b=D2Qy73K+2CR3eBfN5vdfb2Aii6
	lVQUmJBqIHTdAgBg0l2YwbhY0ux0Y91VJEefeMSzWguP4wZIhEYBU5JQ4pX41u/L8LPYzlsEqjFIJ
	4daaGt7p8sQ4iHMp2H1lEsExsDgtw2BCVxfUCZcYikQ9BvqiiNhPTXvgm1xcCBSwu7BbWNX0FvkJr
	NOpTMugIDe+wtLaDdS3zM/TlkYMO/khS1gkrYFh5VFH9I1V3FEWNhjJO/E5Je/vm0+tn3+cYHpnZY
	lRByDqrnGqXCI+tMxh+8W/CQoGD0Cu9xx/xZrU3w/EBWMCpSVo6I+/CMM11fvEoey7gE3JV6KCkrC
	kyj2H8ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSLJn-00DSSI-FQ; Thu, 10 Mar 2022 16:07:11 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSLJb-00DSQP-33; Thu, 10 Mar 2022 16:07:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A441E1F40649
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646928417;
 bh=ZiS/SPnwQg61kBgd93FXFvniwS51SClGVI0Qf1ZMNxk=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=VFAI6Al10tnepVyxeGIIzzYWTeLv5ZQBIqdkRLEtxjcGAt2khOqoqObnB7LoK6+yz
 N9YEyXhenA8DXI0VTQcbby7Si5uZpdZJNJJC8jBhV3V7bwSeNVGn5f0y95yQvmTn/G
 CRhaEbydHUGeJVNZpo60qJ0OhDFG+4YCJBKECSdSmXUo2+v7Q/lO8xJSzZplnDgDnI
 RCBXTLzrqMcVqq16Rltr1qS2Dnqov9qLLCllIRVSzzqVqRjPbDeBbA+ODnkFvScLOe
 xSAr3zv6md0Zz9+YKjkBPgl7vaudM1LuTWqF4lDvDbJlPncEkvCI5S2zfSwHEIA+sK
 T45amm6QPgw5A==
Message-ID: <f6e2a491-d701-d05c-eb3b-2f8f5c080a16@collabora.com>
Date: Thu, 10 Mar 2022 17:06:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] pinctrl: mediatek: Fix missing of_node_put() in
 mtk_pctrl_init
Content-Language: en-US
To: Miaoqian Lin <linmq006@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220308071155.21114-1-linmq006@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220308071155.21114-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_080659_342288_212448F1 
X-CRM114-Status: GOOD (  16.08  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 08/03/22 08:11, Miaoqian Lin ha scritto:
> The device_node pointer is returned by of_parse_phandle()  with refcount
> incremented. We should use of_node_put() on it when done.
> 
> Fixes: a6df410d420a ("pinctrl: mediatek: Add Pinctrl/GPIO driver for mt8135.")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Thanks!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index 5f7c421ab6e7..334cb85855a9 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -1038,6 +1038,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
>   	node = of_parse_phandle(np, "mediatek,pctl-regmap", 0);
>   	if (node) {
>   		pctl->regmap1 = syscon_node_to_regmap(node);
> +		of_node_put(node);
>   		if (IS_ERR(pctl->regmap1))
>   			return PTR_ERR(pctl->regmap1);
>   	} else if (regmap) {
> @@ -1051,6 +1052,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
>   	node = of_parse_phandle(np, "mediatek,pctl-regmap", 1);
>   	if (node) {
>   		pctl->regmap2 = syscon_node_to_regmap(node);
> +		of_node_put(node);
>   		if (IS_ERR(pctl->regmap2))
>   			return PTR_ERR(pctl->regmap2);
>   	}
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
