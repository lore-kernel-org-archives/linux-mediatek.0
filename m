Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324EAC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 14:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SZkh4uFwDjB1L3vxQqx6gnPYd5Hlk9FxjhRVztz1HM=; b=zn68bzy9P99j43BOEHUpeqy0Bc
	quIIBe5/srjsKXzTc/YQvmapdqCc1QTlHstOAJYLhW/gGvkKrspKoet0qQle0++08B720eFtzgEeB
	FI3tG91uA+VDpY0CZX6qvTiUBU/r/gPbvF5/bHp6Ho368fJmzPwLugHLf+ZA4DnzOMs1kmi4gP7Wy
	oQxpXb7rr59vy+gdn0eMblw/t2E+v09yGj+XuhxaeigKIC7uuVdedfGQBhipN3WUsQMt7ZA7KgY8n
	MKO5rBTHEMZRvnlqdioHmpEoP0lCNUe+rHKjRNVEYnD5d4l/Xg7u7Lrkcx28NaA4+kDsAU8MGeGw9
	aTDTaITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8NgX-009OJD-W8; Fri, 14 Jan 2022 14:36:10 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8NgT-009OHd-5A; Fri, 14 Jan 2022 14:36:08 +0000
Received: by mail-oi1-x22c.google.com with SMTP id g205so12418929oif.5;
 Fri, 14 Jan 2022 06:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lD1Jt5HPXkkJLqLAECNA5LcmSI3wdXLzJYaLp3IBqKE=;
 b=DhViUY9Z0mT9rsuJto9tllmgMtiy1HosH8oeA3M1/0PZ89p7v7nhZDFp0UHHeXHdf0
 TucO4pLCWCAng/aXDyLKNL+REJYGoH1Wpc5sYhlJDsGEyQNDpUg2tNfJGk9tjNtM0XV3
 EIti+2dShywaR4VqNxVkp3/a1eApnsKRaFluBLXyGnWLcmWMccKMIOgPD0XDeuGq4jQR
 NOfon0xLmUs0BfnYylg8u+4KUdJYAKEJOpbw+v+meSu5CSRb18yfu+JiH1qXNbXnGoUz
 g1Cf3SiAN2Akh83YcBtnC1T7Ke1HDTq0MztdWfhC62mT8I9XbD4t4UCV6OUl71rbPVUo
 8FIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lD1Jt5HPXkkJLqLAECNA5LcmSI3wdXLzJYaLp3IBqKE=;
 b=pFqHcV5WgalKsJxqZZLmgNPQl/pHdqBORAAAELg+pO9F4nru6Hecst7/+ClLRGr69/
 WCV1m9FKVAdRA7uBRz84NXXK6FIqHFunVABzlj+/Q805fOdlcEqvinTsmxziyR/tu8z7
 Tm6Fav9zH70szJ8Z70SjzJXJuhbPr/W+DTt5FVabGh30FSDFcZFlaKyM1fRGBmM6CJiH
 DCbIM0u3tM2aD6ewRgRbg2/UVgCp2xo60KsJD1u9MqKm1oSwCYzvJnc810b8eHkP03dY
 u2PYWa5cnRula5mP9FVVmTll04daXb3OEvFQAS3H0y8kV5t0jG8ONDo6JZ/YgwbBqOxv
 M0BQ==
X-Gm-Message-State: AOAM5334IHQUXqC9olc/5nAwTsJv6IPKLEmI70Wv63loULh5V7qTfZd7
 uCF73pRbS9AeLm1JOyl9gyA=
X-Google-Smtp-Source: ABdhPJxppYZYgjqq3e+BsBvQ1kr8/VEfzj/laCRWiZfcUvHcPYan7+c/SinPBRfZvGrzUeS7rFADug==
X-Received: by 2002:aca:1204:: with SMTP id 4mr3967201ois.85.1642170962978;
 Fri, 14 Jan 2022 06:36:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q38sm1430873oiw.27.2022.01.14.06.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 06:36:01 -0800 (PST)
Subject: Re: [PATCH 2/2] watchdog: mtk_wdt: mt7986: Add toprgu reset
 controller support
To: Sam Shih <sam.shih@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Ryder Lee <ryder.lee@kernel.org>, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Cc: John Crispin <john@phrozen.org>
References: <20220105100456.7126-1-sam.shih@mediatek.com>
 <20220105100456.7126-3-sam.shih@mediatek.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <8e6ed2b7-b4e7-733a-579f-e1536f68ea2f@roeck-us.net>
Date: Fri, 14 Jan 2022 06:35:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220105100456.7126-3-sam.shih@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_063605_239593_12EC8B73 
X-CRM114-Status: GOOD (  17.63  )
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

On 1/5/22 2:04 AM, Sam Shih wrote:
> Besides watchdog, the mt7986 toprgu module also provides software reset
> functionality for various peripheral subsystems
> (eg, ethernet, pcie, and connectivity)
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/mtk_wdt.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 543cf38bd04e..c6437fe1f4c0 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -10,6 +10,7 @@
>    */
>   
>   #include <dt-bindings/reset/mt2712-resets.h>
> +#include <dt-bindings/reset/mt7986-resets.h>
>   #include <dt-bindings/reset/mt8183-resets.h>
>   #include <dt-bindings/reset/mt8192-resets.h>
>   #include <dt-bindings/reset/mt8195-resets.h>
> @@ -76,6 +77,10 @@ static const struct mtk_wdt_data mt2712_data = {
>   	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
>   };
>   
> +static const struct mtk_wdt_data mt7986_data = {
> +	.toprgu_sw_rst_num = MT7986_TOPRGU_SW_RST_NUM,
> +};
> +
>   static const struct mtk_wdt_data mt8183_data = {
>   	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
>   };
> @@ -418,6 +423,7 @@ static int mtk_wdt_resume(struct device *dev)
>   static const struct of_device_id mtk_wdt_dt_ids[] = {
>   	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
>   	{ .compatible = "mediatek,mt6589-wdt" },
> +	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
>   	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>   	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
>   	{ .compatible = "mediatek,mt8195-wdt", .data = &mt8195_data },
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
