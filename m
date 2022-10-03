Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3740C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 13:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRIMiFRHxfdGJDjG9K9HNpuOScDcKnyF2oEGJoSrlM4=; b=WFpj8A130tAy5LSVjI2fH2WMwd
	+ZvjRdCLAwB2mh1wNfKG9bxSfhjYXovo0r0bRJSDn7vi/wAFj6KGb/VFSbBWNYHJ2JoLKXHXaEJFw
	PSTWXks8On/Z098yRFsNEOQrUcn1QcoHrNJclNse+DjPZ3Blx8I6NjctvUQb+jslzmZuyUDkSavr+
	2cVm5yln3Jx/v31kQDgUxT6Ze4xS3pqiwqSxH4+JzxNKgFkauFJiLMpgkU3qrc3nY86sIpy8NCXiR
	uYXKu0t3Pfbp/ttGHQGDgGfjbm6wGqKS5H4a09E8HQdvhJsXDeuPDstDPEkrOkNcNe26KZyp5AbLJ
	+n/iaLfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofLTC-005zGv-B6; Mon, 03 Oct 2022 13:26:54 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofLT1-005zAt-7v
	for linux-mediatek@lists.infradead.org; Mon, 03 Oct 2022 13:26:44 +0000
Received: by mail-lf1-x131.google.com with SMTP id j16so16594769lfg.1
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Oct 2022 06:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=yRIMiFRHxfdGJDjG9K9HNpuOScDcKnyF2oEGJoSrlM4=;
        b=CCRAtD2B/gDLVtVgCmF4Q4OjwVBw0wDfwOpTt6CScLf+G88sFEV/U0as01pkrtLJ16
         mbfWdwO8Ozs19RiYvPdK81wU+r7P3sNtB3Oy7Y5NQbHzqzCU4kpcqnM1RXShBFJmTPZT
         VUkLDyIh26H2AIFUyvItrin8K2vImbAVe2K5Pn2DrjRqwLcF0BZMzV1olxAh6OCqYDSI
         8J9VYJxfljrKOO/LxRMCB9y1+rt7vzmm0iXKLw4QeFs84RtVvRK5Q+5eAMMKrgnNUjSU
         Arwdq+AcHdKwNzpsSUC8jrNjmjXUKuYBHvBYL0p90ahVtkkf577LrrkKk8sLqA1wxy5g
         gVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=yRIMiFRHxfdGJDjG9K9HNpuOScDcKnyF2oEGJoSrlM4=;
        b=6Q/njdGte9yWrmqq97ciw6Z7LfAimnbNr4OlcpJLbWeMyqU9ClOIaSigYB0+1ONiLO
         +vuGZxuiDxfYXCMiGmvfeKBQW/Kjt/+lhQ+j1dwiHQCD6+24na6RyxNSXaxUX6dQsSe7
         eK2egGlTDt9IpTwGp6R3xsH3mSyKtSAI1Z5e++EgkP5ro5MacfxY5iVhyeuurFlmCcVp
         P1rzceJUEMmd0B/MeB95oeE/tEVgL6FVl0MFXoDiDQ6R/nwQyUkpJdM2y1CJCyX+Usgg
         aT3DHMr9zCsT8SJ7ThXcrCKlbbMEl2bU96t2dm+iXXTuXex5L84AaLBmOWuMdwkkOr4V
         NcgA==
X-Gm-Message-State: ACrzQf03BbvtdxLu+mSEQJ30PyEYPupywqboxDCXutYICqxhEh3Y2dut
	v9xkeA22RjeyBArRTklF0pGmFg==
X-Google-Smtp-Source: AMsMyM6LLORTXjbGJao6foKAioZdPQngaNSwlkj1I2jJGoa7BH0czKJEH7M00qNEosJEewFi3Y8F1w==
X-Received: by 2002:a05:6512:234c:b0:499:9c33:af96 with SMTP id p12-20020a056512234c00b004999c33af96mr7094704lfu.545.1664803600423;
        Mon, 03 Oct 2022 06:26:40 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id n5-20020a0565120ac500b00492d7a7b4e3sm1462850lfu.4.2022.10.03.06.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 06:26:39 -0700 (PDT)
Message-ID: <01ead0ea-d0c7-7878-e411-c00cb5f78140@linaro.org>
Date: Mon, 3 Oct 2022 15:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4 1/2] media: dt-bindings: mediatek: Rename child node
 names for decoder
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220930112237.14411-1-allen-kh.cheng@mediatek.com>
 <20220930112237.14411-2-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220930112237.14411-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_062643_302778_C6201E7B 
X-CRM114-Status: UNSURE (   8.86  )
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

On 30/09/2022 13:22, Allen-KH Cheng wrote:
> In order to make the names of the child nodes more generic, we rename
> "vcodec" to "video-codec" for decoder in patternProperties and example.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml    | 8 ++++----


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


