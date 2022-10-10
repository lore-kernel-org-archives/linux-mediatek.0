Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB973C43217
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 14:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwsU1fn/1SfZtcqL1Zfll3O9hBAK2GV/zHS0qbctt9A=; b=xjerdYE9kO9QMiOMPbDmJNM8ds
	Lu8P4DzYHdtbEAD5NpmeMuFHA9zNeY8/hBmmlNDppHKFAEtdKiPN5wa1UusjMLy4HlppCKK0Dmga7
	JKmcP2M9dn0CaRnvLIGTlLmpjHv82vfRhewx0V5R17I4cFCKdkj8iKNkQYaftHK4FOFY5NKvSuInG
	aBb7zEMNd59Kb4XXS0WkzbkNs5J3YkDvLPxWuUydhIbgMdA/EpSvmF9fcN0OUoZPGs3x1vST4j6qe
	WiTpiKMBtLsHzTdRSsi3Z9lb/KKSuQDL3TlGruRT7iF6dcseHWr8l+XC2pGM3gUZzKb3uAVWu9QlM
	DuwjufBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohuC9-001GxN-Mw; Mon, 10 Oct 2022 14:55:53 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohuBy-001Gu6-F8
	for linux-mediatek@lists.infradead.org; Mon, 10 Oct 2022 14:55:43 +0000
Received: by mail-qt1-x835.google.com with SMTP id h15so2467938qtu.2
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Oct 2022 07:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UwsU1fn/1SfZtcqL1Zfll3O9hBAK2GV/zHS0qbctt9A=;
        b=vFfv1QykuX1R6T4Pv3s7wuWLMBDo5sYCAxir3KGVHEjCi0mdzbZew2vk7h7L4rix3k
         Rf9SYZNWSKxwJzDt0MinCCWk2PmF6aLaMXl9clOTRhhkSAK0KWc7C0aO7U54037TBtBp
         4WFqQ2HLFcob6z8Ev57+FwoAg7h4Bm28VhWB77XX8IRaKjbKaqyq77FLWnJ0q2FteKKn
         psQcN8rXlsCo7oPYfisgs70YCbhs13QHkG2xCSvUGtoeOKERdZN72m1KwwMTeyBq5B82
         tCIPlwoZiF7YhC9lP40IqRPJAuxZrd15FL1yLQZqZtt6u0BAhCS62zqGejhDSUBQCqv9
         rcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UwsU1fn/1SfZtcqL1Zfll3O9hBAK2GV/zHS0qbctt9A=;
        b=wI3WlIKUvdYYBwSY6T3DTpx55tUrrPpiGNbd1W4twjOfoWmxBfuyqB+GC08m9tvcTX
         x66U9pPjJJ0FW1R2NbV0L2KJInLzch2gKuMDIU/5SsnUN86+6kK1gHCRS2SBPSKTWnPe
         XU5ctGWAoyIlSDYDyHFBHhrFSJtxYRx6Y3ZpBWlSRK4Ev2Nh7LdjJODAsqcWFMVrGND5
         XaPvEKxe7ddY6rHsqvqnAqKvGlcqVkw9fwRVrJ+jmuOb11Gb4QhxZgUIAriURWbU87Ir
         t/1EDc3pHYDxmbtZrCtgG24n2q5rdoAClcYdDRHpWcK8DSTQ8sOt3ymU9mSi95t6EAr8
         0ocw==
X-Gm-Message-State: ACrzQf2TS5tJfA7u5acWV/VZiTGph9Z/NNUaBB59u2uOK5kSSr9ABrlW
	U5bSItE1btKlVNW4ixYJBxN2dQ==
X-Google-Smtp-Source: AMsMyM4wUdL69r1gqbyekIM8UU8nT+Iwy6V3/bmUUZzogalJHEIVc9ztR+cgKUf3W7pIPUCmGyr9vg==
X-Received: by 2002:a05:622a:13c6:b0:39b:e62:cfc3 with SMTP id p6-20020a05622a13c600b0039b0e62cfc3mr2150730qtk.687.1665413740678;
        Mon, 10 Oct 2022 07:55:40 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id fp3-20020a05622a508300b0039b26d92989sm1083673qtb.86.2022.10.10.07.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 07:55:39 -0700 (PDT)
Message-ID: <1c10a474-7014-b56e-d2e1-3e422ae82401@linaro.org>
Date: Mon, 10 Oct 2022 10:55:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 1/3] dt-bindings: iommu: mediatek: add binding
 documentation for MT8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: iommu@lists.linux.dev,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 linux-mediatek@lists.infradead.org
References: <20221001-iommu-support-v3-0-c7b3059b0d16@baylibre.com>
 <20221001-iommu-support-v3-1-c7b3059b0d16@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221001-iommu-support-v3-1-c7b3059b0d16@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_075542_514563_12CE960D 
X-CRM114-Status: UNSURE (   8.22  )
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

On 10/10/2022 08:54, Alexandre Mergnat wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add IOMMU binding documentation for the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

(for DT bindings and memory-controllers)

Best regards,
Krzysztof


