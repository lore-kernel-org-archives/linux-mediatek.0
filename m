Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653C4C28D13
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 18:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKGa/93jv8vRuTqUkBTBsQvFVYJ8TTSkk4qvfaQoCyY=; b=pZQNXZyHLCWEkj+e1wPqW9TT+F
	eplpy5ZIKXhVn/g+gJZ+wBlMgQlaQK7MreJ4h91PG/kUntMvuwfP7eUyaGChwBA/aDXnhrcL+Xz/J
	RIZUSsMTXsUhwFqp8Gqo/rVFf6fibYePRdqxkdfj+4+yx8MVmxuDFWXUDPqIr+M+OTW1T6veZe0TN
	uf2E4FEYSeeSFpRXMr9IOXF3bEXUWyWAiVcymEs+YMmhnZcy74JL8TNZAtAZoiSEzS0zKETcX7LI3
	V2PbRQiYOSOfRTAif3fS9UZmylUS4uwHNRQ5x5lOBXLvH+aOI3xEmpz5lEvlT+69xpok88JLpj+qa
	XEBWCbqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQBwU-00DRMz-8y; Mon, 22 Aug 2022 18:14:30 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQBvz-00DR5X-Dc
	for linux-mediatek@lists.infradead.org; Mon, 22 Aug 2022 18:14:01 +0000
Received: by mail-lj1-x229.google.com with SMTP id n24so9356466ljc.13
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Aug 2022 11:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=RKGa/93jv8vRuTqUkBTBsQvFVYJ8TTSkk4qvfaQoCyY=;
        b=tLdDoekyZtdbOPHPiIB1p2uZilGLo26UxY/M7NQlAUMFQqouvgUEStKMxggLWzEQtg
         iN+h+uP0W1/3x3uca+bWymLuZC0wR9zfb9gRh9CqD//IuQjxr1NctRRw7IfMYjqqOd+8
         nHcQbaARqJ58cUFJd6yMSv69A3PNaptBZK0gaKkbqeq1C/J47harz04KpTeF0nwi9DjM
         ROKfKl69mzVua3O0QxS4FhI5d24puShqGDcLF+Tqm9YUHuEDXypRsMEa9BexjxxCBYxt
         3wMBBgLgewh2bJDedY/74s1A9AA+RzDCZb5TNlarefo5QXuTZbLqsAJ6spuTxgcVR0uM
         Frvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=RKGa/93jv8vRuTqUkBTBsQvFVYJ8TTSkk4qvfaQoCyY=;
        b=Upm052Z/fm8yuTse5PO0trEmLd9J8Tf0dVkaoQwkrrzfBtq36RynUe7kJKRymE2POi
         IyxeeAhDliYEiM19z8j7gfzPaSeanvsQQzknnbdYu+Anj4yoUc6+Ns+3L8oto58JiMWs
         CZXDln/LscbGYboN9r4g7eHsvlXEOqSVdvt8nyJCqSmhUeHZw7s1LcM4KhS/JF+0Axxv
         i2RSbBZfL2am9N8/43hXEECvGda2B/Psed/CkYc7dtXG2w6NRn+M+c1+V7WVZj1igpAp
         27xGdGcklSxcX0AOJCfo5ue1ZPMmmoS3OM2sDyem9/lR2J+qKqUn3vtG4DNIAGn/6UKa
         KKCQ==
X-Gm-Message-State: ACgBeo0mrlwNINqKO5xdpzzG2RECEOSg4B+fUSZIbnO35gtCLUC9+5uB
	GjHc1zZQSoulURmK4IaW5ZFZ9g==
X-Google-Smtp-Source: AA6agR6MlGpvLg8FhkrjwsXOIigDZI1dtvyw6m4NpOgPHSGxa789MKlZIW/4bisbOaOSKt/IE7Jlaw==
X-Received: by 2002:a2e:2c1a:0:b0:261:c18b:5fd5 with SMTP id s26-20020a2e2c1a000000b00261c18b5fd5mr4304603ljs.30.1661192036518;
        Mon, 22 Aug 2022 11:13:56 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id 27-20020ac25f5b000000b00492dd8e0cb1sm899044lfz.22.2022.08.22.11.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 11:13:55 -0700 (PDT)
Message-ID: <5b4cedae-ea50-a964-1811-fb5c7daafa41@linaro.org>
Date: Mon, 22 Aug 2022 21:13:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/4] dt-bindings: power: Add MT8365 power domains
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
References: <20220822144303.3438467-1-msp@baylibre.com>
 <20220822144303.3438467-2-msp@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220822144303.3438467-2-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_111359_522983_F3522CBB 
X-CRM114-Status: UNSURE (   7.04  )
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

On 22/08/2022 17:43, Markus Schneider-Pargmann wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add power domains dt-bindings for MT8365.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

