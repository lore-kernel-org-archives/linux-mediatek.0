Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A21C04A95
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 14:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uUiubakIlF1DpxdqyZ7Sj+SDXQ/dw5Cd208ltlbQ02A=; b=Bhigm/r6u6LcmS
	ROGbJt2JOWuK4ja6JlqbyU8DxkTXMBOGmgSOneONQaFsW3G7K7GxU7jyktkzhuqVZbbTqt3fb/gOu
	QY+5IGbhwCBAKtslYAiV6/8bQu4k5BBVSgPfIuJuyPaNMFHACU3qRUO3CsHUFBXgOIYGmpfUA3CkF
	5YSH5mEyxtEAHX0VaqN6dUK8l2sdq0NKB+GpN1Mu23K9Eb+4CBf8KyhzJImJMaLjiGkulGIkztZsa
	W52ibG9FMHVDChxzxfcxL4AuYyJzLZuopcIHpFMc6qZxQN5vEd/YAcv4SrI7fywCb49765u+bVPG9
	KLe33Gijw67F7w2h2Rmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onLMB-005w4y-K6; Tue, 25 Oct 2022 14:56:43 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onLM8-005w2Y-8d
	for linux-mediatek@lists.infradead.org; Tue, 25 Oct 2022 14:56:41 +0000
Received: by mail-qk1-x730.google.com with SMTP id a5so8209795qkl.6
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Oct 2022 07:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uUiubakIlF1DpxdqyZ7Sj+SDXQ/dw5Cd208ltlbQ02A=;
        b=m6Ls5iooVS3Fnkf/3NW2w8jTlWMzIYAuv5F4dmXAkmLpai7RaFRizUY3fHggCFdwl5
         wNKIh8SJ1QFKkm16gP3LAOZv1jhIFM8VOthJwtKYUj7u+hfiqqacrmyK3J3nv7WWy67n
         nk6SDPJT+ZuvjH/PZNgh4RiUElV6wa2daF+/6EZ1QRgvBMlRUDER9PjT4b0cF+DQ5Cn2
         h5/CsJRP/W42czQnDTXMBNCxCYztGtpidL+0kI1HLoBjopI6atnNBovzKnl73RsthZSq
         /ERMjBDo3+OcPDjN+jNYe3P8+tJ362nDh0TLjkUGsQAYRvN+ulX0V1R4C+8hEGXJ2Fdy
         +ynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uUiubakIlF1DpxdqyZ7Sj+SDXQ/dw5Cd208ltlbQ02A=;
        b=Bl9y8lhn4dg47tnk5IPfHst/b/XBDxykFF0guejvrO3iASI0QOla7uCxrZ6xaGM+Rf
         sPHxOER3ac61WdN0/VAULF8H0mI0TYpzYblCcFiiMQgWcXLJfeDoRjOHeDV6AWdghNlz
         9pVICTms1UrmbwaMvsdU0ZhtetkstKfAfrmMcCOJyRJ8mBVL1Ebg5ViZbrf3g9qxVx0z
         xHLXsbijNnVZ9QoVXH6C0t0ivJ73qpzL94RIzSV3wIjzLlr9FxOJPc7zqwJXBeVxZKbN
         wD4ZiGNff1HLpw8QcTrIpbA/CmNHQGDfFgkWf3SKeTI9pxTFoEMZwwIczJ0fquNZq9OX
         Y4ew==
X-Gm-Message-State: ACrzQf3TCN6Zbrrjb1RX1wvWw0lBeQNYuyyf8VVw4W+UW/pKTgPS2n7f
	W6cfmQYuRZ8GZIcbSswAdhvu4g9gMVbT3w==
X-Google-Smtp-Source: AMsMyM40J8qEW/jyC6caiIqv2XzBMoKkNM1NJBwLdGrCnRdc8istSwcNfzTfcYq3K9r0J522tKA3dg==
X-Received: by 2002:a05:620a:4514:b0:6ef:e65:bc77 with SMTP id t20-20020a05620a451400b006ef0e65bc77mr18909789qkp.644.1666709796970;
        Tue, 25 Oct 2022 07:56:36 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id r11-20020a05620a298b00b006bba46e5eeasm2304609qkp.37.2022.10.25.07.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 07:56:35 -0700 (PDT)
Message-ID: <cd2e3ae3-6a30-f6cd-fbbb-9c5c6071fb9b@linaro.org>
Date: Tue, 25 Oct 2022 10:56:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] dt-bindings: pinctrl: update pcie/pwm/spi bindings for
 MT7986 SoC
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221024074349.7777-1-linux@fw-web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221024074349.7777-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_075640_357966_BCCCB1F3 
X-CRM114-Status: UNSURE (   7.98  )
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

On 24/10/2022 03:43, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Allow multiple items for pcie, pwm and spi function.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


