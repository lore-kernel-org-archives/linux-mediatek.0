Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61B7C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 08:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJJG9l0YlRpzRi2ic2wvRcjJj5ylm1zWwiArlHuQKB4=; b=GPZp7zL3Ou6YiQN4q7w9LdKrZ5
	2Q86SHburUzv2UGdsgiMKwVraQhphnXuZ3plIi7CdRS5sxAr3fE8SwVtgGOULIPdzodshjox1x0b8
	mxftR4K3dDVqfm9gTMWmFa4gq4LTqs6FTVJe83k2DdBC2eq+ShaGWcp08FX5Xpi+OgGTV/pPXNUPg
	5mo3WTpe7ae6S9p7nu8qDlRrYhszfegppmx/mCVHOl2xsl/OZn7KtrNI9F5oPDuJBo53zCbLa4waZ
	2nCZ5g7z/s0VmApp/nN92qPhJfcEjB2V0bTVu2RcFiFhrjZVZ96uP+S+VthzG413fC+m8cG3Cuf1D
	HL3tDhKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox1j7-00ApNn-OR; Mon, 21 Nov 2022 08:00:25 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox1io-00Ap2n-Bj
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 08:00:07 +0000
Received: by mail-wm1-x32f.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso10093749wmb.0
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Nov 2022 00:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SJJG9l0YlRpzRi2ic2wvRcjJj5ylm1zWwiArlHuQKB4=;
        b=oE18FL5VHgWbAyFFPmov6vtUa2bJMuC11GB5JkjqW5Jbxj5zElsvEwPG3/jfgpGril
         sU765Y44rdBYa/ZdV8iEWAjAlOTGJDjgJU6ETrgQN2FtXa8d0aNNxrSgP9aKzK/WON32
         SXYO4NvV9d+EIy/sRuP12o5/8uFIe3JL+ymGBB1Th+Wb2I6tktZ4iL9ZjNlE/ZWywjnJ
         5Nzel8/OpcJfUehfvc4608imKFJPHvlhGvINes/oG3ffGDfsQyzinHw3EgKcpc+V0pUX
         JfpokARIyT7U4VLHXyBIJWl2E95Tt06WUUNhJkvOwlWkyGOMwobjegTRC5ZzwYBotfI5
         XceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SJJG9l0YlRpzRi2ic2wvRcjJj5ylm1zWwiArlHuQKB4=;
        b=KXtplujW46qNn0tghKM6UJ1O89bGsJiZ+1eVEQA+F7M6TLIHVEUOd3Wm11zmVXKj4z
         mQAOCEF5QePeybWE9a5K5sEcY2D/JYcYveEDDPsckgcsTLGsOb9vHQ+BYFEg0H6PIFsZ
         1uokmyKDLNLTV9d9ssGDKtqhmrieVA1aWbGrGRmUdTIgRjbBWAzzoqUuHdnUJSCJD9kA
         nkQzr0opE4obh/dobe9bhggy8SyQilOdzVYmMD/6Yt5vNMlL2VKtqi1JgpRD3gEA0v7m
         5j+ZLkYR1dxPo2vkbE4q15t94GBKl/LMI9fRpFSRcZIvzgoRRDGfOy6JzxXBtJfzLXDU
         8wig==
X-Gm-Message-State: ANoB5pnAoQDmJed9O06+5fhcBCMqFdQyg6tVcfur6OpmmCQRrZOJHUvz
	YEs5PmP9/OafSXOEdfeV3o7X7g==
X-Google-Smtp-Source: AA0mqf5VMxacEh78UTA0ugozKyhHLdY0czdV10scTdiqL1kFIrv/uHrklnqc9O5/QBvdoMRdoDoQlQ==
X-Received: by 2002:a05:600c:21c6:b0:3c7:19a6:8146 with SMTP id x6-20020a05600c21c600b003c719a68146mr11903688wmj.158.1669017602975;
        Mon, 21 Nov 2022 00:00:02 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y8-20020adfee08000000b0024194bba380sm10448991wrn.22.2022.11.21.00.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:00:02 -0800 (PST)
Message-ID: <8afd5100-9cef-50bd-2b53-e1a550973835@linaro.org>
Date: Mon, 21 Nov 2022 09:00:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/9] dt-bindings: pinctrl: mediatek,mt65xx: Make
 pins-are-numbered optional
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, khilman@baylibre.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 matthias.bgg@gmail.com
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-4-bero@baylibre.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221121015451.2471196-4-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_000006_487171_BED3B667 
X-CRM114-Status: UNSURE (   5.15  )
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

On 21/11/2022 02:54, Bernhard Rosenkränzer wrote:
> Don't list the pins-are-numbered property as required
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> ---

And how about making them deprecated? (deprecated: true)

Best regards,
Krzysztof


