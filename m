Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6548C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 09:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkhnSat6pPztVn5viyBKKyIp8tQq4n45ctbRUqUWhew=; b=NdO/i2NGNtZwUaCc9p+KPn8hNB
	k7980diz5BO0HJ8IN/ig7TWjUieNBlbBCLdi/kuJHn4lntCnqO6AkHjwnHTPXsrP2nEb9Cp8cS18X
	SMKZEicsF+XsMH0iwkdIawZJZW6iSKENhzOsVnMGTKT+PYt4dwT5NTz96twPus/VY1OKE+AtyobAa
	m4SIhflQv+zeMwBatsIn71IbqRn3sRYSUzIsN1/MHB/9v22aJsPPweo5k9kHMtuTgQwudyxEKEf4Z
	1iBZyCaNA8VajRaXJaO1q8bv21m3RcKpJ/fgbPhkEhK23AivQaze3MXOGRTt4J2iH+7hs7c7r3hAe
	aucFzq8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouron-0096vX-Dn; Tue, 15 Nov 2022 09:01:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouroc-0096od-CN; Tue, 15 Nov 2022 09:01:11 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9E0ED66029B1;
	Tue, 15 Nov 2022 09:01:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668502869;
	bh=TdB8L6iEEelm86FFJ5OJDly7KU/ks58hSw2iu/gT3lA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NW2VKuuy4edI9qk2ZfR4FKnUJHCl6D+hk7cJ7hbgf3Iee8A3ncAXEqSvKixutOWtO
	 WlF+Xqn7w9LLtZmuR75LEyDU7yTXtB+LKxMvCmpAOHP6n8tglFcnBNyUuVyqMDFHeb
	 oKI1vVp1sxB5QPiNuDnxGyWGBWFv/Ier9zzjdrKs9VIFaeAwkvhtcuiTUtyGC7i2ml
	 N4NBXozO4kFP7a7XAJAVBBJ+c6qkf1zeqxEMmJtpPIgoBeiKdr86ZXC39eEggn8is/
	 Z+2w9uCm8ImX947KoJdfCcfKrp64z8ouFRUnu7bZEK0RFzkSJunIC7QnHkge3mUjOC
	 yWixTIwUSYTDw==
Message-ID: <70505f57-244d-1fea-3590-8158be25383a@collabora.com>
Date: Tue, 15 Nov 2022 10:01:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 02/15] dt-bindings: watchdog: mtk-wdt: Add MT8365 SoC
 bindings
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
 <20221115025421.59847-3-bero@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221115025421.59847-3-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_010110_581579_F55D384B 
X-CRM114-Status: GOOD (  14.82  )
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

Il 15/11/22 03:54, Bernhard Rosenkränzer ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add binding documentation for the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Hello,

There's a mtk-wdt.txt schema conversion around that's well reviewed and that
will land before, if not at the same time, as your mt8365-evk series (judging
by the fact that you anyway have to send a v3...)

Can you please rebase this commit over [1]?

Thanks,
Angelo

[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=693051

> ---
>   Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 762c62e428ef2..835af28b46de0 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -20,6 +20,7 @@ Required properties:
>   	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
>   	"mediatek,mt8192-wdt": for MT8192
>   	"mediatek,mt8195-wdt", "mediatek,mt6589-wdt": for MT8195
> +	"mediatek,mt8365-wdt", "mediatek,mt6589-wdt": for MT8365
>   
>   - reg : Specifies base physical address and size of the registers.
>   


