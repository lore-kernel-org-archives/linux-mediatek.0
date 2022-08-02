Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD2EC00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 08:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npQP1PTeFOBz/aH/qk/2cJgnMA7yHhXLpALhGeue+vw=; b=OJPlPKvW3IfPfF27TzTi6nlo8i
	kRGE2KWbKrEvQYSDF8/Ji/zYXdANqBggfPQsM0heV6rEhqk2zjUz52IvTk7iNL7wq97oAWe2m98je
	/PjNsHzEcgnfN6Kc/e+sU/vyVVZEbDWAf1WDUNO1uGJrRP0xruzLnZrWglImlE26I2W9f7BNmSLrg
	YpOcpDtYcs5daBQ3YO/wMEK5H18dlh+N/r6eItXzkK4yTF0QmUoAkUYbXCSgnLpEp8ePdOLApcEij
	MraAGNFwHfFKF5ahiJ9gHU1esh+9Ue4AuCDi3Y9Re2BluRAGZptnvb1reTnM/FjJWQAIV1l1dHXVr
	k6uHxPjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oInjD-00C6QL-BZ; Tue, 02 Aug 2022 08:58:15 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oInjA-00C6Mu-B9
	for linux-mediatek@lists.infradead.org; Tue, 02 Aug 2022 08:58:13 +0000
Received: by mail-lj1-x233.google.com with SMTP id y23so4582444ljh.12
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Aug 2022 01:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=npQP1PTeFOBz/aH/qk/2cJgnMA7yHhXLpALhGeue+vw=;
        b=wrhadkP9rdiZt1XXIHzWWCrjD0rl5hQMS+ZHqpbiG8Bt2LLowIhnWcU7ppEYLP+n5h
         feQRYMFdysj8IjhdN8uy//PHWuS2s0gAwNG2Tl4bJRy/VJ9+pKLcCEgofn1G/zzwOdbc
         Bklq4hdGFHGafaOmpt8fbbRFgY2Swqfn0djw4xHaNIQUxdGw7fQt/cg6ATRE6IJ64N3u
         SJgUmnLAuwZUEPt3YYr+G8Cs5Yl1YdtfUahwTnkJ/1KXe+/za3ugN2PeP7+3or95tLx+
         zqcqdUUdODthmLA5lyqRvz90oSbF2qfLtF5jWkgC45Uoo1xD+XGM0+Lw/wJ93t2KtsXd
         AgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=npQP1PTeFOBz/aH/qk/2cJgnMA7yHhXLpALhGeue+vw=;
        b=ThB5ux/Z2gzIQIuwrzEDJjSprC/fT2Ry9xsc1r1B2Hnh2anADpkBLxBVPmsEmyH5Kh
         9V90o4ljffA+05CBwQdNQH5OulhlEagt6pXomznljxhb6pmvVnRszQECt2MwXm4QPMCo
         xo36QXsOlWq+7G58b6xBxkb4nQA1a6heM2k8R0P67jmRAhd7lGh3yVZV2q+qceomdYCU
         PqShbMOwVUIfvN0ekcdvQwvBQDkMMiA1TSytdGjULednz2JCTktbYQnmdxRorD+stJ2B
         ATC2eXxb1a7o3NM8wEt3/M+uq2pRjDZmBWX3atQAM4BKE59A1yUFXm1RwLvhCAV8r2a6
         5LMg==
X-Gm-Message-State: AJIora/kx8+FKz6FfnVM45y80WXAQvoO2xBxtHJwUSt3tKhKBrLubpf7
	LPaR9leNmCIVCpo76KT0Kh3SkQ==
X-Google-Smtp-Source: AGRyM1s6TASgKeoeefB3kojxmqJkb8Ddf94gvx/txy9BStGigDLYfFEvUo1PUBytil1oYOafbF8+hQ==
X-Received: by 2002:a05:651c:179f:b0:25d:ba24:2e16 with SMTP id bn31-20020a05651c179f00b0025dba242e16mr5887088ljb.422.1659430689430;
        Tue, 02 Aug 2022 01:58:09 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id bf43-20020a05651225ab00b0047fae90bfb4sm2033495lfb.56.2022.08.02.01.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 01:58:08 -0700 (PDT)
Message-ID: <b265c106-373f-3850-2933-9418c2b515f0@linaro.org>
Date: Tue, 2 Aug 2022 10:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 06/20] dt-bindings: power: mediatek: Add bindings for
 MediaTek SCPSYS
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220729063208.16799-1-tinghan.shen@mediatek.com>
 <20220729063208.16799-7-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220729063208.16799-7-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_015812_682094_22526CDB 
X-CRM114-Status: GOOD (  12.18  )
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

On 29/07/2022 08:31, Tinghan Shen wrote:
> The System Control Processor System (SCPSYS) has several power
> management related tasks in the system. Add the bindings for it.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Thank you for your patch. There is something to discuss/improve.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +
> +    syscon@10006000 {
> +      compatible = "mediatek,mt8195-scpsys", "syscon", "simple-mfd";
> +      reg = <0x10006000 0x100>;
> +
> +      spm: power-controller {
> +        compatible = "mediatek,mt8195-power-controller";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        #power-domain-cells = <1>;
> +
> +        /* sample of power domain nodes */
> +        power-domain@MT8195_POWER_DOMAIN_PCIE_PHY {
> +                reg = <MT8195_POWER_DOMAIN_PCIE_PHY>;

Wrong indentation.

Best regards,
Krzysztof

