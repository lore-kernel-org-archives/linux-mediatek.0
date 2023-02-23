Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDD7C636D6
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 10:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6uAB3hMkwfTyu9zpqIRso2gSVlXxxzw5LU2JlkCD4M=; b=aSKPiJOxrn44RXYSiug1vSqDfq
	CJGSxOKOB2vC6VWKn6hMGMFszxTQ3TmjQPaMt8qL9+IS33c8C+8O51L8Y/azczB4utgpzB0/KdqyN
	zU4H2gqejwkgajXxfQse0/y4bHe1c0eoEX+9KPph7x/+NYVjhxEr6g1VYBdu7F5jU+TXb/9VeT2k3
	dPpBdXVvLRZcJg/GaHzcPqzAJF3Ze5lOzWjkGHQYu91lhFY5uMPFSOq7zq3go4uglDk53DXwTNamd
	y20zV3g4bK3+p40v3MjS2DCqexpsk4gCbLWNTjsbMHL9pQAOIJ81+Q8PTKuyJqRRa3gpHVaXv9WTP
	Huqolqag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8ho-00Fto3-OG; Thu, 23 Feb 2023 10:20:04 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8hl-00FtmI-Us
	for linux-mediatek@lists.infradead.org; Thu, 23 Feb 2023 10:20:03 +0000
Received: by mail-ed1-x52a.google.com with SMTP id da10so41518722edb.3
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Feb 2023 02:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m6uAB3hMkwfTyu9zpqIRso2gSVlXxxzw5LU2JlkCD4M=;
        b=o2ZB4fuTJwzxCZhQ2tmTs5lrZFWhH5BwdbDpifGGFd9yqO1BdlACS25fsjwCJh9ggA
         62+AeeDh+mdbzFPmtMDMcFMKCFj2j1AQWuendGCiL3QOqnyLG1gDolDyQ2PTrgCpOYpx
         QF4GheSt8S/7O9UaGygXpL1ukn7MuSEMK71YHI439/RdoL0dOJlpIeJb0439+zcbvW7H
         v6TrsuJKvm0YfCGs4QjZAklaJjRtTfUuwANPxmlkpZ6G0ErEVoOrsg7ERWLaJ9c+HWgo
         ZXJB+GdoUAfu73u+PgrODq+YRat599J668AV6aIaBLY70hbh9tO0tE1xTcUHH2bIPbT8
         gwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m6uAB3hMkwfTyu9zpqIRso2gSVlXxxzw5LU2JlkCD4M=;
        b=RY7qWRAqNuH7TnxqovPqHwSnAiKL5mPSJbJh1Dimhdoy9bE2g+SSUPIbUD7Tb4Y1WL
         se4JLQw75ofv8Ri4VmqcojkPv/uI/f5rCHlbJ2Z84dC9XaAPFWjluq3ybR8H4uwaUSoe
         xw9lCuJmv1yBtnL0Cxyzjw89jv+HJ4urqzdHi0gc8mEJ9Jx+2k1GYIMy6eSVgTITcCBD
         87jiWPqDLZYOrTXRv7eoM09s5nJGM5meeUw0u2bifDBdXckS5LrTpiySkdOI3n/k0gnl
         PZ7CCUaBXRyGn56hg5NDuh0rQk0CAmtXRhAS64Ag0rX5K8hufMXXCJXhLEiQ8gcUXV/z
         UPaw==
X-Gm-Message-State: AO0yUKWKSD/NA5Zf+L6cbdoHZaS/teKYtYTMab9snV1kLFv6GxI1Fx9l
	nAwgbSR0tp5qMuhYOu2Afhcldg==
X-Google-Smtp-Source: AK7set+TVBt4K4pa6VJM6rEUw7E2E7okg1D0xXMxW3mWDSqRnw4ZJ/Xqg+dzQlhhiz4CVjzp40sZOQ==
X-Received: by 2002:a17:906:dc8e:b0:8e5:c06b:90e9 with SMTP id cs14-20020a170906dc8e00b008e5c06b90e9mr8223497ejc.50.1677147598320;
        Thu, 23 Feb 2023 02:19:58 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id bj4-20020a170906b04400b008c78fb7206dsm6186219ejb.68.2023.02.23.02.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 02:19:57 -0800 (PST)
Message-ID: <b834bea9-8370-5bc1-8edd-c4b62287e837@linaro.org>
Date: Thu, 23 Feb 2023 11:19:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 2/4] dt-bindings: clock: break out mediatek,ethsys
 into its own header
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>
References: <cover.1677089171.git.daniel@makrotopia.org>
 <db58bdb35e68f5e57b79e0d3560618ef86f10459.1677089171.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <db58bdb35e68f5e57b79e0d3560618ef86f10459.1677089171.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_022002_038048_015723DD 
X-CRM114-Status: GOOD (  11.54  )
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

On 22/02/2023 19:09, Daniel Golle wrote:
> The ethsys clocks of MT7981 and MT7986 are identical. In order to
> de-duplicate both clock drivers, start with putting ethsys into a
> header files of its own, so it can be used by both SoCs.
> Propagate this change also to mt7986a.dtsi which is the only user.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  1 +
>  drivers/clk/mediatek/clk-mt7986-eth.c         |  2 +-
>  include/dt-bindings/clock/mediatek,ethsys.h   | 32 +++++++++++++++++++

A bit too generic name. Are you sure it will fit all of eth on all
Mediatek SoCs? Current and future?

>  .../dt-bindings/clock/mediatek,mt7981-clk.h   | 18 -----------
>  .../dt-bindings/clock/mediatek,mt7986-clk.h   | 22 -------------

Same problems as previous patch. You cannot mix bindings and DTS and
drivers.

Best regards,
Krzysztof


