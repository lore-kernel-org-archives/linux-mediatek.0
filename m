Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04BAC369A9
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 07:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJkr+bdZSHfbvwe58LDMy3lWdm6+Z1RreGf8MqnSOxY=; b=DwqM7nY9BxppdugslFHRu6Vn39
	Jva0DrriIa4X2g3U8tN6l69LFGzoCy1+W2RzejiS9XnrrJOcCpeY4ZDV68XHaBIWNPo0lg26epJDm
	WHxKHJK1iyaLGY2a8LsbouCW8H0BQAkfAswn3EJfyymnc3QAQYo3jSs7SQxnFv+/GaA1Wl2I99J6I
	f3/jqnDSjQ/3FI8FLKGAqbj2D1LeyhkbqV4Kct+3SnkqL4zgsu+DgDNtitadjEV0b2sV3xt3lbVEt
	oe4VJs+inpfoOM82mJV4ZuKRrtmHugW9aBB3vcQg/aJTdZgSI65Sop0L4qih9d+2/F3e8G8Jn3nnD
	6KquheSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stMn6-00000004OWj-2idU;
	Wed, 25 Sep 2024 07:50:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stMjO-00000004NaJ-2Lwt;
	Wed, 25 Sep 2024 07:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727250396;
	bh=sZD07Nz3JTxtQk22kFbo0BTn2I8r91GWAyKTpZgpZRw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B3CXqL1Z4AgfpkGPaS6OxowMLRHD6RlxBEzgKBUrW2KagsdEi9Nw5hdzrkoJBVSYT
	 t6Wf3RTe2zyvX6taQmtQNS5amemwzdRilfwuwT1U8sDLeCMyIG0/DwUjTBqphL0tWj
	 JbE23qjZkxnNBI2jeFnspzfs8uLubXLoXnmt6XEuwGBWym5qubk00jWwpB2nX8vHwv
	 8hrSNyiQcA746tgvgKoqXfl1F07ycRmrKHNhWL8rQId97ZWlahvDidL2x4lFJu+4/e
	 ZBvTq12zVS5mHqsG6OP/XcMIlxn6KFd+5UPHeiqL8zRdjPV+web/+EBmk4Agp1fZOa
	 6MYPDJN10IoQw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 503D517E1034;
	Wed, 25 Sep 2024 09:46:36 +0200 (CEST)
Message-ID: <32e9ec0e-5ba6-4653-adf7-ccd0af7d58a9@collabora.com>
Date: Wed, 25 Sep 2024 09:46:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: mtk-svs: Call of_node_put(np) only once in
 svs_get_subsys_device()
To: Markus Elfring <Markus.Elfring@web.de>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Roger Lu <roger.lu@mediatek.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <884f0a5d-e6d3-47dc-8a9e-201bb86b271f@web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <884f0a5d-e6d3-47dc-8a9e-201bb86b271f@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_004638_782738_C949B91C 
X-CRM114-Status: GOOD (  16.09  )
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

Il 24/09/24 20:08, Markus Elfring ha scritto:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 24 Sep 2024 20:00:09 +0200
> 
> An of_node_put(np) call was immediately used after a pointer check
> for a of_find_device_by_node() call in this function implementation.
> Thus call such a function only once instead directly before the check.
> 
> This issue was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/soc/mediatek/mtk-svs.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 9a91298c1253..7c349a94b45c 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -2133,14 +2133,12 @@ static struct device *svs_get_subsys_device(struct svs_platform *svsp,
>   	}
> 
>   	pdev = of_find_device_by_node(np);
> +	of_node_put(np);
>   	if (!pdev) {
> -		of_node_put(np);
>   		dev_err(svsp->dev, "cannot find pdev by %s\n", node_name);
>   		return ERR_PTR(-ENXIO);
>   	}
> 
> -	of_node_put(np);
> -
>   	return &pdev->dev;
>   }
> 
> --
> 2.46.1
> 


