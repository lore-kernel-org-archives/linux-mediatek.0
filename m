Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6C1C54E94
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 15:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jz1yQJDh82hmVQElGHGWfr/ouKY/iJoAmFgYkVIjURw=; b=U/8n3dVTWVAYYEfmXRC6OSlOOo
	KFX1W2e954xCpclLTdCmC+si9h6Tjc3yPDXo/TKRUAnaIVwy77gyuF8AUajwDPh08SHaoGoel831B
	aBXjwxmfj+e/6vQICh3jYy+0M9YFrJCQN9bchuE9GgUwHzipYBjT+w5GZ926Pjhbn3bTJuHG3tbsk
	rX91CgjVlJqNyzBOfIl0Xy2qNIccWJjRSXmXh2n1L0s1rXAy0yH+cBs48OZjWRl9m2sOU2Q7mSY9Q
	p7EvRz/dhyIa3FzKYaShv3hLKvL7wXNDpZRavcMoLzmWyatwcWqqO4OMKF0WLcZyl+CAr1YjGhL78
	GA9b1FoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4Eb-00BXMv-5g; Thu, 26 Jan 2023 15:32:17 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4EW-00BXJ7-Us
	for linux-mediatek@lists.infradead.org; Thu, 26 Jan 2023 15:32:14 +0000
Received: by mail-wr1-x42d.google.com with SMTP id q10so2165572wrm.4
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Jan 2023 07:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jz1yQJDh82hmVQElGHGWfr/ouKY/iJoAmFgYkVIjURw=;
        b=CWVyglyvdNmFmSjrgGGDhJJYrYauQdQgibOI4/kl+7D0kO8kyPjUmNAkXIfPCdC7Vj
         V80wClnbqrY2beIlkLJ1Vh9QH7V37IgvU0gt34DovVqXLzqm4T6tHoonZs99RCm84zFI
         iJdqw2n16VUyp0dg4ssV6te4UhHXJ5ba4uFJWsAdmziiP5xQ1zhefta8prLOgdyXE8SV
         B7IDYFUur1cKxGe942GwHb0s7sLwII/KYl30pKzd+mNGATpMktX8GNdsCmpFugYegLmt
         asYOdz3+UCsQ4UioAbl3B8S37n3ErYOHlrK7a1QmY0HUEicJiFBWxVYOfoZoylh+ytre
         CMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jz1yQJDh82hmVQElGHGWfr/ouKY/iJoAmFgYkVIjURw=;
        b=xV2VhaWVMeFjq+r9o1u50MYKHeFRYYKp65MMZp5HCyWNzBSSqADTdwxSX/VU1HEvmd
         /vm5bMsgBAZAhTilBkNfqn1zIez+ije7rdrZ6V8SuifeHrF9pUF00W0D0LkkXyngozXp
         cScG4um3k28OADzabu2/nzNE0pwxdizGSMG5sLYMbZjNm3Jz8amDEsxppCCKsYndR5zi
         HxXw4k6hG16f71S7Z6LoYtUPXTZj4RBR5fibkY+eXdmMqHTCqMt7FsPq1+lma91FAy7w
         im2KNoUXyf6NbANt8js6W/HaV7d+CiubI/eC00fCxveeENKYxIpzTDG8d2aztNd7flvb
         2WDQ==
X-Gm-Message-State: AFqh2kouyoQQM6fQTvODIgtbdo0ZvAEhNO15+Xzxpq4eX4/oRF7VwdBl
	UQRRG9RqgXZcdOqgowyPiSfwug==
X-Google-Smtp-Source: AMrXdXvbHP4MU8LW1+p6+/QnuhuohmSQZLuwW60JkdlaAcbwU5Y7GEyF4W4xaywzdk2WMdog6QND6Q==
X-Received: by 2002:a05:6000:1e18:b0:2bd:d782:c2c1 with SMTP id bj24-20020a0560001e1800b002bdd782c2c1mr35767974wrb.24.1674747129636;
        Thu, 26 Jan 2023 07:32:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d598f000000b002bdff778d87sm1865447wri.34.2023.01.26.07.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 07:32:09 -0800 (PST)
Message-ID: <67279d92-7a46-8a55-34d1-03d10369d8f5@linaro.org>
Date: Thu, 26 Jan 2023 16:32:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 2/6] dt-bindings: clock: mediatek,mt8186-fhctl: Support
 MT6795, MT8173/92/95
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sboyd@kernel.org
Cc: mturquette@baylibre.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 edward-jw.yang@mediatek.com, johnson.wang@mediatek.com, wenst@chromium.org,
 miles.chen@mediatek.com, chun-jie.chen@mediatek.com,
 rex-bc.chen@mediatek.com, jose.exposito89@gmail.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20230126085321.87267-1-angelogioacchino.delregno@collabora.com>
 <20230126085321.87267-3-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126085321.87267-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_073213_101861_32A5DD82 
X-CRM114-Status: UNSURE (   6.68  )
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

On 26/01/2023 09:53, AngeloGioacchino Del Regno wrote:
> MT6795, MT8173, MT8192 and MT8195 support Frequency Hopping: add the
> compatibles for them.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


