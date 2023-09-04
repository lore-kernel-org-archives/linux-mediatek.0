Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A94FC83F3E
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Sep 2023 12:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xyfz+f7VyGeUd0ysOTxZ3d34KQmY46MduGm04AnUCII=; b=OrQVio5fTdwB4CWj/iGtEsXJSA
	JD8hR9CvtOdIM69cCLd/JdV9P3LZnqtzzoZ8H7/ffVocq8HEdiAU+b1ucCjNUtL6oAQGl3gt+bGBe
	4J/5/b3Z11dknT+szBx9nUmndX76+vE1JCOF6rkVizJ5NTOLz1pNyyu99rWPFV8t8GKKKp6LKyt+w
	zA1rId2rk48tY2tJpB64X/hS4BsrC1LMEFcYK9+QshmV7W8Ld3x5lWNvD/mL5jg6SAUjAkcUbOlHt
	HnUEFRZ6Q9v8u9Utgw7oYXZQoiYeFj+Bs62aDsMoTG1naOu3FBUXhgJ977eH7fS2x/VPt56aGTrBn
	Udw+MPIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd8Qp-0043HK-0e;
	Mon, 04 Sep 2023 12:11:51 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qd8Qm-0043G3-2N
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Sep 2023 12:11:50 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-522bd411679so1899790a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Sep 2023 05:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693829507; x=1694434307; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xyfz+f7VyGeUd0ysOTxZ3d34KQmY46MduGm04AnUCII=;
        b=XnkxInqZwY0dWQ2NdFGPO5gO3FTokkXfVd6Pwj2V2dqc7bzCKQ5NdqWU4pqxxrJUf9
         PjfKBVsNLsf1JynvHJkrtWSNz4cZsDXUCzlVIaJV/gf130ZBwXysvjut9kdPDx4p5lOS
         co/TeMdUZulrd6N5g4eCMhy41QnSLluLFxuawFWDqRzOuvDuIR1KdOkrJZGi3R6hYesR
         yUTK449i4xJKMiQ+EkSwTW5O2UVbrxer4edh16pgqtdcKNBRs8XCiinGuduGbjhvJKbT
         De+XpmjMcGWBAEmq09VYPn7Fyd1He/zLbNwxzsSmuLcD7rEwVD+tT4dT/VzCeuCmSU+3
         knwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693829507; x=1694434307;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xyfz+f7VyGeUd0ysOTxZ3d34KQmY46MduGm04AnUCII=;
        b=I62hhNAHlvSdYTuazgFBgzzE1lUvkNuBxT9esrFXrOdyuG9uaooPaKiBpOLtTFa9G8
         QVuAyQ3a3Ygu5egildZKnLyFiE93ITuCSmi2Bn0DFiKv8FZxL/8nNow9dKZzNSjO83l/
         l3jXWdLUCnYe3Um/HP92lLWA7xYVphlauOHHP/P4/Fgjvroq/Io/a8uT8x4urfw/akSr
         kUe8FHUSCtY+v2jplbajBGVdl0EIbSuwP654i7uGi1N0gjBMzWMEbGTuuWhp2dKXTp66
         en0anHBjuhlhOQrbyp87R8kCIoDaF0BP2FJxYwhomxlyujqkpRR/kyyRKByzSNnaQH2E
         v05g==
X-Gm-Message-State: AOJu0YzFRzug/AIiXb/ItwzEZgfr3I14PZj3fd14lxwBSRajUVVTLaTN
	g3U6UH/fHBmKS3ev2yC7IvbvSQ==
X-Google-Smtp-Source: AGHT+IFB2Jh7XUiVV5an3Jp+fAAPvez8NEAQzLDG1i59tLqMZgGpLkp9bUYtaUJ+4kgbsc/ATfvo6g==
X-Received: by 2002:a05:6402:120b:b0:51e:2e39:9003 with SMTP id c11-20020a056402120b00b0051e2e399003mr6398291edw.40.1693829506925;
        Mon, 04 Sep 2023 05:11:46 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id i19-20020a056402055300b005233609e39dsm5821877edx.30.2023.09.04.05.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 05:11:46 -0700 (PDT)
Message-ID: <97b82a16-8710-9430-35c8-673381aaa417@linaro.org>
Date: Mon, 4 Sep 2023 14:11:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/2] dt-bindings: arm64: dts: mediatek: Add mt8395-evk
 board
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>
References: <20230904092043.5157-1-macpaul.lin@mediatek.com>
 <e2e35d4d-7853-fccc-28c2-b8ecf309d6ec@linaro.org>
 <00f0a1cf-6246-92e9-13b0-cf31bb292a94@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <00f0a1cf-6246-92e9-13b0-cf31bb292a94@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_051148_802822_1AA2DCB8 
X-CRM114-Status: GOOD (  13.56  )
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

On 04/09/2023 11:50, Macpaul Lin wrote:
> 
> 
> On 9/4/23 17:33, Krzysztof Kozlowski wrote:
>> 	
>>
>> External email : Please do not click links or open attachments until you 
>> have verified the sender or the content.
>>
>> On 04/09/2023 11:20, Macpaul Lin wrote:
>>> Add bindings for the MediaTek mt8395-evk board.
>>> The mt8359-evk board is also named as "Genio 1200-EVK".
>>> MT8195 and MT8395 are the same family series SoC could share
>>
>> How can be the same and have different numbers? You sill need dedicated
>> compatible.
>>
> 
> The SoCs mt8195 and mt8395 are designed for different market application 
> and physical characteristics, using different efuse values for 
> distinction. The booting flow and configurations are controllered by the 
> boot loaders, firmware, and TF-A. Therefore, the part numbers and 
> procurement channels are different. The detail information of these 
> efuse values is proprietary, so I cant disclose it futher. Hence the 
> most of peripheral drivers and base address are almost the same.

1. Drivers? So we talk about compatibility, not the same.
2. "almost the same" is not the same. Follow the guidelines for writing
bindings.


Best regards,
Krzysztof


