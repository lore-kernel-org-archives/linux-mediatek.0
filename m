Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574A6C32773
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 12:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pr7bhrt5RID2dCUgycRa3zMYdNhJ3IqbeowKhh7I+KE=; b=DDe3BbGjrnx6DsxFTKDHztChmy
	XCRTdYfVuPj7a8fHy7gMEzHaP3OSrYh8H5yUMCPqmVB7UtNefup+cdahLubFIwj99JYN+dDnL08mH
	MnG0V5stXn+YSYrM3UdJ2wEnU8EykL1KzoGWnX3xBvQzePj6SO65t2shapJ68fkgU+4+xJq+LUzyL
	ozVh8/9yJIzbTiADpQ0ut9vflb0MyxSe2C4IJYf4iSLN6z4PC96An0ldYOdLMUTKY516tf1SrXKVx
	a2zUMyOYgG/G2f1yYMMGwYDSBd6v/bkVYqcUn5fEDpnePJx8coLbxD8xZrthJ7ei0DTHFgLQDTorI
	LZPPwmkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1VG-008Kjr-1F; Fri, 19 Aug 2022 12:53:34 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1V2-008KFJ-CN
	for linux-mediatek@lists.infradead.org; Fri, 19 Aug 2022 12:53:22 +0000
Received: by mail-lf1-x131.google.com with SMTP id e15so6056655lfs.0
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Aug 2022 05:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=pr7bhrt5RID2dCUgycRa3zMYdNhJ3IqbeowKhh7I+KE=;
        b=Muww7Fp6z3TLBmnI9wgwpz5L/tNKqHY0CRDPQD4+eVh3MI8VFLnvjHvttcUtx6KqBG
         fqjFjRlicTbmv4GsPbrtBwsaOhVIYDKhwYinqaev9lkoltjVxJWUzB/gO6Az6Tnu5zB3
         8ykUvzjlBHLWIJSkHcmmM5NVviZCT8FWquVXebmXPtpC7HlPqvv0njv+EDeSet4eEhmS
         A2EVoZkbKvd36wUGpTI1uswLPcH3eTtdgalsxPkELrtxvIn4ApRWksbAT3pPdiVUVYIF
         kDEsK73osykelqrEEQNJy4qRa85LPnulZ3WHdaYgb8E9XxJGIwM4+V6v+UPjSDssu4P8
         lX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=pr7bhrt5RID2dCUgycRa3zMYdNhJ3IqbeowKhh7I+KE=;
        b=YsFuoX3oV8tNoQXmME7XQM3lKtT3K1C6SRt2L0u+U9uM4EcndEQUjKufAnBBdNfT1M
         sFB86yIAFO1mx6DFSkNdzjOZleTAyB/hTCf45xNqMqGt0DlFU3gKgWm4xyszIRIOJLZq
         X9k2Z47ML7ZAvCth23SCZlDsb/3JooAphMdxSxCKxV96XWmYQ9wDrTTppGgdUCUIhfl/
         EzbVrHz0bff5uYnSCtMvYiJVOu1LmYh3HxDjDjKUacrIHrET57JPV2+PgrcXHtM23CBp
         o/AunJWEZjb+TWW6LMqEy9GIbWAcw5EMDoKmKmons/wNUPgTxfOTGQk2Y+eSeb3I0Ex0
         GKQw==
X-Gm-Message-State: ACgBeo2oAP/v8ZtUK6du/1xO/5MsTNDUHO6hey7qEmH1A9lIjzJVpNrx
	v2H6lu3SsQpM0CrO/uMzRCd3Pg==
X-Google-Smtp-Source: AA6agR4FIHTx2lqWROLFunTvAZJFkIWDWBQqO7e+yPqb3ua4X70I0FUz5U3OFnmedTqWSw6DG45kGA==
X-Received: by 2002:a05:6512:3048:b0:48b:745:621c with SMTP id b8-20020a056512304800b0048b0745621cmr2241608lfb.620.1660913598597;
        Fri, 19 Aug 2022 05:53:18 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id e8-20020a05651236c800b00492b0d23d24sm510523lfs.247.2022.08.19.05.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 05:53:18 -0700 (PDT)
Message-ID: <e5572e77-4ba5-d8f3-4e9e-04ac5dc416fe@linaro.org>
Date: Fri, 19 Aug 2022 15:53:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dt-bindings: mfd: mediatek: Add scpsys compatible for
 mt8186
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Lee Jones <lee@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org
References: <20220819124736.21768-1-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220819124736.21768-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_055320_531553_61974736 
X-CRM114-Status: UNSURE (   7.90  )
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

On 19/08/2022 15:47, Allen-KH Cheng wrote:
> Add a new scpsys compatible for mt8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---

No DTS using it?

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

