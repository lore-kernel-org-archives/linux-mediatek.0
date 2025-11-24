Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3BFCFD341
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Nov 2025 17:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dgj16XmQKLfzuMiMJnYwYhnRMSc7HIdJxo40jdxC8fc=; b=HcnVB2cPFdB/io
	rkTVPU22Wu9fuHj+Bmh951M5LRuxTd7I2kkhy+J4QEYj1jsAKYlcT7PayKk2rZMXtwoDDPiTnHWF+
	eDxkts+yUAAaMzGuyZ/9x8Z3k/IGlmZ489wbjqb178vk7DK5qAOqUQoy2F8y8HkhgYfPVvKpDM8O/
	szNoh149qTSN65FrcR9JTkzVMi2CCw0YwidNruKEnlArbx+zJ5eWtpt5VUedr33EfSra+j6UgReT5
	Y2tkJ/JKMpAsFVRr2tbaP5pS19UbNFMJ7B4BvhtB11JFngpDP5nfxTe5P4m2Be+oiPSlROCmwzhHB
	7fSU6kZsHdcKedAyX1pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNank-0000000C8b7-2jhX;
	Mon, 24 Nov 2025 17:56:36 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNanh-0000000C8aF-2Se9
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Nov 2025 17:56:35 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47755de027eso24501605e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Nov 2025 09:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764006991; x=1764611791; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dgj16XmQKLfzuMiMJnYwYhnRMSc7HIdJxo40jdxC8fc=;
        b=A/n34a9DxVpJXi1RaTVFZj284yFUdo0wNHNJQ54to2LNre9Rn0d23Gy0hvLGa2NleQ
         0RS+HhnhHVsPYBD+9ebSxWir4/uvzW3dotWaBZM+xUQKJJQlqU1MCmM0uW+EA5OEc7r1
         OWJul8K5/ELRHoyOyaK2n9Dkobv9QbVdGHK+KvX0XTOOEdyjaZMG/+UTYQGO6GxSgq19
         aI4G5jHEkiFjPDD/mOIODI4miCSWrzyUHnzEDMTICMyDN5fhVlhZwEY5JDiimeEi5p9i
         GVgLQgBlQU4bLGvMZ9yOn/D89STKWHOmNb4s2iq1bPATKh58Sy7wrSm77htUPEs1YXUE
         JBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764006991; x=1764611791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dgj16XmQKLfzuMiMJnYwYhnRMSc7HIdJxo40jdxC8fc=;
        b=ms7LurdBDh3pGXpgRZnjJh2VSpkTLK0jxsSHnUuM5U4Iv9AVFoQFy34M73JNtQLuM4
         edmNVw8I3IltEACdAMGnJwwtILYKxmY+VQ6AvClb3x/ALAvC+lLNGp1QpbWIOhSdfVIs
         42WbwctNxWMUEzPMks3GcPVbAdjEHlnYhBIQMOrEbRPrzPIAiyEcBW3PWzHNavumiio7
         DP+AbjIdW/+aMj1S8PzoduznMjsO0JucVJSKGVdmcvBhI69u8ox2kFndOOBzm9q7JRfZ
         s0U2QxBMImFc5RLKdv4X9HkM0BU1hfkowlEU3dhi8YFxx1/OYSO3FIid9ENqiMqWJkIm
         7wkw==
X-Forwarded-Encrypted: i=1; AJvYcCUoHSuKkClbzSMBh3TvB8wvxNIIJNdXdkxTbs1h16HBOVcdHay7DPc7dbylgLXG44N+te/O5VqWQzjmaCDv3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDBNUkU1M/FRxLOr4KpBxGrEqgy5KkkUX3PmJ9XYhbvJCWFsPe
	HfigF/q3Cj2B//fHreyORpMwQbxcMbFfaBYfU5hG0YUeveRxxha05Ly6RlH2C5edXEc=
X-Gm-Gg: ASbGncvcwFME88NnsSivEQt767EDEytWHZqwsiFIUKwtMVgc0SExzvZS9zbkLHdzg7J
	BVefs3UQ7I4hVkIJhUoaPWTDQVu9xYYBWpzL5V+meiCMnIvB2vmVa6RCe4l6yiEjFwPctZozI7K
	WFRuABSliUnFqetiTBMt4w8joPwKGqdqqEy57d+7PHFiO4U2Tb0Mq5a7ImC3NOOlib3opoSALzI
	6OYMg1EhJc4I0LGossXM0Wtp2BNg8LYB6C0aUumdMJ6krU0bcHmAS1XNADdMtckZ1vK+Qn0gZIf
	610J+zbJpBRS2exYBEYK8WrZJhae0fZmnPvOAOU85eOlnaNHFvPE3cHTE9KbHGsBuJ6PYi6zfst
	2kWufHsrmWIuWYf5n5So62x0qhzurCreIPQ78AuYQYit1zrTN+GkHgv+tCo0l1Z0tz7wHKXR3z1
	7i2jhnnxHg0nUGueJy7l8/Fe+ezogmNxobVhV1D7Qi/mxpZrT49EnNnzx93lwgqSSiGVhjKY3bB
	8y4
X-Google-Smtp-Source: AGHT+IF9jQYjGDYWRD+2xNGzxOUo7frTRxo+/YiP6cBgQWSgQQXQD/fGaLUkrkLZhoAvTfv/zaiUjQ==
X-Received: by 2002:a05:600c:1f94:b0:477:28c1:26ce with SMTP id 5b1f17b1804b1-477c016bbd5mr123402035e9.7.1764006991417;
        Mon, 24 Nov 2025 09:56:31 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:a756:bb6c:7b35:af9b? ([2a05:6e02:1041:c10:a756:bb6c:7b35:af9b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477bf198a67sm217894095e9.0.2025.11.24.09.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 09:56:30 -0800 (PST)
Message-ID: <190003b6-2931-406a-a8f6-ec8909c65162@linaro.org>
Date: Mon, 24 Nov 2025 18:56:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] thermal/drivers/mediatek/lvts: Fail probe if
 temp_factor is zero
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 rui.zhang@intel.com, lukasz.luba@arm.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
References: <20251121-mt8196-lvts-v4-v4-0-357f955a3176@collabora.com>
 <20251121-mt8196-lvts-v4-v4-3-357f955a3176@collabora.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251121-mt8196-lvts-v4-v4-3-357f955a3176@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_095633_654349_D88ABF82 
X-CRM114-Status: GOOD (  16.15  )
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
Cc: andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, arnd@arndb.de, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, nfraprado@collabora.com, devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, linux-arm-kernel@lists.infradead.org, wenst@chromium.org, linux-mediatek@lists.infradead.org, kernel@collabora.com, colin.i.king@gmail.com, bchihi@baylibre.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/21/25 12:16, Laura Nao wrote:
> temp_factor is used in lvts_temp_to_raw() and lvts_raw_to_temp(). If
> platform data is incorrect and temp_factor is zero, it could cause a
> division by zero. Fail the probe early to prevent a kernel crash.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 1c54d0b75b1a..b49441d82ffd 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -1346,6 +1346,11 @@ static int lvts_probe(struct platform_device *pdev)
>   	if (irq < 0)
>   		return irq;
>   
> +	if (!lvts_data->temp_factor)
> +		return dev_err_probe(
> +			dev, -EINVAL,
> +			"temp_factor should never be zero; check platform data.\n");
> +

 From my POV, this is not really useful. The temp_factor is set for each 
version statically in the code. The scope is limited to the driver, IOW 
it is not a parameter other subsystems passes to the driver.

If it is NULL, then shame on the submitter who did not test the driver 
before sending ;)



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

