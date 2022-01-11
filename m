Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB897C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 09:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GM137qfMJs2ILPTbPbMHKhk27v0xX3xo1bxOfLe5mKs=; b=meIzxmXoJdNGZZzSvg0y4XRFmr
	wNRVXLiThQLS0faAWUngMbvyYhAkrCDSHEb4QH58/b64S9L5BB1cSE37gbQYYeov0BQv8mQ7bHyzj
	IxN9SOid6A0+l20ED3/M7cF+eaIBb2B5rIqipBg7no6tsTiNJrVTCqHXvLGxXCOzKpABaNpTIi8dZ
	l8LzZJq/J3sbtN/Wa8CVnre+5MFsATWhOZZ+JRCpQ6VZJsfxCJsT2yuAeEV/3Biuc9MJyaSQ6+Xkk
	QW+TkrdZZFdpWgYlxhUY+2n9a+9SgtgIhRjmb84bUphfUZMrEldxbwnGf4hGPp9UsG91QXU7rWQ1M
	KDoMQvvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7DBV-00FUdt-3B; Tue, 11 Jan 2022 09:11:17 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7DBG-00FUYy-Vs; Tue, 11 Jan 2022 09:11:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7A11E1F41347
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641892258;
 bh=ZY19t3su5uLFe0/PG24UiwL7zoDt4pgnUUQFZmfGa94=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fOeZ71A/jtYIdNLUxiVtNnk0hRxeRY1SYP/9rTYI0dnR3ZKcVeYbk3V5xd0mjkPJJ
 ThDZn5u2JOuWTTAwOxojoTeKFPcdX+cwWgitnl7E04FvKTjzKBm1mJo4YzLupMSJep
 LPDiXVnn7Uu4HpYPzNcv3TNoQWnQoq6x13j1kr3sqir2Y34Y+hpNcZtk+ipOCYW5vY
 RrH2kSurnPai+jGenY38etsNX2y4HS+zvF7BGqlNB1Ggwg61LXm3PBFn7UkiSgBMM2
 51nTWWtPvivLlugdNcvQYq2QYEAOcbjHL92N0imWkW7EgnKru59pBrld4YBPP/moS9
 HRdnBCXYw5PlQ==
Subject: Re: [PATCH v2 4/6] memory: mtk-smi: Fix the return value for
 clk_bulk_prepare_enable
To: Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
 anan.sun@mediatek.com, lc.kan@mediatek.com, yi.kuo@mediatek.com,
 anthony.huang@mediatek.com
References: <20220111063904.7583-1-yong.wu@mediatek.com>
 <20220111063904.7583-5-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <00efa277-6475-4f20-f045-443a0706e9e2@collabora.com>
Date: Tue, 11 Jan 2022 10:10:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220111063904.7583-5-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_011103_198380_34C0A592 
X-CRM114-Status: GOOD (  20.78  )
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

Il 11/01/22 07:39, Yong Wu ha scritto:
> The successful return value for clk_bulk_prepare_enable is 0, rather than
> "< 0". Fix this.
> 

Hello! Thanks for this commit!
However, there are a few comments...

This description is a bit confusing, please reword it, something like...

"Function clk_bulk_prepare_enable() returns 0 for success or a negative
number for error. Fix this code style issue."

In any case, you're not fixing any bad logic issue here, as the function
will never return anything > 0.

What you're fixing is a common pattern usage issue, so the Fixes tag can be
removed since it's not really useful to schedule this commit for backport
over older stable versions.


After the requested changes:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Fixes: 0e14917c57f9 ("memory: mtk-smi: Use clk_bulk clock ops")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/memory/mtk-smi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index b883dcc0bbfa..e7b1a22b12ea 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -480,7 +480,7 @@ static int __maybe_unused mtk_smi_larb_resume(struct device *dev)
>   	int ret;
>   
>   	ret = clk_bulk_prepare_enable(larb->smi.clk_num, larb->smi.clks);
> -	if (ret < 0)
> +	if (ret)
>   		return ret;
>   
>   	/* Configure the basic setting for this larb */
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
