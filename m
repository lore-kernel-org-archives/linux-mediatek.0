Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26181C636D7
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Feb 2023 11:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/DCKqOexRI3O4ht4IS85fL/oFtzuchagyfeetw+irug=; b=bWdrJbDbi6L/7l
	jOjsc631r/5yR1dHDpiqUfWxGgJ9DNpcOX+ufx5+sVWFSWdTNpm774RuE55CbV2EjXuCPVmAmyu5e
	wH76/BROYyvWhhIZlYh8H+vlmP9qCMUL/zrP/JNGKy3Rk1xOjHYAqOa2cmn46VxQ+qg9gweitgw2s
	KxMrm3B1HuOulx0Jf2KjwdJwrr4ZL5XHYUAaPQLn/HRaMDE9wBxmrJtTNQQ2d8xW1FvOOtP3Vmc8j
	DDW4UaXcZB/Th/NId/332uv/V01yaJims7ioOH4lfOWdi+KXiblA8EHI0CJuGFApxNlR79tqCM1G1
	z2yvoKmcYd/y9Ey7j/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQoHu-009L5z-SI; Sat, 11 Feb 2023 11:43:26 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQoHs-009L5C-2G
	for linux-mediatek@lists.infradead.org; Sat, 11 Feb 2023 11:43:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so5882163wms.0
        for <linux-mediatek@lists.infradead.org>; Sat, 11 Feb 2023 03:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/DCKqOexRI3O4ht4IS85fL/oFtzuchagyfeetw+irug=;
        b=WYaqol5YRHI3e0Vn3Z+9KAVjVdMHXfIg1M4GlmubP9ZgKKqhOagaxURnYhbYpYuYE0
         DcL++cqnHMnMYUCjgKPWFW2SkFCLIBxVaWOpiJ+bLrJcnbpb2wtYmTHAdOdA8aJ/+6Au
         ZcOkYrh0Gadi9V2R/zp4DOCtTBmgMJdyM8UdiPHL0VCdWJQ428DV0ajanB0wyF/kWidn
         yS6XphvKFDqq5eif7lGeKqTzOMHUZiPrVGrRNdmF+iQuy89/jNXNCMjrg2e9RVN1Ag5N
         pmNyEE/9DknCIKaeXBQGWu6DeR38EL6nsw/svb+Wb5vm3xf51figutCJEepS56bzebIf
         HUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/DCKqOexRI3O4ht4IS85fL/oFtzuchagyfeetw+irug=;
        b=iGlp6ldApsxKr+9W4r2FN7lnXwgkUe6ALIjq07+Mt9+SVeqGomOup9ndQoGyFzuYYn
         PMu2IcLa96Ttv8rWTHCQkxEl2ic6PdgyDDp3qVDnfSMkvGVBZ/HkCUHYlEeON4KZErj9
         awF+o9KpLHNihUU6Pcgrp+7sbn+X/D7QCa1zaWzjTSdacQ/82l5FUhLxmSm2ABigT+FT
         y4qn6kMGMYH4SJmCFhKY9bvU0WmJ04A2N2NQwOZsU0E/RfJjw+JO3C8RaqjtSqX4bvhJ
         fuvZneRXsK9rWZ50980L/y9uVuSMwYBQsp9UOsaPhyp5CfutNeMU0D2mKxm4n1yhBFt5
         +cYQ==
X-Gm-Message-State: AO0yUKUbE6NlgnqJxAAZoJ3Xj9VCJ+8TUNTWWChdqUhLFbuTCI4yzOYq
	91EJJp4FBQBbqb+4Z1aieLsSUw==
X-Google-Smtp-Source: AK7set8gLZFxagvPf5Ty9wYtB3SAt073izJzB3ZgZyJJvf7DyyWks7C13vpcZzOH4awrHMb0Imok3Q==
X-Received: by 2002:a05:600c:1613:b0:3dc:46e8:982 with SMTP id m19-20020a05600c161300b003dc46e80982mr14763815wmn.19.1676115802293;
        Sat, 11 Feb 2023 03:43:22 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m18-20020a7bcb92000000b003c6bbe910fdsm10954145wmi.9.2023.02.11.03.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Feb 2023 03:43:21 -0800 (PST)
Message-ID: <01dd6540-bd64-5a1a-a530-76738181d595@linaro.org>
Date: Sat, 11 Feb 2023 12:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/5] dt-bindings: arm64: dts: mediatek: Add rev5-sku2 of
 hayato
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230211002626.454844-1-nfraprado@collabora.com>
 <20230211002626.454844-2-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230211002626.454844-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_034324_145623_4B50B29C 
X-CRM114-Status: UNSURE (   6.79  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/02/2023 01:26, Nícolas F. R. A. Prado wrote:
> Add binding for newer version of Google Hayato: rev5-sku2.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


