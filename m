Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990BFC77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 16:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymmKCWyi4BuUhQeC0+Pd2BCRko+BuLsOvz6+yinnp+0=; b=XR2bgC5jr3Y1mZ4AyUbRm6Bgty
	DRV4NPkN3iTyTaDrr5FMGfTcZircicGPnk5Ufv02gDEOgvNCxN5QwW+yLB+Qj/nSdWwvQNnKZFEgV
	Bpy0XHIp+L09ENQRgt+BcUqYe9DFtVmQbKf9E/Xeagw06f98HXhV1/F/VSH1vN/QmgUC4Gc1voTz+
	IE1Y78I3+VlNmBsMmQ3k3AuqnCEO5RHxuBCl8QTvw6TZJln06zZa75jI7LfqrypZqdVXZdivpOUGd
	jmwpN9azc/qIGSWTvIA1bLgy+EzmiFSlurM/PuXlYqPmt3uK8aIT/sppyhsDI3S9tbHAEHer8lEuX
	ul8r3HMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyxbF-006TdU-0Q;
	Tue, 16 May 2023 16:32:33 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyxb5-006TaT-2V
	for linux-mediatek@lists.infradead.org;
	Tue, 16 May 2023 16:32:24 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9661047f8b8so2253962266b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 May 2023 09:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684254740; x=1686846740;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ymmKCWyi4BuUhQeC0+Pd2BCRko+BuLsOvz6+yinnp+0=;
        b=TNH6T1E3C/BE0kajA/rxS9mxqz9/Np/ON/NQmMlQq8J5tGVFPKvz5lZWDXBc4csd16
         DnsEc+NHc4S3y9ZJwqGGFRLRJPeHA2yR0elocYlsQrGAL+1aqB47VLR/aovARXtgge2M
         rHl+9C8Wp6tCZlD/qE4KT8qPnAcaezMIxk8zBpr+8N0crlex0fme2+L8GVNcM+nnEG/9
         NyObCSOi/9H4X95Dzb1FNGWU47GNhj+O3erYEFwD+Qo7DyFaVmBQthPR9XWRN7xRyQr2
         rO39QCjL2UbJJLaOR+bxVd9XwGlj2X5BIISl9kIp/BHmPOjNt/OBnbQne3iIbyX0XGhn
         B+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684254740; x=1686846740;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymmKCWyi4BuUhQeC0+Pd2BCRko+BuLsOvz6+yinnp+0=;
        b=bYU7v78btiyCzCBlcp9O4SLLor+Wf6C+jQmtjb2Wx5LHOjXBwt91T9WcvUowBF1rwE
         YeyL8NeLgvVI6pgxSygrkHZi8v5iuHEP32Ae9JlLdO9MphzOW3tiVqjNWE8ZzmGC0qbx
         gHU6eFT9YZierQthj7XEtcR4/kDxJ3cqaN4ofn7HhBMm6KQ1nj4OLT9fwBvISoe8QmJz
         ShONmQeVbHBEFsa8A3teZe2IdhbAZEINLOfp2CN1RMDjua7sQOCEI6A0ATPTvtejtCYh
         DB+GiztA+tPSV+CW8hdAD0j/MKDGb03WT4UhG2FmtetykuUPjp7n6q+2h1P45zrOBtmX
         radA==
X-Gm-Message-State: AC+VfDz236pzuNfgHYzApCy0fKOVbDI4M+neHLDGhoA/s3wPwAOu/6Zy
	79fGAs50UpZH1+nTnDju81rLVg==
X-Google-Smtp-Source: ACHHUZ7OjQMs+ye3zleeYS5ifjOgQA3g+9sxbKgWz6PmgW476anHiMRBNPSEhk91J88fAafiJ3Z5ZQ==
X-Received: by 2002:a17:907:1c14:b0:95e:d74d:c4e6 with SMTP id nc20-20020a1709071c1400b0095ed74dc4e6mr46064634ejc.25.1684254740121;
        Tue, 16 May 2023 09:32:20 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:77d1:16a1:abe1:84fc? ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id jx6-20020a170907760600b00958434d4ecesm11419565ejc.13.2023.05.16.09.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 09:32:19 -0700 (PDT)
Message-ID: <5590f51a-16b6-93ae-d8a0-ab6b4e2e1016@linaro.org>
Date: Tue, 16 May 2023 18:32:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] arm64: dts: mediatek: add missing cache properties
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230421223157.115367-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230421223157.115367-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_093223_813127_BF55279C 
X-CRM114-Status: UNSURE (   9.35  )
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

On 22/04/2023 00:31, Krzysztof Kozlowski wrote:
> As all level 2 and level 3 caches are unified, add required
> cache-unified properties to fix warnings like:
> 
>   mt7622-rfb1.dtb: l2-cache: 'cache-unified' is a required property
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Hi Matthias,

Could you grab this one?

Best regards,
Krzysztof


