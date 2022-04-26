Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852ECC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 06:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qx1X4aQ4L86/daizkamoRmh2EbP3i29OUbZd1guDpE=; b=v2mPCiGLQaOivb
	CEnvtZeSWlOL0U3ZIwCF2EfZFNCUolgv7PkLcijT2I5SudJam98CxiTmbQ6ztk7WZx3+ESbPajkDE
	I049U+KRZn+6/VS93lIKjjjQhQgKB/33DQOhy+Ww0DrCfGmkGritcuIUeIH65RfNvmq935n9vIcdQ
	RiOrJEmhWWgXQeUduHFCLtDEKIcF80NXiHo8lKy8c7/6sAWT7TUQTVkaEyUaKelL4BJC/usyD25wV
	6GGadQXPSGF8M955PiPadNAK0Ma38ZWgd9+7UG0pLOS+hUNc4JpwTlNwDxvkPHIDkf+0tYIP1k/sR
	qUSVT2YsnzmpF3HalJWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njEjV-00Cjkx-FO; Tue, 26 Apr 2022 06:31:33 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njEjI-00Cjei-Jx
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 06:31:23 +0000
Received: by mail-ed1-x52f.google.com with SMTP id b24so21023877edu.10
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Apr 2022 23:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=o60Xdt5/lIQwm3L1GGhGdikwdOr9Y2T0obDjUUJBvKM=;
 b=J5JP8COoziPIOC17a1AheYKEJ74nJMdOvTMVfjYEI62ywlbIffHES6TQyJ5BFbsjaK
 tY9ZyUKyb9v4HGphUo/lSTdBB3cioJKtkzd6i+n7lg4Zn1uTju1dAIwnS3f2Q+qzDS6d
 cB8OUjlNse0gs68Usif4169gsBrvcoKvNWM8ShCNQC9l8ns943iDaQO1cp3erX75a8q5
 ME5XfexVA2CzmiLdNs8XgcRIwqWsxTAHjM98eosxAtu5ovZ/VcuaouLPy5I2Ey+//Ok9
 jebbYJa9e/jOJ4HAf1lBwWUvCRN7R4R2a3BaaOlV82IOVI6z/tVhzK2TuFQyOtcY/jFQ
 KRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o60Xdt5/lIQwm3L1GGhGdikwdOr9Y2T0obDjUUJBvKM=;
 b=X13fzkCKUlCwxXqvDJ1r2QuOOVKvrf8JC1NDNEyWzi6ZGBcrpeY2s52AQPs1/PW95R
 y6wnsoZeBOBi4kl1GHiB5O0K3ZP1KKd+xG0D31l7Et48bCWx7dtPNLwOXfqMTQdMJpy5
 qVE4MWn7xebDvwtYk2uguh7XWoBkOlwcWI41dcY02SWJs4xUTTwuvgpuhlzoXTMekUNh
 gts4dkGH1KElYPkDuMaL1ZbPYJk/O/D4NxotgPtcMy2QEOjq2l4vbVCGAlPl86Kb9L5Z
 S2rpggr9byVEsB8WRFgfs7thL0qK4aWi7HWd0OgnBht2/Fy48INk3RffpvDK2tIHn/Tt
 gcfw==
X-Gm-Message-State: AOAM5328Tr4MlIXS08WSqjVCxxBsQVHPafNYDQKdLhNo0IdLfD2ejV+g
 fZRmxhM2zvcVJcFD4yHkeEC5tA==
X-Google-Smtp-Source: ABdhPJwxSeWO8cf9PYw5+0di2Y79/EaTY+pCk5EE82cxph/Dq3q5Z8dUFxTXDfTKxIZkq+xt1jrpKA==
X-Received: by 2002:a50:cd8c:0:b0:41c:bb5a:1c7b with SMTP id
 p12-20020a50cd8c000000b0041cbb5a1c7bmr22624009edi.351.1650954675180; 
 Mon, 25 Apr 2022 23:31:15 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 lb18-20020a170907785200b006efe7bb40b0sm4347749ejc.74.2022.04.25.23.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 23:31:14 -0700 (PDT)
Message-ID: <0169c4ac-fdce-29b7-553a-14dc7df532d1@linaro.org>
Date: Tue, 26 Apr 2022 08:31:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/1] dt-bindings: nvmem: mediatek: Convert mtk-efuse
 binding to YAML
Content-Language: en-US
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Lala Lin <lala.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
References: <20220425084800.2021-1-allen-kh.cheng@mediatek.com>
 <20220425084800.2021-2-allen-kh.cheng@mediatek.com>
 <e64bdca8-7b18-b450-830c-ca07946a73fb@linaro.org>
 <9d65b713e3ffdd34dcca532c4c97fa98b124bde4.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9d65b713e3ffdd34dcca532c4c97fa98b124bde4.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_233120_821265_B8F94273 
X-CRM114-Status: GOOD (  12.21  )
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

On 26/04/2022 08:23, allen-kh.cheng wrote:
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - enum:
>>> +          - mediatek,mt8173-efuse
>>> +          - mediatek,efuse
>>
>> Still no changes...
>>
> 
> I just want to confirm again.
> 
> "Generic compatibles should not be used standalone"
> 
> It seems we should remove mediatek,efuse and keep "mediatek,mt8173-
> efuse"in binding. have I got that right?

You should comment for which chipsets this compatible is and add a
deprecated:true. In such case it cannot be part of enum but separate
item in this oneOf.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
