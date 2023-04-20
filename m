Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E7FC77B72
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 15:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWHDIdcxmRtBeoS4vbcXHNgCDUZ9mrNN4CpZaerEDtw=; b=cQolRa+9qA7QZ4X/amLU9ceyrb
	vvPF/mdMU/N6olo6wmrcRPJqegL1gixc+k3M4XdFmCefDOE2oLb61SCiw99NMD7wT9xiy9xxJoKSz
	bVpUW0DSFYOWQIE8NL8k0RmZduEoB/28bHYMcmjgGIn80kF9vw8TZHAoO2wUADv6SlA4SVXq6LTno
	Xf0Im/zN1Qhwr4HZ0P1z0l3K3/3m9uM75PMwlwJa1O2exNjvZjysfU6iLy8A/GQ54nLwD7yzbcLbO
	+w/awKXBCMRA+s8RjsDgD+5xgCKS3oJCdWCS17LX9rOakiXrFnHZqfCzvucz9vOaEXfgX4IjV3Hcv
	tLgGV2IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppWah-008T17-2H;
	Thu, 20 Apr 2023 15:52:59 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppWae-008Szw-19
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Apr 2023 15:52:57 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50685f1b6e0so1167087a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Apr 2023 08:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682005974; x=1684597974;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iWHDIdcxmRtBeoS4vbcXHNgCDUZ9mrNN4CpZaerEDtw=;
        b=bZJ618le2ELw5ph78JjrUu5vL10YhthrZv+82TUTyWvPI8n9EGNfQBVgb5D2g0dcWx
         u1oh9w4mpLpFJQflmlNuz8fsklVXvj10KcnsVKhll+TzMxAYf58Jr7bL7MtTN8CQpWPL
         i/IlZM70psKrM8urMyBS0lV4Y9pvc/HrzTw+swEho+jF9D3PLH19JXlAu1r51RODrjhU
         LBjTDzv7rUl/tZDLYGXhkePidU2BF7ewrajiKMNaN0ZlDUAYQXdUivC5HGnNy4EUNGPN
         NwsPqt7t7P2yOuJNTl9evXWMMFNj2hEDbl62J8LpnPLcjgRMNiX8R9+O9AVpvQ6zg7Z7
         HrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682005974; x=1684597974;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iWHDIdcxmRtBeoS4vbcXHNgCDUZ9mrNN4CpZaerEDtw=;
        b=MoKiO2JQq8XgJKm6qsnAb40YN93l0PFR4lLmiIVGxjiiAbxwJi+RP9YED/ggSdRUuf
         LOqDGGkJ6DAR8A97p0kYIuWOCarkKao+VrLlHXgHVGV7bKdVvxVavIB46aJF1T/WkUl/
         6zvnff40l2VS30GOc28babTzptB/QWY2qD4lGy/ZmOn9S6kYLiK9d7jkjszCjtetJKpe
         Ahdi6ZqnVSqevZDaZJN+Hmn0L0zOkcfr527NqYI2hhgV7SD7CiB0UN0IVhSJbccRUzzy
         eqklhSkTOjejnGmb9PobQ6i+U/pu1+PvFKGfFQClIJ7RFybJju4NnYII0eRAYkCFT5lY
         RTmQ==
X-Gm-Message-State: AAQBX9dX+bZCYfdFnPeJP8OOJNySNaMCgWywmi7RfeAn0atfHiL/8SXj
	9r95hXOgA+qWWGlajnVk1Zsy5w==
X-Google-Smtp-Source: AKy350ZPNoJjAsHQnrgBtcWjAkVjOybxjn4aKwAelHOmXaeNNRU9fsNDAzKgv2Ix3OECExzWGt3nyw==
X-Received: by 2002:aa7:d858:0:b0:4fe:97a2:4b86 with SMTP id f24-20020aa7d858000000b004fe97a24b86mr2374559eds.8.1682005974175;
        Thu, 20 Apr 2023 08:52:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bcb8:77e6:8f45:4771? ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id u11-20020aa7d0cb000000b0050687dbb5dasm888594edo.31.2023.04.20.08.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 08:52:53 -0700 (PDT)
Message-ID: <4bd883fd-91b1-5284-cc95-c4917f837be9@linaro.org>
Date: Thu, 20 Apr 2023 17:52:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/2] dt-bindings: pwm: mediatek: Add mediatek,mt7981
 compatible
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 John Crispin <john@phrozen.org>
References: <cover.1681992038.git.daniel@makrotopia.org>
 <2662c29ec80458852bb8c9041656bca46e2662dd.1681992038.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2662c29ec80458852bb8c9041656bca46e2662dd.1681992038.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_085256_394218_D3290876 
X-CRM114-Status: GOOD (  10.66  )
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

On 20/04/2023 14:35, Daniel Golle wrote:
> Add compatible string for the PWM unit found of the MediaTek MT7981 SoC.
> This is in preparation to adding support in the pwm-mediatek.c driver.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> No changes since v1.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


