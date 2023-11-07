Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED8BC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 08:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCz9kZH3EkeNgJgMGqFlLHjIBryd1Qo55/VXUwcWmE8=; b=yeZGYqyvk3930PWt39iEqw4Ne/
	Edg5hXAEeKmhUneTAuZ5fEOs4g7DP9mWnX2WYSKG+hW3BCp6EtJxK3Wwe0+UndgdvaS1h/YwUZBVO
	LzCqmEoWElaD2kNlqV+Aa5cEC47G0Sjl7Ktc99aD0fufZEAriAruTxKLTUU1ZMhOhqb8c9fWgk+I2
	0j5krSBKnT9X18b2qFGZa+kPA8wGUPzgny1AoS59nIvjA5uQWY1vHUsU8Cvl6U+2sLFGcVajvxhCO
	kxhzZLXMYJQVHxo6iaNiyE1q1WeJgufEhn47KrQ9s+qGtuwYNHZECmYM0KXYfJU3X5YPAr4SVD1Dm
	XPGfT+hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0HWI-000pEz-1s;
	Tue, 07 Nov 2023 08:33:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0HWF-000pEZ-2g
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Nov 2023 08:33:09 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DBE7E66074BB;
	Tue,  7 Nov 2023 08:33:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699345986;
	bh=WAeItKcus8R5qgyGRaYj0c/dQFjok1MFYhPuzmvp/Lc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fds6b7nxpvM7i2IrIUt2V/y363QEQRq1Jrl19lwXVZaFUwsnQ4CApbalOxkVrVJOk
	 jQv2Vtg9c8aXmmltCabDPRAgTB2ts8HHtgY0am7PRcX+WE471fKzUiFqqc8tZkw9de
	 jZ9tx2PSDsc6a4T09O4H9F71XFxLJskTmm0L9pFgDKq+875HpABK1R5POHM+VLVseI
	 M5+T1YJwFldxCi/WYmaKjs4Jp5AWveP5LRFcb81ISac9/0al9aNYmrBimwzzW9sOKx
	 Oql5T2p8nSes0QIDpn/mvQDOf3yBkfc3a4auJyQM+9RXwB8KyhqPhV3cHy+eeqy2Yn
	 oRh4M4F3GH/0g==
Message-ID: <2ca57563-2b76-4c40-afa6-cbbc05837edf@collabora.com>
Date: Tue, 7 Nov 2023 09:33:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 1/3] ASoC: dt-bindings: mt8188-mt6359: add es8326 support
Content-Language: en-US
To: Rui Zhou <zhourui@huaqin.corp-partner.google.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, perex@perex.cz,
 allen-kh.cheng@mediatek.com, kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231107031442.2768765-1-zhourui@huaqin.corp-partner.google.com>
 <20231107031442.2768765-2-zhourui@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231107031442.2768765-2-zhourui@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_003307_999883_49CFE4BE 
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

Il 07/11/23 04:14, Rui Zhou ha scritto:
> Add compatible string "mediatek,mt8188-es8326" to support new board
> with es8326 codec.
> 
> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
> ---
>   .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml        | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> index 4c8c95057ef7..9df5e44176d0 100644
> --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> @@ -18,6 +18,7 @@ properties:
>         - mediatek,mt8188-mt6359-evb
>         - mediatek,mt8188-nau8825
>         - mediatek,mt8188-rt5682s
> +      - mediatek,mt8188-es8326

Whoops, sorry, I just noticed that this is not alphabetically ordered.
Please move that before mediatek,mt8188-mt6359-evb.

Thanks,
Angelo

>   
>     audio-routing:
>       description:



