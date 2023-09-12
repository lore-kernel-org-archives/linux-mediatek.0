Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD06CA0ED3
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 08:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NecnTNhEs6mk/7xS4+yPxPBE+Iq+otCfvP8k/SUlgdY=; b=sR6x6KtN4EEkPpBQcAql5YTrD8
	iTekqfeKNfu9kOjJg6dVyCK7qYZSNUq81pC9jCZedMvGCqGJVez7czbaI155ng2c2ven2A51BKPnp
	1tApSBcROEc+8DF6gN7y7TH1gpUnEioUZTStRibLf53fGQ08wW0DOqlP0gyhMWfiqi8kr0ersP0CX
	XsNZ/II46me5+HCt5l+7d7v6+0Jd5PCQKQt6lnbm9V7IL2OtHl/rRbfbIbAP1bZpkKzQJmQjT1AnD
	B3Rkjj00GMZ4TcSiqT/I2Z/iHq6U9XA+x/fr0XrJMhaOYRHxk2YInQF854Un9HcL4QRFT1i86UVnM
	Dq9INnVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfygR-002YvN-22;
	Tue, 12 Sep 2023 08:23:43 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfygP-002YuY-1m
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 08:23:42 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99c1d03e124so659438166b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 01:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694507019; x=1695111819; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NecnTNhEs6mk/7xS4+yPxPBE+Iq+otCfvP8k/SUlgdY=;
        b=zc06DNo0imGg4hBgGNDCJrlPJmBrVMtXnIjUkAuBCH29gFILg2qBTeIp+oHcvYVLrQ
         b0uVo2JXhHtlI8u84KzF6MYEp5GLZqf9o51j4V5PmlOrB+lerlv7yVapU6dmt/Mh1GUz
         RtJ1L785tmr2fjvR4sjNTpyHA7hAjWmMt91fcMk7SscNWB83fJDtJMvBU1L7r2JjMZhv
         nyOeD+bK0WTHASnc9f9jFnaGvnaEHybYg+TRpD//E4NuCHwPLo3TbSDD23eJxCCQBgB2
         CkPGiDgil04qBUdMiDSIFQyMAKn3gZ3YDBegXTuZRFi61YNyYgmjKGy9a9paXmF6Pn5w
         LeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694507019; x=1695111819;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NecnTNhEs6mk/7xS4+yPxPBE+Iq+otCfvP8k/SUlgdY=;
        b=B8EsRN4ReTSR05w3EsfzQIY27MnRtZGfXX15V6xseG4qEy/pWqZlHCRCU/5/8MWvR9
         Qlk1xZ9lvAaCzvsqVpYoTHDVM/UVg8LZ3P0yZQ0PU2cqvYRJlLRfO88LVuD40cIAksLV
         iKsr+bWo8KpLUDJ6Uf3UoYcsbqwQ/7MrimhEi9pQQcRx6FZxAmAYmvtFGZC/E9j5GX4Q
         pCzPYEZYtoyxj8RGAS3eSnOSxLepqO/d39AMruQOCoX/VWu1gD/wP3SBabwHBsu5uOY4
         E0h81HxzGtY1ZzVFVRLXThMljLXG6q7P2bfC2f1B/jbqEwZCbPA3AuepbniQUkp0dNyT
         iKmA==
X-Gm-Message-State: AOJu0YzzPPQ4ur6n3TxrDqdSEVOQ6w/KIgYeR3nvg3k+maY7YaySOjvV
	VUXKMoY/W92DicFDQDidPMXirA==
X-Google-Smtp-Source: AGHT+IFUhAhviWgQLFU03MSAKRTyIaNN7fIQ2Ll6cz8uur8tvWrxceUtpGTQvZh5kUvI/HNWPpsu2g==
X-Received: by 2002:a17:907:a0c6:b0:9a2:86a:f9b7 with SMTP id hw6-20020a170907a0c600b009a2086af9b7mr9091015ejc.59.1694507018283;
        Tue, 12 Sep 2023 01:23:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id rh16-20020a17090720f000b0098e0a937a6asm6416288ejb.69.2023.09.12.01.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 01:23:37 -0700 (PDT)
Message-ID: <c64efa17-704d-0bb0-da91-5658bc0bf34e@linaro.org>
Date: Tue, 12 Sep 2023 10:23:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 02/14] arm64: dts: mediatek: mt8195: add MDP3 nodes
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
 <20230912075805.11432-3-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912075805.11432-3-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_012341_615614_E19E03B0 
X-CRM114-Status: UNSURE (   9.79  )
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

On 12/09/2023 09:57, Moudy Ho wrote:
> Add device nodes for Media Data Path 3 (MDP3) modules.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 378 +++++++++++++++++++++++
>  1 file changed, 378 insertions(+)

Why is this targeting media? No, don't. DTS goes via SoC, not media.
Don't mix patches.

Best regards,
Krzysztof


