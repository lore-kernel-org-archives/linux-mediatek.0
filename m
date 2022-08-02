Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95807C3F6B0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 07:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=368JpS/36rpWybO7f4ScB1zDTWLXtrfKA8qyBV5OuNo=; b=3Tq1z9U4OBztwgES0T1pj15PwG
	vpnSfEEV35F1G7VGgw9+A/WRM0uQTSDdxeYwU5E8oCCi7SV0xkcXZ6184BVuOypVzKwOQ5AJCULJh
	T19ziap9pI4251qqt+EaU7Qfc7toHQNRuAH8jNdhWyQBjZ3T44xpLsjD7W37cIdL+dqxgsXq02Gec
	iOYuoYY1S4NM9zxzICDF/AFL5f1dwywMJ7+UB0LzdWMXj4ueCfyhLX5Pwv7G7pIXE1CCChJ2ENumI
	1KB3bHKJ/NcbEkLYQYu7CXyQC8RJxfqjc8jejnaN4l4ht+0DULv6ydfdUapjQr+1VneonuCsNy5RC
	NUt+G5Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oImQJ-00BOF2-He; Tue, 02 Aug 2022 07:34:39 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oImQG-00BOCd-20
	for linux-mediatek@lists.infradead.org; Tue, 02 Aug 2022 07:34:38 +0000
Received: by mail-lf1-x12e.google.com with SMTP id a9so7933946lfm.12
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Aug 2022 00:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=368JpS/36rpWybO7f4ScB1zDTWLXtrfKA8qyBV5OuNo=;
        b=PAW48wAwiZTpeP12dW/05hHrrHyEYFI0im9DNNF9Q1icROFPCIEb6M269XeZJ/MbV9
         5t2YxR+fMq4jgvEjANIcqMivgGJF29PZCnSzboOrNW+MBMK/EPhmD6KywOWoIpLszoRP
         2MCSDWoEriFDPYGELrXkSoaskNDFPu2DRWKIwXJqdxt0ZPPQiel/waz1N1RgyFPEc8Yb
         jlqJY/UTJ7/RQbPi9DQDvTyje7I/eb2hboyuTCyytIo/c58JUOEARUmiVwcVt3KSK1vT
         fin8GBGpmk2oD8H+CYqA8ukdX9l03o89vJAgdLCMn7uUYsAqnRRV1s+uQJX33SQeZD8b
         g06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=368JpS/36rpWybO7f4ScB1zDTWLXtrfKA8qyBV5OuNo=;
        b=BH/z2xfce6j92bb1I7Ybvty1p67mMnlq5PWXHc07oMPgzLeGJXLXHjmYpXAIYosjHj
         +7ZcEXDi2MOmjNTC1ln2PRgDzdwCoYr58gM2Qhy9Q2/QhoUryfbwEpyagjnq5Mn5P5a6
         OKvnSKJL1TyKz5XTYnKyz2y3xMvtvS45zEOSM0377ojV60s7w+6juDNeVgXyuS7VX9Pn
         BhixGh30hosoqSL9WXFI0izBqiXIARu9o4KltsgJ4sdJ1EwstAj8M45WxedAobkqMXB9
         IQDqnaBzbWkGhXggy4li1v/Mk+K1fjgu56PwdPMdGEKGp5JvHWS8qz48wNMS6xmoaTx8
         mHAw==
X-Gm-Message-State: AJIora+G5p2tUhmv82imBSZ8DvG25Gtm3ch9AOGtrXjVhzafP23NA1uH
	dEqTNAyEUEadg+dlsbxT/is4yA==
X-Google-Smtp-Source: AGRyM1uGrAhHXhNa8GumMf2zq7PU+wfp79kPHZ7PJ8Y8ijdAWAR4/sCz3QReeNWyA2joc0ixSYZ0KQ==
X-Received: by 2002:ac2:4f03:0:b0:481:50f7:ac07 with SMTP id k3-20020ac24f03000000b0048150f7ac07mr6416124lfr.422.1659425674316;
        Tue, 02 Aug 2022 00:34:34 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id l8-20020a194948000000b0048a9603399fsm2009441lfj.267.2022.08.02.00.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 00:34:33 -0700 (PDT)
Message-ID: <f6d7607f-dabf-9339-8d2d-7694a58e8427@linaro.org>
Date: Tue, 2 Aug 2022 09:34:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/8] dt-bindings: dma: mediatek,uart-dma: Add binding for
 MT6795 SoC
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
 chaotian.jing@mediatek.com, ulf.hansson@linaro.org, matthias.bgg@gmail.com,
 hsinyi@chromium.org, nfraprado@collabora.com, allen-kh.cheng@mediatek.com,
 fparent@baylibre.com, sam.shih@mediatek.com, sean.wang@mediatek.com,
 long.cheng@mediatek.com, wenbin.mei@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20220729104441.39177-1-angelogioacchino.delregno@collabora.com>
 <20220729104441.39177-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220729104441.39177-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_003436_218509_14D82BE6 
X-CRM114-Status: UNSURE (   7.24  )
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

On 29/07/2022 12:44, AngeloGioacchino Del Regno wrote:
> Add mediatek,mt6795-uart-dma to the compatibles list to support
> the MT6795 Helio X10 SoC's UART APDMA.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

