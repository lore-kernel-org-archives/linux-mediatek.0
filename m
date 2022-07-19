Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CDFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 10:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TE1OHpxt0Gn4KYGNSFUw9hbvpfW/q/4s1pIHU3OBfG8=; b=K75ICnHXxO7jfZ1hynmidN7Qco
	InAfy7X9yvTDenWONBWjDRM6F16fVynvLbXoGE+0EsGplfa1LKAyZ/k5fE+nXiQEKhYEmyYO5Q7Y4
	nOvY4Z6Q/bEgxv7ZHS9p8fj6AXAbGL/EgIDB6TTPfamjwEdVyxg+9fzJfFW9Yr5p5Wt+bogOSebvH
	4mEBsGSZx2AIJcr32ZQz/0ujWObQ6Iu2MAlZkycc2uqAnLwh8Wtzs/Uhm0QwWjps7cxKMcez5997W
	FdN3APdPiYoNnD7K2rKkOvRyuCyeKHwPxd7Yublo0+PxZP43HtWgb7eUNB4DvpqwRsL1bp5jRbDZq
	LqI2y/rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDk6a-007n8j-CU; Tue, 19 Jul 2022 10:05:28 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDk3k-007jm6-Bb
	for linux-mediatek@lists.infradead.org; Tue, 19 Jul 2022 10:02:33 +0000
Received: by mail-lf1-x129.google.com with SMTP id z22so10254498lfu.7
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Jul 2022 03:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TE1OHpxt0Gn4KYGNSFUw9hbvpfW/q/4s1pIHU3OBfG8=;
        b=UyBAHhlJPbk2RMIIrCx151UQM43DtmaVbDr7vMjzULHRvj0hWF1WSnZCJ4X8za/VtL
         bnSGemNq9ut0fGxisRsXApj4RiO7Ch5DGgERxykkqQ6MPh3eGHYcy9toS5tN4GcczF/f
         MGyFgPs1WsO0MNw+qA9otQOmeGhYlp8tLVguisqfjapEObqaDHAEcSle6upY2MOL3WEe
         g+PMs9wbTmj2w0XQmMg9chumSvKKyJiGlD3/JGUWlmF1GAUMDRZbTprg35wxvwHuAEAQ
         YIIG8Tz1dSGe5rDTTqgoZP/zbTDMawPpke+LoHQOJkimms1+uNNl+gMeM0cDPp3BZcay
         MMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TE1OHpxt0Gn4KYGNSFUw9hbvpfW/q/4s1pIHU3OBfG8=;
        b=diYZ9e8GEUqpiH120mX1BxkZMqkdX6rnOvQ3D+s9EIKt9w3DmVEMYnw/SJ1MGEMx8V
         9Y6TX+o87a3VeWGzCxLgRsuPXTZ8mZHOMOINLVUw4wYdda+yfZO3QqeHseiGUXYr2cZC
         u71ZRH1y1zOSd5UarHF1YJ3wTp2yBFApwWhSIo9vwnRcNNdctKn7rJEfrmJcYLn9Ofqt
         97Ih+lH/eIWmQMH7us1DZSufnwNScklJZOHlrLaHC0h6NR0zIYrVUUjIY0xXrC7smjTg
         Fc5jGBrR8sRQauWNuZ2hOvaDmsnk0dCODz+mTOwVyJPHk2u5iY196SuCbdkwpoqhgQ6j
         do7g==
X-Gm-Message-State: AJIora8Z0htWpEHQpeohS0LeXX24Wkz8zk1aaMGjH0fU1/JRiDJV+f+K
	HAn7Swx2qdmcx99z5nGpdMaQHw==
X-Google-Smtp-Source: AGRyM1vIkpompoYCkzed2fD3099X42TxhN9o9QjyEhnEqursvVyWwGRXgk+JNDyOROQWQa22XRf5DA==
X-Received: by 2002:a05:6512:1394:b0:489:6a91:272a with SMTP id p20-20020a056512139400b004896a91272amr16151476lfa.424.1658224950471;
        Tue, 19 Jul 2022 03:02:30 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id a4-20020ac25e64000000b00489e5ba2e26sm3123329lfr.63.2022.07.19.03.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 03:02:30 -0700 (PDT)
Message-ID: <03e8e543-48bc-240e-214f-12f649c141a8@linaro.org>
Date: Tue, 19 Jul 2022 12:02:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] dt-bindings: timer: Add compatible for MediaTek
 MT8188
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220715120114.4243-1-johnson.wang@mediatek.com>
 <20220715120114.4243-2-johnson.wang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220715120114.4243-2-johnson.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_030232_447306_6BF3B008 
X-CRM114-Status: UNSURE (   9.28  )
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

On 15/07/2022 14:01, Johnson Wang wrote:
> This commit adds dt-binding documentation of timer for MediaTek MT8188 SoC
> platform.
> 
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt | 1 +
>  1 file changed, 1 insertion(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

