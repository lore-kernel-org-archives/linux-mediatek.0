Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF99C00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 09:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7fi6N3RABOBMWCOgXAfDv4FFDxZNs+uf8Zr2BRDwwM=; b=O1vCDNAvlcj2UwtD4exazFWmJX
	idvSG539Un92S/1wSYnm7nb8NXVxBd0uyXEAxiMxKxzF6+ssAC6T3AyIBA14KK2qQ93QPGnfdxQJM
	ylJlNMG5bFvzkgZOxgHm3pyjnz2mqTL6tn98KAQ7JweXz2gq3Zys8h5svSvItRkE3L/xLssApnNS/
	rHu8EIyPa8jbUvykp6b/xt8Z0zRWA9W5l27niqUGfNGi1hEw4E24Y6DwRnOd8/FQN8HVJ21exUcVX
	1a6UY2ONuEsiC4GgJjModSdFvgXsCiSUn/zDlWSymmabDjbQVhT202RaZCFT4q5egCOXHcBHVU1OB
	FRHLb22Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oInpy-00CAo9-Bg; Tue, 02 Aug 2022 09:05:14 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oInpe-00CAXh-Vz
	for linux-mediatek@lists.infradead.org; Tue, 02 Aug 2022 09:04:57 +0000
Received: by mail-lf1-x129.google.com with SMTP id x39so11445026lfu.7
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Aug 2022 02:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=U7fi6N3RABOBMWCOgXAfDv4FFDxZNs+uf8Zr2BRDwwM=;
        b=GSSGq7vw+gfPL5DS1fzXCWGtOOLgZihO8lBtwUiKoowGyKAM+fJ/5z8hP9GXdYUBBw
         DekZ7LSMCREQRYnRyqfd8/kncQPpsbOGd0S99QkBqAFgISMsGSLRppRLqEzzIncNdnVC
         p4aYeSUHKy6kbwfAm4oLSAoUf2EImlmLAYT88cE9m7eCzu4CSjoDbIs3JXsY/Y7yel8q
         GodG5ttDEOkXepK3vEZxpY36LA2ri4We0HNJdmf2ZJUk/VQj7MTD7Xe8VxMfi5YyNGJ0
         xR2FKmDHxQDcnvZtQXOITQLfR3lElnwVVePA8M4uXbHmZV2luleiZ6K2cguR9XwN9wrd
         gZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=U7fi6N3RABOBMWCOgXAfDv4FFDxZNs+uf8Zr2BRDwwM=;
        b=WwjN6Z61NnP/yhu1pb30R2HLoiOfbu0kjoZRXU5j9sxJd6gK29PpZm8gCi8Ym2iznb
         X7ZzxjlzRlj6nDABpXOvtgIed59Bcd+7UXn9BdviniknQ4QD2PGhS4p69gUjG5FLYiLc
         NjJqSxQTGBJmTCWjmITk6Wn+MMwiN3EtOysIaGrT3qTK0rXRg/dwWuwAHDkELKuLFBDO
         MXQYU9Ll/JOrVpYQCzE3gcmnyuJ3IugvdbSEx7l7RNBUY0tKfl1pWicrvTbDQtFLppeC
         nq2Pd/ieF21bX2GQsIItiQ/Db8Ki9q3QqBB5eLHnNREQEHH0S24TMhQvpYWBDp+t0JGL
         jNaA==
X-Gm-Message-State: ACgBeo2PepWHJeLf4EBax+Q1YDceaZp7iaAJwMMmTv6OUA2UK79h9knU
	ryxkfNBjQHfdTvZuj64QUpxY/g==
X-Google-Smtp-Source: AA6agR7XJvJo2wL06pAjhFP/KvfRGXfogwSBNC2DgxGwjN/ZOnOsAf3UUYbcZ3s7sM2T4pU/8YK2Aw==
X-Received: by 2002:a05:6512:2313:b0:48a:e615:289b with SMTP id o19-20020a056512231300b0048ae615289bmr5959623lfu.201.1659431092326;
        Tue, 02 Aug 2022 02:04:52 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id h14-20020a05651c124e00b0025e6415bb8csm40755ljh.32.2022.08.02.02.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 02:04:51 -0700 (PDT)
Message-ID: <3fdbac20-5ccd-7974-300e-2d78d0be048a@linaro.org>
Date: Tue, 2 Aug 2022 11:04:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3] dt-bindings: PCI: mediatek-gen3: Add support for
 MT8188 and MT8195
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 Rex-BC.Chen@mediatek.com, TingHan.Shen@mediatek.com,
 Liju-clr.Chen@mediatek.com, Jian.Yang@mediatek.com
References: <20220801113709.12101-1-jianjun.wang@mediatek.com>
 <cd9518e3-9cb4-5165-af03-00e5300ab927@linaro.org>
In-Reply-To: <cd9518e3-9cb4-5165-af03-00e5300ab927@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_020455_659004_1DE0B9BD 
X-CRM114-Status: UNSURE (   8.62  )
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

On 02/08/2022 10:59, Krzysztof Kozlowski wrote:
>>  
>>    reg:
>>      maxItems: 1
>> @@ -84,7 +91,9 @@ properties:
>>        - const: tl_96m
>>        - const: tl_32k
>>        - const: peri_26m
>> -      - const: top_133m
>> +      - enum:
>> +          - top_133m        # for MT8192
>> +          - peri_mem        # for MT8188/MT8195
> 
> This requires allOf:if:then restricting it further per variant.

I see Rob proposed that way, so skip this comment.


Best regards,
Krzysztof

