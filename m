Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6B6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 09:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zOysJapqHxdf/v52mITixofQpdl3ljs4h2I0clL7Y04=; b=bH9JZNNhA0vOD0
	izxS8OJS91wVlXUK5KnrU4N/CqZYqX7ImuXX4nAsGZhAoriy9yvgU6APesPthgDQ8NQY2hoLRaTjw
	Xxasc0HL4CZ1UrjX0CxZ6FWJ2QF2mVpSqAH+9kJPI2/aNekPcfRGp2pCULv2DvI1rMgaH9UfTrlH8
	/ZUOE/pLzz5DPgoGHC+h4rkTrQ7IyGsJ/tnyuxlC6LXscQVX4P94KfGjsqYWJuOJIPEj5re6l5gSQ
	aRw4jMnv//igemZ3FGx749pG3yY2ccnXZUECCkJfenjYejyXMSZwhAC7ZMcmY1PXMqg2ayKveLdTU
	xN8EY3pQzLWAhjYSyn5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU3dS-008YiH-U0; Tue, 15 Mar 2022 09:38:34 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU3dF-008Yc7-Lm; Tue, 15 Mar 2022 09:38:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 172021F436D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647337100;
 bh=2g+bi31SH2nt5LwkrpZcDsw8tRwzI6EeAAglevEM+O0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WVFUcQ7oKf62TwQkqJBIiau9mLy2Y7iMN9owG/L9eJtno70/6cwNGoySPzg7A5Zgs
 vSWSnJMZtP9+uWNPWu7Adei8JWaabvsolehkcPuj8yxc9svrJ2oiE4wXrABPtRmh0v
 flZlEqntv9hVNofoeDB3EpyvjPJR/JU1BNyDIVtK5Xp7nNZBVgBQg0NTfhgngN9L8a
 Xh/zZntxQG5vZFFv02CXCZksgzbuFBv/GSHbwm275ixE1iHnmx9oR+KWQmkchrQAks
 sGjM7pSHBpiKI5DOOfj/TandHt2yQ+PPzv4QNQNmwHDdX0R82+XaZpNx7vQyu+OcDw
 +o85KkyHv1Yrw==
Message-ID: <140282ef-5174-b86b-cca0-559c24fec2c0@collabora.com>
Date: Tue, 15 Mar 2022 10:38:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH V4 2/6] dt-bindings: spi: Add compatible for MT7986
Content-Language: en-US
To: Leilk Liu <leilk.liu@mediatek.com>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220315032411.2826-1-leilk.liu@mediatek.com>
 <20220315032411.2826-3-leilk.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220315032411.2826-3-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_023821_875528_0FB1583B 
X-CRM114-Status: GOOD (  12.76  )
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

Il 15/03/22 04:24, Leilk Liu ha scritto:
> This patch adds dt-binding documentation for MT7986.
> 
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../devicetree/bindings/spi/mediatek,spi-mt65xx.yaml          | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> index bfa44acb1bdd..7247a177466b 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> @@ -30,6 +30,10 @@ properties:
>                 - mediatek,mt8192-spi
>                 - mediatek,mt8195-spi
>             - const: mediatek,mt6765-spi
> +      - items:
> +          - enum:
> +              - mediatek,mt7986-spi-ipm
> +          - const: mediatek,spi-ipm
>         - items:
>             - enum:
>                 - mediatek,mt2701-spi



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
