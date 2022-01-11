Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA35C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtY5FxVcDFWRQmkdEAVmN5YxVHWZrVTWjRI/g/QKlfE=; b=T8+CV9w5acadC+TnDKKRobHaFe
	Tr5ZILdiE1omkvKDLPmlPzh92VTdA5KlKiyKswLFAFGpsjUHDO/5SzccBIgJ64zwyOmEEAvUq3ZlA
	oM7+jDkpYVdig6t7qKikcJ5tzQE5E5UJXA5nL+L78gsQfLGdEHR7N1hkBldF+1AzrF2dYkwFIBuqq
	eI9fUT/JiDeGbnhWYwg7teUJ2TFtv0GRbh5Y7u+Z192/2Yi9vcwInuT4jA1dFJK6wK7xQ/t/30XPQ
	VJ+BP7siqPIRanRKUNmdjn82chtCmFqmKzbFPKMFXCF8WIVIDJQ3e4PIsQ7HSKcpVMgMUHMftVUd6
	+25pPtag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7HQd-00GRKd-2k; Tue, 11 Jan 2022 13:43:11 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7HPv-00GQv1-Ix; Tue, 11 Jan 2022 13:42:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E0FD61F41337
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641908546;
 bh=UCreUbK892/kWiIWn2pdd9fxoWGUyIKiZH1nbbPcwdI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mwIvm5GO7zmMcNAK4oDZFfaZJj3/3JtrN0WrALn/LLSfuFPtFvs5LmZKNmvwFU3QY
 2QYGT+dndo/0mGDO6OWUB/AovOwJsq2e/HcS0y7q154vL39Yk1LzLy8cc8XRrD6ykk
 K9ffGt1ilunQa4IlfsWw0oZEmsyonFchE1pZBRKBISamAi/pQgSj3qqfF5JjLNb68O
 xYo1KkGKmD+zsCzMbZome9VxKNSfOM9uwHBQuw4SyS4yS36u+kHYanqs0N72ZoOWns
 u4Oi3KJn5SVy/53upnoEizvAgZeyrHvi03VX3jfwnJSUA4sY6Grf5IO97FBh1QUjuE
 HfpnjkqyG1J7A==
Subject: Re: [PATCH 4/7] pinctrl: mediatek: paris: Fix pingroup pin config
 state readback
To: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Guodong Liu <guodong.liu@mediatek.com>
References: <20220111112244.1483783-1-wenst@chromium.org>
 <20220111112244.1483783-5-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <97f46bb0-b446-92da-a83c-751f8b918570@collabora.com>
Date: Tue, 11 Jan 2022 14:42:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220111112244.1483783-5-wenst@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_054227_869122_FFC69D87 
X-CRM114-Status: GOOD (  22.13  )
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

Il 11/01/22 12:22, Chen-Yu Tsai ha scritto:
> mtk_pconf_group_get(), used to read back pingroup pin config state,
> simply returns a set of configs saved from a previous invocation of
> mtk_pconf_group_set(). This is an unfiltered, unvalidated set passed
> in from the pinconf core, which does not match the current hardware
> state.
> 
> Since the driver library is designed to have a pin per group, pass
> through mtk_pconf_group_get() to mtk_pinconf_get(), to read back
> the current pin config state of the only pin in the group.
> 
> Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implements the vendor dt-bindings")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>



Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


> ---
>   drivers/pinctrl/mediatek/pinctrl-paris.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index d720624d8cd2..d259f075c62d 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -736,10 +736,10 @@ static int mtk_pconf_group_get(struct pinctrl_dev *pctldev, unsigned group,
>   			       unsigned long *config)
>   {
>   	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
> +	struct mtk_pinctrl_group *grp = &hw->groups[group];
>   
> -	*config = hw->groups[group].config;
> -
> -	return 0;
> +	 /* One pin per group only */
> +	return mtk_pinconf_get(pctldev, grp->pin, config);
>   }
>   
>   static int mtk_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
