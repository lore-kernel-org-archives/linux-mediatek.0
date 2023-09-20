Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CE6C00454
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 15:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/u+c/OyaKyOk11f46yXtObgpP9VhuVOVWmm05nxlM9E=; b=XCmsoQVZak0yVTlr2W58C/Tq7W
	zQ0+FFa0JzibzHBOAkl43zPLkLexDLVXysZ92+lw0RAQ4fUozao51pncmZTD3LDD3D+jks2TbOg1S
	wGWW7iE4Pmea1LRm3vqnIHuaGigUlTR1nFYONsUhAqWxJ/bcB+D4EWKWrVywnc0+gSozTTgV0Cwlz
	wN+OT5HeR8YZDuXjpR7NLpaVw+cFGGB8pXFRa6tNrH2kYEa0hvApiN/0xkeVyYul7st0YfeZ9mkuy
	d+yMNrLLvTPzPn9BxbAnNTVpX5zFn7Mke87+yPvcPPa4DLkTA8NW3v8yxpXS4CAYMJ6c6z9v62AvK
	DLVzfTag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiykA-003S4d-1o;
	Wed, 20 Sep 2023 15:03:58 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiyk6-003S2q-2A;
	Wed, 20 Sep 2023 15:03:56 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:b07:646b:e2:e4be:399f:af39:e0db])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 43EEE66071DC;
	Wed, 20 Sep 2023 16:03:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695222231;
	bh=0HPlpQakJrXjW7SQHdHHGKTtA1MdZ9XLz+FFXgI3KvA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I9LsKxu/5SkYzDko1gEYhQqW2EhOn2AaMzI4Uemgy9+L9fiLIEyKpJXwKApxOgBzr
	 ZIwSSO45NeACSR5G5Vy0T1sE2+S9fixrrpQmdiw4JVapyZgQxMQDmYyQ+zwCkuTBEl
	 3DoTuwEJ5LVq/52PkVB69a/bCpAolPPdKKg5FVK53dkS2ECcAyKM2FKjoyRxuLVaUv
	 MbmQB5fNUXM55rbnD4za8myRBz2CDnguAkYYOKVV9qXM5CuwYm6DOBCAdQqxTqwLO6
	 jY/swgWX97zvfIbZwltfnibPzqM9y7vf3rTpVeeCvJ0q1ajVjBGzeNFL8ogwarSBgI
	 mER0f7sSEDxNw==
From: Laura Nao <laura.nao@collabora.com>
To: angelogioacchino.delregno@collabora.com
Cc: andersson@kernel.org,
	kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	mathieu.poirier@linaro.org,
	matthias.bgg@gmail.com,
	tinghan.shen@mediatek.com,
	wenst@chromium.org,
	Laura Nao <laura.nao@collabora.com>
Subject: Re: [PATCH] remoteproc: mediatek: Refactor single core check and fix retrocompatibility
Date: Wed, 20 Sep 2023 17:03:32 +0200
Message-Id: <20230920150332.318851-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230919092336.51007-1-angelogioacchino.delregno@collabora.com>
References: <20230919092336.51007-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_080354_896000_B8B99118 
X-CRM114-Status: GOOD (  19.26  )
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

On 9/19/23 11:23, AngeloGioacchino Del Regno wrote:
> In older devicetrees we had the ChromeOS EC in a node called "cros-ec"
> instead of the newer "cros-ec-rpmsg", but this driver is now checking
> only for the latter, breaking compatibility with those.
> 
> Besides, we can check if the SCP is single or dual core by simply
> walking through the children of the main SCP node and checking if
> if there's more than one "mediatek,scp-core" compatible node.
> 
> Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-core SCP")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/remoteproc/mtk_scp.c | 18 +++++++-----------
>   1 file changed, 7 insertions(+), 11 deletions(-)
> 

Tested on asurada (spherion) and jacuzzi (juniper). The issue was detected by KernelCI, so:

Reported-by: "kernelci.org bot" <bot@kernelci.org>
Tested-by: Laura Nao <laura.nao@collabora.com>

Thanks!
Laura

> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index ea227b566c54..a35409eda0cf 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1144,29 +1144,25 @@ static int scp_add_multi_core(struct platform_device *pdev,
>   	return ret;
>   }
>   
> -static int scp_is_single_core(struct platform_device *pdev)
> +static bool scp_is_single_core(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct device_node *np = dev_of_node(dev);
>   	struct device_node *child;
> +	int num_cores = 0;
>   
> -	child = of_get_next_available_child(np, NULL);
> -	if (!child)
> -		return dev_err_probe(dev, -ENODEV, "No child node\n");
> +	for_each_child_of_node(np, child)
> +		if (of_device_is_compatible(child, "mediatek,scp-core"))
> +			num_cores++;
>   
> -	of_node_put(child);
> -	return of_node_name_eq(child, "cros-ec-rpmsg");
> +	return num_cores < 2;
>   }
>   
>   static int scp_cluster_init(struct platform_device *pdev, struct mtk_scp_of_cluster *scp_cluster)
>   {
>   	int ret;
>   
> -	ret = scp_is_single_core(pdev);
> -	if (ret < 0)
> -		return ret;
> -
> -	if (ret)
> +	if (scp_is_single_core(pdev))
>   		ret = scp_add_single_core(pdev, scp_cluster);
>   	else
>   		ret = scp_add_multi_core(pdev, scp_cluster);


