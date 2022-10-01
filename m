Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90754C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Oct 2022 09:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySbgyWorO38LTKoI632Q6sfES0ZxGVIwthdcT35EN3s=; b=1PuYlONDD29ShWoy0dREA/pM+f
	Bfgaky10XSiVW0CB7utCK5kcj3jJkLol4gU8dk+sPQy4F2xnzPCertS4+XOBkXEVqug2oslqlgAgH
	WlN6q56jk+A9vogoRJEktddzG8nzjar3ch8pgTtwiGuIcygqRGtPGP7FA6IjCga+kvcs94c+FNPpb
	R9e4ixHG1yNE6JLVcOptOSw17jFmsUSoNxdGZnEvzIXKfhHX/83OWhwAsAy62+C7pQ5QBe8jcD8cL
	9uDg3A7QLeIoAGnq0jHuaGWdFIeosVRb8lkOttlVZG6DgmSN9ZlNnHVQne+34hzcPsUH9qXXQ9v22
	b+ySzMvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeYv7-00Dzgl-OE; Sat, 01 Oct 2022 09:36:29 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeYuv-00Dzbl-5E
	for linux-mediatek@lists.infradead.org; Sat, 01 Oct 2022 09:36:18 +0000
Received: by mail-lf1-x12b.google.com with SMTP id c2so3852170lfb.10
        for <linux-mediatek@lists.infradead.org>; Sat, 01 Oct 2022 02:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ySbgyWorO38LTKoI632Q6sfES0ZxGVIwthdcT35EN3s=;
        b=mJ/9ekSO9l8O12V28K4iivy8XqKo2KIaLUmuGRw9zvgRVhgPgDKCQFOUVu7JzW7WQ9
         nmDIkf/G4ZY3Ftfa8DQYuzbws0JY8rcgovS3o+ZJ5UM2o0S3PSZe4O9UPvKlNr0Hyc/p
         Y9PDjP4idxY/CQGHJqz7IZKPYpzFLYacT4HHqS4JJnNGqdJGsdjWRtn2Fu+S70qHuC3G
         kJW7SiIS9ECVCWeGfhC4zVQh5MLlGZ5O9vCoRnviTub4Tt352aO+dA2/A8EP+od+BuDV
         eKenX8Y1EI3zxGiTtdEfg1I5joXQHbWlOB6h5jPYMuaUcTTo3I7vhM4z6juR1o61Qoms
         12bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ySbgyWorO38LTKoI632Q6sfES0ZxGVIwthdcT35EN3s=;
        b=vKjZYC24ipfejFvQJztTBAf8GY20PuEFaZAcMUT0q4tb8ouk5YaEmP30nKkb7DxDHP
         UqUuI+QOgWEyrHllYK5GAt05RdiQLbx01p5NEaLMEcdAg2UNR5ygXN5OM8db+yRfbxf8
         zdErAi/46OuRL1Kln2ZktG/LgsHw5j2y8ZTiufWR0Qvo7jmkTRxjWnhvhByC2VG2kABI
         TQOjJkzSZ4o4mxgg0meYZAyjn+8uJDw0OqXnJ9lPje/dPmJYcvDn6yjpxSlGR2d9b084
         GMKPERQ3sFsXPrMNHb7YJzlq6wpYPX0IFpzyLRskGMMhBvidMlGUndmSMtSJPrNhInbs
         sSBA==
X-Gm-Message-State: ACrzQf28r4vZ0/skLEBSOYKK7Xl2YndMRHkG1DaU+ASaYMOCWhlwmPH5
	eAJpBPHd44hcmDQz+6k+w9ENBQ==
X-Google-Smtp-Source: AMsMyM6bbgFZJ8+sMNM9l/WKxhLRKRd0nJAXEV+hIpBTsCya1wPJA5qXAuI/pKK8yArz4xPTLWDwvw==
X-Received: by 2002:a05:6512:b9d:b0:49b:9ad9:17c2 with SMTP id b29-20020a0565120b9d00b0049b9ad917c2mr4388114lfv.16.1664616974877;
        Sat, 01 Oct 2022 02:36:14 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id be43-20020a056512252b00b00494935ddb88sm704465lfb.240.2022.10.01.02.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Oct 2022 02:36:14 -0700 (PDT)
Message-ID: <c4870076-324a-a3a5-af1a-e812493b6436@linaro.org>
Date: Sat, 1 Oct 2022 11:36:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] dt-bindings: mediatek: vcodec: Add the platform
 compatible to schema
Content-Language: en-US
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Maoguang Meng <maoguang.meng@mediatek.com>
References: <20221001030752.14486-1-irui.wang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221001030752.14486-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221001_023617_260976_DDE47C2E 
X-CRM114-Status: GOOD (  11.25  )
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

On 01/10/2022 05:07, Irui Wang wrote:
> There are venc node warnings when running dtbs_check, the clock-names
> was unexpected, missing properties '#address-cells' and '#size-cells'.
> Add the corresponding platform compatible to schema.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../bindings/media/mediatek,vcodec-encoder.yaml      | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


