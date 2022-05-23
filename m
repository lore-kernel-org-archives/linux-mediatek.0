Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F2AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rcQDvkh8fxEY2ZaNcsUywgQKAmcAWoM9fzLgr8Ss/o0=; b=rN7yXzhVfOE2hW
	GCM4xhzEXdh7hg/SAB1FfwTeakEyOZm0RFSIMA02NY1aozB1G97oyKr4W1S2QPYfjgmXbwBRdHye0
	YomWktw5KRbKXz+WzUNjdf0u1Y4YJQgAnodl/IPLdIgYkR4EwmHoP4A8IUlTtHvyzk6kcOzaZRoVC
	bMamJ7KzepWtBfH1lJNq/w5siXHg2SFWThzkW9g6jrCfcTOFK6uvg/Pl0csBzifUg8Aqwp5kxsAmu
	YCHRCwGPFNkFuzcTk3dEeJKNy5ygAumL85e7cEktVgWY6CoRhDxRyTZ8d4ChNWKNYj0uhx29UiIsx
	/JWdlkRen8hrvGyLChPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5dU-003PQ6-QV; Mon, 23 May 2022 10:50:04 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt4W3-002uDH-FW; Mon, 23 May 2022 09:38:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A64751F426E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653298698;
 bh=XvaiufkFnN1wMlfvWPGiVI99J1BcUL6VmHZvtPIs1vM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=J3u7n8+ezDneiHNhUBpp+KDQ0k6O3Slu7Ag9EoZBw4/fJx9FORvGjuEQ3g79+vbRI
 u1TR3W8Nlhoyi+mXH5Pe3Hg3ZwrCDHZk/aj7YqIgApW1JWsDnxY/RiNfBEKv15wjDo
 Je8cDqtkSt+nFrtWHGoHiGRqtc2+cmvXoLapIEf1h8vlJVmMhdGQ43BTwttlACBcu/
 s1gGnZ69LsTBCaCHHBV5QKhORxXk9tYuzndFX/8FV/FPqEw5drdpJyOKvT/kbGs4x5
 eZfmh9xaB4C58q1aVCCqzFxAiiDTjwqvu6sPZPS5l0NMNwQfMlrihU/5JPty1/nkhY
 gp0kO1HWK02lQ==
Message-ID: <d9563b65-2391-d32c-8a07-ca7a13cae7c7@collabora.com>
Date: Mon, 23 May 2022 11:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 4/4] soc: mediatek: svs: add support for mt8195
Content-Language: en-US
To: Tim Chang <jia-wei.chang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Roger Lu <roger.lu@mediatek.com>,
 Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com
References: <20220523084034.26802-1-jia-wei.chang@mediatek.com>
 <20220523084034.26802-5-jia-wei.chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220523084034.26802-5-jia-wei.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_023819_743787_CF8D763A 
X-CRM114-Status: GOOD (  14.29  )
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

Il 23/05/22 10:40, Tim Chang ha scritto:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> To support svs on MT8195, add corresponding bank information, platform
> data, probe and parsing function.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>



> ---
>   drivers/soc/mediatek/mtk-svs.c | 151 +++++++++++++++++++++++++++++++++
>   1 file changed, 151 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 656d0361ff7d..bb5021648143 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -1680,6 +1680,89 @@ static int svs_bank_resource_setup(struct svs_platform *svsp)

..snip..

> @@ -2559,6 +2697,16 @@ static struct svs_bank svs_mt8183_banks[] = {
>   	},
>   };
>   
> +static const struct svs_platform_data svs_mt8195_platform_data = {
> +	.name = "mt8195-svs",
> +	.banks = svs_mt8195_banks,
> +	.efuse_parsing = svs_mt8195_efuse_parsing,
> +	.probe = svs_mt8192_platform_probe,
> +	.irqflags = IRQF_TRIGGER_HIGH,

Interrupt flags are specified in devicetree; avoid declaring irqflags.

After that:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
