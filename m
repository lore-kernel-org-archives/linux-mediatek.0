Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6C1C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Dec 2022 08:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8D1QHQCpi29rzUZgRP89fJD5YqRNF7ocoA5T9SiKjU=; b=zp9vMd8gREAx7W3beMQ8ghNeZz
	oKhySZGI6Ftd23l8GA6EBi+R0t7XQSHaucvaIMY68yzpA1lWI0xgNTYkQWHmvStXSiGHpAc/QxxjU
	c6rygF1Bqtr2EIPZn5Eyqguv+XR1YtkFG3UUNZ5Wj8f8s3Blxrauv2BF+tOPsPTjQPx3FoB7qQI3h
	So74PoGIPKeEt8WfhAwrtqUs+Z5/66/K4dZgg/EsjAtQkyeerOuzwdBNEfroA89pZ5HFfUzIN09rw
	kG0kOHkBtE7YJ4496vBNmv7NTdYAUjJFWmu8uskeyPcCIhiYhvIOUnzhBRwf9l+y8CKJShDUZtk/u
	frSCggAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Z7m-0060Xa-Ra; Fri, 09 Dec 2022 08:52:54 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Z7h-0060Um-5e
	for linux-mediatek@lists.infradead.org; Fri, 09 Dec 2022 08:52:50 +0000
Received: by mail-lf1-x129.google.com with SMTP id d6so5970114lfs.10
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Dec 2022 00:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t8D1QHQCpi29rzUZgRP89fJD5YqRNF7ocoA5T9SiKjU=;
        b=cIiLqmfm+vYdVKmG+GNYNX5be0nbheIFzXVWtAlhWk+RkRzT7DmA5ieXvUPqdLNHJg
         7qKKpuS8ObSV0MARDlnM5CAo+7MDTX4ak8jXAHFIS0mwxsbjEh6pZXJaa5jxfXT/uZL4
         MGplh7lO0U5fL0q1KZIf6j9+8p65W1FDt94xvRdrW8kjyd89qAvLVK+gWiIX5yZ3Os2D
         phjLCO4Rjv9T5HxiLUb7PLxZ1moW0LtDI4OdEbwwKryEji5GMBwNNeSkBKt4Gk9UX5JJ
         mbMesFVcZTlLQFBYv+zCzyyYw5Wjis1uudk2Z0hR3i+EWE0JSofRkSx+MA8lLXRhvjcf
         oDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t8D1QHQCpi29rzUZgRP89fJD5YqRNF7ocoA5T9SiKjU=;
        b=I204HtvNS3ULBA8AsrvHC0Yag57va+tuosOPF6aHEyUmOprFX7DSokbDAKD9QVG0n0
         s9TNrkoOJrzCABGVrpfwm1WOgW/KPDl/YCi4jw1QiPv45Gea8+xjeLgGv7EzFQ8pQoAI
         lJC2dCi5despGDwUS1HUFlJiMVfELw2IEOr0LVrCNSeDhXm8StE3KraUzR89SdtVXVla
         7h0CfDrOQl07UOII1KuGdJudAgiCRM4LV2lnwzPyn7Cx2ev5iGQFUQEoZX3JfyJgRz+K
         DtGybjeS1xuBpWbwbCuPn3XTrGK1XJ9Dd8dP4o5WgbpKGF8X0L4Gu67DXmm71dWrPC7t
         m6mw==
X-Gm-Message-State: ANoB5pnVB+ak7txlTDUt9WMDa+CugvstqEzzVWVDIFAQlyH8rKdXl8Rc
	4DWmtlCsu2oUtSYVwbI7QYBB1g==
X-Google-Smtp-Source: AA0mqf4s8dwZrPgP5uaIipu4vmk7CP2r3nM7cQ0pGxmNAWVLRsr7PWOLyYeq0TYAdB7CiUq+wPdd9g==
X-Received: by 2002:a05:6512:10cd:b0:4b4:b8b9:e304 with SMTP id k13-20020a05651210cd00b004b4b8b9e304mr1712294lfg.22.1670575965824;
        Fri, 09 Dec 2022 00:52:45 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j7-20020a056512344700b004a100c21eaesm172948lfr.97.2022.12.09.00.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 00:52:45 -0800 (PST)
Message-ID: <500f9bdf-0de1-d6b2-1f09-11128699ce3a@linaro.org>
Date: Fri, 9 Dec 2022 09:52:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 7/9] dt-bindings: mtd: Split ECC engine with rawnand
 controller
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
References: <20221209064317.2828-1-xiangsheng.hou@mediatek.com>
 <20221209064317.2828-8-xiangsheng.hou@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221209064317.2828-8-xiangsheng.hou@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_005249_219216_989BF3F8 
X-CRM114-Status: UNSURE (   7.77  )
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

On 09/12/2022 07:43, Xiangsheng Hou wrote:
> Split MediaTek ECC engine with rawnand controller and convert to
> YAML schema.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


