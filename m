Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E26C761AF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 09:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYCju3cZ3O9keu/FLQNASmIVYyF+HMyIVhCeqGeGE/M=; b=LwGi9v3M4CGZZazKVxZqu5G9QF
	l/zN0yAO1TXPn0v+RhT/FyR696tV528EfdgFU2Kd6+fZhE78+LnRa7QAZ3UpYptM6ayksRINqiwm3
	rEuNb4tfdbON3kDGQ8Vd8HjH25LT7/KWeioaXXuFmi/9XgNyqsfUp54PggwQ9xWMlJRmcXu5bPtJz
	hhroN+UNUpelvpt0DAD47NJuyXU7RTD8gqPkS1yxfB9gMJNH8GwAFNeaHyELFkWx30aJmsKXLOeLo
	UqTHxQrh5eIkTQ0Z0TpbBzkZ3eDrcPTdjioiOKY0Rqy+OwOwcQi5b3ziPFVfs+LWSp+0P39Dc9Ait
	q53NBi4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzg2-003zrd-2b;
	Wed, 05 Apr 2023 09:43:38 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzfz-003zpm-1E
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 09:43:36 +0000
Received: by mail-ed1-x530.google.com with SMTP id i5so139764337eda.0
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680687813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wYCju3cZ3O9keu/FLQNASmIVYyF+HMyIVhCeqGeGE/M=;
        b=z3CBfac+rQ9laEhyG5k+IFA69+578Bg4sLkNHEIUOfkTcG3UMrDbm2xLxVz7nzLh/q
         Q+5VLpNAOb0pZkEr1dJ/puPEJdCtTZiiZOCB1PcN5ggRtag65HqsbVr2AIVUNsV9NSYw
         9sFtnbIocc6fnI4AHUm0SsQbnOD3Flz29ZB8+GvA0u7GrbgK8gXtaZ7B5f+8x0Qtjkkq
         8LLCt9fKnxURPVxTYycTQe2ddlE+DIKxHeB0r0dX6qHsXF8W6ECPw/gKT02eDBYVc/Z9
         9MQUjgV/U31BSByxXyu3AvBbJ9bT7sNtqoGi6phEeywJsytHwkb1MtV7au11UYgJ4UdB
         h8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680687813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wYCju3cZ3O9keu/FLQNASmIVYyF+HMyIVhCeqGeGE/M=;
        b=dktY7nztVHFNVL8xmkLdZru0yv3MtqGwziRggCgOVCGqRSzTU3PcmDebNk3CEKnUgV
         TXAoPYPPcWqswRM9GrTmriQuhTNPZIMEo3FQBpxoMGsmgjpql54iC3TEfzG8FU4d23Ry
         qIiHCUmUk4jJy+j+JwtaLNWwuwSPWYVR5+ZlUCiuqXKgxy7RsxU8y12A72Pz7iFXR87x
         peLulHFdijjLUK/btH536CdSSwY6pTT9SxxiqPMyvLcqP/FA2nJTQUNvsRB5/hAbJ+nV
         x+/LsBQi8dNl2fd7allryMxFBW2YxmAB8wWn/VSRpF270+k4JKK1df/DkWmZdmw3KJzx
         xQ5Q==
X-Gm-Message-State: AAQBX9fTSNnU7Ij4wvaiwtnQoNdL2caj5x3R54UJvag3Kwp+hEBNGHoT
	2GBHLCng1qHnRh39rFmohlp2Qg==
X-Google-Smtp-Source: AKy350ZLMPqeb+hhbOLRfB84fh3Zo264Y6kjfy2jAQoqhQFRv5JP+zQyqPAAp1bXMfTfGKFJd8LZpw==
X-Received: by 2002:a17:906:319a:b0:931:baf:259 with SMTP id 26-20020a170906319a00b009310baf0259mr2308827ejy.63.1680687812888;
        Wed, 05 Apr 2023 02:43:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:3f:6b2:54cd:498e? ([2a02:810d:15c0:828:3f:6b2:54cd:498e])
        by smtp.gmail.com with ESMTPSA id q20-20020a170906541400b009442efdaf20sm7182439ejo.156.2023.04.05.02.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 02:43:32 -0700 (PDT)
Message-ID: <9847bc48-c96c-3599-e876-bcf9ebf1522e@linaro.org>
Date: Wed, 5 Apr 2023 11:43:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 10/10] memory: mtk-smi: mt8365: Add SMI Support
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Yong Wu
 <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
 <20230207-iommu-support-v2-10-60d5fa00e4e5@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207-iommu-support-v2-10-60d5fa00e4e5@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_024335_425465_A5D2F133 
X-CRM114-Status: UNSURE (   8.18  )
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

On 05/04/2023 10:06, Alexandre Mergnat wrote:
> Add MT8365 SMI common support.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---

Why the driver patch is after DTS? Driver code cannot be mixed with the
DTS on branches/repos, so such ordering suggest your patchset is not
bisectable.

Best regards,
Krzysztof


