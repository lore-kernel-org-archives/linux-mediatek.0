Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE3BC001DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 06:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RmzlTlEgcYnJC16d1sILZcykRMmU7oi2/EECxLz3EA=; b=Y12ldBHzJ0VqkdP1DdnQiHA2L3
	JlTPkPMsVxfMyJMMp8EKzNqhtuxNr5dHTz+k6X097Z7EQIueZfm1K8RE5zo1e2j714W4obeSrru0t
	5X7DdQMw/Z0P251ghkb04cUw2/UMcQoj2lZS7MRHPbS63Y+PB4fOnadMT0SKp9RUZfHqLXLuI/1PH
	xfnLKFDEQSN8TQzy9acpk7LhACtsR88xkUx8LNs/z5jpunQy8QMgVHhn+Y6ywOqfP4GIrvhYAarjL
	B1iKQRO87MAbKYqVEG7TkoniMZZBO1uPd+F/iIbBKL3PHgY2WjDgdLFLh1VSh0f7HOC0EuVzcxBHA
	VB2B0IIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzAh-006f4g-25;
	Thu, 10 Aug 2023 06:29:23 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzAe-006f3P-1G
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 06:29:22 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3179ed1dfbbso547850f8f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 23:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691648957; x=1692253757;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7RmzlTlEgcYnJC16d1sILZcykRMmU7oi2/EECxLz3EA=;
        b=gAH36ndi9Z8jmOqcwwQ7x/zvyE9DXiTJt+CSTEM/FkIiLCr2eMFExpHOad4v/Jw4OM
         aaDB6r6JMaGe4n2ZCqSk+DHv7LGjeGSUvXvmU7RGXLZqb/SXV6ThYGEKB9UlYWlwxdNc
         PKnwXATug8YqgRO0/yRIjFZ8TtGtkZvT+1bVlhhsBCqof40RT8tqjir28cicrtOA+3xQ
         FP3jTQwhRlIp6UjWZTYBaTZgo2WcI9+cyzqAskTHDPBCHAX/VC2Hgy4NL542stdPHVhe
         ew6+J59IPPJLaayqRgDMORH75w/IvfZI4tsdX8RtgGAAwM9Xon4XoeDPAiA3X8wPlwAW
         9Xeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691648957; x=1692253757;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RmzlTlEgcYnJC16d1sILZcykRMmU7oi2/EECxLz3EA=;
        b=a8fX3890Kv2tELrXuw4bFZJb1fdSKK7/dAu4mLdIq+Sr4T4EL9HlS+KwIsPs0eTuEj
         pRVSSmcpKIFm4v+uwJcARU4PLeRO8l21Nau5ghRUz4/7eYZmFI00OoXWCsTZKAdGvCqp
         jSpxk5J+8JAmQ7n0zwLAksFhORCFEV2/0aNRvwiqGp7JiZaBypmj9dtfT9OEQ3qIqkdD
         ujmCdW8YRdN2mVCXXegWBHyQ4XGMBBV/TefhTNYXN6VSjOcG6uf/HG65LqJOjp5tW2k4
         vUybK2j8rIq3ntuUh73LvyEFhcvKXsaAUK2SQOy+hM3oYVM7UYGqzrZXKG7SGu7H6qx3
         Ypfw==
X-Gm-Message-State: AOJu0Yy6R5IS9TdWbtsclgGKOolPl6XSpgGxZFXZQVkh+0gJq9NRhS40
	9XH/xgViXPYg+xQ/Io/MsGgR9g==
X-Google-Smtp-Source: AGHT+IHfM/E+7Vgu6aFKR01Zqy+crsACs4Det4aFk46Ou0O9aYDEJPY0PlHY2lvhIjir+EnM/ZCkWw==
X-Received: by 2002:a5d:62c6:0:b0:317:65de:4389 with SMTP id o6-20020a5d62c6000000b0031765de4389mr1331788wrv.61.1691648956800;
        Wed, 09 Aug 2023 23:29:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id k3-20020a056000004300b003177074f830sm1026903wrx.59.2023.08.09.23.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 23:29:16 -0700 (PDT)
Message-ID: <b786f564-b2dd-8b6c-c4a3-c861cbf74f16@linaro.org>
Date: Thu, 10 Aug 2023 08:29:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 01/12] ASoC: dt-bindings: amlogic,gx-sound-card: correct
 maxItems constraints
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 Rohit kumar <quic_rohkumar@quicinc.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Rao Mandadapu <srivasam@codeaurora.org>, Judy Hsiao
 <judyhsiao@chromium.org>, Trevor Wu <trevor.wu@mediatek.com>,
 Jonathan Bakker <xc-racer2@live.ca>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
 <20230731094303.185067-2-krzysztof.kozlowski@linaro.org>
 <1jr0oowg6m.fsf@starbuckisacylon.baylibre.com>
 <076d8a7d-8369-4e88-9997-d54b91b7920d@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <076d8a7d-8369-4e88-9997-d54b91b7920d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_232920_427106_41A3397D 
X-CRM114-Status: GOOD (  12.65  )
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

On 31/07/2023 16:46, Mark Brown wrote:
>> The upper limit of 8 might work now but is very likely to be wrong for
>> the next device to come.
> 
>> Is there way to correctly describe this "pair" contraint with DT schema ?
> 
>> If not, then I guess the most adequate solution is to drop minItems and
>> give no bound, like simple-card is doing for the same type of properties.
> 
>> Same goes for the audio-widgets property
> 
> Right, dropping minItems seems better than pulling a maxItems out of
> thin air.

OK, I will drop the min/maxItems and send v2.

Best regards,
Krzysztof


