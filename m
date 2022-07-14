Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BAFC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 12:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9+Ie+sOdHcgr0chJ5gnnpnyxb7W1Wg0VwLqU9aI85E=; b=Vhz+JVeJ4253Nv7vGTTbOS8Wf3
	H+icnOKx2WK7669wpXDHKtJDj/AzSyHpyhImpylEuIgJV0r3/c5RyxD8am4dEP7LpbbDGK0S5RW9B
	oTpRWIfVdxNnUARU9ZkKsHHYPJxPuwgpS1fjvu1416im8vyZ9ian9mYYsmrcOpsUzlDAJmo8Y82mb
	IKQY2RYuxLXO1LJHWRqC9tNHNmsFrXDXV2iVWDHWDNvWxp1Sj5hFDnzGouvJ6MjoZcYHK2n9N8KAr
	JFjcJUxJwPmupvUa1qgNxVyc9g23aVgUZai+RNEzj0Nl6XCaUjxv21eC1aocjJRbkpV8WnnA/yiRo
	OiFClG/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBy6u-00EHSv-1S; Thu, 14 Jul 2022 12:38:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBxyr-00EC6v-2R; Thu, 14 Jul 2022 12:30:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C1EB96601A3D;
	Thu, 14 Jul 2022 13:30:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657801805;
	bh=JVzIn5i13DB3/LDAuFTquEfvgf4d0MOmVf70FJzjMJc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OoAviENdLmUSvVXKjtV8pZcO9HKH6GmHsSHPis+lTpAkyhs422g+PIZEeVDWzySig
	 ueTEMOkXaenWoQSWRpkl7mU9zOOn7NaXh7bnnBtSyHL58YaJhaYzYbjDicIfWIRdcA
	 y95lrdbjBDfOx7y/r1rlAGzfzR1AhdMcsOZ4VLVYYPqh6OZfI7707HzBfj0Rs/WxId
	 NunmwCi+DVC6y+3MZCDj/+m3LphY6H/GlG01fnw/WzUCKYvU2BnJXZ7jCD9FzZuYiD
	 P2bpxjTDLHSUyMh+PgEFbtxK5ChjnPv5sWMc1RjBhiOy+BbVeq4NiBV+6TjQVcPzSm
	 2uxIivKlaPlQA==
Message-ID: <468507bc-e10d-0d7c-aa77-bab4769efbcf@collabora.com>
Date: Thu, 14 Jul 2022 14:30:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/1] dt-bindings: uart: update bindings for MT8188 SoC
Content-Language: en-US
To: kewei.xu@mediatek.com, gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com, qii.wang@mediatek.com,
 liguo.zhang@mediatek.com, caiyu.chen@mediatek.com, david-yh.chiu@mediatek.com
References: <20220714104149.23343-1-kewei.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220714104149.23343-1-kewei.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_053009_383074_6F18F720 
X-CRM114-Status: GOOD (  12.89  )
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

Il 14/07/22 12:41, kewei.xu@mediatek.com ha scritto:
> From: Kewei Xu <kewei.xu@mediatek.com>
> 
> Add a DT binding documentation for the MT8188 soc.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

This file doesn't even exist anymore. I've converted it to json-schema, check
out commit 22b10b33b9c6e76bc08f64e52862e68c4dc76052

Regards,
Angelo

> ---
>   Documentation/devicetree/bindings/serial/mtk-uart.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/mtk-uart.txt b/Documentation/devicetree/bindings/serial/mtk-uart.txt
> index 113b5d6a2245..e5094e1db7b4 100644
> --- a/Documentation/devicetree/bindings/serial/mtk-uart.txt
> +++ b/Documentation/devicetree/bindings/serial/mtk-uart.txt
> @@ -21,6 +21,7 @@ Required properties:
>     * "mediatek,mt8173-uart" for MT8173 compatible UARTS
>     * "mediatek,mt8183-uart", "mediatek,mt6577-uart" for MT8183 compatible UARTS
>     * "mediatek,mt8186-uart", "mediatek,mt6577-uart" for MT8183 compatible UARTS
> +  * "mediatek,mt8188-uart", "mediatek,mt6577-uart" for MT8188 compatible UARTS
>     * "mediatek,mt8192-uart", "mediatek,mt6577-uart" for MT8192 compatible UARTS
>     * "mediatek,mt8195-uart", "mediatek,mt6577-uart" for MT8195 compatible UARTS
>     * "mediatek,mt8516-uart" for MT8516 compatible UARTS
> 


