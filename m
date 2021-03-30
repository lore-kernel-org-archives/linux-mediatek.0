Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41476C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 08:42:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE83861996
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 08:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE83861996
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6gW8beWP451tn1waoNHVgqRDeOd9gUJi7ViVzO6BTLc=; b=PHrVel0zx/0wsVJpJNN+CoZQS
	TaVFxX+97Yf8oXGviG1b9FwtkRLcungSpsTV9P21WVObtfMB4OM3m3au9yuCfc5UgX5lGuvFt9I1Q
	8G+DCAQnpZrzEEodjmW1Pe6UlHg+kndfaqKd8W7XxqOh4OZyK+FaIafVYjLvH2dtvJ085tSwhAY3+
	g2QczQK7Fbwldt1mWMCtMY/P6tuT9GjLEU7Pd5iuA60v6FUSqb6GWs3/LwecNgN7/dNBRytyWI8lU
	Oozu+T4vWgGcGcFYeYjYMU8IhbJi1lCTDfypXc1mHvovIWEaEe0naogP8uuC8DfHAjFDVLesxDYdi
	sTupJXCPA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR9wv-0033z4-F6; Tue, 30 Mar 2021 08:42:09 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR9wp-0033xm-KO; Tue, 30 Mar 2021 08:42:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so9801662wmy.5; 
 Tue, 30 Mar 2021 01:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=krsQLivBerECO2Nqnyy+OB10H1EDkhWoiyrKaCeb8Lg=;
 b=oiNBDmPzq3Y8fePN7nMQ7AdgARgd2zgHYC8Ssu+rZLzCWiorRcFC+SCUNsS/6bFO2R
 Fqhv/f0Yqr4jtU3zrQvvM208t/90Aq/yM2yzuYeSGYVugkImN1XgtIazsb9oXvEIallP
 LHA1XhdAlyru9GKMTcn38n+SL9uz9mh96qNuf4XW1RVd/GWiVQFoGqg32SSQqdPuXJs4
 VSIBP0SYFWDsdilp2V9Y7L+Q+t2THMCJTSFDVtVODcTbLuuKUofgu/LVRd8PEoE40750
 yG8iC4QAz9/thXCSPNf0V9svWo3QAdziFFCW3YxM3JNB/y8b3De0CxxZpj0SlMKxU3Wm
 ljjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=krsQLivBerECO2Nqnyy+OB10H1EDkhWoiyrKaCeb8Lg=;
 b=nk3lx6v3ubSsgjy1nqIlduLZgNhgQdBgyjSaoAD9h0kAlJscak4FTCVdYlef92jLT6
 StV/eykdxhV7BiSL1j0LjzY4lf+tr/KITiyHXfAkQWmlYGYXsPz1CdHDfdFJgsh2bP9v
 1azGdl4npOl/eN6L2XdphMFlYolcUF0H7jJ+k5ENW3rOdWiodzUByayurJwc19Jgxc4g
 R6K0PC/+Itky9/A0iiWlMpyANKfqo+J5sfZgwyXTZ1RY9Juzw8sWL2vtpzzGtLGLqY6/
 H4Gojxw7EfIi3YTFkEbjDxuPzC+drko8mzf4jWAz2mrLelLt9d2pVus1C5lvNo643Qmc
 sX2g==
X-Gm-Message-State: AOAM531nJ9J6iBBy2lozmksfW2Y003I9bzO0VsHzwAoFPXEXPCtCXYIH
 A53R0oaoxD1y57S+hwyciY8=
X-Google-Smtp-Source: ABdhPJxXscwjMq30pZb/7xvIHlD4sO8yvNnKjS1cmRihsXZaHln4EdWnmUPxzuVBmI+hb/+tVRybtQ==
X-Received: by 2002:a1c:b783:: with SMTP id h125mr2877539wmf.106.1617093723153; 
 Tue, 30 Mar 2021 01:42:03 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id c6sm32497708wri.32.2021.03.30.01.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 01:42:02 -0700 (PDT)
Subject: Re: [PATCH v4 1/2] dt-bindings: nvmem: mediatek: add support for
 MediaTek mt8192 SoC
To: Yz.Wu@mediatek.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>
Cc: Seiya Wang <seiya.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew-CT Chen <andrew-ct.chen@mediatek.com>
References: <1612151986-19820-1-git-send-email-Yz.Wu@mediatek.com>
 <1612151986-19820-2-git-send-email-Yz.Wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <779f47d2-f735-aa78-c40c-8905cd9f65b9@gmail.com>
Date: Tue, 30 Mar 2021 10:42:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1612151986-19820-2-git-send-email-Yz.Wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_094205_448465_9DDFF313 
X-CRM114-Status: GOOD (  17.60  )
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



On 01/02/2021 04:59, Yz.Wu@mediatek.com wrote:
> From: Ryan Wu <Yz.Wu@mediatek.com>
> 
> This updates dt-binding documentation for MediaTek mt8192
> 
> Signed-off-by: Ryan Wu <Yz.Wu@mediatek.com>

Applied to v5.12-next/dts64

Please resend the DTS patch with the comments I made.

> ---
> This patch is based on v5.10-rc7.
> ---
>  Documentation/devicetree/bindings/nvmem/mtk-efuse.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> index 0668c45..82dafa3 100644
> --- a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> +++ b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> @@ -7,6 +7,7 @@ Required properties:
>  	      "mediatek,mt7622-efuse", "mediatek,efuse": for MT7622
>  	      "mediatek,mt7623-efuse", "mediatek,efuse": for MT7623
>  	      "mediatek,mt8173-efuse" or "mediatek,efuse": for MT8173
> +	      "mediatek,mt8192-efuse", "mediatek,efuse": for MT8192
>  - reg: Should contain registers location and length
>  
>  = Data cells =
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
