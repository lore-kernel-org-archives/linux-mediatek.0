Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F557C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 14:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zm+/ZRBOZldlqL53b66Kc1VMqiVBWlw5REXJ3gKRg4Y=; b=j4dMB4rQHeijYwyFumx4ojxODE
	Wir7wzUSEvhNzkk3//5VNV7mBNM16OngT+fDHsKbWuSrZUDhqFlq/KHlfcr7Jadr6CY34c7TTQVsq
	X5hCEkDuEjOB3u5JI30wde6hz9TEFMXyr6zYQ7KT3bw2vGd3Fnmniygvh+FHmHSQlphh6YnQfE385
	BpCCX40fF6bRh7fi83TZ/TfgBp/OOFNIUZBaxxe8bC8vJDBWqWzjKT+oTYwY5REiOcev0/7doTihn
	T0aEy6QYNi9f2hO4BKySK+D3gWL126DRLGJ2SZbPSqwnK1LFyxmP39quTWCq+PMRv/1XCabf0ANxL
	eI33/03A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1pEM-00DeYr-0k;
	Wed, 24 May 2023 14:12:46 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1pEH-00DeY9-2z
	for linux-mediatek@lists.infradead.org;
	Wed, 24 May 2023 14:12:44 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f601c57d8dso9405805e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 24 May 2023 07:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684937560; x=1687529560;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zm+/ZRBOZldlqL53b66Kc1VMqiVBWlw5REXJ3gKRg4Y=;
        b=LHhbslmTHVtT9aRVJDuMWr6LDB2MF3ACI6tD/x5vOsxgQkBYgqvwDD2fM+JU9yS1rR
         XzvkbnASGuJZNpMiKuI2/qFlqr16uMdAr8lTmipfrNJb6s/OVD8XXt9gOBHYaPg/xnR6
         B6iJpZtoz1xSwOhBJMS1ND9SZv6/Ekphr0o7uDD2vsM7YYmyvFT+Fe4QprO+akeUiG81
         5TpJskzGdjOImOoOwC/fPDAGUD5jOnCl7oGrQ95IAJMqiik4rjNWC8EVUculVpwDP3Dp
         /2dVOwmVQ6isKH5XKbxJzxmAJGeP4NF0aaOh5tW8/GzYrRbooI3r6d8C9kyvJyTeU1I0
         RUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684937560; x=1687529560;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zm+/ZRBOZldlqL53b66Kc1VMqiVBWlw5REXJ3gKRg4Y=;
        b=atkQ4TEJ3/pa6FGk6IHtpjjR7Pl/lMFac25mOdMw7/f0LzeYoN9wWEbGTOrsM5IMpM
         6Kc/X4iaaHgtYKxv5c+IgP3LegNL6RgBUadrWi7a/k6fFR6940zB3KagLBpUM9YK1ab4
         CLW1ARcezVt068MZzMsrz1Y5IXhjBrDq/c40vGk8mlUGi8BolTKUowT6lcxy9G9jY3Jy
         JqAxlwtfLkUGR+WR/1oBA4rCZt8vEgejCYTfVFjvfdCQST3aGROp0ZedReP7DqjH0jZm
         BptIcbqGZXExaGdZ7hM3mW3Nh9OzwziBVPuOcrtI/BFPX1BCma2nfVnZx7cFbJk/vJys
         UztA==
X-Gm-Message-State: AC+VfDw3uK03SXl3e8EkIHwBKm3IjNCaLkbJk6cECmLc9/VcjIyrjQn4
	Cr6ovX9btvsj6kyqkdAzir0oDQ==
X-Google-Smtp-Source: ACHHUZ7ZiBQArVsrxbnbOPfcgyP4nY6sB/SNzM2bGxT5NtG/F1Eh5MP/d2t7lgX/aqnh4urNKvrplQ==
X-Received: by 2002:a7b:cbc9:0:b0:3f6:84:3df6 with SMTP id n9-20020a7bcbc9000000b003f600843df6mr9846304wmi.10.1684937560071;
        Wed, 24 May 2023 07:12:40 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c24cd00b003f4dde07956sm2444460wmu.42.2023.05.24.07.12.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 07:12:39 -0700 (PDT)
Message-ID: <cb2e035d-2630-2eca-3f15-b04e4d81c699@baylibre.com>
Date: Wed, 24 May 2023 16:12:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 4/7] ASoC: mediatek: common: soundcard driver add
 dai_fmt support
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230523021933.3422-1-trevor.wu@mediatek.com>
 <20230523021933.3422-5-trevor.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230523021933.3422-5-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_071241_970989_AE7B8A35 
X-CRM114-Status: GOOD (  18.81  )
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

On 23/05/2023 04:19, Trevor Wu wrote:
> There are two changes included in the patch.
> 
> First, add set_dailink_daifmt() function, so dai_fmt can be updated by
> the configuration in dai-link sub node.
> 
> Second, remove codec phandle from required property in dai-link sub node.
> For example, user possibly needs to update dai-format for all etdm
> co-clock dai-links, but codec doesn't need to be specified in capture
> dai-link for a speaker amp.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>   .../mediatek/common/mtk-soundcard-driver.c    | 49 ++++++++++++++++++-
>   1 file changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
> index 738093451ccb..5e291092046b 100644
> --- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
> +++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
> @@ -22,7 +22,7 @@ static int set_card_codec_info(struct snd_soc_card *card,
>   
>   	codec_node = of_get_child_by_name(sub_node, "codec");
>   	if (!codec_node)
> -		return -EINVAL;

IMO, the debug or info print should be welcome here because the behavior
change: dai link info parse will not stop if the codec node is NULL.
That could help to understand what is happening during init.



Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


