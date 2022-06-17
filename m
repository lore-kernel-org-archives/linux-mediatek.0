Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BD3C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 23:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnlvDERG8oowX1HgALJdegPeU3FrNxjdXcUUPk217Kc=; b=PFK3vIxOeUfgALGnqCmxr+bXOY
	+9VoAR+KOOTlVPJmgq7EPEO9aoSMQNHNZoRsQ+1ru5re6EUwhnLhpzf12A/n7qK44/UDXIyxPpc8L
	5sVlatvT8BaaTLxw98E4eosLmCJPadDJ7emMvunz5bBdJdk82nmbZ30RsG0YbxRxWwVXTwp5M+VX/
	YfzNVZVzIiGrDcPrz4ALgjCmmBuAWr+N+hgdmGyQ7wsbdtBAfh/nSAgbp7WUbNg7eIO/aHFMlAEGl
	p8atR9XZI1/mGb+Pc9SHB0lT/6NW1oEKSzi4VlOQsPDz1qTzTs/frzi7eeJVqkNL3CV0cz1bmFA5o
	ADZ2VzJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2LEi-009a7N-OA; Fri, 17 Jun 2022 23:18:44 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2LEf-009a6V-Hb
	for linux-mediatek@lists.infradead.org; Fri, 17 Jun 2022 23:18:42 +0000
Received: by mail-pf1-x431.google.com with SMTP id u37so5345695pfg.3
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jun 2022 16:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=dnlvDERG8oowX1HgALJdegPeU3FrNxjdXcUUPk217Kc=;
        b=dYgOoOJ+N1WQxKWgcZXmEa3c1hdI0FiUiq4kjgxMtELC1+LGpzl7e3X18OpxsPSLM6
         Z/Md1Q8QQHTehEao5xTscQMo7T5Lz4/pzDY3ntkLraiKoKzWL7ROaL2cao0FuDoT9stK
         Y6P4ABr9fN3CpUeRy0JOTZbpI9REGz0+47sTJIsSUOPeGNaoMlC+f+NCcpS6t8dOO/i0
         k26TzfWBvaDMUogUbaw/ePh4I1gdsJWFEU4PXk4hYL0DfC4g6chOMd3nJE1h86wiO1et
         1I9ZkUSlHIQ81Yj27Bv60tr/T2MsJF/eku397IM1VZwlVgBppgapkFlTfY5NfCWNSsqt
         MDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dnlvDERG8oowX1HgALJdegPeU3FrNxjdXcUUPk217Kc=;
        b=oP1iwDwpQmY8ebLIGXWZzvxY0Ive9zOM3VMLZ6o4JcAzDgcpij1pDISw/B2aM+a7c5
         eZGj7bOw/w2CdR1T9SUE71sssSxXr/26CnK8+mwEbXCVsQow5fPBsHiVac6fOkZLCH1f
         QKr4vbOnbzjQddPfImEvXxyH3ocVwR5oWfJ0K9HdMFwrVTgLZEARPclt0ZTRg8oHW03c
         x95A+pZkrZfA/u8SLWhbLilkY6NgktuGqFD9oPS17nEVClXlJYtk1qpk7b3ixpx51j3n
         PGV+1g0xrHYJ8pNBSPNbEysbQttRygG0XHSAmRmZiPGVEzGVZQM7CkY8BeuvxHHcU2bH
         3qvA==
X-Gm-Message-State: AJIora+jo5ZBsYmYKTpX4lxRbGRFjND37t0wmF0FanIu4FqEQneAqZxM
	gdco+LfB006XqkvGw1mcmfE7sA==
X-Google-Smtp-Source: AGRyM1u/txoKu7R37NfERg5G/UkpHCJc9k3H5j4ALGDpTt/qdkZUdeh8lUa7533JzX4jdxzHyO1UDw==
X-Received: by 2002:a05:6a00:2410:b0:522:9837:581f with SMTP id z16-20020a056a00241000b005229837581fmr12316295pfh.11.1655507920906;
        Fri, 17 Jun 2022 16:18:40 -0700 (PDT)
Received: from [172.31.235.92] ([216.9.110.6])
        by smtp.gmail.com with ESMTPSA id l4-20020a170903120400b001620eb3a2d6sm4088846plh.203.2022.06.17.16.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 16:18:40 -0700 (PDT)
Message-ID: <542f4f86-7bf9-b5fb-16d2-849121b6ee6d@linaro.org>
Date: Fri, 17 Jun 2022 16:18:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 17/40] arm64: dts: mediatek: mt7622-rfb1: correct
 gpio-keys properties
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>, arm@kernel.org,
 soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-17-krzysztof.kozlowski@linaro.org>
 <fcc5f00b-0776-9511-845a-5eac5d4c7876@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fcc5f00b-0776-9511-845a-5eac5d4c7876@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_161841_652547_AC8D8A89 
X-CRM114-Status: UNSURE (   8.42  )
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

On 17/06/2022 03:41, Matthias Brugger wrote:
> On 16/06/2022 02:53, Krzysztof Kozlowski wrote:
>> gpio-keys children do not use unit addresses.
>>
> 
> Is it me or doesn't the commit message match the actual commit? Change looks 
> good, but message puzzles me.
> 

Indeed, wrong commit msg. Thanks for spotting it, I will send a v4 of
this patch alone.


Best regards,
Krzysztof

