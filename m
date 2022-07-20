Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83084CCA487
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 17:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICIFskbhDAxkqyFPFywjKrA2bMQUTmKy88Z9Ca4QMwc=; b=qBpgAlUQG9B1NRKQlDiciIeqra
	Xzb+iMK3QZH+KwOd4j7PR3v78TUQWP8uxhyMhG3fRt+sDzr5UgGb7MaOIY5/u7/N4PoFoYaVtwbof
	5pwcLeD++DrgB7CqHLPQ2PZ0LstxeAOTxp7BwYoGiWrz8wkmziH8dC3lrPHka53U6MSYEdHV4vZtg
	NRK58LL/Xe4eNfNgyUhAAf+R6fBZMAEEfjDumvK1Jf/ZvfjXR7/x4pTY9YPNRu8SXc1cVPrrArD46
	l2iRTDsn7WDJmnvehyqmjgcbnAvAsdTzG5bG17JZ08BLXLmoazQfUUw5J6cOdLyz2zh8BAml8FoyR
	4jI4Cj6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDeG-008ilw-KV; Wed, 20 Jul 2022 17:38:12 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDeD-008ihp-PW
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 17:38:11 +0000
Received: by mail-lj1-x22f.google.com with SMTP id x10so21508136ljj.11
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 10:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ICIFskbhDAxkqyFPFywjKrA2bMQUTmKy88Z9Ca4QMwc=;
        b=pU4v+a1Ih9uwueVmVnw/nnRcFBk6TOtjSs23U+h8gRjVlV7wDHKSroELFu22DOnyC0
         MyE9ToyAShxsaTpXlt+/dHrJQvJsInZpC6XHFrdQORgZmkhNz/GcLEL7aLSOnjghiFRF
         yoAig85kwvl0gdzvs1inz7BQHrpwSaBinQUgdUT2+pBtFMNJin0BEW+PLOuwnOieRzVS
         eAJFwaq+rF9flazp7+kc/D2u4tCzcGylZyCH4TsvhRfddoo6xg4QmIthqM/kEy8hQeCU
         JWHiDHl/sFzRmFD9/NxBYwUKVb7BC5bLLOH20jDlZ90DknQPvGOX7X1IVUSH0s7dKspk
         qXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ICIFskbhDAxkqyFPFywjKrA2bMQUTmKy88Z9Ca4QMwc=;
        b=TgQ6AZYqH4Nkp1bi9OxBvo4WX+r05ZMLXD3ZG8sTFFhhT477ZRiyt9RWjhxy26hMDJ
         iDfR80epO5OhnCtHv8Dg2jbJE5u32y32379stT5RQKdsx297UMH0fIpIAQ39STFyTqQT
         JGwf6IXLd4ySdcTfL5xLIm+zUl9FH3M8MdRJub93/4mLC67WkLWLTVwLYbmzQVWc9bvh
         MNWL7yS7zy9CTFW0I1XTkPF00vYreczUDdn1UfLP3VYJqvlxUUHYbb/dfPG60aSxh4gL
         NLLRjgp6VBhmbAxQh6wOsN6aOkrMU+VrV/0uPgd7kYY/mTFdorUJ2fT9wNrVBzcnXlEH
         B1Xw==
X-Gm-Message-State: AJIora9clN7RxRvPm6VoMacwwQH1qNuAxAb2Oqd0bXdeLF7skeQiGoCR
	I28pdesbgIF+df0VXXf5wR4zKg==
X-Google-Smtp-Source: AGRyM1sG7lbScHD/ieFpA/+GQ6oByCyWagIFfgC4I8Gr18ItlMyGc5wtlKO06bA6wu+LjYej5okHsQ==
X-Received: by 2002:a2e:8e28:0:b0:25d:c1b9:aede with SMTP id r8-20020a2e8e28000000b0025dc1b9aedemr5581492ljk.28.1658338686017;
        Wed, 20 Jul 2022 10:38:06 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id v14-20020a056512348e00b0047f6b8c2127sm3909309lfr.186.2022.07.20.10.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 10:38:05 -0700 (PDT)
Message-ID: <3fab6834-7622-a33a-dc97-9c630702b6fe@linaro.org>
Date: Wed, 20 Jul 2022 19:38:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 07/21] dt-bindings: power: mediatek: Update example in
 dt-bindings
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220720123023.13500-1-tinghan.shen@mediatek.com>
 <20220720123023.13500-8-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720123023.13500-8-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_103809_865335_D55287AD 
X-CRM114-Status: UNSURE (   8.56  )
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

On 20/07/2022 14:30, Tinghan Shen wrote:
> Update the scpsys node compatible string to align with the
> scpsys node bindings.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Squash it with previous because logically it's the same change.

Best regards,
Krzysztof

