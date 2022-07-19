Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578CAC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 08:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5tPAjfHeyt/9nWoLPgh1ePITZuoZDz+EVcIyo6GRic=; b=k0PPxpMzdYMPm45sRYnkQ2/7NY
	wJa8EGp2jAufVfKcS1VuxGTomYr5zxM+R1AHE+cVScfThg7lUXB8PZbgHOxFoSVuaQQJ8Ed9apOyr
	ykJDJpWlwQLl80uuq3Nzqmg4Y2coswIuhk022zMhpJgAo1b7zGg42p7MA+Kp6t63mh//CwtCqsuv5
	RH2u8b/8TN2Azl1ynsWNaHQqGFtEOnJT/wu3H6stbHk87/QqgsrcXg/AUIKMA5+JXMVh0e3MzgQ7I
	oUN1wwPAcH48AYKng5SNGhyhxoqb9dClVfNd38ontWb5RaVbAkJ8neQgi90uVy3/amxJ53vfg6Ubt
	Y28/+Qjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDj0x-006jQg-RY; Tue, 19 Jul 2022 08:55:35 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDj0o-006jDS-CK
	for linux-mediatek@lists.infradead.org; Tue, 19 Jul 2022 08:55:27 +0000
Received: by mail-lj1-x22f.google.com with SMTP id by8so12976408ljb.13
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Jul 2022 01:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=C5tPAjfHeyt/9nWoLPgh1ePITZuoZDz+EVcIyo6GRic=;
        b=P8EVvDbX+vDNJWC6YPt2XRMkePfxHBOFUzfB/GzDN/oWC53/JZTdvY+sNIcgefaM/2
         ayN+Ls1HhSfNOESiFimoo+GkbVw2v5gdmizhv5Kqgi6AWVd2haBSymVChNsB46/BnjeS
         DtWmBvvJieqSJ0TtQGxEOiwi3ZGDpfCawDQNmXw3Ha4F27zLk1Q9qemFsysx4DtHJv6c
         5XGEjB+IKbtC0XbETRdlMckSdGSBzD9UsMePRYT5GORVFXrlayLdzgGQP4YZDindAF1j
         B1Ei6DE/5TTcIUWOXT5KskVy9jFDoTTUNjkKkAHVEyAtWKh6sh1EtxLEqagVy9hqiMcZ
         eHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=C5tPAjfHeyt/9nWoLPgh1ePITZuoZDz+EVcIyo6GRic=;
        b=Hf0xXVqm9/yPt0K/kMs1MyLbt2hOqxTW6JmB7fhG/Z8Y8/W46dMf7DEBl5MmuPgA4t
         YrqF280yydWCn4zUvxai0XzfO0Jtu38aAqguQYRyDf6eoEV8EZ4e3wlQCkdgMTrKc/hB
         jKXuIX6rdvbGaIc4EIgRsj0A88pecs/LLqCbC9yqiY/mNwhrH4a+iXhMlece/xmM4cmQ
         /fBwnUZkVENa/H3iGY4khLL6iiAQ/n87inSgzb+O+w5F7s4KjSIUp3QhjAwYX+XGqG0P
         Rt5RFtlpg35HPQ8kFcCMLIKANOVXTyTb9m5XqwE/hfvETy10n8vLrSy5IlIusUxr5+7h
         35kQ==
X-Gm-Message-State: AJIora/Rb+Kt/XKXYjaUKwrGGg0n1Hx4kNNNYGMHfTDL+vctn/FGitEe
	fF47akHd5HFRiVp4bbT0D63x4A==
X-Google-Smtp-Source: AGRyM1vKlIrJ95bllAqZdARLwJ8lPVKoeAGGpvR8DLdWf6hjC70dveXwiPaYs5ilNo5PMO6XSpemQw==
X-Received: by 2002:a2e:bf18:0:b0:25d:6852:c949 with SMTP id c24-20020a2ebf18000000b0025d6852c949mr14332401ljr.85.1658220922476;
        Tue, 19 Jul 2022 01:55:22 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id p21-20020a2ea4d5000000b0025a6e47056csm2579971ljm.124.2022.07.19.01.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 01:55:21 -0700 (PDT)
Message-ID: <c537ed21-92f3-4c2a-f775-66bc5421f22e@linaro.org>
Date: Tue, 19 Jul 2022 10:55:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/1] dt-bindings: iio: adc: Add compatible for MT8188
Content-Language: en-US
To: Hui Liu <hui.liu@mediatek.com>, jic23@kernel.org, lars@metafoo.de,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: srv_heupstream@mediatek.com, zhiyong.tao@mediatek.com,
 guodong.liu@mediatek.com, johnson.wang@mediatek.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220719014657.28714-1-hui.liu@mediatek.com>
 <20220719014657.28714-2-hui.liu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220719014657.28714-2-hui.liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_015526_452174_6C312406 
X-CRM114-Status: UNSURE (   7.28  )
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

On 19/07/2022 03:46, Hui Liu wrote:
> From: "Hui.Liu" <hui.liu@mediatek.com>
> 
> Add dt-binding documentation of auxadc for MediaTek MT8188 SoC platform.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

