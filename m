Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AA4C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 14:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ObbG6mABYuE7DDfEc5eI/vK1Lgcc+YM2qE7KooiClE=; b=X3R7pxccJoLy+1
	QhLPNmAkxadPX8+1KJo4vd9nrT7KckRPQOSwQQI7otZ7aORbyu97LK0EtwK/N/xf88nDBetavFLY0
	gj9M6Kvb38vjqlt6wTqhTvQQ5KYZN+O1MlgcGJQWYHh+UTZ+7mwneWC9gkXtrLuUsTJXSIPZEjG4P
	PQwIkhxn0bmpJfAVi6ZXlKwgmoz0JSytrI0RaozGnov/spji+hzjt3fJRsiRMC8P5ShlgazVLjgeu
	klV8V/8E89h3jqzsPRON63SZqz5k0D+JVSUJIZlzpMDh9eFuzTT/DAtB43FCcP1yFeS/v5VjTvQsz
	oFPaqkmfSLwYUTJylcDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKhyE-00B5ye-Sq; Thu, 17 Feb 2022 14:41:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKhxf-00B5jo-6S; Thu, 17 Feb 2022 14:40:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0380C1F4598A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645108843;
 bh=o7M37NRjUzyT1SEEw8QEv+OQorYXKUUvT1lprkZEPDY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lyfIa822zgsumKInOeSFVIxYdBA40JLhTin+IhAc/pXMOJljeoF4s+oOZlSYJ/eSH
 /7KTlL4yml3t32SDDDsx953Ml+vQKZKiSQWkSqV6RjGDbqS7uIoyMHT0E4Psfedxik
 m3rw9y/x3NgRNL4mElYjdClK+j9he4LBZtu5deC4zQk7PsHTAFQ+kpt7zggPZiU0nq
 sIWYFrhr4jsIScQbwVHrQLoquXWAI4qRIpzYnGfESrYe4N9xNRBRtsvX93GGg4F12G
 /74tbymUv6mYvH3kM2Ptz4mcLg8LnS8nxsUFRIROrVUJ/yMt/qOZmQFvWSL+1/2n6R
 zGhyMssm2PqWg==
Message-ID: <10a101b4-293e-19c8-d241-5357a947acef@collabora.com>
Date: Thu, 17 Feb 2022 15:40:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] dt-bindings: phy: Add compatible for Mediatek MT8192
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Min Guo <Min.Guo@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220217135620.10559-1-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220217135620.10559-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_064047_490341_FF39F9BD 
X-CRM114-Status: GOOD (  12.29  )
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

Il 17/02/22 14:56, Allen-KH Cheng ha scritto:
> This commit adds dt-binding documentation of T-Phy for Mediatek MT8192 SoC
> Platform.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> index d279ba222316..7b2e1bc119be 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> @@ -81,6 +81,7 @@ properties:
>                 - mediatek,mt7629-tphy
>                 - mediatek,mt8183-tphy
>                 - mediatek,mt8186-tphy
> +              - mediatek,mt8192-tphy
>             - const: mediatek,generic-tphy-v2
>         - items:
>             - enum:
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
