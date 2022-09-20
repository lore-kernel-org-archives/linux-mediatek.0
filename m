Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656A3C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 12:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rl3k7Zu42BDVI5+EytkL7XeHQK2rUdJ2J3BRCdSI0M=; b=KcwcSwaGfLWQHw5tFuRbQL9Pkw
	Aj51FlHFgzxd6gkk1leOHIX3MJyq/n60o1ZElL/deV0dW2KjL0nqB1Eac3TCeDg6JDewqMU2eAMul
	ZK7yq0+9lJ8HAThvkDoNWYiK3OqavO0bZfUylCLbRJkEs2jzcgex1gIASv1JE0XABotcymf6QM6Fz
	TdnZZwdl8y33seWXNcAeyXFF6AIajacu8zFbErapfqI0E7slGA91vfoh974YesIKmPPgdYr2q3zQh
	JLT2WM6ISqugaOV+qOixGMWIeNEQBpYyH7PCqI/6e/aakryiHloKlOsUPwhPj31zqWSOUg+Fa3uUe
	ko7qMuWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oacMK-003hTb-Hv; Tue, 20 Sep 2022 12:28:16 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oacM8-003hMy-98; Tue, 20 Sep 2022 12:28:05 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5EE816601F6E;
	Tue, 20 Sep 2022 13:28:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663676883;
	bh=NPxDT7RTTZBkSABcbUotCRFM07rynk+ePPfNGnAf5es=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oHKpd1wgBCfUl/PE8TpExrL/6IN3Un7x78YdsfDul4i7FON64+XDn0RCiV6kGhs4T
	 9OKZEdsYbN3dLQ+NuN7ATS51Dy7Gl9jqcNDPVsG9efDIBokTIBMafXXP2rCKEJF3J5
	 PgeTL49sqR9KQevFTyLDxJmKmXNzkp8+F2KoZYUEipgEekim/66YJt4KtxTcgWD4py
	 ZnS/oIgZeEwTtNyJfOuAQowg3sot5PIK2qKESk17quutcZHphm0atqi2RNEIQaycRo
	 GyzJHgb75mcIuArcR2+DR0VKpaMhRE7m/9i64gTzxbphY65mnQLxCUQXXWrsP/fAPC
	 V7nAwPOZf8o3g==
Message-ID: <312ac152-867c-f91a-f2b8-25a55bc3fab5@collabora.com>
Date: Tue, 20 Sep 2022 14:27:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 1/3] dt-bindings: watchdog: Add compatible for MediaTek
 MT8188
Content-Language: en-US
To: Runyang Chen <Runyang.Chen@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220920105622.25666-1-Runyang.Chen@mediatek.com>
 <20220920105622.25666-2-Runyang.Chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220920105622.25666-2-Runyang.Chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_052804_475903_8D9BC797 
X-CRM114-Status: GOOD (  13.68  )
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

Il 20/09/22 12:56, Runyang Chen ha scritto:
> From: Runyang Chen <runyang.chen@mediatek.com>
> 
> Add dt-binding documentation of watchdog for MediaTek MT8188 Soc
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 762c62e428ef..b900c85d4560 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -17,6 +17,7 @@ Required properties:
>   	"mediatek,mt7986-wdt", "mediatek,mt6589-wdt": for MT7986
>   	"mediatek,mt8183-wdt": for MT8183
>   	"mediatek,mt8186-wdt", "mediatek,mt6589-wdt": for MT8186
> +	"mediatek,mt8188-wdt", "mediatek,mt6589-wdt": for MT8188
>   	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
>   	"mediatek,mt8192-wdt": for MT8192
>   	"mediatek,mt8195-wdt", "mediatek,mt6589-wdt": for MT8195



