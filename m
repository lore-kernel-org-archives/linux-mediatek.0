Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCEBC77B75
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 May 2023 12:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5omqk/hpCJeATo0rNTnZV84JSlja//TXerFzgl7Kd4=; b=FqZxC7RTEsZmU/umf3G4rBcgHC
	OyjHNtMNxQqlUV409ryD2tnhvIeL+gxPqbIQMWMcvISq/UBe29Uy/Z4wwXBefA5fznUjYLUyu8Atw
	WV1sQ3+2oj8394q5cH+6L+iZQTM7GeHGVqTwqZjOWC7e6qppMSAEwEjh9SRrbrcGxLXKLYVWad/yj
	nPSct58Dyd6mUZ4Lgj4hN1XFWvPZ46veZzylpQvwxJkqcukn2d1BjmIYWSNo/g3g3IhX+uebkzR0n
	xKh/pliNFOsmVJwBSiKsId5PdSwjkS/pKxHg1vElqa4JbrRprtRMhDAeyshGNlSw0rtyQ8u1yjMKB
	MvRhWKtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puubs-00At6w-0u;
	Fri, 05 May 2023 12:32:28 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puubp-00At5N-37
	for linux-mediatek@lists.infradead.org;
	Fri, 05 May 2023 12:32:27 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-94ef0a8546fso275692566b.1
        for <linux-mediatek@lists.infradead.org>; Fri, 05 May 2023 05:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683289942; x=1685881942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m5omqk/hpCJeATo0rNTnZV84JSlja//TXerFzgl7Kd4=;
        b=jvwIIPuBxo9RVg2kci2vS6w4S3wac7x/LYTWBMWIET5UDNGLeUG/RonGSskaclwp9I
         T3yLGRcVLgpaYR64TKOQOSDE2f4Xt366YXPTRSArfStsJD7GSkRPB4ibITEg/dKSn/8w
         iJXWecyta8xnNRvQprvjq+KzRzh5OWMvZfXmzUmElundzjM/duf8uArl7c114JdGxGCM
         K/7KXSazXmoFRvJtjzeV+KXy2QOeSTD3HPS0Msa/UGtpAdGefqYAIFMy33sRlQI6tOOe
         lsMfGDsQ5mArJkyVK3cAH6/2woy3VZ++RAa5c63P+0VeX27uIoDFvnUOD/KyhZ+iFP9h
         0o2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683289942; x=1685881942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m5omqk/hpCJeATo0rNTnZV84JSlja//TXerFzgl7Kd4=;
        b=gvmv3J1VOAZQyV6fvADpzfzanGweEqauELGYuUCm7/g9U0gxReQ5bxf0LvxJrABdwB
         2XsrzIEEiGFjrO2RctWLbsP5XlgPDEYPnCMUpABlnHJEUmpkR+uN7m7OwlQZUi0sx8FU
         irOQNZbRwU9tvyC7WPgScrOLmq8mu8vEJTw3J63/NIkAX35ZfHuFXQYPTrsFPjM16TFM
         RnkxpaJdH7y/w5uuwuSCD5WKFyk9SP9B6uXmKwYjrfn/60GEXkyeU8Ra1Db/0QQAjHVz
         lL4LIJ8gitoX4c5v/a6PQ9e5WTZFT7qANnyyFGg0NQ+X2pUuJ9FyFbpSkAXCoXp89uV2
         +zWA==
X-Gm-Message-State: AC+VfDzSiANdNT+McZr9+5hu7zIp+D8d7STgUXePa2+PBsKfLy5Bk1Ow
	bxTXtZ06KXXqyEQEZzZadCDmSA==
X-Google-Smtp-Source: ACHHUZ4+6P359EPLf/Xig5/oQyDJN8Le9JY0QT5lpJA262gEFJ+jWYEY1pr79v2B+E4zLxTFMf1ziA==
X-Received: by 2002:a17:906:9b8a:b0:931:df8d:113 with SMTP id dd10-20020a1709069b8a00b00931df8d0113mr1272957ejc.26.1683289942345;
        Fri, 05 May 2023 05:32:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d? ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id u3-20020aa7db83000000b0050c04bcc3b2sm1737285edt.64.2023.05.05.05.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 05:32:21 -0700 (PDT)
Message-ID: <14ec49cf-c232-7dee-8dc2-8bc7d40f1716@linaro.org>
Date: Fri, 5 May 2023 14:32:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/2] clk: mediatek: reset: add infra_ao reset support for
 MT8188
Content-Language: en-US
To: Runyang Chen <runyang.chen@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org,
 Runyang Chen <runyang.chen@mediatek.corp-partner.google.com>
References: <20230505120108.26603-1-runyang.chen@mediatek.com>
 <20230505120108.26603-3-runyang.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230505120108.26603-3-runyang.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_053226_001807_2B17E6F4 
X-CRM114-Status: UNSURE (   8.58  )
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

On 05/05/2023 14:01, Runyang Chen wrote:
> The infra_ao reset is needed for MT8188.
> - Add mtk_clk_rst_desc for MT8188.
> - Add register reset controller function for MT8188 infra_ao.
> - Add infra_ao_idx_map for MT8188.
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.corp-partner.google.com>

Same problem.

Best regards,
Krzysztof


