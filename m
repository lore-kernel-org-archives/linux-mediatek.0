Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BF2C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 23:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZYFg5kiVhld2lAiBUaa0ABgAdKIA/3yLwoH/l48Ndg=; b=fRwzrW960KR2M3bWDZJOSZ6NvY
	HVGzkZ7+aRtDKYc4bvVcEzXxXYnsMgNlhWwOI4NcC5sDMyokfHhkpNXJVuca9d7egfw7J7DuO9T42
	29g6J05H3gcqjIgCwZes2+6kQYCaZlffu1L4+3C04T3orsnEXvwu74q5kjZ6elftLz3SffmpceWMM
	2RdNLXVT8pY4D566NbP/+i5LeNgV/FYwwa4CRaRCbkEaf2206PdOUCUWfmpJXbfZOn3QUJEulHQAW
	igsb/bZ9YV1JkdWgaEbojc/S9wkiwwb0LOOe7/cX4BQ0szlbpqehOuSy3X55bYYcUP8SB7zo5IuGG
	aUniVkUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2LIb-009bm5-Ji; Fri, 17 Jun 2022 23:22:45 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2LIY-009bkm-Vq
	for linux-mediatek@lists.infradead.org; Fri, 17 Jun 2022 23:22:44 +0000
Received: by mail-pg1-x52c.google.com with SMTP id z14so5256185pgh.0
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jun 2022 16:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=BZYFg5kiVhld2lAiBUaa0ABgAdKIA/3yLwoH/l48Ndg=;
        b=NM+CS8TeBLIzD73k6jDvxl8r2exFRyI0AzyUwqtQyY5Wrvn1EyVhBCPZvU3RVlLVCL
         GSing4OzXKnQ03Bpr5gjk50qCE3f2yqUooD5szbeBVu0eLmDF1PODhmYzFtORs85GH00
         2ni+66TgRxjJd/AnMFXdWrh/ILBHI4HYllfWPoeYqWfwajWT691jOqAHyKRM7lE3TgHz
         ca8Q+PUepWAkNOEIe1e72DrJXCjDSwHktQAXPLeIgHIJYVFU9zO5bhMQSmrS9NZLTkhm
         5wABOSDPoI7BqC3TRTPgqGgWT5WAqMySxDuiy+CRpQLVSWb22679Fr0mMy14D9t1pj1y
         U5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BZYFg5kiVhld2lAiBUaa0ABgAdKIA/3yLwoH/l48Ndg=;
        b=mBHxhl39w98jTxPfHGIBut7YRXdeTlt0C411U+oFokZE5NMJ+lgNGjnmkz/NX+RYYB
         +WjNpVpcJ3ISoCG0Gx90pm11mykbmTeQkT4fPK9uf/C430hQxhvXUyHutLfIHC8ZyE0w
         DFc8MAIAg09iWFMK12mXzlPLSLXRhoy1UngPfe4IDNWahxSLynApzQWiX+fluvChyPZm
         oBUaakjNJwXMfzvz7j3P8tNdJhv5SOXdELS079TQgyAqUr1XH2ucnacPbIQBbkt3dldi
         lpTVN2/0MdJ4AV7ZOFSQtd1cRtztGzbUL5IHNzOdTpqPerpUGJF2eopGa9nuccNx7znb
         id6Q==
X-Gm-Message-State: AJIora/aB6wdu2PQyAucUMezcjolm9o0GTDdvFh9tKrIiziApj+I1nq8
	LqLbLvJE+Z2vxwbX4Zo5OY3bTQ==
X-Google-Smtp-Source: AGRyM1u2gXb8MDp4KfFCqq5UNmC/0QyElHJ+3n22NkWBoduGn8VHO24rY5m3NjNte2yGRFcMtMnZ1w==
X-Received: by 2002:a63:6bca:0:b0:408:897c:3fb8 with SMTP id g193-20020a636bca000000b00408897c3fb8mr10798602pgc.576.1655508161648;
        Fri, 17 Jun 2022 16:22:41 -0700 (PDT)
Received: from [172.31.235.92] ([216.9.110.6])
        by smtp.gmail.com with ESMTPSA id k8-20020a170902760800b0016223b5d228sm4042218pll.288.2022.06.17.16.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 16:22:41 -0700 (PDT)
Message-ID: <834af774-ecdd-1929-86eb-6a814c5d774c@linaro.org>
Date: Fri, 17 Jun 2022 16:22:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] arm64: dts: mediatek: mt7622-rfb1: remove wrong gpio-keys
 property
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220617232124.7022-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220617232124.7022-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_162243_071019_7F167996 
X-CRM114-Status: UNSURE (   7.61  )
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

On 17/06/2022 16:21, Krzysztof Kozlowski wrote:
> gpio-keys (regular, not polling) does not use "poll-interval" property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v3:
> 1. Correct commit msg (Matthias)
> ---

Eh, jetlag hurts the brain. This should be [PATCH v4] in the subject.


Best regards,
Krzysztof

