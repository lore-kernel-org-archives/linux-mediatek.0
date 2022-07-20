Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4512C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 17:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aeyafCkyinZJZTTcPy1wEfXMzXWZcIm0MV4FRs14iJQ=; b=gK406DHFGCID2K5r6RRtzv+13P
	rbn19kr6/iFQ21Plt3aaLTOU0a0YmhV6hFS+ybaMekoi9i32E6vT3z2M5hoEMk+pTfVEErJM82i80
	p1ipjGzHCL0zSLXshjMbzyo6vmvc1GmltKTW0dAgKYS8yAdDNijcwZTchSHHhlIaRA22ALXHpD28X
	j7Xj3BwX58dgGicKKdLs2V2+f0MOv+dspUMKGsAifgbd8/z3AwiepkkidiYP6UW1/MQR2g9W71N5H
	rRI99dXeaE5UXNayWP0uWbHY9FjWX9Vk1yL4qQg5Bn74/Hz+k6iJ7fhaLVInTFI4kvf/FrhZet8Bh
	8gKnyccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDfV-008jzv-Ul; Wed, 20 Jul 2022 17:39:29 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDfS-008jxe-Qr
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 17:39:28 +0000
Received: by mail-lf1-x132.google.com with SMTP id a9so31440168lfk.11
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 10:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=aeyafCkyinZJZTTcPy1wEfXMzXWZcIm0MV4FRs14iJQ=;
        b=zreXvg79hkBxKuShfS2H1ZVu3CjpX0spc5x+RYWSF3KMxuyjz5fLD7BBgfbuNGIvaN
         a2Wol5GaBcqFJs24Or/Cx8yVs8kKCzk2Q2Q+Kbw4VACBuD0IgavdZPfksPMWyjvHRkA3
         Xtom3dAIkGJ5NScEK9Dlt+XbFEMBKHcftw6XKQlhV5SMy5nxSAzs47rcxyG3JKnh9vEl
         /OKrKhIMKbRVpK72I4APWWgYq4traCLcCWzFv5auA0G14VIFu2oCCHlZ6ikxN3c33nsV
         XkKmrckQcwEb+7CWFRCHpGWzPJugLd1eKmVhWrUCUnW87mf1rv/60AlQED8RF/yHnS9t
         ELtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aeyafCkyinZJZTTcPy1wEfXMzXWZcIm0MV4FRs14iJQ=;
        b=6c5LqOzq7gXWRyrzds5L0VIS/AD3/7CXcysWZMbsBAYiGIAjll426CzGrWuElr61o3
         Ld6D6h4osWLdEYg2K38Q3izMjf5xhqibOd3dt6oHDziDUS/ZIyeHe1vG+zFmtwbQSoml
         A/uT3Di4aAoSaStp4QCPvoe93PJT0lTacrAf4FscPOn7X6tx1hJo0kMgG54R9VX03U4z
         R2l2Q2H1UiDD5Su10dqnR6RYNmZD9XiDC0zrmlMNjKledx1WBEkJrUrtqdpgqJiXoDAH
         nCPhadXqurGDwRZdn3FCMaw9S8EGRnh+ypKKHj8QW/AsgjtQC3qPs68lXXLNeJ74Ste1
         JlyQ==
X-Gm-Message-State: AJIora94eQ5wi+XP7UVJXm7pCf13ps9e360GIUezca56VP4YTWsc9yPn
	M5Cqy5+cj3F1Y87G7SmxQaaqFg==
X-Google-Smtp-Source: AGRyM1tlok4eLvijqT1LvZXgtABKbS0mRRyNVkb8xzG9GzfNEkfDR+8raI0dXp18XCp0w8HM7jBCAA==
X-Received: by 2002:a05:6512:410:b0:489:d17a:b2c0 with SMTP id u16-20020a056512041000b00489d17ab2c0mr21052431lfk.493.1658338765232;
        Wed, 20 Jul 2022 10:39:25 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id z13-20020a19504d000000b00489e64dcf75sm3940177lfj.204.2022.07.20.10.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 10:39:24 -0700 (PDT)
Message-ID: <085a003e-576d-b39a-60ce-ca8f53c89d43@linaro.org>
Date: Wed, 20 Jul 2022 19:39:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 08/21] arm64: dts: mediatek: Update mt81xx scpsys node
 to align with dt-bindings
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
 <20220720123023.13500-9-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720123023.13500-9-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_103926_939080_9CD88652 
X-CRM114-Status: UNSURE (   9.32  )
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
> Update scpsys nodes using simple-mfd in mt81xx SoC devicetree
> to align with the bindings.

"Update" is not accurate enough description. The same in commit title.
It answers "why" you are doing it, but does not answer what exactly you
are changing here and what is the effect. IOW, you need to explain the
true logic behind it - 10006000 is not power domain provider etc.

> 

Best regards,
Krzysztof

