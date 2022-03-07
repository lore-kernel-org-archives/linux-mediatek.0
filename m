Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41134C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 10:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WeIJa13MsscCLJmGhD6nHwaNjWqbHqrLCbrbXgWDeow=; b=PnMUAlsy1+gl67
	vZnlVPl/xywNi4w6au5e+qtddV6rM1LjT42RT9F+RPRL8mpTzptdG5FdttfnO8LxJ//GDxKzOAtsp
	swshqvoCynzuhq7fDMhkEnlvhO+oAcjZh7Eqcvt8qYn6c4IxLVYUeQ0UAU5R1d8YxVU+xYNr86yWE
	nhb8zq4JYy+nhz9Vs59/a+0daSAM9J4nSfleNXQWFMF7NQaPXYUUOc5/FoCP/zwaFhU1t4uCiscm/
	SKjFQv0pLvA8Zw3EuI3jf/lN2MjpUaHH0ogf1EMtVo3hydnYfscR5mbklr7hgDiSQH5FJ886z0AtD
	pQzRIDLF8hl0E6Lw+0SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRAg0-00H8za-5V; Mon, 07 Mar 2022 10:33:16 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRAfZ-00H8kp-LR; Mon, 07 Mar 2022 10:32:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 75C481F43920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646649168;
 bh=PesHG5E9XWbmSJlu7I167mK5yVdbSK02UCAMGo049pQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Dw5qXgQNfkLcKFLIdYteeaVz2PeRPjWRY/Y0R8CXAB/5hXopw9c+kg+ANQXd+iV9G
 EPNAP9xDxiEPo2IEgk7Hi2tGGluboOOm/FZGeyxRkvhUcHnWn5AJZdlgxIuh1LkWdg
 0fnXNz8PwHnQcqOuf+rDwI44j186+HSaz5B5Xvn6oW2kQ8Q4vnkhc844IAm45X04Gg
 oCFPYxo7bmVWbXs20PUvlNfVn9/dp/FzCwK8biefNwLL83o2tX7lYGQto7YVIP+v95
 HMslHNz0F4DIlgiRQpDT1jsoN2ayKflymDDDGdDRIRqMAwqnHmb2xMt2ZUjCJBeNVo
 En4ZaIuBYE2qA==
Message-ID: <b3950b6b-bfbe-da80-90cc-1a836958f931@collabora.com>
Date: Mon, 7 Mar 2022 11:32:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH V3 2/7] dt-bindings: spi: Add compatible for MT7986 with
 single mode
Content-Language: en-US
To: Leilk Liu <leilk.liu@mediatek.com>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Rob Herring <robh@kernel.org>
References: <20220307065230.12655-1-leilk.liu@mediatek.com>
 <20220307065230.12655-3-leilk.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220307065230.12655-3-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_023249_879378_6D66640F 
X-CRM114-Status: GOOD (  16.55  )
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

Il 07/03/22 07:52, Leilk Liu ha scritto:
> This patch adds dt-binding documentation for MT7986 with single mode.
> 
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> index bfa44acb1bdd..48024b98408a 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> @@ -41,6 +41,7 @@ properties:
>                 - mediatek,mt8135-spi
>                 - mediatek,mt8173-spi
>                 - mediatek,mt8183-spi
> +              - mediatek,mt7986-spi-single
>   
>     reg:
>       maxItems: 1

I think that the best way to do this is to better organize the compatibles
per-hardware, here... or the compatibles list will eventually grow out of
control for little reason.

Since "IPM" is a new SPI controller IP, I would expect more and more MediaTek
SoCs using it in the future, so here's my proposal:

- Add a generic (const) compatible "mediatek,spi-ipm" to describe the hardware
- Add an enumeration with "mediatek,mt7986-spi-ipm" as the only member, as to
   prepare this binding for the future.
- Single and quad mode can be expressed with generic SPI bindings!

Specifically, you can express that with "spi-rx-bus-width" for SPI_RX_{....}
and "spi-tx-bus-width" for SPI_TX_{....}, so you don't need different compatibles
for "mediatek,mt7986-spi-single" and "mediatek,mt7896-spi-quad".

Fast example:

spi@12345678 {
     compatible = "mediatek,mt7986-spi-ipm", "mediatek,spi-ipm";
     reg = <....>
     /* Quad mode */
     spi-rx-bus-width = <4>;
     spi-tx-bus-width = <4>;

     .... etc ....
}

Regards,
Angelo



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
