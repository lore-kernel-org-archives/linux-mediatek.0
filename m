Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0781BC54E94
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 15:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85g64dsl/DcFY/LlzFQvHEB0mO6DyTsjvCN0CbsFtNw=; b=viGNQK1U8s+M3lPgT3QQwjJvW1
	wFswOwEJ04LMqbXrAC3s6WnG2Bw8m73p9TJVeOwSuMnCwMwwdfSKSem69hCgmtyUHF7LlI3zy9aa2
	wt+MISs/DNjFfl3voTMTGI1Y770NJGv4xL+XGw7WYr1XM0aW0nxOcvEdBjvLojAUpOgUgTAiVM8Vm
	YMLUt3PaTVX9RGCf4OQtTPo+m7/Nqg/KX6sgvJ0qHATOdGYGvsNzMDFjTFiVUfuDJdK1/PHSUqZMG
	uz7d9/ShNtuPvzGSIHXLLDi8UW2fOSw9pQD2CbD5ATm7cP30/QjCsg3t/nyJoqpg/84TjXdbk9Sv2
	UGlHRxOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3oN-00BNp2-EI; Thu, 26 Jan 2023 15:05:11 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3nj-00BNZU-IQ
	for linux-mediatek@lists.infradead.org; Thu, 26 Jan 2023 15:04:35 +0000
Received: by mail-lf1-x136.google.com with SMTP id bp15so3385624lfb.13
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Jan 2023 07:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=85g64dsl/DcFY/LlzFQvHEB0mO6DyTsjvCN0CbsFtNw=;
        b=RkiI+vwnnL7VCkolwfyJmz2pmhwyz1uPFgE9WrH3eTnJ0h1OjtfKBo3De8gNoeWD+X
         l3xRPZIq/L9vFJzv6PULtvhXKKJtDa9LLTd2AiHrb4BZ60JZC+IqDP/SwDQlwxNDg3Lu
         9JvSTWA0sLX1/2yvxrUmgT4h1TvymGWt7fVAn2xOTJDbbM8Feyi8EviAkCrynsKOph1z
         JlCZLF6rHye2m3z2r22q6SSNhTHJoseOKvgJklu5p9zXC51NgfsruhZVLFQ0SRjjMd8L
         sQonnT13MfN0mupzXLJTbk49qRIe8hctNAc3jWuKFq37gyG4sRWzTKJCqEAo/+pvSIr+
         DyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=85g64dsl/DcFY/LlzFQvHEB0mO6DyTsjvCN0CbsFtNw=;
        b=XDcSRyYJ6uq4A2Ln/FYF8uA6l90UPQGPGsSJophnFAQ4dQuW2Hw/w2Wj2QLn4p3WV3
         cZieszYYTRyPJg6FLOzh39i7M/Zyu93QNMHAYV1K43OBFfWcxIF1SRfxKlZCwmqwCh4C
         /gnf+nB7BJzJ8ZjFttrqv9S+IBHQvYAqANF2XHCbjmfzjrfyObhd+zYamRMuHkLkxk3W
         1O0SxP9RVCSRzmGTzfwb24vOgjYAl+kEa4r452kFGAWVRtQ+mIvP3CMijUDWBEes4Fyg
         fVw6f3It9LqMLNkpGpcQZWDB6zRiELMDAWGA1KFRSURyXyXZQMEYxiRyJXeb5SJF4yQS
         Jzew==
X-Gm-Message-State: AFqh2kqyTzL1cEVNwFs9T5sg+abwkVN8tXokXT4XAuTkZbOjyUDp6raH
	L5qZvbFH2nJIWZUS/YkZYzbb+Q==
X-Google-Smtp-Source: AMrXdXu6eyBeVwquiscq6dc3oKOQoMKYuh59bv0ZswxZ5ffCDxH44vMaC4VrsM+OBs46fi7tYToQIA==
X-Received: by 2002:ac2:4f0c:0:b0:4ca:f887:fe99 with SMTP id k12-20020ac24f0c000000b004caf887fe99mr9661416lfr.25.1674745468435;
        Thu, 26 Jan 2023 07:04:28 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id p8-20020adff208000000b002423edd7e50sm1618824wro.32.2023.01.26.07.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 07:04:27 -0800 (PST)
Message-ID: <0a47dfbd-d786-c7bd-e4f5-c71e1b649b9f@linaro.org>
Date: Thu, 26 Jan 2023 16:04:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v9 7/9] dt-bindings: timer: mediatek,mtk-timer: add MT8365
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de, maz@kernel.org,
 lee@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com,
 gregkh@linuxfoundation.org, chunfeng.yun@mediatek.com,
 angelogioacchino.delregno@collabora.com, nfraprado@collabora.com,
 allen-kh.cheng@mediatek.com, sean.wang@mediatek.com, zhiyong.tao@mediatek.com
References: <20230125143503.1015424-1-bero@baylibre.com>
 <20230125143503.1015424-8-bero@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230125143503.1015424-8-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_070431_720324_05D47C0A 
X-CRM114-Status: UNSURE (   6.09  )
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

On 25/01/2023 15:35, Bernhard Rosenkränzer wrote:
> Add binding description for mediatek,mt8365-systimer
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


