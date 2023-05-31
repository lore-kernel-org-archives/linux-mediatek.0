Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABE5C77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 08:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3yGTLd8BfU6EppE4+dZgZAP8SOgv2AzHM4HGsIsdJqQ=; b=mjEejsm/ogYy1763oR4IHUorEp
	XpsnSUCtJ/WL/D1XLdsYH7UXn9dLuYFYHLOPdaWL3n60eic1d1JgVe6G4Zi6OULvci5D/oMfGWSCc
	AQnVgthQWGo9kwe0cl394nY0tH85JDZAXXPluzoOsRrBgAasNosmZxHTpUNch/DUJwWcjnol0kwhs
	rrh6RnQLi44QjZIX5U0jkWduzUM2oaZR6itEdwy51LFhlSZzcerW9/XpQl49Dhyk5A45/Z9kYco0x
	BWTN5Zf8j/S3G3QBNNsCka4NQUVTLX4VemPhcH/n50eMOrvLRWBEgqRMte6aYqpWRFYayD9BKMPbo
	WTrea6sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Gpf-00GYwR-1w;
	Wed, 31 May 2023 08:05:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Gpb-00GYtG-30;
	Wed, 31 May 2023 08:05:21 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C7FF26606EAC;
	Wed, 31 May 2023 09:05:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685520315;
	bh=f5OvxJa8ehIWi5I9QZ1DR6Nr8ujEAfBfpi6+QCPyFu4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eYrL8GXKUbi0r2G3hBCKlOKgJi1jjDq9eHqnc9/a0cUf7+I04gPJzb/weRFWprffJ
	 1SIS86UZt7SFZgTXZBgtLMU3oXCOAzYwiHLGO/RFxiF99CPvanoD2s0EsQDDSBwEkz
	 5rh0C2S59B6rljP6njC/tLWZzIAAo5D4rPUOvFelK+Eif8RP0f3IZ92nHCZvGz7Pmu
	 DCEHRPePaV3lFQ49Pl/SnvCpu4CSk160+yjQFY0hs+P0s5v1tw9ouoD/GW4tE3FMAA
	 OeuRY6qdKUAzUq1Q0eLTdLIbtQ064lZoJE8nyTJv/Kq5aSlywf5kqLZCc7jKEWJV3R
	 +ls8+RJMkcHeQ==
Message-ID: <371790cd-5a7c-8fa6-cc38-3a3680525092@collabora.com>
Date: Wed, 31 May 2023 10:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 2/5] thermal/drivers/mediatek/lvts_thermal: Add suspend
 and resume
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org,
 rui.zhang@intel.com, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
 ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, wenst@chromium.org, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com, nfraprado@collabora.com, abailon@baylibre.com,
 amergnat@baylibre.com, khilman@baylibre.com
References: <20230530195132.2286163-1-bero@baylibre.com>
 <20230530195132.2286163-3-bero@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230530195132.2286163-3-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_010520_100757_EEB3DA0E 
X-CRM114-Status: GOOD (  21.79  )
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

Il 30/05/23 21:51, Bernhard Rosenkränzer ha scritto:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add suspend and resume support to LVTS driver.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 34 +++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index d0a3f95b7884b..5ea8a9d569ea6 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -1169,6 +1169,38 @@ static int lvts_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static int lvts_suspend(struct platform_device *pdev, pm_message_t state)
> +{
> +	struct lvts_domain *lvts_td;
> +	int i;
> +
> +	lvts_td = platform_get_drvdata(pdev);
> +
> +	for (i = 0; i < lvts_td->num_lvts_ctrl; i++)
> +		lvts_ctrl_set_enable(&lvts_td->lvts_ctrl[i], false);
> +
> +	clk_disable_unprepare(lvts_td->clk);
> +
> +	return 0;
> +}
> +
> +static int lvts_resume(struct platform_device *pdev)
> +{
> +	struct lvts_domain *lvts_td;
> +	int i, ret;
> +
> +	lvts_td = platform_get_drvdata(pdev);
> +
> +	ret = clk_prepare_enable(lvts_td->clk);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < lvts_td->num_lvts_ctrl; i++)
> +		lvts_ctrl_set_enable(&lvts_td->lvts_ctrl[i], true);
> +
> +	return 0;
> +}
> +
>   static const struct lvts_ctrl_data mt8195_lvts_mcu_data_ctrl[] = {
>   	{
>   		.cal_offset = { 0x04, 0x07 },
> @@ -1268,6 +1300,8 @@ MODULE_DEVICE_TABLE(of, lvts_of_match);
>   static struct platform_driver lvts_driver = {
>   	.probe = lvts_probe,
>   	.remove = lvts_remove,
> +	.suspend = lvts_suspend,

Should we do that in noirq handlers?
We're risking to miss a thermal interrupt.

Regards,
Angelo

> +	.resume = lvts_resume,
>   	.driver = {
>   		.name = "mtk-lvts-thermal",
>   		.of_match_table = lvts_of_match,


