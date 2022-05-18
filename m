Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9B4C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 11:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qg2vVkgtQ5tN/v5zrMkYjJeaWoL46gCUJWi8D54v+gM=; b=2xjLJN9RZ5v4VC
	hnmmkOShD+gqIjseDEParcqyKCGhMiTA5A81K5khLBWvdJRFdwMentpqB09vmpO+6mRhIcngZUFuC
	Ti4HzZ4ZMdqhX4JAezWb/wn3/gRaraDRTzCoF7blLIFguK55yNePT5XhIj3ZVhhijYi37Jx8xKcG1
	n+FZ/AQ/xXvMlcMrQ1VMfsk6jySEhK9C1l8wn7qfw3J7SNyP5mE8y0gWeIAQwFhbUnQHYorYlmgIC
	tHsXBfkq7uA+hj3yNxSefGnQbJkIleqJ7efa9V7khCZu6wdaP5BpwlAal5sIuc+bkNW6uYraZ8yvP
	3sI/Ui41I2AQ4/QLOVnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrI8m-001fWX-W3; Wed, 18 May 2022 11:46:57 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrI8k-001fTU-56
 for linux-mediatek@lists.infradead.org; Wed, 18 May 2022 11:46:55 +0000
Received: by mail-lj1-x22f.google.com with SMTP id m6so2216841ljb.2
 for <linux-mediatek@lists.infradead.org>; Wed, 18 May 2022 04:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EDiPOA35YpIMmzK7dsSM1qtvLUD5H06MjqcVVznfnc8=;
 b=GxUQeWpawScCuAuO/Vl1cXyxJaV+vVOfQG8DVLc0IwhvTeh0gzW3LqGLu/OYc/lqUT
 1pHPWQ2yJRopu2YLSwcgf2H3h0japAKr0Ja+1FenPLLuoct1RHN1c0kcPevjUkYoZPzE
 1cztIm1FRfcBvnuDwAmNYzde/A9OWVfDH1DdoDCFGL24YK1agIKXAEAZjYMfdPDusvZH
 3onMgofqkIQMZO8qa7EBhKHjQSYWSmwaBZ3mrP/U9qEH9POYzVeO7qTRYKN8JNRGMoQR
 qntjz1vdghAyKUekVZU98RugLY9xI2m9SNU2KfJZgPZt9zSmaozi6xaZ5iuAFP2S2Xqt
 E+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EDiPOA35YpIMmzK7dsSM1qtvLUD5H06MjqcVVznfnc8=;
 b=RlGxoqtiPZwyeuOpePyDekS3z7pGlGnguc0uOOPICNQdxR+MIfr2OyAcBVbYDFjJ+A
 7Bk/odnomMwPVjhBWialhXa/gd6MWn3RDPq2l5Gy4xElOf11wHyp7RFQSWYqG+WvcTl2
 3YNzIvdhGKUm5c8+2tsKRAHxYc25bifOQ5xQ52LtApRFAWjDLGA1mz6fSg6B4BkLS+xz
 wYpQNbdvFzucg0mZns8Msh81GFNWVaiGOGXtmGi2vdtxVxNs125K5trn2tehr6IRBI3P
 kjVFXMIuoSP3opw/QzI0wsBkLap8OcNjJNIe4fFlSY2MUh5C21JUTf5SM/T1i8mCBkc1
 OPmQ==
X-Gm-Message-State: AOAM533VyfZ+XBsJB7Qh9Nu59dWt3HVvqtW9aWpIdDvqPIB6/VavpKBd
 vMEM2pAPXnA7DLesKMzKyW5PWw==
X-Google-Smtp-Source: ABdhPJzVz5C2Bp0+KEsQVVSs0hSJ0o9YxpGpmUSFF/kiVX1ysvgaDMd7Dyc8MR2g9VB8Ei3Pgdy3ug==
X-Received: by 2002:a2e:7f17:0:b0:253:adc1:697f with SMTP id
 a23-20020a2e7f17000000b00253adc1697fmr6886566ljd.418.1652874409374; 
 Wed, 18 May 2022 04:46:49 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 c20-20020a2e6814000000b00253ccff0211sm93272lja.118.2022.05.18.04.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 04:46:48 -0700 (PDT)
Message-ID: <81dcc83b-7ef0-779e-ad2b-8d0722b48ba4@linaro.org>
Date: Wed, 18 May 2022 13:46:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/2] dt-bindings: arm: mtk-clocks: Set #clock-cells as
 required property
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 sboyd@kernel.org, chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com,
 wenst@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220518093631.25491-1-angelogioacchino.delregno@collabora.com>
 <20220518093631.25491-3-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220518093631.25491-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_044654_251403_6FC3680E 
X-CRM114-Status: UNSURE (   8.77  )
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

On 18/05/2022 11:36, AngeloGioacchino Del Regno wrote:
> This is a clock-controller binding, so it needs #clock-cells, or
> it would be of no use: add that to the list of required properties.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

These I considered as somehow fixes so I did not ask to remove the Fixes
tag, so also not squashing. It's fine, though...

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
