Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F522C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 16:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3GRCujY2fAX+k+XJzaZ2/t/vuB/DeUSEDa+GNTMfusQ=; b=3kFTC7YO4ifUvyRSiu5RtSM/oT
	ydYtBELtn507l6t//kd3Pt9IaKVtdui6EasFGPgfErBx/hLJRegiV+emmvt0f24C+RLpz1ksVcjrE
	Gv4pbWtCIRpWn2SC/qipMvS8ZA8CI/ixcA54Q6gsSYuaskYt1ugHnbRke95Qu49JZxGkC4RfBCUxW
	CYzgyN+F7OWlZ5oSRJsWhwDh6aQy0UNHNIGNEGoJDh0Z/jDH96ErNY2jSFFOoMUk6APh1+Rnns65m
	nVAUA3lkHFZ2PxvBjen5tM0y1UHSjNandemxUObDc/oIGEnmugaGYrklBUd+dAD/7tUFzxnpnA8uf
	hEJXnXKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p03PC-00A5P8-Vv; Tue, 29 Nov 2022 16:24:23 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p03P9-00A5Lu-JM
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 16:24:21 +0000
Received: by mail-wm1-x333.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso11217489wmp.5
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Nov 2022 08:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GRCujY2fAX+k+XJzaZ2/t/vuB/DeUSEDa+GNTMfusQ=;
        b=1eaHXzpwyfP0Xm9D0dKf3bkMGVH7/RDX8y6pi0wi5VI9JnC7f+wXmOqzSkOVJlYUyn
         2PIGzbHvMMRDvA1hqyFKhjy3kakuJy1ftnKZhI+gO8CnA2+S3yM3DAcACE+bAosP0+gE
         n/LYTU2ououqsTNoyItyMUnEiUXCL540Qgf0ZXU57bdLrB42ZfaKRAgEmA7V4op25LQQ
         5w4//RTlRU+L3hIlmfHCgUmeNJdDJFEuIFBAEhN2/KdtsOXr2AF+GFFZnHe0wdn8JC8E
         vToQIGhEFn5w13btdt01kqjcC65N6r1N4RzTicYqMUtE4JHRWAAAibm95fEgv01kywRJ
         1sEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3GRCujY2fAX+k+XJzaZ2/t/vuB/DeUSEDa+GNTMfusQ=;
        b=F/NO1Om6GvZNGmvN9yzVf+Ej/NeaKUAUxFN6S+ZwK+sSkEoY3V5UlRFrgn3k+NRJd7
         OFkJ+VjmAdZKF2/fLkR9JibR5Wl8S5WGXnuQ6MWB3+bCeh9rOKxOuJlCkgH+Ji+04AxH
         +glNPaS73bOBD2wSWTOQ8TItaiy3eE1t011PnCuZvwU7/T6K4EYF4g1eG/imvxu7NFbW
         fiIMZERWWvp84XGz7GrR0Xi/Bb/U54ffYEZlgXD6fiRuLBti9kxVfWmyU3epI3ENHkWN
         ZGel/fdpi46Pj+wNVfBYrwNTx/Ey1bTiXJAycH8SmC/2gpqS2Quq2JsW/cL6KsXoNuPp
         qCCg==
X-Gm-Message-State: ANoB5pnxmy0RznyExyuMMP4bqS5hr6MIMB1jtrS2ZdTEKbdLzohJ9fq4
	pALBlfB4OPXVZJdP7f6teVbENA==
X-Google-Smtp-Source: AA0mqf6WH15ucpt9mj1yfuOJMrgVZJ8iDUK+OVWRFbLh+62MS79+TdGJJYsFeGLXckdY8erRt2KZwg==
X-Received: by 2002:a05:600c:4b17:b0:3cf:8b22:b567 with SMTP id i23-20020a05600c4b1700b003cf8b22b567mr27612720wmp.144.1669739055891;
        Tue, 29 Nov 2022 08:24:15 -0800 (PST)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id g3-20020adffc83000000b0024207ed4ce0sm11185741wrr.58.2022.11.29.08.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 08:24:15 -0800 (PST)
Message-ID: <8bd55bfc-009e-5357-d616-8f10196e25a4@baylibre.com>
Date: Tue, 29 Nov 2022 17:24:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 krzysztof.kozlowski@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, maz@kernel.org, robh+dt@kernel.org,
 tglx@linutronix.de, youlin.pei@mediatek.com
References: <20221128092217.36552-2-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: interrupt-controller: mediatek,cirq:
 Migrate to dt schema
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20221128092217.36552-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_082419_679109_0B4ABFF4 
X-CRM114-Status: UNSURE (   9.37  )
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

On 28/11/2022 10:22, AngeloGioacchino Del Regno wrote:> Migrate 
mediatek,cirq.txt to dt schema as mediatek,mtk-cirq.yaml.
 > While at it, I've also fixed some typos that were present in the
 > original txt binding, as it was suggesting that the compatible
 > string would have "mediatek,cirq" as compatible but, in reality,
 > that's supposed to be "mediatek,mtk-cirq" instead.
 >
 > Little rewording on property descriptions also happened for
 > them to be more concise.
 >
 > Signed-off-by: AngeloGioacchino Del Regno 
<angelogioacchino.delregno@collabora.com>
 > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 > ---

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>


