Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329F2C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 13:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftHZyHw/wNXSXOb7JE7tzZIShYwLppug3sKDdxarxV0=; b=fGfy7x59hhUAB7+bc/8HEuNph9
	CuH2nsZs6GTveJRByZbS7kSdnNt1CmlhtAYD3zvlpP6TSTShHJsxyOYc4q7A2+InjYK+yj1wtAzHx
	gf6myLFqdbJ3SzDvQZQuQxtBKXJCwjTjX2McYqFe/cGPrXm6V+ZNwQwiPksCfSm9GvmAZAaio9gKP
	LPxZAimdDuvgFHV6dxD5fP/+wXcxF5YTNpzzAwH+stgn+zNv75YX+sSqwgKlF/JfMITS7yreCzaUG
	5OftfTrE+qDsYVYW0hF2/o+JHUXHHtVvEBXLYQ14IAm3yajmPrhjv8vWSq4Hn3zwZmTrLY2XFnlfI
	xSPxOHCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1pxG-002cpc-Rv; Thu, 16 Jun 2022 13:54:38 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1puQ-002b7P-T6
	for linux-mediatek@lists.infradead.org; Thu, 16 Jun 2022 13:51:44 +0000
Received: by mail-pf1-x42f.google.com with SMTP id s37so1558703pfg.11
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jun 2022 06:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ftHZyHw/wNXSXOb7JE7tzZIShYwLppug3sKDdxarxV0=;
        b=MSTj0O1uiObYq3RmWcwpgd2XlA+q3StSV+EY7/gO0RfsvbeHdumMIDv3rtsYW0etPl
         lXNHPJmMeve8eyJUs1tMPqPX4dzBhFL1AlZvo46UvFavAZtHNGszAxdIKEf5RvmEJn7y
         xSNmT9oxEzfl9hSXSqPGwB9bBLO5m9fIaskr5TdovjEkO6DIygXDriPM4p5otH6bcWuC
         QcOw0i+vyeVSwxWvFIULjpA7WtaeQGCifwWtkjJgkJ62mvof5qP68nJR+2zEO2mCgbtp
         Pt0B3nuvnaGFcLhtCwxhF8lwd80dr1EpnGkToOoo+amBn/o0S12mYk2AktizYvhrIHCo
         c/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ftHZyHw/wNXSXOb7JE7tzZIShYwLppug3sKDdxarxV0=;
        b=Mc9/oIqJWSzaB1v7ckXl8HErZ833vvyQlZBTsv81tuIHCfH6eO/ZK+Hesh2UYOOjZX
         pCG79YYNGo9Kx1kv++jBHQisD+J+P6qwAsjLXEBGSF86HYR+QuTgrTQtfDr0+MomjN9V
         +nryF6fq73uLDn3uETerPEz0M/E0OJQKDz3lj+W/9SW2iljCpzoF6u0//U3XY2RfaJ9s
         /GlTtxSf3kJAiVTNd90aZvqSoZeM5DUJ6NuD7kGk6ZVn4LdLQDQ1ZydkPhBrskbvkTEG
         vbd6hg/0gKguFzutJ6X8sIt/xBF5kxS5pYt2Ll+zIU9Wavd/vPHy/lTkMmzYmdH7LYhj
         +8iw==
X-Gm-Message-State: AJIora/Kf5wEgC3Kx+0FywDpWPgcPItj09NHH9NBKzx4UF7/8PG5Me9u
	yV4S3zRoTbXEztg15eORjIqunw==
X-Google-Smtp-Source: AGRyM1tjArtHfSvBr9dHM79YJP+gIsvNtTxmzvobAhS9iAdqa601s5ctpq9flyl1E+ympHGNh6ORjQ==
X-Received: by 2002:a05:6a00:10d3:b0:4fe:5d:75c8 with SMTP id d19-20020a056a0010d300b004fe005d75c8mr4874387pfu.6.1655387499862;
        Thu, 16 Jun 2022 06:51:39 -0700 (PDT)
Received: from [172.20.0.255] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id 9-20020aa79149000000b00518424f8922sm1799565pfi.77.2022.06.16.06.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 06:51:39 -0700 (PDT)
Message-ID: <e1a9b1b4-19ab-38dc-3343-017d05655922@linaro.org>
Date: Thu, 16 Jun 2022 06:51:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: mt6397: Add compatibles for
 MT6331 RTC and keys
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 lee.jones@linaro.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, johnson.wang@mediatek.com,
 hsin-hsiung.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220616091531.12646-1-angelogioacchino.delregno@collabora.com>
 <20220616091531.12646-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220616091531.12646-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_065142_984698_B193D379 
X-CRM114-Status: UNSURE (   8.59  )
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

On 16/06/2022 02:15, AngeloGioacchino Del Regno wrote:
> The MT6331 PMIC provides many sub modules: regulators, audio
> codec, LED controller, keys, RTC and some GPIOs.
> It is always paired with a MT6332 Companion PMIC, which provides
> thermistors, WLEDs (display LED backlight), secondary AP cluster
> regulators, modem clocks, battery charger and fuel gauge.
> 
> Add the necessary compatibles to start implementing the basics.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

