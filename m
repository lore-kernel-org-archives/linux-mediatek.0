Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F90CC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 12:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOlTSrmRtbUCBfz8gCz4WOvdg96YJQdXKVBz3QHx9bs=; b=A4i94+GbE1d9oX/1f/PKVaN8KF
	k23prh3FJVOF75Nx3jDwLTE5jbdfkh2/tGnpDpo//mJO+B2k5GTR5eClWPljQnU29Be/3ijFQP9hb
	u163Z947RHQGytllqHKOKvo8Vt4hNFzk1PXrTXx2kvlNMXua1ohrd0Q2V1NYaq+IGG0Ij9YooD5ly
	1Vs3Y+IkN8uiD9ipj61cz8fgjr+L0L90HZqYxIAkiuxuHjYbZfSwUX1aKec6wbyifeeBI5no03Ydk
	aUnMCBN5cEMuu8BO3ItOP0Rtgk3uHZRO5hr1/urRrafaaJd0+mfKH918vPxBwb1uKkxGgG9a0PWJV
	sqcXQ3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox605-00DYZ0-7R; Mon, 21 Nov 2022 12:34:13 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox602-00DYTD-Lq; Mon, 21 Nov 2022 12:34:11 +0000
Received: by mail-wm1-x334.google.com with SMTP id r129-20020a1c4487000000b003d0283bf132so194907wma.4;
        Mon, 21 Nov 2022 04:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VOlTSrmRtbUCBfz8gCz4WOvdg96YJQdXKVBz3QHx9bs=;
        b=V8siZQDFyD/hT3Om+NOj7hhswdGA7duSCrWm61KEQ/mP6nhbGLe+pX5cO4Hiv1aC06
         SGgQNBp7orlIKTRM5cxRhiv3KzMQbDKPOa9hbcF3WeO4Jxegg6R08UoCINuxKi/agRb1
         REO7D9+ZzE+0xXwc7/L7hj8R0XLsxWUqxHMDWjYNr82OMiWjExLT5SHTwfJEmgufx72t
         DQ6vJs5A6lBut1ePzFui5MR86Qqc0dczNfJT4uX/O5ZF2xARBS01lEvdFcVrfe9DJKtW
         IFUSN7HjfWpjb04GqXsFglT1LSsj37zJ7nrjX3EFM+f6M5HpE+DbBc/2iG2lm4LaJxmH
         dIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VOlTSrmRtbUCBfz8gCz4WOvdg96YJQdXKVBz3QHx9bs=;
        b=AskojqV+ypSnST2jG9K7E1HYjet8nHBSrEZfb44T2+EETY4sScBh82BrUe7l+LiMCW
         Wt8+MWtof3gQBaqCD7NsJKCc+f/FBBKkdTOZd5E7vTbq1A5K43Z9ZCVboF2JEIs8mfNq
         GngNS5tk9q2tIOrdPp3HFyjWA58obYT8bEOYTnpWnXs7VsEXswfXcLckPFA9qoUs1nc2
         utGA9RBDnzuhr4Vx0yHnAXMBm4kBuj1kyCbSuEc/TViRsCHOvRBWJHx3rfxvzId+qaAI
         HsD+fdQBj1xWTT4J6Ihb+QW+jhqKtgX6PKds9NNr3VsZ9rghKsp4+RT20Ucdw32ajMi5
         kLgg==
X-Gm-Message-State: ANoB5pl/uDIJil7sW6gi+jTgj6dObhBN+wkFfHBbxZQbxGy+eGB+hPcC
	bXmsroPtHv9wRdHtrjKIUYQ=
X-Google-Smtp-Source: AA0mqf6heJdZ9/M6W4IHJWOvjmp4NclZNoZVkaQ1Z+boxuga0PuFE6uaHa6xFt9cYsPIr036klryoQ==
X-Received: by 2002:a05:600c:4e50:b0:3d0:bda:f2c with SMTP id e16-20020a05600c4e5000b003d00bda0f2cmr3600512wmq.117.1669034046972;
        Mon, 21 Nov 2022 04:34:06 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id q125-20020a1c4383000000b003c6cd82596esm18130468wma.43.2022.11.21.04.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:34:05 -0800 (PST)
Message-ID: <8572b192-bab4-645c-4046-3e5586178312@gmail.com>
Date: Mon, 21 Nov 2022 13:34:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/9] pinctrl: stm32: Remove check for pins-are-numbered
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski@linaro.org,
 khilman@baylibre.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-3-bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221121015451.2471196-3-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_043410_748218_44D5CF33 
X-CRM114-Status: GOOD (  13.39  )
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



On 21/11/2022 02:54, Bernhard Rosenkränzer wrote:
> Remove the check for the unnecessary pins-are-numbered
> DeviceTree property
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>


Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>


> ---
>   drivers/pinctrl/stm32/pinctrl-stm32.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index cc9472b284047..1cddca506ad7e 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -1499,11 +1499,6 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   	if (!match_data)
>   		return -EINVAL;
>   
> -	if (!device_property_present(dev, "pins-are-numbered")) {
> -		dev_err(dev, "only support pins-are-numbered format\n");
> -		return -EINVAL;
> -	}
> -
>   	pctl = devm_kzalloc(dev, sizeof(*pctl), GFP_KERNEL);
>   	if (!pctl)
>   		return -ENOMEM;

