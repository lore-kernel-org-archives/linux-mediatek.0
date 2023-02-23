Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C811AC636D6
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 10:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/aXgtpRAAmBlOXzSkXhzdZkmLPBehTIrS5g09JIRzo=; b=AcNdtO3saq65QZ5bLJ/GtXycvk
	h7bZxuGaVjF7pfAAJ+OcEpmX2vPj2qG5uiy2IJ/Zel/ycaO/RTLhhgFoTFrwN9n3lU4U2Clu6eCUa
	q3G6sEc9bKFlPiEGMQU+bE3a9ptPHci9T8ms95mhIGAKTdbdfKHUO2hno5Wb2bHIe5qpv2PFZQIE9
	x9m2G8v0acPENJywgQGSqgty1vGjva8YnhtrfsQ5FCxJd45r29Prv5knOa1nAofmRYKK1wafaSoJn
	WD+cipAMJr3IQN8R4yH8V6VItIvjS6bPbWaXR00nZugg7Aq0D8SWBHFJp8hisMWijoRI1J1pHhbrL
	T1Z1EEuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8ge-00FtTT-BG; Thu, 23 Feb 2023 10:18:52 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8gV-00FtPh-0V
	for linux-mediatek@lists.infradead.org; Thu, 23 Feb 2023 10:18:44 +0000
Received: by mail-ed1-x530.google.com with SMTP id eg37so36456339edb.12
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Feb 2023 02:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3/aXgtpRAAmBlOXzSkXhzdZkmLPBehTIrS5g09JIRzo=;
        b=RR/sD/ukR85nWBQeNICDAifane3oP+7Bybn5qjnm19TgMnsrsto6pCq9Pt+E3r13jT
         /P33bRNSNAWwKjnNcsW6fC/qtxrrpIGPOSrGnGIOIPLXAEV1mMSqf4V65f9t1N/tJJvi
         zYpEMUCtAC/DeUFJ9H26EmKrfC1vcBCL1mtGV1E0zOLx/8vGcdRDc/4GaftPQSLkXg5k
         atRKjrpbdKdEG3ljIXHnHMNCAiVnoTnEawL0jNuzzEKBakgXAAtvAb0h38oej3Lepgox
         17UopHUpoBz7rlcmZIh51n1D2eBedl7ret75IOupB17G1j8ueN5xpqjYS4fVjwGgXOoD
         xXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3/aXgtpRAAmBlOXzSkXhzdZkmLPBehTIrS5g09JIRzo=;
        b=duWCnY2ho5oXA0s3+Om2wEfeKQe+RmGM+AjIy3ZFA/+aZgn5TeYHq45JLlxV2p2XvI
         wX1VoxYOa0R1cttYctj4TaXjXh5Xv4a2IsKnMDl9S8ITtgmwi1D5IsAMM2eL//e81jpM
         +Mglx8gJlZjhLyVh0k7FLKGt5k7u/bOJQu2G2KjGb+3s6iJg0K7d4LWyw8R8XPo5vL6+
         VG//ml1un8lNF2d35fXk27lzfuXCsrT24sliXJyG/otfsypqgc0hC6GpXvgOUXRJNmS/
         b47VQw4l7CPF/VS1sg6eAquAlqgVlCGVhaq1d30Glgu7bFBjfXbSgMjSs1+Ffw4KlKA9
         KLPw==
X-Gm-Message-State: AO0yUKWQbwVUlcEesAbIF6Gx3JAYUg4l/zfKX3Krxc3G737CsWOEVziT
	NcFbaxbFTWpS24jrNlnzXgK4Vg==
X-Google-Smtp-Source: AK7set+auc5RST/uYYMVLzBpn9BjsWrPQ8Bb/2gvNFfSEYyoeQt+g8Sqq38q4SabwCeG1Q4hXbGabw==
X-Received: by 2002:aa7:d88c:0:b0:4aa:a4e8:8d5a with SMTP id u12-20020aa7d88c000000b004aaa4e88d5amr11193144edq.33.1677147519115;
        Thu, 23 Feb 2023 02:18:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g9-20020a170906348900b008b11ba87bf4sm8288218ejb.209.2023.02.23.02.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 02:18:38 -0800 (PST)
Message-ID: <ace28a97-b43e-4b24-52d0-93bc21263aff@linaro.org>
Date: Thu, 23 Feb 2023 11:18:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 1/4] dt-bindings: clock: rename mt7986-clk.h to
 mediatek,mt7986-clk.h
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
 <15d718a2d696d29b48668b9ab5531369c537a1e6.1677089171.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <15d718a2d696d29b48668b9ab5531369c537a1e6.1677089171.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_021843_061425_1FC66B1C 
X-CRM114-Status: UNSURE (   8.93  )
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

On 22/02/2023 19:09, Daniel Golle wrote:
> Rename dt-bindings header file mt7986-clk.h to mediatek,mt7986-clk.h,
> propagate this change also to mt7986a.dtsi which is the only user.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi                       | 2 +-
>  drivers/clk/mediatek/clk-mt7986-infracfg.c                      | 2 +-
>  drivers/clk/mediatek/clk-mt7986-topckgen.c                      | 2 +-
>  .../dt-bindings/clock/{mt7986-clk.h => mediatek,mt7986-clk.h}   | 0

You cannot have bindings and DTS and drivers mixed together. Which
points to fact - you cannot make such change... Also your commit msg
does not justify "why" you are doing it.

Best regards,
Krzysztof


