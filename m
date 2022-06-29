Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F19C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 11:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QCnND+Ihr0E4grOsKhhsVTMtV8dOmEKSL8p2O7AW2mo=; b=F5wdeayqdnVb3yqdFb4RhBuSz4
	NyDi3C+tKyllBuNqu2PuMO6cuGdl/8xBGr7U7hmibYteCbMbLI0T5c0L1rvPj57uOdnJUZkQmBQ93
	7eQi9xE+DsOMazHE2zgYS7y4V0OaoZQJCdWwfYGziRfURfs9SpcbTyVVs3RXw4mU8mlCSgwRqit7f
	CxYYW7mmQ7Tu3KfIL2H3LoJMttwIeU6uO51wze8vwCTzaCsrsxOJB1Ys0CpGX5Ap0fnkQQ2STqLZC
	NT+lRJeQ/znDz4ctR4b5LGZYLCeLT8UtP1ynAMrOsveJWg8vG1+eInWF2TyaLv+BRCUhZbdJUgG5h
	ivSKpNiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6VaO-00BHqR-0z; Wed, 29 Jun 2022 11:10:20 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6VGQ-00B9L3-Pc
	for linux-mediatek@lists.infradead.org; Wed, 29 Jun 2022 10:49:44 +0000
Received: by mail-ed1-x52d.google.com with SMTP id n8so7644686eda.0
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Jun 2022 03:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QCnND+Ihr0E4grOsKhhsVTMtV8dOmEKSL8p2O7AW2mo=;
        b=yNq8IvCL5Dg51Uk7RRycS5nTQ1ufinsu06YZxbJrtwMe2AdvrQ8y2tWiPzSnzQDxJt
         g6JYm2ol8XeEKknqc5daQfBgei7nO5Rzo+vxg07UEgvs3x6ZAv/6N/Kc2ez2Ut9ah4yX
         25qAwKWwtCYvUkkhMVtHu1U3apXjGaBVplRwyx49+bv0uh8zhQRjKwsVlDpcJnAIuiIi
         P7nX40urc34Noz/c7SArlRjxDpAnsbiJA4gJBJ2bF0BmsojoVIghTJjTtWmIBIvFOx2Y
         3OUgAeAQaYSi9d3tkhF0AN6+nteGOdUB3hGv1LeMIx/XZJty7ZDLCcZQCBsco7/5eX8Q
         Cylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QCnND+Ihr0E4grOsKhhsVTMtV8dOmEKSL8p2O7AW2mo=;
        b=X7epNSt6TsrhvylIkwBaV7ErXJBz4eRkDGxiipNJ8S513XaGQtO/YPLV1VSSbllBvl
         unWu1dqfC+YM97iCyNC438a/jaGCLfF0Jgc9D59e+qG5xLIoq1jKloWpqcPZ35AjKHar
         HoKc+mGrSNcfqozwXMr6ZlZfDeNo29KVaUag+VCJ8Eg0i6dscd5dIGxJ9pQUiuUvGixM
         iBn5y06zev5hHmAK+76VQJfkb6eIjMq5anbjuAi8srTP6ptix3xZkUFpsQeHG6z1+4vJ
         W75POW5OQkw3O3wueh6CM9NdI7dgZ/VmTLOVC8WJUqHrMBIrJy38hPN6HJBGxGqzPdem
         L/BQ==
X-Gm-Message-State: AJIora8iDlNJ83vsg7LiX6VAVa2yxDWA8dTxY1ExgOZ9k0YivMbW3VRy
	TVsEm+Orauq9IBNC/JeB4HDBow==
X-Google-Smtp-Source: AGRyM1vPhtigeGlEU1LfGq5MzvjkEe9jkqsKuNcP6bcK5KLfAijl6m0zJULiQcNe8NSdk7w+UspYZg==
X-Received: by 2002:a05:6402:d05:b0:425:b7ab:776e with SMTP id eb5-20020a0564020d0500b00425b7ab776emr3460224edb.142.1656499780597;
        Wed, 29 Jun 2022 03:49:40 -0700 (PDT)
Received: from [192.168.0.184] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s16-20020a170906455000b00722bc0aa9e3sm1300091ejq.162.2022.06.29.03.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 03:49:40 -0700 (PDT)
Message-ID: <75bc2de0-1965-ed64-7313-ccf9a88a64c2@linaro.org>
Date: Wed, 29 Jun 2022 12:49:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 2/7] dt-bindings: clock: Add MediaTek Helio X10 MT6795
 clock bindings
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 y.oudjana@protonmail.com, jason-jh.lin@mediatek.com, ck.hu@mediatek.com,
 fparent@baylibre.com, rex-bc.chen@mediatek.com, tinghan.shen@mediatek.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, ikjn@chromium.org,
 miles.chen@mediatek.com, sam.shih@mediatek.com, wenst@chromium.org,
 bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com, Rob Herring <robh@kernel.org>
References: <20220627085632.23797-1-angelogioacchino.delregno@collabora.com>
 <20220627085632.23797-3-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220627085632.23797-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_034942_884563_41F40BBB 
X-CRM114-Status: UNSURE (   9.71  )
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

On 27/06/2022 10:56, AngeloGioacchino Del Regno wrote:
> Add the bindings for MT6795's clock controller.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  include/dt-bindings/clock/mt6795-clk.h | 275 +++++++++++++++++++++++++
>  1 file changed, 275 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mt6795-clk.h

The same as v3 - you still need vendor prefix.

Best regards,
Krzysztof

