Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5738C6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 18:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dq1XDLxilwUbRdN2NKx0IAo9lxfpPYiUEXJI1fFrVu0=; b=tf/qOJBuqOE44mB61zcuwzKL4I
	xPIOpedNZPc5LNvkip82q2FGSTZRkLCCi/3gP3npqYivPRAuTMhRWzJ3dRugvBYJ90oZ1Amf8bbjG
	OO+bQ4xn5RkSgyV6bsNVDU22GGFWnQm6ENExUiKf2iJKF7npleAAt0eJcEtWZPfq/eF7sy3mvd8qb
	SbxMliI0GeY89lZdrBEmVuEvdE/f9SHdP13OWBOiDuPLIxq0Msu41A3ka3C+dCXdSO/LWOiSwBQ/i
	7mLK4ayc5Sy346MtTCrfhROueHmecFoMgDmTjx26Ro7TAXkTuHxzDTnohL6+gbjLFaMmC6g0c3dgv
	Z6D3PtrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1popfA-0030fK-1r;
	Tue, 18 Apr 2023 18:02:44 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1popf8-0030eE-2B
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Apr 2023 18:02:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f167d0c91bso27343845e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Apr 2023 11:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681840959; x=1684432959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dq1XDLxilwUbRdN2NKx0IAo9lxfpPYiUEXJI1fFrVu0=;
        b=BuyxldTXbucsx62EFsiScrzThNIX0m+NcsbtdxeiOSQpufd77ss2oho1H1Cxey9a+y
         4hqMr8pzk3HxS3cPiYBvO5UmddlMxpW4dvw35iv3PKPnXVAg6kn8hvxcK9QXGnAfsKfN
         Lm0uMZHHkGAwwbW0iqmlTNZ2a2Z5Q/Jm14GxYs49YdCYdGHzdgFu+YvRRqB9p5Ro82j6
         hkhStFuALXFHpsTakvF4Y3GvsrOQCKDrBpu4A7RGmZ1Fld2rnw+RKGjs4CmpP7j0fTWz
         //9BDnAoAlZmOIwB5gS9gfVj51ri4m+aoSbq+T+2tqYVkM4YS4GcymAkpUWQsYhrGhdd
         q3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681840959; x=1684432959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dq1XDLxilwUbRdN2NKx0IAo9lxfpPYiUEXJI1fFrVu0=;
        b=J8oN5w+p7J8wTr/+XGjFa1UMraEZkfLhV1/DAXC6ia+52azQGyMSoxj1wLkiGFAZBd
         dP+5kU5oKiJivDL3cQN0UD0x0n6IfWPsajCs/4PJqIQVlU2ae1SmSjYMSLtCBxF+kW2m
         dV6W7yeBlE2TWLc8lgAm3jEJotvicXIX+WMuhTyLfWAY/Z8GwASz2fyNbglfwn99U4mA
         PoJku4txphB6ilcQHCT56dwe4qALfE2dfLDjZqhzOl6QI/l/WkE8VqqABI0HP2DIBQHM
         gXyCSC5cnaNxWjNZ2zoVHLny/uJN90IVo0aYVQnh4aYYHZefzFeIcqqXKKZWiZw6IPya
         WNvQ==
X-Gm-Message-State: AAQBX9ekSleeNSvaqehF/4cPM+CIWIxOk65qgwaTcBlh14Y+6qXhGbbd
	Jbcs4zEZtErdMDZg//TM6ak=
X-Google-Smtp-Source: AKy350bcOoocdidKn1c/bC+dVipSJtRDm24yqfKPnERXZZIxB81yRoRfcgQB2SuJ83eRc0ODohf6Qw==
X-Received: by 2002:adf:f2c9:0:b0:2ef:b052:1296 with SMTP id d9-20020adff2c9000000b002efb0521296mr2699430wrp.22.1681840958643;
        Tue, 18 Apr 2023 11:02:38 -0700 (PDT)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id z1-20020a5d4d01000000b002e5f6f8fc4fsm13611818wrt.100.2023.04.18.11.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 11:02:37 -0700 (PDT)
Message-ID: <f19562fa-a8c6-4870-e413-7593419b800f@gmail.com>
Date: Tue, 18 Apr 2023 20:02:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] dt-bindings: input: goodix: Add powered-in-suspend
 property
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-input@vger.kernel.org
References: <20230418124953.3170028-1-fshao@chromium.org>
 <20230418124953.3170028-2-fshao@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230418124953.3170028-2-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_110242_716547_8BEEFC0F 
X-CRM114-Status: GOOD (  20.23  )
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



On 18/04/2023 14:49, Fei Shao wrote:
> We observed that on Chromebook device Steelix, if Goodix GT7375P
> touchscreen is powered in suspend (because, for example, it connects to
> an always-on regulator) and with the reset GPIO asserted, it will
> introduce about 14mW power leakage.
> 
> This property is used to indicate that the touchscreen is powered in
> suspend. If it's set, the driver will stop asserting the reset GPIO in
> power-down, and it will do it in power-up instead to ensure that the
> state is always reset after resuming.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> 
>   Documentation/devicetree/bindings/input/goodix,gt7375p.yaml | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> index ce18d7dadae2..942acb286d77 100644
> --- a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> +++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> @@ -43,6 +43,12 @@ properties:
>         itself as long as it allows the main board to make signals compatible
>         with what the touchscreen is expecting for its IO rails.
>   
> +  powered-in-suspend:
> +    description:
> +      This indicates that the touchscreen is powered in suspend, so the driver
> +      will not assert the reset GPIO in power-down to prevent power leakage.
> +    type: boolean
> +
>   required:
>     - compatible
>     - reg

