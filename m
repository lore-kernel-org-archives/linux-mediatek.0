Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BD7C67871
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 00:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p9iGP14d6f9I4D+kuqf6O3+s5e5qEr4YR9xj0lL2tQg=; b=uVG8wez6LRUwwS
	moO8/aMlOzpQp/9EfFt7fHtEhxQetd7H3AHCCTYgaTwkB2mPxp9aZLNmoZU6s793FTZI+T9LW8Uxv
	TIjdwa1uJcSqez0P6DBTrIpP3MfW9U5OmXxNCVTBRO6ybRdsFFT0mfBuZNkHgHcjEdQei2p/7QnLd
	5d2KppR6kQWGJ9Zwx9mkIW3titwYNcaz+msIUOdWFQKSLwzGihs/ePbocUQDtCIK9pCa6M62Ha3Lw
	k0Ae8X9i1hwxarPksLJTswKnz7Arphqt4DHT9fuMvKjBz3IouFey3P4+/PtVwQYN0xOeoGltwy2OR
	ZVnCcVkljD3I2+eCl2mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on7eD-003Q6Q-Nh; Tue, 25 Oct 2022 00:18:25 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on7eB-003Q5N-6o
	for linux-mediatek@lists.infradead.org; Tue, 25 Oct 2022 00:18:24 +0000
Received: by mail-qk1-x72b.google.com with SMTP id o2so7123448qkk.10
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Oct 2022 17:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p9iGP14d6f9I4D+kuqf6O3+s5e5qEr4YR9xj0lL2tQg=;
        b=OtcjS3mzg7rlOcJHjSoD4JAWkUpNIVr3uTqc4Vek0xgQC60nPy8J5iQ9eBp+2ScjNh
         mKkfAe/bj/e1y5HJwuzOnTHJhj6CICRZOx7YVwDPcDkw+hQJzDCNoZ7v7bB+4dsHoXbu
         WJRZjmeJumf1MwvDTeByrDcFZXKEqCU7GhdJTcAa6iNvoUAh1PILnE1ZlxLQS1Axvvm7
         bzqO6u8S2fc68LqbJ/TIQD/3OsnKbL4HEoosLrMqxLzAqFmmfxs42GcXhUM6mKpOEekx
         CkXUkK7+8ECU0HaUf0NJTQhbZ0OKcJcCRSvtBR3I1ALQLtAFluNsshqcPCT5vuDBzpGg
         jedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p9iGP14d6f9I4D+kuqf6O3+s5e5qEr4YR9xj0lL2tQg=;
        b=fBtDtTKDzTml0Bf5tziPfWXC9c4lfwUyundZlSLePe/9Piaj/UCZBmiQaMNySVcKPn
         JhJG/symB7oK3pYqoxnvSzY5hXIvkjJQfS9FMNiMHAVpp6RMsYPLNRgJd9dxshD6LXuD
         in7b3HrKUWvw/t3Ncp6e8X7j0ZDsZFvKmSCDnzUsHggKGbiZwgAI47nQYPEDEEnGygmZ
         GgKWpj1FE6AcwmW2D7tIHe0kU9lr5rcIazkFE+QxRYeDWKKkGorklbRkDUEv1xDbjUZY
         1iYLRCO5WTEv1BizkT1okN3ShG3nuOSwEOy29JpJI+pqYz5lQQzm/3aQhZkJ7OWFp1ZG
         qtqQ==
X-Gm-Message-State: ACrzQf0/SnkguuqEIt82efPlsXG/45rF1jADI32xQua1kS5cpEdVJXqa
	xKM28upXsjz3Frt4izN0GvAbBw==
X-Google-Smtp-Source: AMsMyM78J92TaYTk4yJazk6RCGkFm9WubGdfdV2HbUM+i9DvZ7hX6waN9UYo9qf6oaenDl6vIy97bg==
X-Received: by 2002:ae9:e115:0:b0:6ee:bcbb:396 with SMTP id g21-20020ae9e115000000b006eebcbb0396mr25000114qkm.668.1666657099961;
        Mon, 24 Oct 2022 17:18:19 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id m8-20020a05620a290800b006ce40fbb8f6sm1040395qkp.21.2022.10.24.17.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 17:18:19 -0700 (PDT)
Message-ID: <22a8f70d-a5ce-1f54-03d1-50874b7c99fa@linaro.org>
Date: Mon, 24 Oct 2022 20:18:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] dt-bindings: pinctrl: update uart/mmc bindings for MT7986
 SoC
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221024073634.6834-1-linux@fw-web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221024073634.6834-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_171823_278033_9C469673 
X-CRM114-Status: UNSURE (   7.68  )
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 24/10/2022 03:36, Frank Wunderlich wrote:
>            - if:
>                properties:
>                  function:
> @@ -221,8 +225,9 @@ patternProperties:
>              then:
>                properties:
>                  groups:
> -                  enum: [uart1_0, uart1_1, uart1_2, uart1_3_rx_tx,
> -                         uart1_3_cts_rts, uart2_0, uart2_1, uart0, uart1, uart2]
> +                  enum: [uart1_0, uart1_rx_tx, uart1_cts_rts, uart1_1, uart1_2_rx_tx, uart1_2_cts_rts,
> +                         uart1_3_rx_tx, uart1_3_cts_rts, uart2_0_rx_tx, uart2_0_cts_rts, uart2_1, uart0,
> +                         uart1, uart2]

Wrap it according to Linux coding style, so 80.

Best regards,
Krzysztof


