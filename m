Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF36C32771
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Sep 2022 09:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJDbkaS+XsYA+l+f+wbMnU3wGxWDofURrR9zLtociWE=; b=ikvwGZvFxFMe8qiEbZPmiZdk8n
	T84PYS5YJLpaOvY2rjocXesgS5c11vUo6pRJr4gqccicw4edA6IPou4p14GjFpdIdZftlytiOaGS0
	hMDwkvQ526wa10Z/EXMGoGuDZ0YPD5SKhHos+jLVrHwuu+jPFgiyg7K+clQVAo924v0A+D/RGcnMh
	/P0kLkxs+iaTD/PpzQADymDsrnrYlQJk1wmg1w/4VdkxX26CAR08S5so8+PavQDh44OT3RMj03iwT
	irG4nbiAqekW8KOPIDSFSteHCE5vfa2TvB36GODl0dpC3z+gwfj3Kk2Nl8FLJ+gwEEKE/DMzPCWxd
	pmQ9CcVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZr1m-00EYex-1Q; Sun, 18 Sep 2022 09:55:54 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZr1j-00EYdB-Co
	for linux-mediatek@lists.infradead.org; Sun, 18 Sep 2022 09:55:52 +0000
Received: by mail-lj1-x229.google.com with SMTP id s10so29985543ljp.5
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Sep 2022 02:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=uJDbkaS+XsYA+l+f+wbMnU3wGxWDofURrR9zLtociWE=;
        b=UTLclj9isYRIkZwI/IEgMUn1xnFFiMIUn5BEDdx4mcbGyCIdk/7lEMpwdsGscUCpfs
         ZkaA7tyHUbJtjLYuLsZJbUdMIa5zEXoCbJZ4i4yuvbf39j5wgHlu7MFPiKcj9ckbugZj
         0qXrEc9dOIKLVa08k656mgAwRYs6UvUSH/F+ScYCz1VcutArFRKXB64fxqM/qe6RsXKI
         gye97Iz0PsXPpFAt8GIUqXCFKDCWxI8SjCy//QfHJ9AOxhC8j6WvWUR/xjgxzWOZWXTZ
         SZ47WKYZGaIpV5x1HMu9myl2+qZPfim/u6/vw1yH8ZBFspYe9KNDXLHj7Sv8iOw++S9p
         TvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=uJDbkaS+XsYA+l+f+wbMnU3wGxWDofURrR9zLtociWE=;
        b=nLWY/+i1G/LIc4kDpioKh1Z5KZgmZ91CHKsQQjl4uRX4MHgVez7+kykAeKeZvMtsTg
         Se9Dnx6Xn2tBmUfxfgppGxK3NYli+i6oVgGlPIcXgq+jc/9wrgaeLOLZrZl1mQVjw1g4
         d5Z0fiviNSkxvOl3kvuVy+fCsY1RNzE+06aeLAtCRX1li7GWCsxSbPq29EpicYobK7h6
         Wvf0G2wwvCEu4Y28i7xUeG0Mixzc9qVNEWc93A9WmrHnAItCJD4CSw96FiMbwy7U34Ku
         B570vPpnK7h9BQRg+0kiImoK8oZiD6rkaC1WMWqBzNHuzfY7typ0bZAIRA4sGo7mf6wC
         iA+w==
X-Gm-Message-State: ACrzQf0jOSYzwGilF+ZzZctbs6XARNqZV2KPUvCFzikcEIp8tpG5wqCv
	jIAIjIQpHjpi0Ep26S1vD/Sc/Q==
X-Google-Smtp-Source: AMsMyM7YhycPtcrow7NNduVCQCLpXLeHqzsHwGbPl7HWaKdORAeYW8z0BTfhkDBJyNg+yZ0X1gYzNQ==
X-Received: by 2002:a2e:891a:0:b0:26b:ebcc:68fb with SMTP id d26-20020a2e891a000000b0026bebcc68fbmr3528397lji.427.1663494949351;
        Sun, 18 Sep 2022 02:55:49 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z9-20020a056512370900b00494a27500c1sm4583294lfr.163.2022.09.18.02.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 02:55:48 -0700 (PDT)
Message-ID: <2cccf8a3-20cb-5cdc-cd42-9efe82c35320@linaro.org>
Date: Sun, 18 Sep 2022 10:55:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 4/7] dt-bindings: leds: leds-mt6323: Document mt6331
 compatible
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sean.wang@mediatek.com
Cc: pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220915091214.59673-1-angelogioacchino.delregno@collabora.com>
 <20220915091214.59673-5-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220915091214.59673-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_025551_463198_41F165D7 
X-CRM114-Status: UNSURE (   7.62  )
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

On 15/09/2022 10:12, AngeloGioacchino Del Regno wrote:
> Add mediatek,mt6331-led compatible for the LED controller found
> in the MT6331 PMIC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/leds/leds-mt6323.txt | 4 +++-


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

