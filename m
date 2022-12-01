Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0DEC43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 10:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2LyWUsrGr+KOW/s9GALL+g5mR7trWF5Joo3KOJ8Ejg=; b=utCeJ+m0hVRONa8+81C1ib3EZy
	PyybYOJyTGGPpO/6c6yB1ss4zpj83ctm4ZQwUQ8rPLQ1tztWIA1vnKCj1+LXM7Z9Lbs7whSW+O2TL
	/CkYhy5aBEBvsucU9sh+u5b5LEOv+P+Q4rhFlkQVQ8Ofmtjc9l4GEYuC7O5QM7emdr64zRcrZZsUc
	qkPWMSnR/P7sX3CnthVlrE74aG4A1LAdW3+LMOpZvAuvajv5V7SWa+737h8iWMfuK168khlL+ulKS
	2LQgQjYAHMkFeHpglRkYggGUa/iNE3EqbzMHNCVNU3Abv/ehWd+kCVcaI/FjeQtyPMPK17yHHqFAK
	QaU64U2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0giB-006fre-Cc; Thu, 01 Dec 2022 10:22:35 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0gi8-006foO-QS
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 10:22:34 +0000
Received: by mail-lj1-x22d.google.com with SMTP id z4so1346175ljq.6
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Dec 2022 02:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c2LyWUsrGr+KOW/s9GALL+g5mR7trWF5Joo3KOJ8Ejg=;
        b=hlTG/EbRq6cXGljyfQO0IfWwSOjYdBmZcWFqpYM81+yxsTPVL+vTOMLn5cYFWbJhwT
         /lyJQpmi1IS3x7GWBYlsxXiM4NDtcMB2j7JX4WqxZ3lCyNN+BNfohTgBDJhWl9yiSS2u
         2MdvPLcSAu+u/UXhSqniu8WwVwCe1snHo0JoFm47IyDbjJbniuLlKtCyB3Mvnp6oA+p/
         AAx1Jt/unu6GbkKdQZ40+ef6E3DZQKNkTHTZT4kwFkqzaRupuitRM0QRUQtA997Nfvq5
         /OpZeR02auQr8mrVjfei+iVWbWHLzhc7zi9FQ37SF1VZRLcEFOs+mGUFA7NqzHddIhxd
         TlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c2LyWUsrGr+KOW/s9GALL+g5mR7trWF5Joo3KOJ8Ejg=;
        b=Rm9ld81fWynNCa6IHgSy6DaS7gSYPymLUCJ2bWKo6mHMr+w2BGh4+MCrqLDm1r2zdi
         xyFFIZ04hl7LijzfZNVBgv1kW/KLTxKeebM4SToDgBou34ttHg9O+wgcsOQBy619TcaL
         zsexJOIIsj76kYTHS3NmnMxUFF4T+vi6dWKW1Ybyok6fB6MxpTluwW1gllBmdw0DIpBP
         9zDHv811GZLOSO01VjNVe04NXv7x6ObG8marVfjrshXREC+nG0HrRjFWf+n90ASYnrMg
         ilv0zLQX8fMbHC90n073BwQ1CqY+iL5sWpPgzE1r23JuQ7GMUitV95hHNExjlQACOJYB
         isXA==
X-Gm-Message-State: ANoB5pnzFVDgyl4HU9078gE9DyyOcg6mNLUQEKcmSSVpCFiyLYPNCmXk
	TODx0fVpwTGnry5/NyDQk0L+zQ==
X-Google-Smtp-Source: AA0mqf7qNngpU6jQSjBPS8ynWLgZ9UQtDWu99NJDaw/LOnYWcE4iGJHPtsDc/ZZjlfMlbIq3g0Q8Lw==
X-Received: by 2002:a05:651c:1a07:b0:277:11ae:d44e with SMTP id by7-20020a05651c1a0700b0027711aed44emr18417888ljb.458.1669890148788;
        Thu, 01 Dec 2022 02:22:28 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v13-20020ac258ed000000b004b48c977d8dsm600398lfo.125.2022.12.01.02.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 02:22:27 -0800 (PST)
Message-ID: <8c1dc14f-e0b1-b5ce-aeef-68c20da5dc63@linaro.org>
Date: Thu, 1 Dec 2022 11:22:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] arm64: dts: mt8192: Add adsp power domain controller
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>
References: <20221201073328.1559-1-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221201073328.1559-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_022232_883582_E8806DE6 
X-CRM114-Status: UNSURE (   8.76  )
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

On 01/12/2022 08:33, Allen-KH Cheng wrote:
> Add adsp power domain controller node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
> Ref: https://lore.kernel.org/all/2ec80bd8-dfef-d2e6-eb41-6e6088043e33@collabora.com/
>     [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
> ---
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 8 ++++++++
>  include/dt-bindings/power/mt8192-power.h | 1 +

Bindings are separate patches.

Best regards,
Krzysztof


