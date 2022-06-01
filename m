Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4771DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 10:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qg/jjASzhZ6Ipw9yvpLiL31q41Z033CxFEMoUPw3+Qw=; b=y8KWYdlJycSZKW
	VD+cqV73Z5UpQGdZWn4KYWvOqX5n7K8CPJadB54wrlqH4dqHnLZ5r4Dfk4xxhp0pIHn7o/od34nRM
	a4THvd0WMcdH1IWaHp+x46sQjfYI2OXpXGGda9e9KnzNLJQlXLFw2J0S5f8s1oCBii11kltxPMjZl
	ThrzYB4Ie3CuMElqSWdUJ2kQv5ZtD6+PDXF8w2Wbmwgrno3z+c78W+miZTxUc8GcDYPeQKcC8Z/lT
	uGuAhqBpyZRhfT3qmx3YlV1CGPJkEyTe2VXXC9I6JXblTe2FhK12Ep3O7sZXU1btAviz8nUp2EWXA
	YXnw7DCuykRW+PiMqd7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLr6-00FPNx-34; Wed, 01 Jun 2022 10:45:36 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwKmj-00ExVp-E0
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 09:37:02 +0000
Received: by mail-ej1-x633.google.com with SMTP id u12so2525685eja.8
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 02:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=BvJY1lFnsr0Ymr0p7fEBBy1zBdInDHqv2gZieFwic/w=;
        b=H9oMDfi9FTLslshDgNUeUCSTiDMS6SPqQwQ4xmvp2YZvpk8mRC3cDlTC3xpYhnqMtp
         nPH5zKM7d+MOUcflu/CWX3v4wWpaT9OposzSM/Dxx78jsQELZDS5MGcQrSkywIX6o5Uh
         4MpGtaojX5vTHNuVIp8cnOB/0ztfpdpeB3mh/avFuWHvaJ19hKjRBAfWOWCvpf81qUhb
         PX1Cb+q3YAxaR3A5LiSjRG9kjKmrWrFqrOgbDUopVp1qK7P6ID4hzxjnsii4gTsV3W5k
         rOX8IHcJbZ2vzaD1PmxLhGXES4FfrspfYMIIDx5GmxITFiWW0RHW7uODZtl6Lpz4t4Xu
         p4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BvJY1lFnsr0Ymr0p7fEBBy1zBdInDHqv2gZieFwic/w=;
        b=S1Yb1nJT/nYmXztfVp9jjhLcokJSCfnlGfsJ76TcdHFwMgrB+cJLWNYONCxGQcikCt
         XMnA0TN1TBqxBFHxTaqBEZQSi/cCgeuYDSoI4XKQM+JYPsV9Y3W90wx/4gpXg486HTeo
         MD5hPpgkyFIpw/cWfPIX3I8TvWgkkc9SjceVaZQ+bwvj5oAMmKGC7o1gFt5x0DCutcS+
         oKMLXwYlTyvHlcsFwtpWPYVx7mtNjueHGEyXFJA4K6bcVPhW1OAnS1nebupWFUUoLtAh
         K+QBxOhVZZsEwmqgWU/wfiGeNqhZHqd6ptN3XaDPximL6VkDQeZ3REJoCw/7v+fCHZsk
         R1Gw==
X-Gm-Message-State: AOAM5307HZhDp5bm81JB8VuWo/w7iOLTl9cvXrUCh7EOaku2mRjyWUpP
	2ffaXZm5CaPkZ6yvQSPp1TYVWw==
X-Google-Smtp-Source: ABdhPJw2rvaPJFhu2OJTcgjX9RCpncnnG8SPTMWTUMQWrgzBxKr8ze5Lrm8qBjOHLVpPw2RtdL3afA==
X-Received: by 2002:a17:907:97d2:b0:6ff:288d:1bf2 with SMTP id js18-20020a17090797d200b006ff288d1bf2mr26274477ejc.664.1654076217545;
        Wed, 01 Jun 2022 02:36:57 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u18-20020a170906069200b006f3ef214e13sm494920ejb.121.2022.06.01.02.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 02:36:57 -0700 (PDT)
Message-ID: <8924ef92-d8f7-1f10-b1f7-7f9bc1e2d444@linaro.org>
Date: Wed, 1 Jun 2022 11:36:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 05/17] dt-bindings: dma: mediatek,uart-dma: add MT8365
 bindings
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org, qii.wang@mediatek.com,
 matthias.bgg@gmail.com, jic23@kernel.org, chaotian.jing@mediatek.com,
 ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
 chunfeng.yun@mediatek.com, broonie@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net, Long Cheng <long.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20220531135026.238475-1-fparent@baylibre.com>
 <20220531135026.238475-6-fparent@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531135026.238475-6-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_023701_487622_69FC4591 
X-CRM114-Status: UNSURE (   8.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 31/05/2022 15:50, Fabien Parent wrote:
> Add binding documentation in order to support the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml | 1 +
>  1 file changed, 1 insertion(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
