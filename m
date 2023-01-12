Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304D1C54EBC
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 09:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPg45aihulxFcwTt727w+mL/usKIND+jUszExCuHhXY=; b=fifIvBmffY/4sZRQV4soVf/NsG
	Vo+YhVqJF2JtA/MYkQ4Y2UKmCty8jlkZOELx9D6TcGL7PW2rZJYs+WXbCZ8XvEIPBH1LcZ/J7OD3m
	8a3aQ4gviZQz2iW5Rxt9ngk9sjmc3MeBirVYZNSDvGY6Log3e+22MQ/QW3guKlu3cR6aU44QQPI2a
	+9wd9cAi34jW61MWnJxGeYkBonNQIYkhzh/1RCI9ixLnEVrhPlx/htBL+z4UKwHlKHE3QXTE+r451
	2T0V5EnKiZxppI5sjkj586ptAR+9IOKRMKcjIgB8ITcaQanq4S2wSuKpn15vsiSNXXd+06ZP0UVF2
	4zI5o0qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFtUn-00EFNU-BR; Thu, 12 Jan 2023 09:03:37 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFtUY-00EFH5-FU
	for linux-mediatek@lists.infradead.org; Thu, 12 Jan 2023 09:03:25 +0000
Received: by mail-ej1-x630.google.com with SMTP id u19so43054235ejm.8
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Jan 2023 01:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NPg45aihulxFcwTt727w+mL/usKIND+jUszExCuHhXY=;
        b=MEKnkpY7fZaDBRZ0GOoGL+5J1rSvAP8tz+GM5LCiulO58ykRwW5361vjH5gxAeEoTv
         8HhjnXzMTuVGML79PFXQGwbgf5poVUiyY3JZQ/kxQKDoQDOgSFvZirbzNAoalx5RnAIo
         W837pnqEu6ErV/K5C/TSut+95htAA3jdC85im8RYpa2Mv6Wf8gigkXc66wQ3vp7EW9jG
         99CbxHCvE1P/wla42oE6rDpKSOx9JX2xV8TtbABTXNatIUem6GM68FEzT9TlJi46V4F5
         p4OAsmgHzFf9g/x76nO013ohi75SH8DxRI4ld+AMCZf9VNCU4qQSAPS7K1ju3MGQsRPN
         surw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NPg45aihulxFcwTt727w+mL/usKIND+jUszExCuHhXY=;
        b=zwbJXGYImf6UAAG6LI0AxRP7e/hFwlICF+FtvUI7gfzzGL6cKQaaUwMeT9C1qRaM4b
         SEIkPEsrnxx7sqv4RVUTMbeXSCAg0xVpBlgp5Gs5cH0+jvlkiodkyXHzOgL2A6qPmT7L
         qQ1wU8BmbNvwh45zI/hzSLAmSkCscB6eSezBZYauS8EvOz7EwF/eOLBdWOZyxa8LOdaD
         UFtCkVfWa+kfW/7hjT+ocYmIZuYUP24fnsXBUtGrOMcraOQiZISm7/MvRsI57VrHUpbl
         Lms/bTbfGFCUqCmgR7nU2hdBL9ikajMTsq0GJd//8ogXe79mIZ2eUfBKX++o8ihUqWvC
         49UQ==
X-Gm-Message-State: AFqh2kr7mKQe+WdoJyxR+TUdkY68gbEdB04pRqi43vQHPseGqNbBbGdP
	CtHlSbKo3k6UF18e3H/rTbmiVA==
X-Google-Smtp-Source: AMrXdXvzRX9flDjGK/8oJ+WqOQPVMaaniUk/Te2rCqcHpO/BoL8tDSkKBKpzsxbv6klDJbEcUyLzaA==
X-Received: by 2002:a17:906:1655:b0:7b5:73aa:9984 with SMTP id n21-20020a170906165500b007b573aa9984mr60091934ejd.14.1673514199160;
        Thu, 12 Jan 2023 01:03:19 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906059100b007933047f923sm7202212ejn.118.2023.01.12.01.03.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 01:03:18 -0800 (PST)
Message-ID: <21a5fc20-05d7-5d96-aa75-bc335835033c@linaro.org>
Date: Thu, 12 Jan 2023 10:03:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 6/6] dt-bindings: pinctrl: rt3883: add proper function
 muxing binding
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 erkin.bozoglu@xeront.com
References: <20221231160849.40544-1-arinc.unal@arinc9.com>
 <20221231160849.40544-7-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221231160849.40544-7-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_010322_588957_AE53B4A7 
X-CRM114-Status: UNSURE (   7.73  )
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

On 31/12/2022 17:08, Arınç ÜNAL wrote:
> Not every function can be muxed to a group. Add proper binding which
> documents which function can be muxed to a group or set of groups.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


