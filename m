Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91280C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 17:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wh4Z1xlqDztZUH1w7IbXNlkUYB0pflLL3OVprobSnZc=; b=F5ER9d/Pv4oZfOjwLMl2z0+z49
	gUGKhsmMyu/3JmqI48fjJTVmpzO1tjl0agcx6pK3i2uFJO2RK4DKZtF/1soLYz7ABTCOsWEKCjjph
	bNrdJxNqgs5YtMn5WyIrC0Ww3Qp8vEDwL8E1pUbcWkS8MXjSGbIe2Ff3ZFadmqRr3cfVjJcM5wKHt
	7HrTREVBeRlFvjNE1HDRU+UwLvZzrY16CqdQtxPB84vugknrh6vO6VZGFQ//8wa8dZLsGLlO5jrYn
	xWkiZ5bbBZa4jWGj7nJZHcC8WBtCzo3ut+E7z9/SiagAkVuud/uYPT4XcLxQrXccNJifbYC6jWJZv
	p2s+ooEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf2dJ-00GvNy-2Z;
	Wed, 22 Mar 2023 17:52:21 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf2dH-00GvMJ-08
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Mar 2023 17:52:20 +0000
Received: by mail-ed1-x532.google.com with SMTP id y4so76356193edo.2
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Mar 2023 10:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679507534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wh4Z1xlqDztZUH1w7IbXNlkUYB0pflLL3OVprobSnZc=;
        b=WcgQoZMSV/a0eQ9pzfFJS6PJOkUq4BOxRnUsYi1tODvQhCM6XAVIzZ656d7dRAo45m
         jkaqVR41zmD3Evi/JdVzZeSvpsycq/g8HfPdXGdmzr9IHdZ4ZYUYgWDA35WIKSb8qs3K
         4GBwCIqYJvd3cfwJ5x7LEfjiVp+qyWH9wtr6wChbhNsNKvXjgYhh4zcK+vRgLQR26xTM
         vlUm34N7H5q/KUnatolWI/y9cmvYTiN/H/0GTnQrgx0ot2jx13y5wzrOogaDdd4VVVD4
         g0zGgYhpbxRwUZOUoELIh4LuhRgOf63m18hB+Av+4hLt4x54//xRNZQqSjygqbRAADne
         KPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679507534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wh4Z1xlqDztZUH1w7IbXNlkUYB0pflLL3OVprobSnZc=;
        b=NJR7KcZzGPQwddOZMzjEZXRlg1x54vHgL0+NSZ7hxGdSqQnEZXQ978hMBzUWXi1Gw3
         JqFZ2/h3FUuQuecR0oDKkuX4NUCAL0ltSIiOEAnwRL4wqkH9OpU5E6YqUm6vXDupNWDk
         Isj/YWbgFTvqj6upWpdawpnwECVtTkuKChTN4OPo0kFzd9gfd/on+dbZF5qVwQYNkc4D
         gUI59LFaDdDjn7UmCLTrpTDsd2hd7A+vO075Yt5PJZKYP9oxPsfzO134jgxE121WyySS
         NLs/Ms2dbM/H6bShqaqFfRgFvkcYkvs/vlWqr0afFIEEWadFmwtbxwobwDxbofQuU4cJ
         HDsQ==
X-Gm-Message-State: AO0yUKXu0LzN1HjcQ2GbmFha2KSQ19O6mX0oKmNxnP2Q8GAKwsohyMkJ
	0b8s7WPtYX2eR12k/d6FPARxZQ==
X-Google-Smtp-Source: AK7set/w/Af4r7ZkWY5/EYuLO7gRu4DNAGQ4mEA4NNMEcc/QIJ5nDOUWk6vdiJaM+ZJYjQJK7+8P1Q==
X-Received: by 2002:aa7:c053:0:b0:4fc:6475:d249 with SMTP id k19-20020aa7c053000000b004fc6475d249mr6466295edo.3.1679507534645;
        Wed, 22 Mar 2023 10:52:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5050:151b:e755:1c6? ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id t22-20020a50d716000000b004af6163f845sm8115519edi.28.2023.03.22.10.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:52:14 -0700 (PDT)
Message-ID: <2087e394-afa6-f1c0-cfc1-df382b2d13d3@linaro.org>
Date: Wed, 22 Mar 2023 18:52:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: clock: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230322173549.3972106-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322173549.3972106-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_105219_083191_334FF8B2 
X-CRM114-Status: UNSURE (   8.95  )
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

On 22/03/2023 18:35, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


