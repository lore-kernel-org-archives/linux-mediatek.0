Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56789EB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 11:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XT+twtxTCYlY8c/fAcsypV3E8gY0Retau05eex4/coc=; b=SQXN+uvoW1so6yTHii38Oq+KeL
	D28JcvZw+FZ2hzdnDy3OPU/D2inphVc7DOxe1rJCZEbXfZFkqiuvd28Y6Ocje6Mr3HbFMAE6awIpp
	pUf5/Lb0rxmpTqNgGHFYNIgq7cZKen7wUIuT7tQcJWCPBLVw4+PPWuRVQqeewPiOifNGabz8SuIJI
	MQBbMuD1VuyIl0ybdDxe8WMdVZyhNOjV3329pyYDbk/WLJLAlL9DT4qYu0Jkis5SC9aYy1L06t7N0
	qRfLhRH2lTaC0dZqpOjwMMyWnvZaGxirKgxHbwIBtDICusw37PgF1LBZg9Nvm98lcXrRBiingAz6F
	hnpdbdFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSGw-00B3Xl-1K;
	Thu, 20 Jul 2023 11:56:42 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSGt-00B3WS-06
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 11:56:40 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-98de21518fbso131083566b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 04:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689854197; x=1690458997;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XT+twtxTCYlY8c/fAcsypV3E8gY0Retau05eex4/coc=;
        b=XS8Ww8msMEZs/ipVPCAvtq8Bb80loTAB6c409luGUXfM0uY2yxO7tdkgsdWp3hU54n
         lQtIY5uBPsxjMB8DL81Yd9XaIUxUFm3B50keC7pUXieqY3L0EGoVLPhrNDeb54L3nOPZ
         c6HvYnaLhpByo7cYJSnzwyEpibnMSOEFT/+fu3xfycGw4qKGdWDoPQ2hOJ4aHzyaKY4W
         xuoOJ4ihqSQTMMcGpZunWRKdrPEJ0HCtI9pXMT887hBwufx0xALi5w1ooXOmaPvVoCio
         ZJinjazCqrnYQLOuaC/3R4Zm2ruf1C+D5lAWf48MuoJ3vt9CGKzW2Jax6s1kBFQouXXu
         rirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689854197; x=1690458997;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XT+twtxTCYlY8c/fAcsypV3E8gY0Retau05eex4/coc=;
        b=bI+NUnUE0OerjXaC/c7RGmfU5xs1RDCQvDr3cEird4XaAXJ9buG8ZwkRWM6L7ZIruc
         jzH5D7xNm2Ef4NuJAyEYUtusbdfWPAAmd9vwUXaPG17SpmUTisFj/czqeDwkV3WarW0+
         o1AM7PxayaFgmVeenMaXygPDuwBNPSwLgf2nAzwYMkqkp5ijGZ0ZZ6brXzMzJeED/oc4
         VlOLvQT45JWG3RNfhxl36s9/gjLoErXNUNRnfiAiYMfg0t2Tg/TIOVue1ao1WvIV6I6r
         bM/tX+vScMMOv8fDslmhSvjoj0a05V/3Q/OyYtno+cHc30DKtVDq+Gb4FHA77Ha8CHJE
         d9ig==
X-Gm-Message-State: ABy/qLZR0KDPdJW1o7zU+k0ZGmn31pyNijK3Tr4Z0TOzeXiEJf8Me6FK
	LuHm7qwvXoY+0tBE3ruDh/iNTMAU4Hwep3i6dxk=
X-Google-Smtp-Source: APBJJlFVjStzouiZKnkcXn2pw0FoxAW2Q1fP+GOjFCDM1mx82BJGWEwxEzIbVUCBJBs1m8ITXpnTVg==
X-Received: by 2002:a17:906:1059:b0:982:1936:ad27 with SMTP id j25-20020a170906105900b009821936ad27mr5349271ejj.11.1689854196613;
        Thu, 20 Jul 2023 04:56:36 -0700 (PDT)
Received: from [10.1.3.131] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id lv19-20020a170906bc9300b00989257be620sm587462ejb.200.2023.07.20.04.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 04:56:36 -0700 (PDT)
Message-ID: <4e0bd4ce-1344-4a63-e1c3-333857b3d226@baylibre.com>
Date: Thu, 20 Jul 2023 13:56:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] arm64: dts: mediatek: mt6795-xperia-m5: Add display
 backlight support
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, kernel@collabora.com
References: <20230720091559.86406-1-angelogioacchino.delregno@collabora.com>
 <20230720091559.86406-3-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230720091559.86406-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_045639_070652_8DE7765B 
X-CRM114-Status: UNSURE (   6.90  )
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



On 20/07/2023 11:15, AngeloGioacchino Del Regno wrote:
> Add the relevant nodes for display backlight on Sony Xperia M5: this
> needs both the SoC PWM IP and MT6332 PMIC LED strings.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

