Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFAFC6FA82
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 11:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1FM6FAoiEC7PRrQXFWOsfGGjoGMqEaUpaQkuBnp1+0=; b=ec0VqakGFlBHHdNfHx8pJLSAJ5
	Gim9iMWGLAkBstKs3kupZZYfjoQbnAEWWGDaRWUhieFYkgDTWsrqzHtwCQKwEhTcVDNFxv+b8hzix
	z4NwnUDbr9Ma0JaRpL+Xc6xXi4FzqOK4vjuDu4aHDsaKr4l1e2xC3+YOKtWyVXCc/ge6pOmhq/EIt
	6DgId1t59H4z8Z8qn87XDQtvTVbPJ4po9bJsH6hxCzcu+oa6MRgo950cGEGzPfdVhVDXkMikHteoq
	iHkvVeV3AC+x/y0FKSAZSZHteQl3cE9e+eF3etaSsLW9DurXLoXIf1FAvEL7/OeW19OEykBExwJEj
	fVVLiKvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaEaY-00BRip-D8; Mon, 19 Sep 2022 11:05:22 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaEaW-00BRiA-AF
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 11:05:21 +0000
Received: by mail-lf1-x135.google.com with SMTP id i26so46312098lfp.11
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Sep 2022 04:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=A1FM6FAoiEC7PRrQXFWOsfGGjoGMqEaUpaQkuBnp1+0=;
        b=E+e2zAkBBAYbfP4FR7CDEDZL6ZBO3HanynU8QYzX2dHuxE/7jtOkzzGnboB92pZKlz
         CfolEkfmNq200LVMY9y1ZqenAfdaLjzzhMUb5izdzqtRETRUDlYv0kAqWmNvj/j7juma
         kRUBzqcdD2LODp1Gjs0eDSFfkB2H8Qxa3IAglVyEdxWB9p+3CXVprVCEVJtcGNhRnTJ3
         QLPUphIs8bDk4Ky+7g1R/98hE2H5KAh2uTVlhK6lzbHNmpjG+hMCtGYAquKu3GPrWq4J
         lbgQ0OeAEqYYxWAJ/RX7KQdfyGCEjvnE4DmlvxMY17PGaONt+jgncae3EoEDHB1KarrC
         CneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=A1FM6FAoiEC7PRrQXFWOsfGGjoGMqEaUpaQkuBnp1+0=;
        b=nvojSNFJekt69aUpD2Bn7Mt7uxsidhqQvofsWvN2NzLioMGycp0zRaEeYtehcjnWOj
         Wag+Dm7VbqVi13y9PFDCwAmiEuQ8zQqR9Lk0Lveo/MxfohKktvlzzuPzQ1wiphux4HAY
         K4ecEDDs0eQcVQC9crVcPLQyXzZ3ZdO2P7PeaNeefF8MMTMg3OKGQoFLAZF0NRvi7FDh
         YNcZrzyciUkPKNsOXV6XHQPReeqvMyaQufMtF/5htpFpkvnI6M6dsZrwMXD0NiZ2FoPe
         iVhvUy9hbxupd7Fi5HKTMXitfewlY/eeHsHpixayQJ7LmTvXQd5il6sdv/jopsGokV7K
         GyQw==
X-Gm-Message-State: ACrzQf0XohkSuEhTsWfOIQWvNnhp652DkAZsk3dvArS2GZUzjdIIW+oA
	sQYAC+WiEw2tQNlIwiUFfYqeVg==
X-Google-Smtp-Source: AMsMyM6YrKPdqb1UqOzTNjT+xjVxRozWKcwrIhZa5ApEvR1bc0UP6/cShGl5qisCorV5ckrazWZ4Bg==
X-Received: by 2002:ac2:4c35:0:b0:497:ae09:11b with SMTP id u21-20020ac24c35000000b00497ae09011bmr5900342lfq.507.1663585517490;
        Mon, 19 Sep 2022 04:05:17 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w9-20020a05651234c900b00499bf7605afsm5010369lfr.143.2022.09.19.04.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 04:05:17 -0700 (PDT)
Message-ID: <2e2a7dbb-ba8a-3406-b54d-0ca135193c3c@linaro.org>
Date: Mon, 19 Sep 2022 13:05:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/3] dt-bindings: mediatek: mt8188: Add binding for MM
 & INFRA IOMMU
Content-Language: en-US
To: "Chengci.Xu" <chengci.xu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220919082611.19824-1-chengci.xu@mediatek.com>
 <20220919082611.19824-2-chengci.xu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919082611.19824-2-chengci.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_040520_459719_5086D725 
X-CRM114-Status: GOOD (  13.72  )
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

On 19/09/2022 10:26, Chengci.Xu wrote:
> Adds descriptions for mt8188 IOMMU which also use ARM Short-Descriptor
> translation table format.
> 
> In mt8188, there are two smi-common HW and IOMMU, one is for vdo(video
> output), the other is for vpp(video processing pipe). They connects
> with different smi-larbs, then some setting(larbid_remap) is different.
> Differentiate them with the compatible string.
> 
> Something like this:
> 
>   IOMMU(VDO)          IOMMU(VPP)
>       |                   |
> SMI_COMMON_VDO      SMI_COMMON_VPP
> ---------------     ----------------
>   |     |    ...      |     |    ...
> larb0 larb2  ...    larb1 larb3  ...
> 
> We also have an IOMMU that is for infra master like PCIe.
> And infra master don't have the larb and ports.
> 
> Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

