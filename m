Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CD7EE49A0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 05:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46RStdP/Qt/K8w0DMGkBqPuTHcz/tk87RawMdnkHi6E=; b=XWCFpNOBUGNMH7XJELrVht0oHV
	Y+B0ZrOWa0jzrpBHuNtuS5Zr/y4IwsF7MNKVrfg6hOzg7ahAt+fE5IxNYaGw1mod/PunBK0295ICx
	UHfl/vRbMVtqhjUqALhg1lg0G3RIiWsW4pQDSCdAm5f55imI/VzNJVoK45o4vBvIoToOoJD2cI4Oj
	dm2dTLZwZUHywPvMtab3svjcwn0+eDpawsgMJq5fcoK7Bb/uSEFHogzmD+eNNTTt0ot9NVQDqdvIO
	5h84N0U2/QL3NywcOTwrby7O40swXj2nTAC6lnO58IQMYRlHPZATBYbt7e3SDxu0FU7T0nqTFaggi
	D8g9NPJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYgj7-00HJKv-06;
	Wed, 23 Aug 2023 05:48:21 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYgj4-00HJJg-1H
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Aug 2023 05:48:19 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-52a23227567so909766a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Aug 2023 22:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692769694; x=1693374494;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=46RStdP/Qt/K8w0DMGkBqPuTHcz/tk87RawMdnkHi6E=;
        b=VgnbV634oF+2LRhvV8FXPyOie3JKBlaALcCr128w+ZlL8ZIfQ8r6ez41La0WHMQEEv
         I39TW78SBxefwEkutIgzcPgSGg5ALNbnOowDrIIhr96Wlnpj7De27UijIe/vzPkX1J5V
         j23uk0VgJmhNHtcU5sMktyx6u5ntsWY4Rf6EpZnXy/yxnUFXUX4etFX2vBg3Mim0ULhI
         joaWvlpusrpccpDEXDUk0tHBf16bPiuRayxl7Wol4EBYguW4mJKhQsilGbrNu4zEa3it
         02p/sVtPyoFJaRgwb8MKv7xb1iapVPfRIa6BL3k2MTWidKlmYcaIeCc16UJiOo8XbKUc
         g1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692769694; x=1693374494;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46RStdP/Qt/K8w0DMGkBqPuTHcz/tk87RawMdnkHi6E=;
        b=jl1uZxejK5v1yYlQyfCf/FjiqlIabGcT2RdbjE6Y7918/8keSnBAm6JDOpKJPcL2x7
         EbGUiijujRI7Y3Kd3dyJvPpAunRQtAcQe5iMwXAEck3n5HWokoKeFGA2xoOyi4fym8fw
         lOFbl/JN1q222oO0pYH/LsjR+m+kSJ0h4jD8h0DJvilM8+5UY/dyR06yC9kj2FI+AqdD
         RYoouMGbwh4WaOvINMGeVWlriTF323xkkISKbZukeMfac4BVr8ov3QlXsIuM3olhF/kL
         3QtDf1D86TvfZ6P10Q+FoS4P8EeSToPPytHgWra9pKL00n8tcgFCnDIewl4GuQ4ujE+B
         AcJw==
X-Gm-Message-State: AOJu0YztcRCsRejAt0nqq0Lg/ZOxfTOZOzdvY9hI8dey9KzVWRWpBIqq
	TQOViFhw44ThiHqejb57mDkOgQ==
X-Google-Smtp-Source: AGHT+IFPbUlDSF0J1kdpdEmWO0Ky+QwxfXgQYdaLU5e/JsyKQcL8x8+JagL85rqm6r5cOkvvGNImBw==
X-Received: by 2002:a17:906:8477:b0:991:c566:979 with SMTP id hx23-20020a170906847700b00991c5660979mr9479926ejc.36.1692769694610;
        Tue, 22 Aug 2023 22:48:14 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id ke9-20020a17090798e900b00988e953a586sm9289732ejc.61.2023.08.22.22.48.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 22:48:14 -0700 (PDT)
Message-ID: <e1c69599-a894-4cc8-123b-f4654b08412d@linaro.org>
Date: Wed, 23 Aug 2023 07:48:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 03/11] regulator: dt-bindings: mt6358: Convert to DT
 schema
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Brown <broonie@kernel.org>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230822084520.564937-1-wenst@chromium.org>
 <20230822084520.564937-4-wenst@chromium.org>
 <5ad5ff92-1367-ba96-b126-da80511a2769@linaro.org>
 <CAGXv+5Gc+R-hUJi5gm8an+dkq3JMD2JGwP4kDakKaHbAX2P0gQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAGXv+5Gc+R-hUJi5gm8an+dkq3JMD2JGwP4kDakKaHbAX2P0gQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_224818_435880_7FB0C1D4 
X-CRM114-Status: GOOD (  16.74  )
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

On 23/08/2023 05:54, Chen-Yu Tsai wrote:
>>> +
>>> +    regulator {
>>> +        compatible = "mediatek,mt6358-regulator";
>>> +
>>> +        buck_vgpu {
>>> +            regulator-name = "vgpu";
>>> +            regulator-min-microvolt = <625000>;
>>> +            regulator-max-microvolt = <900000>;
>>> +            regulator-ramp-delay = <6250>;
>>> +            regulator-enable-ramp-delay = <200>;
>>> +            regulator-allowed-modes = <MT6397_BUCK_MODE_AUTO
>>
>> mt6397?
>>
>> Both cases look a bit confusing.
> 
> There's only two regulator binding header files, mt6397 and mt6360.
> They seem to correspond to the two classes of PMICs that MediaTek has.
> I believe the two header files and thus the macros are meant to be
> shared?

Defines have specific model name, so they do not look like meant to be
shared. If all the values of the binding match, they can be shared, but
then this should be mentioned in the binding plus it should be used in
the driver. I don't see your driver patches add include of this header.

> 
> MT6397 and co refer to their AP PMICs, i.e. PMICs that are companion
> chips to the SoC and provide most of the power rails a system needs,
> along with things like RTC, audio codecs, etc.. The MT6358 and MT6366
> belong to this class.
> 
> MT6360 and possibly others refer to their charger PMICs, which integrate
> a battery charger, USB type-C PD stuff, LED drivers, and a handful of
> regulators.


Best regards,
Krzysztof


