Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E681BC32771
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 12:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRQAht+syD+WoClHi+abQcpzAmB47QGZmxwK52W8goQ=; b=jd0eHgJJHQQWxz7RaojWotH9c+
	YUl0lxEiRM3/9GJeKrT+XmzJvPVTUI6ei3COVAxxn2LuiP48MR038/YgASVE1D3GW40WwqAZK3CiM
	ONrz3CLVClHOn1WhoaL3QLwDMcUpsK6yBS/NvVd7KeCQ/DU6UTUjxrnN2kPV2tBvebv59jqztsoZr
	9FP3imJToChcpUt1bFFaC445Tt6TlQooYOpmddwwNY1P+DEL4ayRpF6T8q0rHAAPrbqcgmOPXByFa
	520lbIa82POIyqwrIaRiNl4Ssp7408DUnQ3iqjdc9/3bxt7ULvNT/VmbG8Yug5v7vIBrQA6OUXymX
	Y6necBbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP0v9-007eLw-7x; Fri, 19 Aug 2022 12:16:15 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP0uy-007e7M-6u
	for linux-mediatek@lists.infradead.org; Fri, 19 Aug 2022 12:16:05 +0000
Received: by mail-lf1-x12c.google.com with SMTP id l1so5364727lfk.8
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Aug 2022 05:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=iRQAht+syD+WoClHi+abQcpzAmB47QGZmxwK52W8goQ=;
        b=gAnalwOyubLu6+wLXJWbeHG2l/u2fmMgVQ9Vpx1zAjL7bFzAM5ZzxJQcJDTeot4yn+
         i1AJkCiTdquYltpTVt2ufhmroC5Uj/FxxUY6TdC9cKeyHf3f/ViVjSeGky44Bm+U7x03
         7UcAcO4Ol3ry4gVYmwiLyIvga5mk111OYk+z1mTQjAUBS8QbknoRSmXCcSeqxp3J4BAM
         lGS55fHy2ePWP/sOp3TCd1gTP+zRBRsgcPLcehqXQBBqRL8CghXkoR/xGnXewBmiDEEG
         oqeNqSFRTsqamvLgd0nUvdFvmZ0A8GCy2DBVQx14FWpRe3kQcv0YPrMQacMchQJe6X1b
         96MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=iRQAht+syD+WoClHi+abQcpzAmB47QGZmxwK52W8goQ=;
        b=7AOQqd7DAcXqvrhczinFzxvFMG3syLYqfc5XWitGMB7R1wZhiGuNO2FhTEXRTtT98s
         /jUg233LvdTK8MAEuXa8dkednbEIBni1NN6HrWbc74asHrsI8LyXqIK7fBJLrDxQCMQv
         q9HKqcia0mVl3f59NaFQpfvi189tof2/e3g5sZh2NCMnOn9+NkQKSTVT0Q0FKz6SJ1Oc
         P57XwtEhp6f3u4kitjD+6mFY76k7vBP93OoJdFYzTwNzg0cpepYjuD8nvmtouW1WW4ub
         lavKkWAiA99sWT7Cltf/fKyrEk33c4FUFqajlUyBxOKueWPr9SsGrNQuzpFzq0c+Rwzw
         RV3A==
X-Gm-Message-State: ACgBeo1W1ETFzynKtVgoUkFwuwW/J/Muk9Bc3bKp9avtG1xNcjL8Uu7w
	zCpdT61E4uom+QxFUTbNI4mWVw==
X-Google-Smtp-Source: AA6agR6ZzDgldit3bbnQaHeffN9D/ccyNG3aT6Z0pYd8NszNFSXmXT7adl+3BQtJYB1uFOadxcnBlQ==
X-Received: by 2002:ac2:5e75:0:b0:492:c50a:3a89 with SMTP id a21-20020ac25e75000000b00492c50a3a89mr1449763lfr.68.1660911360346;
        Fri, 19 Aug 2022 05:16:00 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id t14-20020a2e8e6e000000b00261af4754bbsm594964ljk.41.2022.08.19.05.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 05:15:59 -0700 (PDT)
Message-ID: <438da392-f419-ad76-7e91-aa4aab36e12c@linaro.org>
Date: Fri, 19 Aug 2022 15:15:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/7] dt-bindings: phy: mediatek,tphy: add property to set
 pre-emphasis
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>
References: <20220819091344.2274-1-chunfeng.yun@mediatek.com>
 <20220819091344.2274-2-chunfeng.yun@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220819091344.2274-2-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_051604_296181_78DCC567 
X-CRM114-Status: GOOD (  13.61  )
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

On 19/08/2022 12:13, Chunfeng Yun wrote:
> Add a property to set usb2 phy's pre-emphasis.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> index 848edfb1f677..aee2f3027371 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> @@ -219,6 +219,13 @@ patternProperties:
>          minimum: 1
>          maximum: 15
>  
> +      mediatek,pre-emphasis:
> +        description:
> +          The selection of pre-emphasis (U2 phy)
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 1
> +        maximum: 3

Instead of hard-coding register values in bindings, you should rather
describe here feature/effect. If it is in units, use unit suffixes. If
it is some choice, usually string enum is appropriate.

Best regards,
Krzysztof

