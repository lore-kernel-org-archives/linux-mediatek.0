Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74D7C04A6A
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jul 2023 13:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3e9h1mjHXNaFhhktneoIjNiwNY2p47H6uRSWITeacf8=; b=JUaV2A9lsGpH3IoZJOJ/SyUYPA
	YP97NweYNY2D3DV1bVF2KEVE4fpk8OLoba/rO6G4c6UU3Vt+ChkwuzJMtLiTkF/YJvMSl0T9m1L+Z
	iyLrVUQXyJP3b10OqPt3vFtuS256dIZXIsKNR6KwFtQTzsX+IGC5aYY/hemU9gavVhA8doK9TZ8ZG
	PK6Khi1lzlpCY8Hdm+QcyCL/fPcexTd9dAeB4LhG64zJS8QiqB6ouQXfgdk8qXQrqtqJ2yifZ+H0q
	ba2sGkf38ly0A1dPmywPbpAqeNXncIDXyCyf52g0dtOoWHl6jVIB7Z1Sd6mcjvI3/vUikZL9Y5PDq
	hpK9HI7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPkNL-007dLv-1H;
	Sat, 29 Jul 2023 13:52:55 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPkNH-007dKv-19
	for linux-mediatek@lists.infradead.org;
	Sat, 29 Jul 2023 13:52:54 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5217ad95029so3927483a12.2
        for <linux-mediatek@lists.infradead.org>; Sat, 29 Jul 2023 06:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690638769; x=1691243569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3e9h1mjHXNaFhhktneoIjNiwNY2p47H6uRSWITeacf8=;
        b=D1w8WthUtE8ehHd3nb4SEpll+SUUhvdWnPQixiZ/dY274mYBgVyWIBGKVAB5ftEM//
         /I8T0jfj+I53Rt7kKUp2TlKdBTfYFm2XudyMCKistf4oGYikg8Otv8TdCf+h8954HQeF
         FZxrTL0gQvx6j45TX3rJ672DDdxGVbtWfCssm6epJNLOTUp5OVl51SZJzXaT47dDdQm9
         4jF/2bdKh8xK1c+nY+sRnZ2BX78F6BAuAyhTxLJl2TnjeIsBq/2fC2fkGHL6dH2G7za/
         Pd8sbareGKAlpqbl5pqMcuoidNqZNk22zH26AlI8QIaj8vqGU88LLS6kGodV3F5xgRKc
         Q6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690638769; x=1691243569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3e9h1mjHXNaFhhktneoIjNiwNY2p47H6uRSWITeacf8=;
        b=c8Q9EZiPpqB2+ltCx4bqUz5RoSGK5K5KgmtpixtezGqfFZkDuN+ERyV6+Vl+XkDCzy
         Mjngurypr+uAkSF1wi7AVTs/LfHGLqfJUsBiqLaOPVIa70jb4b9fL44BBi5qLJ67WwVG
         Ehyj7d7jJwmtbLb9Qk6ccLIrAkvaCffSOc+sQof4EbjnlwqAXaeW5wt3N38oV8bWv6W8
         vIRaxtfXtB5zlorHjys/GmpNUNxq3JpEJw7AQ8ft23zNTtQuFgQEutzgT8nLUlZxIJeH
         Nq3FBQshePX5LUiSuDM6MBGeZgrKj98zDdY+9+ssi1CjKn7jNiWFgvdR8iXlKsrddvWO
         s+HQ==
X-Gm-Message-State: ABy/qLaD0pHLwPi0Qo1OIB+sIrglc86rMsLyF+ck4im8FIWkor2RPKx/
	BsGBx1ijzLgewR23EAJy5tqgXg==
X-Google-Smtp-Source: APBJJlEsGSrFZkZih0nqPZ7KkzS2vK2oTs+DEAnJxAjBCNeO/gQ2G4zspKF6FrGJ5Xmt0TLCuFYHtA==
X-Received: by 2002:a17:907:7638:b0:997:deb1:ff6a with SMTP id jy24-20020a170907763800b00997deb1ff6amr1870674ejc.22.1690638768934;
        Sat, 29 Jul 2023 06:52:48 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id kq6-20020a170906abc600b009828e26e519sm3282832ejb.122.2023.07.29.06.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jul 2023 06:52:48 -0700 (PDT)
Message-ID: <9cd12d89-b0c1-484f-231e-7b6915f4572b@linaro.org>
Date: Sat, 29 Jul 2023 15:52:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: net: mediatek,net: fixup MAC binding
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20230729111045.1779-1-zajec5@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230729111045.1779-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230729_065251_487959_6A4D5BDF 
X-CRM114-Status: UNSURE (   6.84  )
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

On 29/07/2023 13:10, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> 1. Use unevaluatedProperties
> It's needed to allow ethernet-controller.yaml properties work correctly.
> 
> 2. Drop unneeded phy-handle/phy-mode
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


