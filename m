Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF66CC6FD1C
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 13:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/yxGBjJWYHSDKTiHFSEDygkdbxssA9wfkJfJYmMlGw=; b=ZpGxq5Tz3ihcVOMGR7thVvBl+9
	9M9Mb47EBZf04hDFC0xab0oMpBacje6I3dYFfMPA+zfoKxmXo4qQkqPQ9/+8kn74j20ehjlkZjVyj
	JMXV8gTtBt81OwCUaGtFob2kcqwDG8av0biMalQLhNquqw5gz/ZplR65E9l9H9lkEHP5QWZuYAv9o
	5tD+x4fIvHk7A3ecrUIAapANxpjSOeXo/qg+OCCnumqgJWGjfpj3dRXC4kWjCRdMIP7QEpema793d
	QdvCICgq8p56vQDg10inQ4SOY1QNhfRxfm45CGQO3zQiKvsxxiSXwFzY9QRscW3/1zKu4rR0dOc2p
	uA4U5pEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pazXH-000eBC-3Y; Sat, 11 Mar 2023 13:45:23 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pazXD-000e98-V7; Sat, 11 Mar 2023 13:45:21 +0000
Received: by mail-oi1-f177.google.com with SMTP id c11so6405597oiw.2;
        Sat, 11 Mar 2023 05:45:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678542316;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M/yxGBjJWYHSDKTiHFSEDygkdbxssA9wfkJfJYmMlGw=;
        b=jW+B5A7cAJXULykILmHmp4nlS82lcRZnHyOFPUh7U9LlNm0h/4KzOyCoZfZsSNEc/U
         uilngiPPLJ5Fa1+vCmGIZ5FipLM7NFabjEoeOG4NJR+hhdD8GBf+kQeJy9PXaidqgaQU
         VQtxMsz5ICYu3RC46UF4hhSz/JbJX/4s/9XVIg9Ep0GPKzZE4n48wdsDaPG8YONswlxn
         tojGqgaMrIa0oco6tBJuRtCycboNeItaub465gHdvJnNjxDKyV948nRrTlLoJLOkzulR
         2ouV6BobyLmZZZCQWIm8r/VthzvAIvUM8H/0q0RvoqBZ0YlVea3rFQxswLbyJP6mWkgj
         C25g==
X-Gm-Message-State: AO0yUKX58HQjMIQMs6onuxmk3rq4d0NmHIu7YpMn0yZ/giuiuLTKHuns
	I7pB0P/gh31TbNEhwPvg/A==
X-Google-Smtp-Source: AK7set832JJbSMM00eLNYQW7qdwTXKNOJD+8e5BwJxEJiJKYv+ZhJ1MVeE7vGwHtwXoHgfdJlO/7vA==
X-Received: by 2002:a05:6808:b12:b0:384:18f4:1536 with SMTP id s18-20020a0568080b1200b0038418f41536mr13462686oij.32.1678542316277;
        Sat, 11 Mar 2023 05:45:16 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80f8:ec2:d840:96d4:1bbf:55f])
        by smtp.gmail.com with ESMTPSA id s188-20020acadbc5000000b003847ca255fasm1054934oig.30.2023.03.11.05.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 05:45:15 -0800 (PST)
Received: (nullmailer pid 31469 invoked by uid 1000);
	Sat, 11 Mar 2023 13:45:13 -0000
Date: Sat, 11 Mar 2023 07:45:13 -0600
From: Rob Herring <robh@kernel.org>
To: Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>
Cc: linux-serial@vger.kernel.org, gregkh@linuxfoundation.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, maz@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, angelogioacchino.delregno@collabora.com, krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH v11 2/3] dt-bindings: serial: mediatek,uart: add MT8365
Message-ID: <167854230361.31217.14194578578496265497.robh@kernel.org>
References: <20230309213501.794764-1-bero@baylibre.com>
 <20230309213501.794764-3-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230309213501.794764-3-bero@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_054520_020221_967E8FB0 
X-CRM114-Status: UNSURE (   8.52  )
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


On Thu, 09 Mar 2023 22:35:00 +0100, Bernhard Rosenkränzer wrote:
> Add binding description for mediatek,mt8365-uart
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


