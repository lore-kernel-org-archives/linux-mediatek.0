Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9AFC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 10:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQZQi/Jrw3qvYPq1w5WSVXwwszr1N2uvMGdGYFMBq24=; b=I3/jMvqRnT2Hn/
	I7M//esOuVXNm6h9F1iAcdfdh1fxePzq92PR2i6N1Yet3Dj6V7VQbWhl3D/iwP0o/YILbqiiMmwQW
	3Nqnl16CnyeNq1bFIKQD9088XnB989fbYMFIyysD6Ewa7hNgsqZFvenUakm9Fes1IgAzRzujIKyzS
	KvlsqPx2AU8mmHCvobNksfzEQD/Xs7B5xRmwf3Oikr9DLprsKd3C9MenwraB7UownvpyurR49Z1bV
	zfMfvprNYLcrwpVxWI4W82Yrdrzkg4JrHSFVYQSV4ZaiQnzBJvcdtelGWiru9ZjSWQSVZXhkR/v1U
	CpRC3O5V63UBHg2ykKgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLek-00FKPh-2s; Wed, 01 Jun 2022 10:32:50 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLN6-00FCkS-C9
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 10:14:39 +0000
Received: by mail-ej1-x636.google.com with SMTP id rs12so2677152ejb.13
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 03:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=AlvALx0zMnGDVnEapBQ7KHJlm9HnZCeBAZQY2Z7YIfQ=;
        b=KpJ7iB62rkYxYYPytNHxK/MzKHmZsF5SvunBuTcECK0tn0gBcv1PatBmUDZ+SvIPy6
         2vqt4Zj3vabQUZh4U3OAndnCqt9yZyLZ0IKx3nkfjHESGq5PandWAV10KgQKMi2pMU2K
         ho27qU7HddcfX1+Ll7SPEaP5cq7FDEBr9ywhMsVOarhAz563nJibiKkzZGXMSf/76XI2
         7XJ+7WhqDvf4p9WEs5e88JGVmweks7E88ztDQGkWkgeXJYq1/x4N1OkEu7GCo0a4VD+U
         Fk7xDFGl6MW00LFfN2Ek7iVNwZMl4z/F5PPhmDrLWw+2CH0XVcZpjoaDOzSaGaz4v3H1
         wqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AlvALx0zMnGDVnEapBQ7KHJlm9HnZCeBAZQY2Z7YIfQ=;
        b=FxDT0wtULfpTP9wi6/9BL8DRtamUQR+YL2INIC5rDMGes9Ls2UYRzm5jThyYeOPtm/
         JLRpBRolnUZqQH5ZmbM4G0aUyZB/P2tRDSjUkNG8znFfGQN4miRAwwjvMv4y0zpqmxGs
         3Q6SYRVF+k0FF7deZ2+5a0q0MUmxIeSE9Et4Phmp7PyF3gRK2033uP8UrzxF/LxjeBCJ
         urHFFw/xJwkTLAoWl9FL+0HYmfQdT8Yp8qUPqrISwbRfnfERUWVPWOXhfP/iutQJFCvz
         kHbpU+q3ZHdgZo8JXfQxw4kGB+O0UKs37g4s1aWK+bAr3NKB/OUfebckW8PWQkGa0xpw
         47xQ==
X-Gm-Message-State: AOAM531TxV/dd1xLJqvV/KocRqxTAyJLXg+kBlJd4DpMJRjn4tds37wG
	7uSGZf7GQtWrTtAH3ExyWlBZIA==
X-Google-Smtp-Source: ABdhPJxmm2Ul6Qx7gD8GTPvF4loAnXC4xOsCGIvm33g8Xu31YADXTnZMvU21oiaV1IKR3O6RT4tgSA==
X-Received: by 2002:a17:907:7291:b0:6f9:a3b5:7ce4 with SMTP id dt17-20020a170907729100b006f9a3b57ce4mr58314733ejc.642.1654078475092;
        Wed, 01 Jun 2022 03:14:35 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id k24-20020aa7c398000000b0042dcac2afc6sm710131edq.72.2022.06.01.03.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 03:14:34 -0700 (PDT)
Message-ID: <30a4ce8f-366c-9e58-1a48-fc434ae739c0@linaro.org>
Date: Wed, 1 Jun 2022 12:14:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 14/17] dt-bindings: usb: mediatek,mtk-xhci: add MT8365 SoC
 bindings
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org, qii.wang@mediatek.com,
 matthias.bgg@gmail.com, jic23@kernel.org, chaotian.jing@mediatek.com,
 ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
 chunfeng.yun@mediatek.com, broonie@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20220531135026.238475-1-fparent@baylibre.com>
 <20220531135026.238475-15-fparent@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531135026.238475-15-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_031436_478982_8825C2B0 
X-CRM114-Status: UNSURE (   7.32  )
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
> Add binding documentation for the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
