Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4F4C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 14:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nH+F5AEU18v49BlaboQjiDGDrmW5FK91kUcP0/O1FPI=; b=iSIYVuZUWV6RTfy0hn4I8G31b+
	4EH/xdq68RorWHBI0X7zf1g2nlCg1CKiOhgkhOZ1BG4tajCblzXHyl76P8sDATm5wERiousW0Hm3U
	PMXSJfmFxhBJETiOy8m4yWUXaNu6jftO7ytuctbgfAZe66zXICzwyM5uZ6jTIilEw4e4RYmwH+bjK
	/Y4WG3tUtoDds2etBzCRyT0cSRbVfDOeQCp0S5IEf336Bd2Kcbb4CbhqDSiJC46VCNzwxcVnyQvyS
	ZKUrMD9nV4dMXJT0QtXVbpPXN5oqZmetfW0L07j8nOR6VL5LUfXfoPYc9uVxm6JtsPnld/1nojNUw
	z32Gwkcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9prr-001tri-Id; Tue, 18 Jan 2022 14:53:51 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9prp-001tqY-2k
 for linux-mediatek@lists.infradead.org; Tue, 18 Jan 2022 14:53:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1536E1F43F73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642517626;
 bh=ZNaX/A42dWxgeoOMmsN9zg5S+iY7KKP8MfwY9TtdMlg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=E77IBzzN3ChFnj4rWQxucnOEENtDBpzSy+Xv1HGd0/RpJmBUtI811J8xE7gtosowh
 TpMdgZ3s4jHvIrvOSHyDqQeDZmQ5nAXFHnZ4pyAkmR9Lg+YtigXrcJjICKdFxreTxC
 bs3tEkK96ikCHuJ/2LAQoRL1Xz6Parc8NmkOG57r7NLrxB/GUsBX9ERXy3L2Xirine
 qQ7TqmYvU6dokZqmi6XXJfpHgjsQ7yYq1abOU8ZG2RiyoFbwv87R1XDT2Y2j2i/H8W
 xHhjUDvQ4lsc46JTEI78m3MLpEfjuVjp+Y5yS25eYzQk4JauGKYhSSbcVMvr7HxLNQ
 l3B4jurQDSLBQ==
Subject: Re: [PATCH v2 3/4] spi: spi-mtk-nor: add new soc mt8186 support
To: guochun.mao@mediatek.com, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Zhen Zhang <zhen.zhang@mediatek.com>, Bayi Cheng <bayi.cheng@mediatek.com>,
 Chuanhong Guo <gch981213@gmail.com>, Bin Zhang <bin.zhang@mediatek.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 project_global_chrome_upstream_group@mediatek.com
References: <20220118142820.2729-1-guochun.mao@mediatek.com>
 <20220118142820.2729-4-guochun.mao@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <b1302443-68cb-b7d8-6a17-c1783ce3ff55@collabora.com>
Date: Tue, 18 Jan 2022 15:53:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220118142820.2729-4-guochun.mao@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_065349_288129_62604138 
X-CRM114-Status: GOOD (  15.35  )
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

Il 18/01/22 15:28, guochun.mao@mediatek.com ha scritto:
> From: Guochun Mao <guochun.mao@mediatek.com>
> 
> Add compatible mediatek,mt8186-nor implementation.
> 
> Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> Signed-off-by: Zhen Zhang <zhen.zhang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/spi/spi-mtk-nor.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> index f5ff01f61f42..e44fdf7c9e4b 100644
> --- a/drivers/spi/spi-mtk-nor.c
> +++ b/drivers/spi/spi-mtk-nor.c
> @@ -765,6 +765,11 @@ const struct mtk_nor_caps mtk_nor_caps_mt8173 = {
>   	.extra_dummy_bit = 0,
>   };
>   
> +const struct mtk_nor_caps mtk_nor_caps_mt8186 = {
> +	.dma_bits = 32,
> +	.extra_dummy_bit = 1,
> +};
> +
>   const struct mtk_nor_caps mtk_nor_caps_mt8192 = {
>   	.dma_bits = 36,
>   	.extra_dummy_bit = 0,
> @@ -772,6 +777,7 @@ const struct mtk_nor_caps mtk_nor_caps_mt8192 = {
>   
>   static const struct of_device_id mtk_nor_match[] = {
>   	{ .compatible = "mediatek,mt8173-nor", .data = &mtk_nor_caps_mt8173 },
> +	{ .compatible = "mediatek,mt8186-nor", .data = &mtk_nor_caps_mt8186 },
>   	{ .compatible = "mediatek,mt8192-nor", .data = &mtk_nor_caps_mt8192 },
>   	{ /* sentinel */ }
>   };
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
