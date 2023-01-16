Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E91C46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 15:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+UDRzzqJZNu06Gc3ga3e9IbYLEa/rLRliciSPrDBYRg=; b=qDPAegWzyV7KrWhWxVF1w25BFw
	ShEcqdWjdzS6KsaQk6pQ4Bno2O3mOLNEocbW7K5ViGzthPRfACx0KY1JLwvwRVk5BLw5/ATs1Rxaf
	cpA6JgMyZB4fa0nP0q1pl+CNqtdUxRErDS3nVRb2oyxcg6C2wC1XhqWdiIniM0tlV//wjGlWPzFc8
	CwXs6uF0QOH4zhSutl5MLFEt2eRB4AHi7h9WRerFOIBTgC6/gFYowwl32fn3uprBoYb5ZC+hp4/Jb
	5RGv3VQPv3R+qweD99rDAcyl7UGZ4UkKzaOOVYtnk3OrfIYAVvSMNa4FuGv/7BduTGXpASryoB2iD
	AmrdZAJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHROQ-00B6oA-KM; Mon, 16 Jan 2023 15:27:26 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHROC-00B6lD-TD; Mon, 16 Jan 2023 15:27:14 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-15eeec85280so8019845fac.11;
        Mon, 16 Jan 2023 07:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+UDRzzqJZNu06Gc3ga3e9IbYLEa/rLRliciSPrDBYRg=;
        b=RZ1n0r4AI2GerlleUSjlaFyWkhgl9jIMqXrEzlp1ISH72sFG9wRxtNfxl3PfYoU30v
         Z80ubSNT6yJGj81XovIyuXolWqXluS6B5cE2P6/fLTlkFPpq2RjcGgCkeTpLVwynlHva
         2hQo9OZ3BIBz9PU2Fjl579mEVJph58m0+YkHhx7cgqdC118Ru/WxV1vkcu6XhYHmPHZA
         PeTCYHCFpJXFkWfN2Sxrxuz3zyASDXMfpvaj88JuB2BrJunQWn/dWiNbmIzQGo3uDTyb
         /ZvCC5gfoLjbgmvLX1n+w+DbI6QC6Ch16CQfCine2/9Pod7zAFqZF3+fpYexfyItzswx
         Yujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+UDRzzqJZNu06Gc3ga3e9IbYLEa/rLRliciSPrDBYRg=;
        b=WKORW2VEWwN464QZS4j1kIn6FPiDZ6GcdgkRW9By/Gm6hQeKuIqbd6WsAj18YzamLT
         Jr3iqIGasWEqbDzHQsZz9RGAhrDQbQre9cdiBAT+kj+7wNSHXcT3WdNJO4sBm0fqtYAZ
         O7rT4/mkhVpInJHGpnT33C5AqRxWNMbefdlQpchRBXM2Bg0KibU8iAYY1Uq325F9AjpC
         783ROqiouYqotk9/q5sQ6tZ335/NXsuEJqVCLMNJrQkZt7BsZFpFFvIyHESAFg91gBeY
         mIv03wkFCE/8PCUblNrZEbY+71Nv6R8AI62hkLlv9CBn0CV7aMFT0FBrVO8C20mn+22i
         v9Og==
X-Gm-Message-State: AFqh2kpEhQ2QtdmfREAW0pdM6xTWhZ3KV45hfdJIr3OOwyHWAJU6JOt3
	0F/Rs8pczL7579raCwJBk2g=
X-Google-Smtp-Source: AMrXdXvOczUTz6EPlUdVCboKTU+LLgs9MuRt5dnGPTrU4EEQ8diSJ0rUGv8x4kcKVoA+IAM6neRL/w==
X-Received: by 2002:a05:6871:110:b0:15b:868d:137f with SMTP id y16-20020a056871011000b0015b868d137fmr116467oab.1.1673882829313;
        Mon, 16 Jan 2023 07:27:09 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c6-20020a056870c08600b0014be94a12d0sm14722761oad.44.2023.01.16.07.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 07:27:08 -0800 (PST)
Message-ID: <bfcac231-682d-8b2c-6c3a-e3a5a04ca5bf@roeck-us.net>
Date: Mon, 16 Jan 2023 07:27:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/2] watchdog: mtk_wdt: Add reset_by_toprgu support
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-watchdog@vger.kernel.org
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230116105305.31818-1-allen-kh.cheng@mediatek.com>
 <20230116105305.31818-3-allen-kh.cheng@mediatek.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230116105305.31818-3-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_072712_990103_B5ED5A10 
X-CRM114-Status: GOOD (  18.68  )
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

On 1/16/23 02:53, Allen-KH Cheng wrote:
> In some cases, the MediaTek watchdog requires the toprgu to reset
> timer after system resets.
> 
> Provide a reset_by_toprgu parameter for configuration.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/mtk_wdt.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 3e6212591e69..a9c437598e7e 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -50,6 +50,7 @@
>   #define WDT_MODE_IRQ_EN		(1 << 3)
>   #define WDT_MODE_AUTO_START	(1 << 4)
>   #define WDT_MODE_DUAL_EN	(1 << 6)
> +#define WDT_MODE_CNT_SEL	(1 << 8)
>   #define WDT_MODE_KEY		0x22000000
>   
>   #define WDT_SWRST		0x14
> @@ -70,6 +71,7 @@ struct mtk_wdt_dev {
>   	spinlock_t lock; /* protects WDT_SWSYSRST reg */
>   	struct reset_controller_dev rcdev;
>   	bool disable_wdt_extrst;
> +	bool reset_by_toprgu;
>   };
>   
>   struct mtk_wdt_data {
> @@ -279,6 +281,8 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
>   		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
>   	if (mtk_wdt->disable_wdt_extrst)
>   		reg &= ~WDT_MODE_EXRST_EN;
> +	if (mtk_wdt->reset_by_toprgu)
> +		reg |= WDT_MODE_CNT_SEL;
>   	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
>   	iowrite32(reg, wdt_base + WDT_MODE);
>   
> @@ -408,6 +412,9 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>   	mtk_wdt->disable_wdt_extrst =
>   		of_property_read_bool(dev->of_node, "mediatek,disable-extrst");
>   
> +	mtk_wdt->reset_by_toprgu =
> +		of_property_read_bool(dev->of_node, "mediatek,reset-by-toprgu");
> +
>   	return 0;
>   }
>   


