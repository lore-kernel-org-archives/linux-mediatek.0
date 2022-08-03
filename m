Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64A2C19F28
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Aug 2022 06:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wCmqftL2YTJwRl3uJo2czdhPZEtp4fKlSDbfT0Ewd4=; b=XEd6Ckl03rldNRbtqsYB+Y+0OZ
	/Y0n5MbdjpVqceONXJOtBd9z2+n6TkWKxIkw2cSqsHFCAAL+br82bd4a5OY+QAazMOs8X/0fyd8W4
	3xdWpDueh4OGafPsCKzCR6Jm7Q/J9Eow2sCojwqAx8z2NQP+vHSZv49PgBI2cmHJoL1ode6mioADg
	C2CPZgITrvk48xS7hMaouMqxr8XAUax8bp75WzNJWB8FB3LlQ4RSyZAEj3dPJBWke7StFywbLxm9d
	DE4zWjMS2Ci/s6hbkli4B8/MV3eXHGKusCZ2MT96Gcx4wx/vOrq3AdT9aXdXC66A88VG1nE2eY2SD
	pD3k6cQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJ878-003EaB-UW; Wed, 03 Aug 2022 06:44:18 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJ876-003EXg-3Z
	for linux-mediatek@lists.infradead.org; Wed, 03 Aug 2022 06:44:17 +0000
Received: by mail-lj1-x22d.google.com with SMTP id z4so3258236ljn.8
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Aug 2022 23:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6wCmqftL2YTJwRl3uJo2czdhPZEtp4fKlSDbfT0Ewd4=;
        b=S8AR7bEDgG1TRfKJbCDVv5Q3tJj6UuB0l62JQgl61dfaQ2IfMXCzzbiYMIt3cQQgXc
         wX0QRZXawZXgX4Z7IKoSjE0jCNzRplDDUEa4D5adMdvWwoGcgCGS7z4WBh8RqQouDP07
         IEzzNAv6bD/VXMZZULSeI3KZ6zI++uWfpyR1iXqUgfTUw+gGCJlo1fhWIbEKlBXIS35z
         v7DBBDohOCJ2VBhoMLNA5XwNYaSpYiTWrPkDfnNbOhqtSl0IDIwrimONgp4szk5qwK78
         nZVSStgWoyI9flFyLbDjGMXrXkMihmAPHFGJNpOJsrdaTQVk8ah9mNYawe4FZsJVLTWv
         Tu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6wCmqftL2YTJwRl3uJo2czdhPZEtp4fKlSDbfT0Ewd4=;
        b=7pCK3IOVZGmWmQvVKWxLywS4yf9gQpUKE5AIPamEuzd/ym9a1Hx/3yuEmLIsGuRcmm
         ftz9HHTZzSEZHlsDzkKpHtwLAGNEBZPCt7w2aDYUBOvUGVTk8+DvKmtJQQGWqWXUSidb
         vlb+mgDwrk1wt4jQF3fah9ElYlFTuhR1Twuttrj5Bj2Z0MGO6ETqT/20jk9Ar+u2e9QZ
         ps5hBxC9O6+/S+2oDVoRmkzomjWOu4bf/HIxgB9SYwZC4yp+bLUYoNxZ3N98PfQyWRCu
         Mv+DRiV77nT1gMQpDnHMNghg0rlJbI7UlZziyzwRdUI9gvxdkbwd5VxRB8Kj+TtgUpjw
         tcZw==
X-Gm-Message-State: AJIora+QpQGvyjpNeo7pb9ktf60ZGj8LtmCg9a5Eq+2dORN31ojAfwnM
	oqZXXP5cL/8weiyooFq77ovhUQ==
X-Google-Smtp-Source: AGRyM1s44i0wbnt6DAfjwwwQh9ZAYD+9dDBin5vOqQvN7GRthJFgT71RyENzL2QFCogHHWjE748DUA==
X-Received: by 2002:a2e:bf14:0:b0:255:b789:576b with SMTP id c20-20020a2ebf14000000b00255b789576bmr7850928ljr.47.1659509054089;
        Tue, 02 Aug 2022 23:44:14 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id c14-20020a2e9d8e000000b0025e5b5474a4sm546137ljj.85.2022.08.02.23.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 23:44:13 -0700 (PDT)
Message-ID: <5c14e959-10cc-5520-e88f-b47a195b99e9@linaro.org>
Date: Wed, 3 Aug 2022 08:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4] dt-bindings: PCI: mediatek-gen3: Add support for
 MT8188 and MT8195
Content-Language: en-US
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 Rex-BC.Chen@mediatek.com, TingHan.Shen@mediatek.com,
 Liju-clr.Chen@mediatek.com, Jian.Yang@mediatek.com
References: <20220802120624.19258-1-jianjun.wang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220802120624.19258-1-jianjun.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_234416_228559_F5A5400C 
X-CRM114-Status: GOOD (  10.43  )
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

On 02/08/2022 14:06, Jianjun Wang wrote:
> MT8188 and MT8195 are ARM platform SoCs with the same PCIe IP as MT8192.
> 
> Also add new clock name "peri_mem" since the MT8188 and MT8195 use clock
> "peri_mem" instead of "top_133m".
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
> Changes in v4:
> Remove "items" for "mediatek,mt8192-pcie" since it only have one item.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

