Return-Path: <SRS0=h4nU=NZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45707C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 10:06:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EF87610CC
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 10:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0EF87610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QT1e+Boil0sm0dNIO9322WHRZ0DaRcbBvkrPU1AkNWc=; b=vwYe6/zyecnydxtuPTd6Vt/NYO
	2SLh0k5dysGQurj7wkWQY2usQTfePozhTAqe0dVCMToSk5i9m75LAARzgGdfH7cDOurlT/vlYd0kG
	SB1AEQSU60MoMypGqKfl18UH3wgxVksmIkuNHfZCX028qyzSo6dczA+WWb9AoubASBQ8kq3dKtRCk
	m6kuUlX9iSAAv1k9ahUclzJ96wvp5jVBcJWdcb42lReh2iW3yPziKvpylw0RUhHJhfUEZhdOUoCeR
	9y9LzKCFV+uGgoWq3WlDYsAyHwyecFZPMlhm6S7q3Q2bcUhsJ9hRt7ZbmBNlYPV4W6ZFAto7LpR/e
	ug3jmwrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM65V-00Bd9F-45; Fri, 03 Sep 2021 10:06:21 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM65S-00Bd7O-1P; Fri, 03 Sep 2021 10:06:19 +0000
Received: by mail-wr1-x42f.google.com with SMTP id x6so7410205wrv.13;
 Fri, 03 Sep 2021 03:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iNmWH11IfHfGgA+hr1tDCMgJNkp9fxHtUXct3dWs0WM=;
 b=ghnwOsqiqgmNVkfIqwYH+BiPPQa3gWVNLTPl6O3BMJ4jV054Ys+am8yP0fWf1sUuqf
 hD+XOJ5cJrJeifs8GFp1wprFn3k6erFwWINEs8X7y3BmwmIYLjG5qdMyU3SmHVyf8uwk
 GxIH1h1X6oOHU377BbwgpSWOomBiD98heFDH6Tnws8/7Tlmg2jjVqJAB9nyomBvMMvBL
 7gFQYwwfC5fJkNkSvk8ZtkJzeHfJo9LTzaRCQqIBUPJAEOL84N3i+BYtg1rceqM/KwMB
 4Y82A3UJnIE+BR5QZcCnzoDpl9HBcJUaIKq2nkScqnVudyvoz3ugr+MbG1TgjyeMynR6
 qcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iNmWH11IfHfGgA+hr1tDCMgJNkp9fxHtUXct3dWs0WM=;
 b=s2PAjSOJFf0oEAGYau284SdThhpaFdkCjBfArrUgkBtM7UitAxkw4FMOxdkXLRIg5k
 2FgFoPRTXfu5MYkktU6ZzoW59ndZgVgRZUa5+cI+ztjklo2/G4OtUq0B9QYHSq9pvubO
 M/rtz6dSfmr05ez5WVUGGLw0jlgc9MufAcxJyJZJtCrlNfuDF6pELyODmTCko09aolTa
 XyvDotQjqwXB22n4oP6LiSjgJmZPhzl408/jWtypLK+w6tp9chMGpb4NF3AugmkNJIeO
 FjWeoPQuUEbWg1sNEBeAFBlFAR+ABfvboSU8CnBYuGSlIJT/P/juI720cw0TVl0kHuwf
 LV5w==
X-Gm-Message-State: AOAM5303ytnKgXMgFdDWFcyl64kzVDukUBPDxgMisur+tw3ka5BC3JC0
 1z1sVyj1bGfex6FdTt2zjrs=
X-Google-Smtp-Source: ABdhPJwlJP8tBN1TuNmAVwZFdWKz9KdIFxPvHfw+0UDerVYp2oCZxX73DeyPcYhLhTflLW+0x4R1wQ==
X-Received: by 2002:adf:b748:: with SMTP id n8mr3069436wre.133.1630663575285; 
 Fri, 03 Sep 2021 03:06:15 -0700 (PDT)
Received: from ziggy.stardust ([37.223.140.66])
 by smtp.gmail.com with ESMTPSA id d9sm4176444wrm.21.2021.09.03.03.06.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 03:06:14 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] arm64: dts: mt8192: add eFuse support for MT8192
 SoC
To: Yz.Wu@mediatek.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>
Cc: Seiya Wang <seiya.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Tzung-Bi Shih <tzungbi@google.com>
References: <1618384669-30070-1-git-send-email-Yz.Wu@mediatek.com>
 <1618384669-30070-3-git-send-email-Yz.Wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <048c7ac6-e91b-14ce-17e7-a291df2763b4@gmail.com>
Date: Fri, 3 Sep 2021 12:06:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1618384669-30070-3-git-send-email-Yz.Wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_030618_134355_DC1077C6 
X-CRM114-Status: GOOD (  20.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 14/04/2021 09:17, Yz.Wu@mediatek.com wrote:
> From: Ryan Wu <Yz.Wu@mediatek.com>
> 
> Add eFuse node to read Mediatek eFuse
> 
> Signed-off-by: Ryan Wu <Yz.Wu@mediatek.com>
> ---
> This patch dependents on "arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile"[1]
> 
> mt8192.dtsi file is needed for this patch.
> Please also accept this patch together with [1].
> 
> [1]http://lists.infradead.org/pipermail/linux-mediatek/2020-November/019378.html
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 9757138..4d4e4de 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -436,6 +436,11 @@
>  			status = "disable";
>  		};
>  
> +		efuse: efuse@11c10000 {
> +				compatible = "mediatek,mt8192-efuse",
> +							 "mediatek,efuse";

Please fix identation.
Binding description mandates a reg property, please help to make the patch
better by adding that property.

Thanks a lot,
Matthias

> +		};
> +
>  		i2c3: i2c3@11cb0000 {
>  			compatible = "mediatek,mt8192-i2c";
>  			reg = <0 0x11cb0000 0 0x1000>,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
