Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75F9C7EE22
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 17:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayyCxGH0foji5L7wUxPjLMBEgCkH5OqBptH4GPUcYDk=; b=04hKtl0aKi65Gr3fftf3sWvQIA
	A9eN4GKMyPpYvPCvtb0M8SyUIKkdwibEwr2w1I8nGTo8hAzTaxCJ4KciCh0abY57+D7oSHkTZA0mV
	yU5YdltsEE2ELJjxWQm6n52zuOtFRwXu9qYW4Cv/642rDqxqAM2najTHz4xSUL5MO5HfyY44fNKrH
	RX1tCUO3FD38BTFghHv04UEgMEoaXwEwa4/aitH8sDZsFszq+zxO9vsFHGc1k/RGYnED82Fn/PMBX
	m0leLUJFN+unDkkuZVs5m+5Flw1mSc9opjoB03TX5Ztfxj032obggl5Yp0Io/UTHdTcfWP47Dnu/g
	bd0crhkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px9km-009Tjo-0T;
	Thu, 11 May 2023 17:06:56 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px9ki-009ThY-2A
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 17:06:54 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50bc25f0c7dso16084455a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 10:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683824811; x=1686416811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ayyCxGH0foji5L7wUxPjLMBEgCkH5OqBptH4GPUcYDk=;
        b=yQ5Tj7C1ussm/VcwYYhA4Rs12QyIk3aRNikd5NJbYP25dBwJSb4EYVtQhvG8pWTpBH
         T4xirmZIQF6GvaHKEl3CnI6q6yxNmmyJArTKL536EiBHClq2oE9DdnPzvaffsw88f9oQ
         apVjOK+XLIqdMlsPQ8AdpHxkyZxSaQC/q0SOczMoE8nzExFNLJ332OEuk36w9nU25Fis
         oh0U8+Izz6csTiIism28LBA5UWnvkp18HoOaJxdNL8kEEwUAGENOJfeL5tJh4/YhsP50
         d5HhjkKL4Sys9jLGxfFXLt3eWF2KgIXzWpKN5Ix/Hw9lC0yvnEOfcW4a0SMfn/YEA+90
         zksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683824811; x=1686416811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayyCxGH0foji5L7wUxPjLMBEgCkH5OqBptH4GPUcYDk=;
        b=ACWcxwwvWCCluC8aHv2phK19FZT7Z0y0zRvpxp0cT35ddAqNXaikgB7jmEBgp5MAWt
         6/19HS2E/EY0OAsokzLOUDw/gJTDIk51YfsY/UJkT3gsb5g5Bj/cbAvd38GA+Ecv3AXz
         JhHItBlUVMk5DCltjQONUAQgkiAuciNvZLyUG0Z212AI7hz48TLwyXpm0ai13dVU96tM
         6UWLeG04w288vA3XIQmCDS3OOXiw6xuyA+RibGgIl36eYXvc34/Shdb5D5Fzunzhq0Sk
         HIVI3+hiSWZTCjEeTzzdkc+p6gqKizggzwVtoebRnjPunXka4lrbtAw49tWFFlmjby2t
         GucQ==
X-Gm-Message-State: AC+VfDzSjqdQTJl/kjsmxV/6nAIN9kobBkCxp0ARhdXr7krYjqPmf0U9
	6cW2qyIK+S2sQABpm4ivr1KmxA==
X-Google-Smtp-Source: ACHHUZ4kcUwO/YhdtrTa+xFa/aeEXoGMeFo5bs2na974KrFHqO2vD2Z8Q1dUjxA1QOC5UsUxODF7gw==
X-Received: by 2002:a17:906:6a1b:b0:968:2b4a:aba3 with SMTP id qw27-20020a1709066a1b00b009682b4aaba3mr14233722ejc.5.1683824810998;
        Thu, 11 May 2023 10:06:50 -0700 (PDT)
Received: from krzk-bin ([2a02:810d:15c0:828:d7cd:1be6:f89d:7218])
        by smtp.gmail.com with ESMTPSA id jl21-20020a17090775d500b00965b5540ad7sm4331348ejc.17.2023.05.11.10.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 10:06:50 -0700 (PDT)
Date: Thu, 11 May 2023 19:06:47 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Eric Dumazet <edumazet@google.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-mediatek@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
	Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>, Qingfang Deng <dqfext@gmail.com>,
	Simon Horman <simon.horman@corigine.com>
Subject: Re: [PATCH net-next v4 1/2] dt-bindings: arm: mediatek: add
 mediatek,boottrap binding
Message-ID: <20230511170647.g6c3ezlyqqislzaf@krzk-bin>
References: <cover.1683813687.git.daniel@makrotopia.org>
 <f2d447d8b836cf9584762465a784185e8fcf651f.1683813687.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f2d447d8b836cf9584762465a784185e8fcf651f.1683813687.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_100652_728032_D45F6249 
X-CRM114-Status: GOOD (  13.99  )
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

On Thu, 11 May 2023 16:10:20 +0200, Daniel Golle wrote:
> The boottrap is used to read implementation details from the SoC, such
> as the polarity of LED pins. Add bindings for it as we are going to use
> it for the LEDs connected to MediaTek built-in 1GE PHYs.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../arm/mediatek/mediatek,boottrap.yaml       | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,boottrap.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek/mediatek,boottrap.example.dtb: boottrap@1001f6f0: $nodename:0: 'boottrap' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek/mediatek,boottrap.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek/mediatek,boottrap.example.dtb: boottrap@1001f6f0: reg: [[0, 268564208], [0, 32]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek/mediatek,boottrap.yaml


See https://patchwork.ozlabs.org/patch/1780124

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

