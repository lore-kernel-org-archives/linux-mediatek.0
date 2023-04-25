Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044C8C77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 11:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yI1TPR9O8Wn13PLfmt3B7Vg1j2zRFGIPi65gxOuaq/Y=; b=4LGp49U4NVVbbsdCYOcp1T41Mi
	T7p3FO6rrH4v18EYBR62INm/M9N9RkfWGQK0/JJzErfh25Vd4OhtYdLyWKTEsegBJxfn5tjqVmoqY
	AtN07q5rr4SbnT/0wws2ATEVarEJTyxbxGT1LEmonctfNwIn1UwZZpNGheDSNlmxMISKe45gZy7G0
	6bB2LKQHjXR/V9sHyCJMtUSv+DG4fSjrI57X8aJXBKhWD7TTaMY6T7Katkki/uZ6Jo9BfAPO2HgBo
	FK3Tk4kpETlv2oCQCEhhobxNKh/LEcvHhEDLdwhF8aTEoBOPBqCapx8cfVwSVCge4ndrF16jsdRLb
	pCuUwIxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prHFi-0010fN-1V;
	Tue, 25 Apr 2023 11:54:34 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prHFf-0010dL-04
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 11:54:32 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-2fa47de5b04so5448722f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Apr 2023 04:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682423668; x=1685015668;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yI1TPR9O8Wn13PLfmt3B7Vg1j2zRFGIPi65gxOuaq/Y=;
        b=3nlr/BU9pJfmnVhoKeKK1Gca00UCWqM4C1wadITfww0QPAIukFk5VSU9ouJ9F1CVcb
         cqXl4mjge8YEnco5+X7metyV9AOpF/xXwLNFLWlttnMOl+nk5GZybJObRoXvBDQnfkPc
         2pLOv3wma4WagQCIEjUBhibYZyV57MbSX8ZU/CcfCOTXaaXv3Hd6SwD+s/EAN1pD9fi2
         b8pAlkxoBoxWjyPA9PoRxtPJfYVSx5x1VshuKq2LNMZtJY3S9wAYJiZ2k6Ok2NhV7j6i
         sgM/M+AOKle0zyLGDLo2uDjL1io4JogdtEP7vpoZ+j8Dsa3VxrOStICnoS5cxHZnN+Tg
         VNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682423668; x=1685015668;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yI1TPR9O8Wn13PLfmt3B7Vg1j2zRFGIPi65gxOuaq/Y=;
        b=NqF0yjxflyraWvuYy1G8/W4S07+fszcoS3JeB7eLJJCwaQdRQxp7SRIOmlhYexKe5S
         N7qrJe8p7oL+GqnOm2pH31w0EP77enES6mVqgKabjr70F8SsO0tOkjiu/Hnqiee/5U+i
         60mYOgEy2CjYR3Ni3RRuBQ/3PimJUlJVXV6sHUgmfliM3CEXNNFTCoTQBP2AF7tw2FEm
         rRkscDxB8mgZ9pDCD+Wk4cT4+fT+H8jbfKP1W0rKNGdrBYWgpBrf7gCruy5pzDDiQZfx
         SVvpprdJHKlc0fyWYZPlm4MwPDFTyrWPuMeOoFuZNA9BVLasq3VEDe6DirppC6DQGbMD
         fRpA==
X-Gm-Message-State: AAQBX9f4bMjhmeY8JDCWelhg048e+wcrioVEczydiWHLOImKMvySGZdU
	o1jo/JgfrCGW8W7MZnhuvzyeXw==
X-Google-Smtp-Source: AKy350YCwqDUNA8w+A+W4tuYIK6NweEAGlyiUZKepVtxB1ipt8FUsK3pDf48E+Y+4hASBI4VwAmAJw==
X-Received: by 2002:adf:e4d2:0:b0:2f2:7a0e:5cc9 with SMTP id v18-20020adfe4d2000000b002f27a0e5cc9mr12124465wrm.19.1682423668174;
        Tue, 25 Apr 2023 04:54:28 -0700 (PDT)
Received: from [10.101.1.6] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id t12-20020a5d460c000000b002f6962ee703sm12948252wrq.61.2023.04.25.04.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 04:54:27 -0700 (PDT)
Message-ID: <202f71ef-5e95-9fef-bac6-18ab8d0c4fe3@baylibre.com>
Date: Tue, 25 Apr 2023 13:54:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ARM: dts: en7523: add missing cache properties
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230423150824.118430-1-krzysztof.kozlowski@linaro.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230423150824.118430-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_045431_059482_9D187741 
X-CRM114-Status: UNSURE (   8.41  )
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

On 23/04/2023 17:08, Krzysztof Kozlowski wrote:
> As all level 2 and level 3 caches are unified, add required
> cache-unified and cache-level properties to fix warnings like:
> 
>    en7523-evb.dtb: l2-cache0: 'cache-level' is a required property
>    en7523-evb.dtb: l2-cache0: 'cache-unified' is a required property
> 
> Signed-off-by: Krzysztof Kozlowski<krzysztof.kozlowski@linaro.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Regards,
Alexandre


