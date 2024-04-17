Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BCFC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 10:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5H3N4oJxu5d1w7JFE0bpOeoSm+pYTgn60S3f8x9oLeo=; b=YJ1KETHyxgNPZaIzKhqAGaXGJN
	nEfcJ5nYbxPJFrM92+7rcc1R7y08BCCHbbHaxvBgcqixsubN267YlA6w5aQmxZX3uqHi6JoKYjml+
	Zr2imKhrJ6zXLmsfR1yGpPBEA+y0dI9xw9yCRHwVBfVjjR0ZKHYj9yICvSgG5nwj5dNMr0KLyo6/W
	xsmyZb1XLhEJ0YWYczbSbCw7IdT0oxbXyJWUsQWaKpuaLDc/R6jjMUsYlThISzDcx0MPSHimRXGCT
	qdXqquvTnBOG4KzsdwOwvb67OK9xSJocdH0KB+eVCseWdV9z63HJnH/S5VnjnLcPbRFaCh48OzVIB
	AFI3aXvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx2JN-0000000FX2R-00U1;
	Wed, 17 Apr 2024 10:14:41 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx2JJ-0000000FWzf-0U1m;
	Wed, 17 Apr 2024 10:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713348875;
	bh=nP6Y2cH6R/RSVNj91LUL6ipM/UHgj+V1OQwPKKnkgjQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SstsGJ1d7dF0sTiCq19GAQDn9PeB6bYpjCOvzfpX6z4o9hc+KpF0FbQsPvO371n/C
	 GnsKq719DLEgjgoXZ3DGGJ1t4/BZdaJC2+Nul+USg1vFiARr9mKkfOdgbS0TXFQJPd
	 yMeow0v4fKoHqlKgNSTCpBKVdtACyjIc94RpPjpuz98RryoTV/fs61uhsWWKPp0ObR
	 jx1QJ/3wXJmNpHHHlQlmOBTtUl0HbVAl75rb9i+HKeFSTyuexydG76wDgiFvUj91wx
	 iEgJfGjVhJ30+X3lwEtXi3BX9UC5cVBWYtStI1XeOJEqgXQ6zEoon8dqvxS+GgzJ1s
	 GtCKvWnb+nWsA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E30BD378020A;
	Wed, 17 Apr 2024 10:14:33 +0000 (UTC)
Message-ID: <105c9ee8-2b9e-4117-b4d8-472982ef59d1@collabora.com>
Date: Wed, 17 Apr 2024 12:14:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/18] dt-bindings: display: mediatek: dpi: add
 compatible for MT8365
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-7-33ce8864b227@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231023-display-support-v2-7-33ce8864b227@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_031437_371869_CF71C847 
X-CRM114-Status: GOOD (  10.60  )
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

Il 16/04/24 17:53, Alexandre Mergnat ha scritto:
> Add dt-binding documentation of dpi for MediaTek MT8365 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index e126486e8eac..ebb61bc4eab7 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -27,6 +27,7 @@ properties:
>             - mediatek,mt8188-dp-intf
>             - mediatek,mt8192-dpi
>             - mediatek,mt8195-dp-intf
> +          - mediatek,mt8365-dpi
>         - items:
>             - enum:
>                 - mediatek,mt6795-dpi
> 

MT8365 and MT8192 are identical. I'll make it easy for you:

       - items:
           - enum:
               - mediatek,mt8365-dpi
           - const: mediatek,mt8192-dpi

Cheers,
Angelo

