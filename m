Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE72EC6FD19
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 08:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p60r4RQIq9lENEGJ/QlwBJoxKpdBJ8AZmTLP4vyPj0c=; b=ndDq9ZON1YfDtWB73QpdSyRRgR
	rzTFc9aHWCqJfDL5SMXrGwp65E+I8W/k6fk8Lt+ruxUEkzMv/DZGeeoU2ZAxaaouIRVKqgN2zcpiJ
	Uq/5DrEl9tB6eg+pXkBvnsb51GXJJ9mehxSfDq9xQMvslNtKGxzUD11119+9NmSIuzSoXZ0amf9I2
	o0yVba2NiJ8lK1GSOqMu8mof5KHhffimkdQ1RedrV/qFPFelXKJhin0akNX5nwwtPq0rC+6WovQR1
	/OTLcAmBucJpH9g4XnGxWUMJDeYUVVXGH5jiE/kJ8k91BjC4+hAuOJ0tGLq0sy5y+uJjEvz/julag
	CQQ4Is+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paY93-00DedW-74; Fri, 10 Mar 2023 08:30:33 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paY8w-00DeW8-UU
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 08:30:28 +0000
Received: by mail-ed1-x530.google.com with SMTP id o12so17299527edb.9
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 00:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678437026;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p60r4RQIq9lENEGJ/QlwBJoxKpdBJ8AZmTLP4vyPj0c=;
        b=U2DJBT9jLSVEnNTuWNboA4NSBMdTcdylwj4pN0VNQQI2ErOS9XwoG/5UrpaHqqS/yZ
         TaUDD6IXkLxo7YmKotKwwzGxl5/vjGDKpXS2bry+fDmKinNTz2I8ajdkJs+7D2dEdiUg
         LQ32+z74oJynSwhXUCJU3Xr/PUFW4q8/wE5jjr1qBKI1tyXuREmUoEckFUG0QBcy5xS5
         thxJtBxSVTpkpjfiBHyBwOnAGTGLivPNE7WpimSYNqzkGYF+8B+eijs3NMmgFsEPFCI2
         soe2e5hXdPO3EzalOcHwwMlgX8geBEGgM3FsAySqdoel6QmozeCbEYTDhvS7LNI/fqVj
         nZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678437026;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p60r4RQIq9lENEGJ/QlwBJoxKpdBJ8AZmTLP4vyPj0c=;
        b=miiBPVuwmLewa8eaE4SqW3sJNVnJWm7gY8FMOZdK++nXrmgzO0HLLwH/Ws7W9pDxzS
         3nnh5Qa7pAa8atXMRKQ2SFpwRAxGzpEOxCLGGm3KTvxfYvYOsgw/VuqrpERb/ACMBQlZ
         414Fx9v436TM4SgVc9mCH4Brld8REEicxR5aiZNCBwDUKaDUzN3lI/ws6kIKcu1thXUI
         Qls6hzcR3Jhp0gyTHXATu1y2r4GwuPl8FksgQ18qpqQ06qzyK5sHFSN/E3MngN73kNYY
         Q+b6Mn8F6Gr2PJtBpL35MVNA0aRLC3g5f/92RlCCIqLp8uwr/x5jd3HD3PBuIaLgAScf
         D8tg==
X-Gm-Message-State: AO0yUKXdeTWz5FwKSyQkKd80NG9fACOzfcX+1cIrUkAxVR58IQcZqJXg
	hl7GZ77NAU7brxHdrLK8Vy99TA==
X-Google-Smtp-Source: AK7set/yNYP1EquMq3rDndLAJVWho/hyhK9d2ZxbDbkWV9KHk72jmIVb6JNErXFWMCT99dUz7Sb83w==
X-Received: by 2002:aa7:cd0d:0:b0:4d4:d933:4ebd with SMTP id b13-20020aa7cd0d000000b004d4d9334ebdmr23053795edw.14.1678437026457;
        Fri, 10 Mar 2023 00:30:26 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974? ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
        by smtp.gmail.com with ESMTPSA id f11-20020a50a6cb000000b004c25b12b7cesm541950edc.42.2023.03.10.00.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 00:30:26 -0800 (PST)
Message-ID: <008f616b-c956-f9ea-7436-039f69808c8b@linaro.org>
Date: Fri, 10 Mar 2023 09:30:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 02/18] dt-bindings: mmc: mediatek,mtk-sd: add mt8365
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Guenter Roeck <linux@roeck-us.net>,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 devicetree@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
 <20230203-evk-board-support-v2-2-6ec7cdb10ccf@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230203-evk-board-support-v2-2-6ec7cdb10ccf@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_003027_040409_0C26DFFA 
X-CRM114-Status: UNSURE (   8.30  )
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

On 07/03/2023 14:17, Alexandre Mergnat wrote:
> Add binding description for mediatek,mt8365-mmc
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


