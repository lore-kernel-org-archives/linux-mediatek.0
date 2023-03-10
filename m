Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D23C74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 08:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgYx2UGfTwFbl4TCcYTYMnoS1bTy+izVwo0DNp29p7Y=; b=lXLUC9xKtu9sknflTSjdI2XNVn
	h3l2pBi6fyQ6zMqGp1mftoYC107MaEdCKLrLIBOsKXe3hepIqDh+lDnbfRn1UrDRGZCakdY7IUxAK
	nyboZVuxcla706CmFycTAnIsaYB6lHXYErD5zkyAzoy6zyzabxL3TH9lNwdIdQW9IWDYY15hclNwp
	vtMCTupKFzIXhueH9XfXZjm0/ec+00sZl8SDNH/dq/+CYpErsU1H/CdqPDy398pQoPEskBzcoq3AZ
	sxN3pg5/kZ8uKrBkslXuOoipYt2hraLWG8Aa8HzASLIoP5XBz9UJKjgVPXpirH87oVbFHsBqQKcnF
	kXolSCgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paY8t-00DeYw-En; Fri, 10 Mar 2023 08:30:23 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paY8q-00DeW8-Bq
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 08:30:21 +0000
Received: by mail-ed1-x530.google.com with SMTP id o12so17297915edb.9
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 00:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678437016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pgYx2UGfTwFbl4TCcYTYMnoS1bTy+izVwo0DNp29p7Y=;
        b=TpPrFuhkRg6/JR1Q/Y/rDRt4vA2o3fQpjMNEWM5DXTB01lKEXzCMaA+8ZrgVRLh2Ho
         3uno5hha299c99A5JU/E578aNcGPZxfHTzqNlonTB24JKh/ywl60IEd0UNHN/gry1ahV
         YV0GV7P+7EZs7q8EWpXYNeZ0qpA+bfiRs2KOYOKZ2IX7NlqEN77jRaDRyz8cvVkZIiG0
         n+Oo+9lVq1yAhVEQx7Lly2BsHet0I7xPBgIp1BTm0h0nipYqXMb0qj0lcY/xki+hycCy
         I5573tGgDw36aCo3RAb3jBjfja67SdE4hq3mBJzptM79GvBQdXWYfrRqC6dtdolRNSfh
         /sIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678437016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pgYx2UGfTwFbl4TCcYTYMnoS1bTy+izVwo0DNp29p7Y=;
        b=WaJ07By/VEZKo30Df7yt/f1vKYeJSDyOBQ3SyC3wIcV1KagiVis5dEdot2QziUkjWu
         mADs/nQX5Y/uWKEUik9pYEpFG1EjEe3E/fXZmLRsbu8pjW0COr7pylb5+G5yG6s44GAM
         bGa/GWHDYvD8RAXu1ClhEY5KaX7DYBlyFUoaXPoCX3z0fYSd3M5MVZCAZlsX9uOYTsFN
         Fm2Ln/pWKpn6uj6mAWwlmZUhvzB6pXtTrrXbR+gawGFjkUhOWFlS9oOFhHYvXXn6Bk+/
         PQTgn84xXvt2G0vDf2hFn0w4j89wpkCnLDDkxSI+35Nu02nYpzwv8t/UfPYJluVq/tD1
         gCag==
X-Gm-Message-State: AO0yUKVyjiI0Lhd7CAdnbZ+OHa9VxalyDUCrBBVa5p6cV5swMnhCgnUm
	PAdxA0md7MC6B4Ik0bVzlPFqtQ==
X-Google-Smtp-Source: AK7set8NOZrDKPAzmWgYGJhsw3eZjf+xuOWPeEVf+UIyE+dOuruW3yvUgVjy69Ef6oDeGn0Dx/0UAQ==
X-Received: by 2002:a17:907:1b1e:b0:8b2:8876:2a11 with SMTP id mp30-20020a1709071b1e00b008b288762a11mr1066346ejc.28.1678437016554;
        Fri, 10 Mar 2023 00:30:16 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974? ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
        by smtp.gmail.com with ESMTPSA id k7-20020a1709062a4700b008e385438c76sm676728eje.55.2023.03.10.00.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 00:30:16 -0800 (PST)
Message-ID: <86e0ee78-bc39-3dea-ca8a-7270362a71c2@linaro.org>
Date: Fri, 10 Mar 2023 09:30:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 01/18] dt-bindings: watchdog: mediatek,mtk-wdt: add
 mt8365
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Guenter Roeck <linux@roeck-us.net>,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 devicetree@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
 <20230203-evk-board-support-v2-1-6ec7cdb10ccf@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230203-evk-board-support-v2-1-6ec7cdb10ccf@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_003020_441691_CF81BD03 
X-CRM114-Status: UNSURE (   7.38  )
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

On 07/03/2023 14:17, Alexandre Mergnat wrote:
> Add binding description for mediatek,mt8365-wdt
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


