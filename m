Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF210C369AB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Apr 2025 08:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1Db7gNvoR8IanW8NAmy3JDaY3pQsa/khDNF6Eb775Q=; b=J2HSShEax/E2aGcsYiwYERa9ZG
	z/zGuwwLza3tLAMrB4FV9diYnxWpjz7R8OdK+97jUd58ZJ+OMnWF1uTre1g/MQi0yiuOS0gJwMxJl
	m2N/Lsp+zur+eIRV2guXm2Ni9mnPwDNQmogFyygi7NE+pvG0umX1WG1CR9lhxsuruTDxnG80fr+1I
	xXrey+l7Y829xz8nADXD6S0Ei9bLI78WyROWxqMFBDvSIj1UD6weBCQJyTDejwfiMmtrQNj1taESu
	3LNif6jvIXP9eji9EcA4RU/SkSu6sWnlsU6rkGbRayQP7JTgbjcGkCffZjQAUZUJ4RteXu/5r5xzs
	mZveONLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s5J-0000000DLmr-2qjm;
	Thu, 24 Apr 2025 08:37:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qyD-0000000DAqI-16lk
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Apr 2025 07:26:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745479562;
	bh=L3sPTbyHOQBsE9r1lkpVZmPXCDuy0OrlWFtecvsFdxU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fFwo/qrPuvk7TruqJfD20DxBUmV9hj3nAQJhWySZiBK4aHo7shziI/PulmpJ+jzj8
	 rb8YT/bZ/t3vxxI55sKFmXpFR+Kvd6hJg8Lz6s0epgHulQb++7c5eCFGDvSqgt1nW0
	 Zr9gVVijGzt2uUqxPOTCsezOCEEm+wTvAhvcKioIjc+2VcHq03oYlSJtDnUKzvs3UQ
	 XV6U92MuzQjbEavpJ/8HfTu5CGER/dq6hMv32Vs2/BUMhlTuDSX50po48HKb91gH11
	 O6L6GP3XBLMmKgxztAhWlFuQ08ziFCRJG+XbZtUPyOzTT0WOgNvyh08ty4Tjbax2Oh
	 wZcYDItkfASlg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C745117E065E;
	Thu, 24 Apr 2025 09:26:01 +0200 (CEST)
Message-ID: <32b3ebcd-a015-4866-9529-25abbe1c9f2d@collabora.com>
Date: Thu, 24 Apr 2025 09:26:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>,
 sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20250424010850.994288-1-cengjianeng@huaqin.corp-partner.google.com>
 <20250424010850.994288-2-cengjianeng@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250424010850.994288-2-cengjianeng@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_002605_484747_34E72E47 
X-CRM114-Status: GOOD (  10.87  )
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

Il 24/04/25 03:08, Jianeng Ceng ha scritto:
> Ponyta is a custom label Chromebook based on MT8186. It is a
> self-developed project of Huaqin and has no fixed OEM.
> 
> Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Changes in v11:
> - PATCH 1/2: Remove redundant items.
> - Link to v10:https://lore.kernel.org/all/20250423093647.4074135-2-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v10:
> - PATCH 1/2: Add enum for ponyta sku.
> - Link to v9:https://lore.kernel.org/all/20250328094034.3400233-2-cengjianeng@huaqin.corp-partner.google.com/
> 
> Chage in V9:
> - No change.
> 
> Changes in v8:
> - PATCH 1/2: Remove custom label.
> - Link to v7:https://lore.kernel.org/all/01020191ea98a643-2d0be5d1-e00b-48e0-b823-bfe2c65b0d00-000000@eu-west-1.amazonses.com/
> 
> Chage since V6:
> - No change.
> 
> Changes in v5:
> - PATCH 1/2: Remove sku2147483647.
> - Link to v4:https://lore.kernel.org/all/20240906085739.1322676-2-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v4:
> - PATCH 1/2: Add more info for Ponyta custom label in commit.
> - Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v3:
> - PATCH 1/2: Modify lable to label.
> - Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> Chage since V2:
> - No change.
> 
> ---
>   Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 108ae5e0185d..fa1646bc0bac 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -285,6 +285,13 @@ properties:
>             - const: google,steelix-sku393218
>             - const: google,steelix
>             - const: mediatek,mt8186
> +      - description: Google Ponyta
> +        items:
> +          - enum:
> +              - google,ponyta-sku0
> +              - google,ponyta-sku1
> +          - const: google,ponyta
> +          - const: mediatek,mt8186
>         - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
>           items:
>             - const: google,steelix-sku196609



