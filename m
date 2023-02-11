Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096C1C636CC
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Feb 2023 11:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZbEkkR9nvAU97/4Y+LuXIp9nLp3oMVuz++HgxVysnT8=; b=x5gcoXSYEZ5Nfc
	aiiDryBTZUU0gVsBh3VQSHyI+jzIDB1+qTlce2DAjR3U4M7WPXSXM9OWy8fSecRL8WFevRWzboPVj
	hfgkNU9OGCtI1FVm0zVTKD404K7i/zynfPLkXC7SHkt/G/JkeTrzkhH1O2wQ2Yt3MNw/9wnB1K1jh
	aLb54M7pDSRpxTPmex1D3dyUKfbZ/bk5SkZgsZhY1BaF3AFonwZJZEwXkNNczmeWeaNPbGVNTl5Fk
	qv9fwbtVb7X628m7kHPxFE8q2h4VuTG2lNbai2yX36qtKaOl8ws+To0gd1vk3mug7I7V4S3mpw87G
	GMVzH5yZ5sX2p5DLMXDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQoI5-009L9G-2o; Sat, 11 Feb 2023 11:43:37 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQoHz-009L6p-9o
	for linux-mediatek@lists.infradead.org; Sat, 11 Feb 2023 11:43:32 +0000
Received: by mail-wr1-x434.google.com with SMTP id k3so27923wrv.5
        for <linux-mediatek@lists.infradead.org>; Sat, 11 Feb 2023 03:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZbEkkR9nvAU97/4Y+LuXIp9nLp3oMVuz++HgxVysnT8=;
        b=XWPMKRudURMymzIF/gXm57vpMavb5AQQwD9lazHSDhOrNkuKEFD3Q1za4eXp6dzk8u
         1H6uU8ZUQuywwk6NeipUB4Q1BOM5RcgRPP3Iiv7fvzEYvclG8+K0nqS9VIse+XMpDqCg
         APwt16JoWa9YuG14tu2zQPXNni4lNmaKNo8ivxHaiXkZkgCBKT3mogAAG4HqnUyE84OA
         64TudziPfM2yrt6xsKsXQaoRLkV92XUgRsQdsXL6rYwp46BX4D6zEHd4DCZ+p2XEAEFG
         MlEBjVwGp13zXm5HVD7FMUNwr1X2XxDoFvSF/Nr0uD4xE+w6wd97c1bzALxOHC07CQFn
         CvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbEkkR9nvAU97/4Y+LuXIp9nLp3oMVuz++HgxVysnT8=;
        b=4S7ooomHPyPP06v+xjuSRGpdfa/N5YKuvVv5EPAveDeYJ8oxBCqzXKdknAYlegaORY
         rY9qnppRFF6z3iabKAln0/9+6DPH+tgbb0A0NaR2SHMstBEixo+lRFb99Em++vQkHHLl
         HMKZhSOPzqO0lsNoblB28q+clxx3dSHZQdwVpPrs9tK+uhh8B+1UgNX4+joYavLwGcJZ
         az7H7gJLsAlrHk8j0gifiPRzW0Y63t9zC3rOZsJjVhLavg0/xWib6Rx1lqtOi9/pnyZH
         Ux7RPOb3NEcCGdOV+4zoo4tHJWfjXPrpKv1GOCZd15U3afBADycO8QCqfmJsngELMlxw
         ls5g==
X-Gm-Message-State: AO0yUKXb4cGZ/F9k5bqIY5DOUr+KY6JUpPBsm9y0lyjVPdZQ3c4dO+wO
	hRHAuC/JGnlIbqdCSMxLBmathw==
X-Google-Smtp-Source: AK7set+AjZeAj5VRJRyZxpiwq2ZVhwNwNv5wzpMoz4GSz+5ElqCHNWci0n6sGer4zEtrfPcP41qJhA==
X-Received: by 2002:adf:e7ca:0:b0:2c5:4b22:bce9 with SMTP id e10-20020adfe7ca000000b002c54b22bce9mr3942693wrn.47.1676115809166;
        Sat, 11 Feb 2023 03:43:29 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n8-20020a5d4208000000b002b9b9445149sm5960625wrq.54.2023.02.11.03.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Feb 2023 03:43:28 -0800 (PST)
Message-ID: <b2511c2e-a261-1af6-653d-6cde27c8327a@linaro.org>
Date: Sat, 11 Feb 2023 12:43:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/5] dt-bindings: arm64: dts: mediatek: Add rev4 of
 spherion
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230211002626.454844-1-nfraprado@collabora.com>
 <20230211002626.454844-3-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230211002626.454844-3-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_034331_366438_037A50E7 
X-CRM114-Status: UNSURE (   6.75  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/02/2023 01:26, Nícolas F. R. A. Prado wrote:
> Add binding for newer version of Google Spherion (Acer Chromebook 514):
> rev4.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


