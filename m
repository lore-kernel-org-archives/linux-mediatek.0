Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC5AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 14:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CzaWRvmCNDfbNWucAb05HFkW7aZalGnvVeM7FrCH8NA=; b=M3Yjy+fpjnJela
	OV5kBQYjQbE0Vyv9+zmVwfCAmroSQUUmVU8XTH/hQahN8ATyOgLQ/Jp8i6UQSKZPvLs3QYxbfmEjt
	s47Wv1SE1JMN2t4hF7t5FKa7TmR7mUVcmKRqRfbD1OGesFnZfNnR9lOvspf++loMM7OFYWkYFp6Hf
	z887/vTTNtYQO5UWpshpqClhjsD5L5W88Ezr9sSY3Sd5mNKO3OhVnX5nBnbkswILZBw1C7Hl3VVvC
	MMHGYE8GKGYDDLd3w2kwtUoojRQ/BbMgVXJfHqiETJXhgKD80VvngWZfMw6ZvcC/ZlMDsMEeFHyit
	YFImTw9YUVkxkzPVU0yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZCpE-00CUMh-UC; Tue, 29 Mar 2022 14:28:00 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZCp2-00CUJL-Br; Tue, 29 Mar 2022 14:27:49 +0000
Received: by mail-wm1-x333.google.com with SMTP id h16so10442077wmd.0;
 Tue, 29 Mar 2022 07:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UkJOWRMCUbYGorBI9uSjtZM4DcqQkhNQvraKREd6DJc=;
 b=V1fRhBIzg9+s+zRnUxg0fUPZxucXslx9ozftXP1RpkHrH4Ef/J8W7paMsNPEPzNxWp
 /+Ns57oOWvMkb+7cVyvajnyIZ2+yq4WYSY+FWPo89ChQev2ybZaNvp7Hn/qmjA5CdEKM
 73JvpoORSJ1tAfT4h1Yt1/pEtUUwyPm3yFV2bqjzBPkbPARl4U0g1qwDrdxAMHlfF1sJ
 SGrTJ1HowfJ8kmHppGztqy+CtZcl7iQKEd/VgkKew8vlAAVgS5hVKn1w1TmYwmiWcor5
 S42MkiEXSmEGlOXujsai4H4vmK3sMM1+Yx+59rNiHmIwoNyQtdcVWaG4DvPSBIZ6sflS
 5lkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UkJOWRMCUbYGorBI9uSjtZM4DcqQkhNQvraKREd6DJc=;
 b=cdC+KJQrJbjV5F0m0wzThxcvQXLMrSlVKqmApNLPB+V/wYjv8svhU47b2lRhJI3Sr5
 KkOK1meXBpDEhk8c5PTEwvbCBxqxvfFJQjixKznUfly3P2oLoydd9EZZUUmmBC4j2N1f
 BS73sZruOibUVbhxGrhTTIsbayPFNYmiShGxFNARrtpHf4jFRqiMiF1Mfo+/o3pIavAp
 G8NErnkgYdATogF5FzuXS0DjieueHPHJEbQJk/hdHlX90abjrOzpnldWrawOfx3ppm2I
 WEypDwM4ukJp1v6NLMRKlyyCEBD5ehre5xHHlUMUUyOwW8+todfdsYozggfjXwMMOf4U
 Q4WA==
X-Gm-Message-State: AOAM533TjTKBVTxcdLR1zj3ibilBZn33G5FLXCGdgsTkYBlT/RrlgYaL
 0XodD+Naq+/2OMzQe6qgsQ0=
X-Google-Smtp-Source: ABdhPJwX2KEy3tkZ1IjhynPidjlbcvxK0tdLnJQsJX0bhkANmcG0wKDngAHg7t+Pw1CwomTxSCE3nA==
X-Received: by 2002:a05:600c:19cf:b0:38c:b1fd:1fc9 with SMTP id
 u15-20020a05600c19cf00b0038cb1fd1fc9mr7334595wmq.103.1648564065633; 
 Tue, 29 Mar 2022 07:27:45 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a5d4348000000b00203dbfa4ff2sm14956641wrr.34.2022.03.29.07.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 07:27:45 -0700 (PDT)
Message-ID: <32931f81-5615-8156-4c67-bb4260488185@gmail.com>
Date: Tue, 29 Mar 2022 16:27:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v12 2/3] dt-bindings: mmc: mtk-sd: increase reg maxItems
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, ryder.lee@kernel.org,
 wenst@chromium.org, chunfeng.yun@mediatek.com
References: <20220329114540.17140-1-tinghan.shen@mediatek.com>
 <20220329114540.17140-3-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220329114540.17140-3-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_072748_439464_0DD3F97A 
X-CRM114-Status: GOOD (  16.67  )
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



On 29/03/2022 13:45, Tinghan Shen wrote:
> Add optional host top register base for the reg binding description.
> 

Is this based a on a new version of the IP? Shall we make the second reg 
mandatory for the new HW? If I remember correctly the reg needs to be restored 
after power save event. So I suppose mmc won't work if that's not done. So 
optional wouldn't be the right approach.

Can you please clarify if that's the case.

Thanks,
Matthias

> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>   Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 7032f7adf3ca..6d41bcec900f 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -40,7 +40,8 @@ properties:
>             - const: mediatek,mt8183-mmc
>   
>     reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>   
>     clocks:
>       description:

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
