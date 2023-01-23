Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F692C38142
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 18:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lr5MPaX+CPbj+uvLPSPuq0twot1PyuqJGLrkh8HJM0I=; b=KuDXvlzZ43sELGqyr7kNFPkqV3
	hN/9CsmxJuutFl8A3GXyN2HafAK2BPq1iMqqFhYX9M04ZLcGyfk6fCCiQQnLDuwZxj7t4VA8oxFUB
	FItzWt9/7vFbVa0aTVfxL3vHg1U3Wnd3YWtqFvUN9DfrYDfb7t2ln5TdyCj/sACL8TSdXCiF+r8mf
	dEW0ngRo4bgdp406YGTWxC4FMBtLm8e1QN6S4U2iaq4kAS5yG5bny8L4AxDxEasX2Mc+6q/BX5jas
	i2Cq9LNzV/Be20FFSL0Cr/BMIddRzR8E95P2N0WJj5YPSREx+0kFlmQnTwfIiWFRRQ7E2iucX/99j
	14w0/IBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK1wP-0014Ah-BC; Mon, 23 Jan 2023 18:53:13 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK1wM-00146t-Uw
	for linux-mediatek@lists.infradead.org; Mon, 23 Jan 2023 18:53:12 +0000
Received: by mail-wm1-x32a.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso9310976wmq.5
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Jan 2023 10:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lr5MPaX+CPbj+uvLPSPuq0twot1PyuqJGLrkh8HJM0I=;
        b=xBqRe6fEn+YI8ZmpAsJ+mDYVaEfFQmDshTw9/SjuAUTRT+O5TmYv12ERKaxeqsO8PQ
         gkAmIjYGjk9UFYHwzHx7cJScZbISnCINuUppUbX9dpx+bWL6KNfbSxDtge00SKu7P0Mf
         38xeqLn7nAaBGxSitBCxrhN/DiaA1WJW4yPi1DkmgG0gCtlShBuxLdiYIpWvv4mtHkci
         6Enmd8efhtrU/63NgFCq8OKyzjasErOyl5Zw2GT/Kz4I9vW6rgmUJpsePZH45GfDTEbv
         1FYjz1zOtaqMEK6BUz1AaFaiMvgs33Q039xxvOZEDI9gMmpwlnwcko6t3xwtbAit6zT+
         4TFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lr5MPaX+CPbj+uvLPSPuq0twot1PyuqJGLrkh8HJM0I=;
        b=bveYD246oaVyDdqwhikHC8cLBCwP/Cg12xpxNSc2IcUuN+GKnOPfF8bl+ChKBwvllK
         tHJgV8fBj6/+/ZLrT7FfDEODeKkT8Y2T5UTrb4T7+S4NBA2+8GWzEPNiX4y+Fiwgb/rV
         P3YbqAMBHqYQWvpjh+BHpQqnKWTDU86dQjySWmmEaUg5gzQK9VRZLOCGBvby+wJcvKcb
         QsJFTm+bEsgtitCoTuoaTfWfN5snQ5KffFMpy6GL8SLX/4igCgNSwHpXqrgSWsaimICi
         OwAsZTLGYyy/8gY8atjJe0yruPdfzgvzhECOEzGaDcSanTOiLZJt6LAuA1my2nqw83xp
         PSmg==
X-Gm-Message-State: AFqh2kq9e2pAxprX4LoIjFTQ83xP6UWv2TRAKU4MYZkIllBxNrXNazgc
	rcWC2l/ywCm1/rsMZW4bUZtVqQ==
X-Google-Smtp-Source: AMrXdXuHygLwV0w4vccurHokoLTMYfXYMC3RwpOQYEmkkxITUtYbU06E92YaCyZXbM0xv/VucMgR4g==
X-Received: by 2002:a05:600c:1e1f:b0:3db:2063:425d with SMTP id ay31-20020a05600c1e1f00b003db2063425dmr17101085wmb.2.1674499979190;
        Mon, 23 Jan 2023 10:52:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c7-20020a05600c0a4700b003d1e1f421bfsm12568074wmq.10.2023.01.23.10.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 10:52:58 -0800 (PST)
Message-ID: <e75e5e1b-e7aa-e62d-1f12-f1543b6dbc25@linaro.org>
Date: Mon, 23 Jan 2023 19:52:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v8 8/9] dt-bindings: serial: mediatek,uart: add MT8365 SoC
 bindings
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de, maz@kernel.org,
 lee@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com,
 gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
 chunfeng.yun@mediatek.com, angelogioacchino.delregno@collabora.com,
 allen-kh.cheng@mediatek.com, nfraprado@collabora.com, andrew@lunn.ch,
 gtk3@inbox.ru, sean.wang@mediatek.com, zhiyong.tao@mediatek.com
References: <20230123163833.1007181-1-bero@baylibre.com>
 <20230123163833.1007181-9-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230123163833.1007181-9-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_105311_017948_61BCB879 
X-CRM114-Status: UNSURE (   5.56  )
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

On 23/01/2023 17:38, Bernhard Rosenkränzer wrote:
> Add binding description for mediatek,mt8365-uart

Subject: drop second/last, redundant "bindings". The "dt-bindings"
prefix is already stating that these are bindings.

> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


