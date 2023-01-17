Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6C1C3DA78
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 11:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcsXRu4v4Y+Ep4I0A49mvEOyXRqnaq/f1PWoI6xqQUE=; b=CNiS8CzmbcBobciOt37askJXAW
	bybFJj6svPeyOBPzTylrSfGArhx5wcRRUv8MNbbB7QncwrqDBXJTEyQxxB2DOaRTMfT9R8KeQxq94
	UPBZ3Vjk4n2vRITlV5K/nD1iGgWPKTJ+FjniNbRJF7dK/Sqvus/buukdSt2RarIyWaiwmwItQ3Msn
	y6fK3/75wXBHDLCmTsIY0i6cOur04tYaSN4B/m5pzLrl68XWZkIm8KVRjix1r5jqxwbORbNX2sjeB
	LYy7uab5gAYUzFq113UfPpoM01Az+bGypDYmFywQOzNCAsxaKbC2OxMCbDfLLyB4f/7NehRSgEOjs
	FRyym5Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHjrn-00Dx7N-DN; Tue, 17 Jan 2023 11:10:59 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHjrk-00Dx6V-JI
	for linux-mediatek@lists.infradead.org; Tue, 17 Jan 2023 11:10:57 +0000
Received: by mail-wm1-x331.google.com with SMTP id k16so1296342wms.2
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Jan 2023 03:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UcsXRu4v4Y+Ep4I0A49mvEOyXRqnaq/f1PWoI6xqQUE=;
        b=m6p1wGOnKJEDfkSA93hpergNA4e9NcWzqucHS531moH+87fERdNK56Ad1XCdBBqI/c
         oc3TV7PAlAhAzPbRIgRIkOwl+yW+L/z/t1+bbAlTO9H5u6TiKe7mwGMIGef31A398tGM
         R9j2j38lkdH4j99fwg/JWJpnPkepR2E9CSWcTGog9Ma7fO/GIuGliJyToAM0xVD9cqYN
         WYUBDt1axj9uyQFbrRTV+AWE339r6lJiuRgaZZ8bZuo+U7L+KeDIcg7DZPBN6hawzjqv
         oDoNZh7ypBYATwX9c+RfKmQ6LS8NqLUC744tjBfY88w9oYwLWLm2eAQudiKrXtqcTC2H
         sPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UcsXRu4v4Y+Ep4I0A49mvEOyXRqnaq/f1PWoI6xqQUE=;
        b=FWnKbKanZECFL/aKWSw1TXNuPytCYLA6x5Lw4cpG6hfOOjyFUrF0xuYXhhBkxB1UGE
         BS/NEusOUR5dwIUAVqqIz5SA8o2cK3D5wFodacMKWVOO+LM2pqS5qOyC+d5p6Y0RB+nh
         5GhmfkSqhR77/TygGZU3LFEjdjmn2YalXkQyI1xiYLzl80gX62l4Ipa3JBslJhxZdbQ0
         ha3NuvLx3KyW/ynQPv/HF+Wvvmw4Ew1TECe3gXCu3cpqOSgU8moUhNwlLeipO3zixORr
         /9kPGfBt75Icx4N1VWpMoUZhbsqW+Xgk3KRqlEsmccn/ncopWMs8m7Xn5m0XQ1MxC8ka
         V7sg==
X-Gm-Message-State: AFqh2krGbYo6iLFyEZnQlsayW6EbK1Qm71EW3BJr1WM//VpvX7ucNPm5
	Xk9W93eUJPRl+EVIa/DsmtvOgg==
X-Google-Smtp-Source: AMrXdXs5sqtStasZ70vT/y/3ZTdwSxJRFyq2ZIub+y2aoLJDZqkTDXaBvoYOfrS9eUJjmLN3LwETew==
X-Received: by 2002:a7b:c5cb:0:b0:3d3:4f99:bb32 with SMTP id n11-20020a7bc5cb000000b003d34f99bb32mr2539161wmk.36.1673953854842;
        Tue, 17 Jan 2023 03:10:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n19-20020a05600c4f9300b003db08be84e3sm1620011wmq.32.2023.01.17.03.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 03:10:54 -0800 (PST)
Message-ID: <3fea483a-2d33-e870-0dc0-f4073abff23a@linaro.org>
Date: Tue, 17 Jan 2023 12:10:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/2] dt-bindings: watchdog: mtk-wdt: Add
 reset-by-toprgu support
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-watchdog@vger.kernel.org
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230117014023.2993-1-allen-kh.cheng@mediatek.com>
 <20230117014023.2993-2-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230117014023.2993-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_031056_676801_6C2402C8 
X-CRM114-Status: UNSURE (   8.57  )
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

On 17/01/2023 02:40, Allen-KH Cheng wrote:
> In some applications, the mtk-wdt requires the TOPRGU (Top Reset
> Generation Unit) to reset timer after system resets. Add optional
> mediatek,reset-by-toprgu property to enable it.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


