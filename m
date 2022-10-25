Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB65C38A2D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 12:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yrilAhGGJreK8L4jo0y+OfIubyvYYXmcpdYjjv0NBzw=; b=NgV2DvG2JTyzcW
	ATQ9xfyjsriNqUTW29a3w7GdX86Xb9mpJIGqJIVIno46oft2wN3scnLXc/xU3eyEvmV4RRAggOvRr
	P44Oj0fSqiRO2T41UFb2Bqx/eaIuAh/Ig1KYo7aDEPEtVpuSRZ5RXGqrKak+cayXjBeNxfkvbEpoQ
	8/DCm1nfbaXXphvfi5Af1BG2JGk4bhHnkYLL/IFm5aCqY0lPIR6/8aY2ohPPDDZcZFWbd6QXyVEvO
	dt10hgND7VxZ/FIS9JMi4TA7jaMAJza3D6eGcdKXDlx2Sq0+328Pepj+DzV7o5Y9PhH2WXFB2Nczh
	FQvJst950g07MEiAQmNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onIw6-005917-D2; Tue, 25 Oct 2022 12:21:38 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onIw3-0058zx-EI
	for linux-mediatek@lists.infradead.org; Tue, 25 Oct 2022 12:21:36 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id ml12so7370744qvb.0
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Oct 2022 05:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yrilAhGGJreK8L4jo0y+OfIubyvYYXmcpdYjjv0NBzw=;
        b=vFP823FJZuCoQ/qSOuYtkMQd2VmdCUrulmNtzL1ZXynQCiDNoSwdCXGbDO/vsXvXOB
         GLEh/COj6kV401Ni86hUKFde73N9Nnysrv5Wdma5U4q/VDRlKmnT0UUog66EV4CPz9VE
         ZG4KL/5K04wupgRJp7o8WLu4PyvCpolUKv0xzxSIDDc6VQHlcGVI3Xm4yIpsaSGc1yWl
         kSJlMKbuqk6uCSbX3SmBh7DG/VZBfyxSReCuOoo5jXf/WtEBaX1DBKhLtuHlRQfwqZ/R
         u994/N/ApSm4zlTiYLwUxFDQ5q2NJEXcKfHd5eBvQERIzpeLQgfqB9qivAqRoBC9zyTq
         NK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yrilAhGGJreK8L4jo0y+OfIubyvYYXmcpdYjjv0NBzw=;
        b=b4OQBzZJcIGfT1jMln6nkdGZVfpIZT/vBGRSBH+1aAqkXXnz2mseMMTdxD7bVSdoXa
         YO4HrHcQ82mB/XZT3UA1hf8NYRqFEbLp4WBRcDRUfrQ/kRbZs2hyUsfyKiJVHGF5INum
         wQqnJdmMKtqKz1gsEMIK9uQbEcOcw4lker17Q/oeA8n04gD9ntNaBe1EAROzSyPkp6PV
         +YcBK8yRi1nq9Ly3IoC02hKkFjJbW/zL5jKA28ZNNMyOKVs/o084jrGH534QeogF3CIt
         6OzIlCqKho/rAZB3ltJERSUWysToncSIIAOYmEB++TZKllDXHM0r3hNS0piBDG/NqKj/
         BYdg==
X-Gm-Message-State: ACrzQf3e/hcBO0kMvZCfCiGzX0CXKzHg2iYTS+b1bMpDGThmxY/xg7SQ
	ath0OFbW4y5imr6f0c9uCt2JbQ==
X-Google-Smtp-Source: AMsMyM4s0N1Fal+yR+QTBJMIob7ci46MXCs+VOue61R+M/I9AAZ+z1gY8tW13hXFvcnKIx6Wvt0hNg==
X-Received: by 2002:ad4:5ae5:0:b0:4b7:1bdb:d79e with SMTP id c5-20020ad45ae5000000b004b71bdbd79emr26229025qvh.25.1666700494159;
        Tue, 25 Oct 2022 05:21:34 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id dt27-20020a05620a479b00b006cdd0939ffbsm1911886qkb.86.2022.10.25.05.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 05:21:33 -0700 (PDT)
Message-ID: <857f6769-3618-0958-472b-bff57a23f763@linaro.org>
Date: Tue, 25 Oct 2022 08:21:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v4 2/6] dt-bindings: mmc: Add support for Mediatek MT7986
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221025074238.18136-1-linux@fw-web.de>
 <20221025074238.18136-3-linux@fw-web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221025074238.18136-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_052135_513205_DF51DAA5 
X-CRM114-Status: UNSURE (   9.48  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <Sam.Shih@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 25/10/2022 03:42, Frank Wunderlich wrote:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> This commit adds dt-binding documentation of mmc for Mediatek MT7986 SoC

> +          items:
> +            - description: source clock
> +            - description: HCLK which used for host
> +            - description: independent source clock gate
> +            - description: bus clock used for internal register access (required for MSDC0/3).
> +            - description: msdc subsys clock gate
> +        clock-names:
> +          minItems: 3
> +          items:
> +            - const: source
> +            - const: hclk
> +            - const: "source_cg"
> +            - const: "bus_clk"
> +            - const: "sys_cg"

Drop quotes.

Best regards,
Krzysztof


