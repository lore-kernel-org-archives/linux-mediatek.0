Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC1BC04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 10:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6yHs4rSxOQ6qy2Hekl9h1Wn+oXWrJB1lIm/YYC/7yc=; b=O0mKam8dWNfVBjA4Xuo0z6zy7R
	a9RwfR+xeGLhOPyA2ong69utoTssuh4ptgk0nVUXyysuHF+m/EeQlQLsKjLqKHTBiX2IY38fymJdZ
	CC88FQnaQkjFKWh+rUfnW4LJ5EcNgr4LZJ46MJ3Bj9aKNRyuDrmZA5R6HQt08XzPtcvGSHAarAIjI
	LIOEdiONYrkhSMAGWFOu4Ot3nSMmp1aTF5SBFH1dPw4yvlDB8pRPQvpp9U4kAJWOlsA6fg3eJSK8K
	jVUfIarhUMHegffazfzjQq/LtIpr/o0iKKJUYtQXJ7WMo17IKWFsnZCeWORnXeKq674fJOF8UEA2+
	zDxOX+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8zrL-0000000E4rZ-2AbO;
	Mon, 20 May 2024 10:03:11 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8zrH-0000000E4qH-3jwg
	for linux-mediatek@lists.infradead.org;
	Mon, 20 May 2024 10:03:09 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a59cdd185b9so1048183166b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 20 May 2024 03:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716199383; x=1716804183; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a6yHs4rSxOQ6qy2Hekl9h1Wn+oXWrJB1lIm/YYC/7yc=;
        b=hOVnBesv11ZyP4ynKFcNJCLMMqfoIB3OiNZHbwIqH1xUDKfvKl+rzatRzeEDwCalx0
         paRLFJpzQOr14gOyPnKpuF8+ChiFu4na3SiHFYWPxBbsuT42iW27s/Yyw03+Z117Ubba
         Mnpe6W46OcdiNbFMrRfD649dR++Jcurw0vLSgcUCjpupyzTHgo3yFjQ87RmeZAIC5lRL
         aOg3ZfyEAEy2ysBMFTIHZz7P8p9zgJh/+nJMzoxqTFtPBsBpcbEObBYIqo3dnd+vuTK2
         4lzWCas2Xrc2sDU7y/q2pof/Yi6DXHNESOrWFcnPbjkFTCdWEGLwedxAMElGwZRPdwBl
         ET4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716199383; x=1716804183;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a6yHs4rSxOQ6qy2Hekl9h1Wn+oXWrJB1lIm/YYC/7yc=;
        b=n/PkXgMygLEyDHrHbsE3vzD1u8DSEa4Wk3abVFN4A/W49AoPP5R/eR7H5WeAOXdTnj
         GdzvuroeDiN7Qd+Y0amnp4qoMMiYXSQ4GVDWYbjIGGGLNtbCSEa7IzOt3POFuCASWoPm
         9yNKIGDfKj45XVG3Wq933pVA6cUSsfqPq6xUClpUPX9ec44AU2NVoSm5s80cDcoEwaPb
         SDluU0QOue5lCn09Gk1hOZcNIyayFmaURMQwvLmgNdqhLraCK83vKuTq8sdzUC+ZkFxd
         KACeTZ+OsOzFsbS6cNsiRjC16Qs0ndP8Cj6uVcYAL488fuO6FgOX0Wv3ppZLlYO9W9TJ
         G7RA==
X-Forwarded-Encrypted: i=1; AJvYcCWAey0Dz+0Uh41/odpnquEN7Q3pTiOigOvHltEyj2irDhV7/MpNmwC78s7EUfy43r9xHfoO4xZZ3OPIc+rteBIixCFIx0gJk2AGvtqf7Kk6x2/O
X-Gm-Message-State: AOJu0YywfCdaYTxa4fHZzwHoe3SagaD6l6e3YIUoaLsCRwz72uLmCUK1
	fPR09JOZqA425hd4IiugksOPkIS38wrpVoEObtlOGcCqX4Yzks+rBpgELCE7pho=
X-Google-Smtp-Source: AGHT+IHvS6YMfewPPk1qx5NmgVCTMgWM7DY6JEB92R4p2YnC056jgBx3nsgtMXv/G4ze4/9m3RKHEA==
X-Received: by 2002:a17:906:cd1a:b0:a5c:dc46:d252 with SMTP id a640c23a62f3a-a5d6003d4b1mr491279766b.38.1716199382808;
        Mon, 20 May 2024 03:03:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a691870absm982730466b.124.2024.05.20.03.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 03:03:02 -0700 (PDT)
Message-ID: <1540f43c-9859-49a8-9b20-1fb08d1c153f@linaro.org>
Date: Mon, 20 May 2024 12:03:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: mt8365: drop incorrect
 power-domain-cells
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
 <20240518211159.142920-3-krzysztof.kozlowski@linaro.org>
 <3b1be547-ac49-40fb-909f-96952c299545@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <3b1be547-ac49-40fb-909f-96952c299545@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_030308_074666_E9DD12D9 
X-CRM114-Status: GOOD (  11.42  )
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

On 20/05/2024 11:58, AngeloGioacchino Del Regno wrote:
> Il 18/05/24 23:11, Krzysztof Kozlowski ha scritto:
>> The top SCPSYS node is not a power domain provider.  It's child
>> "power-controller" is instead.  Fix dtbs_check warnings like:
>>
>>    mt8365-evk.dtb: syscon@10006000: '#power-domain-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Well if you're fixing that by migrating to scpsys compatible, you might as well
> resolve all of the warnings in one commit, removing that power-domain-cells
> property in patch [2/4], otherwise this one is technically a fix for that.
> 
> Please squash [2/4] and [3/4], like that it just makes more sense.
> 

That's independent thing. Previous compatible - syscfg - also did not
allow power domains. The difference is that bindings did not print a
warning without my change. We can reverse the patches if this is more
suitable.

Best regards,
Krzysztof


