Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18C8C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Nov 2023 09:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/Us8oVneVkSrXYGx1VHyFzAEG/952Zvs6JVIWe0JBw=; b=QgBAWRvZ2pWCNIdod+WdQJhByH
	7YjNA4SUpRPR1rP2orHCdbUkWD89psusAteEx+7OAMRaL/AceWMr5rypcrHgdtobr8Mw4roz/ABeZ
	ASE9ivdZrPxCFCb5uZTL8vvt3/CpIX9ES3lwaHRzuQN6iFi5XDPE+8UzTg7yz0jJU5y9PfVcOKVtg
	hEaqUX8RIob/bmaDoemmo+sdsvwLq7HKCHdA4lwF1htx9MZZ36Qz/tXM+Q+TLwkTzihe98oHi7+oi
	8Dznphq4p77TfErkuyI6O3xWwNhhz/9HEwfs5rfuFadivkodeSU49askDj/DtB/umJOh0XaOWLvws
	n6ykq67g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8cvi-00AGzS-2W;
	Thu, 30 Nov 2023 09:01:54 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8cvd-00AGxO-0V
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Nov 2023 09:01:50 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a1915034144so3462666b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Nov 2023 01:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701334905; x=1701939705; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c/Us8oVneVkSrXYGx1VHyFzAEG/952Zvs6JVIWe0JBw=;
        b=i3R7yTjfsTXB71v+LnULIYUIEr6bTAddk+y18NNZG7wo5vzgbfe8FIGf+rdzw5QMnC
         o3YDeUJTq2FsBBaZRNuI67p5nXcaSuLDZvd/W4zvxwyqcZ3nzBwJp3ZKH1xmz6yDivIJ
         dO8K25itxM24M16aSlnBvE9N7FnUi16Stny2hgfIyFEhsAuXxjqnaTw0eBpBkpik1HOL
         yzW8T0CVk6dIXYRhjiqhU4ILxh+EuQTBeZPd8jwreSS/39q483fzAQpiUT/3o0jSNMkv
         wWnG3A6FqTYEXx+IUUjq7/wrSGEETt5DHQWn5ryWazRAnZM3+gDTQtmuPJGUpxq9W21x
         +C2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701334905; x=1701939705;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c/Us8oVneVkSrXYGx1VHyFzAEG/952Zvs6JVIWe0JBw=;
        b=lWvBUWE+VLopHWOuZFK3rNj01dxHb5BCey8C1o7iqTRbKv21WSH5p/bwy5exKttuw6
         i2bB8XMM4QwvTfROfiymKTB+8ahkMVlbAF6wimVyXnwLht+rBs0XMEXlyDLXdDWa2TMa
         6rP+cGiMzNOwd1GI61rnCv5Dijc1FNNnpUcnVWvdiCHJ90ZSFpMVYtC4LTGBVHSNaw8s
         EvkwvV/uLLx3s/4PGSMDqGjimpAsawNYZYkzyt4IlIk4B+t2u9nzlyH+VxaShZ1GE3oM
         Qqnvhm+E584hQFQBxCP8b8PD9XKijGinKr59ehiqnQPECOs/8FJb8HDh8j2ZChSiBVoL
         Wllg==
X-Gm-Message-State: AOJu0YxhwXHMgJjKlqaLeYrBLFRjqZ3+jUfjQ7tnPYFcZ54olR4w8UEj
	cZ80HgCKSwMM677u3wTZhK9OcA==
X-Google-Smtp-Source: AGHT+IFF9/7xby9d5Z1C7wgZ/A59zGyy3WTylTdicKDZbeXWpEjhKrQfSwq3UbfA15wTXmo8wSpaQQ==
X-Received: by 2002:a17:906:2306:b0:9e4:b664:baa8 with SMTP id l6-20020a170906230600b009e4b664baa8mr14055106eja.7.1701334905432;
        Thu, 30 Nov 2023 01:01:45 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id h14-20020a170906398e00b009d2eb40ff9dsm449444eje.33.2023.11.30.01.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 01:01:45 -0800 (PST)
Message-ID: <299f569f-c3e7-4807-a141-4bbc06435f03@linaro.org>
Date: Thu, 30 Nov 2023 10:01:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183-kukui-jacuzzi: fix dsi
 unnecessary cells properties
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org,
 Eugen Hristev <eugen.hristev@collabora.com>
Cc: krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 matthias.bgg@gmail.com, kernel@collabora.com, hsinyi@chromium.org
References: <20230814071053.5459-1-eugen.hristev@collabora.com>
 <170126437824.153055.10626099314938040381.b4-ty@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <170126437824.153055.10626099314938040381.b4-ty@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_010149_233633_987B8A7A 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
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

On 29/11/2023 14:27, AngeloGioacchino Del Regno wrote:
> 
> On Mon, 14 Aug 2023 10:10:53 +0300, Eugen Hristev wrote:
>> dtbs_check throws a warning at the dsi node:
>> Warning (avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>>
>> Other DTS have a panel child node with a reg, so the parent dtsi
>> must have the address-cells and size-cells, however this specific DT
>> has the panel removed, but not the cells, hence the warning above.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] arm64: dts: mediatek: mt8183-kukui-jacuzzi: fix dsi unnecessary cells properties
>       commit: 4b66a34afe29d991155081b2f1e10482bd00cbaa
> 

> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 

You know, your SoB implies review. Unless you want to say you
usually apply code without reviewing it...

Best regards,
Krzysztof


