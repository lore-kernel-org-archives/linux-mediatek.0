Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E007C07E9D
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 18:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bEsiJd/ABJ6GfZVhG9n8srep4jX5Ng0oqWanjXKMf3M=; b=1pBNAEmwwSggr3SyAKIT7yBT5B
	BgRXfNUYwD6rNKQHeYU+mOoLfMdkYJdTVK8r8WF78D7DRS8sGPTDmNgP0jLSm6wqcQTF5Nr9/y7We
	5NyAmjh0Ur4oL/NmxDY5aj3OB2VbDsWBtm0vYVyGZhxpkRvk6qSXwt/oAcBs3uf36A0PMO4Ryg6Sv
	6+zWWbgxCCjvtp+r+cKoac0wBhl0BK2GUNpEIswe94pa/cx8i6tm8RSeKAJpyoH/g08p1QBwRDPie
	8mIssVdSu8MS7U1lYBp4dTorpmJZO8t+XzvAkzhx7nNeM4XF+Zbkrr+2xZyHI6eJxdgodvhHGk/4V
	pRJo3S+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obn9I-005INj-9M; Fri, 23 Sep 2022 18:11:40 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obn9G-005IMu-1r
	for linux-mediatek@lists.infradead.org; Fri, 23 Sep 2022 18:11:39 +0000
Received: by mail-lj1-x229.google.com with SMTP id j24so948838lja.4
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Sep 2022 11:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=bEsiJd/ABJ6GfZVhG9n8srep4jX5Ng0oqWanjXKMf3M=;
        b=wdf0UoY5ODBa65zXyvuXU6004RbmRtmAQtzkUjBFxlpQtsXPB6f8/sO1rqC0ZGgLp3
         4AMdVPtt9QHPuyI0VxvgIs+5MrEOgv6JoAB8AlLpxgFsMBIOnfWGqJCA6iLMwm3A9N5n
         ZIWhGGwWdLofl2d7Oa0JdtvK+ek0ZFgho+IdjF9Zua3H6P1m8VRuu/tO9eMrcsVF5l11
         CyOBznGHDjwORKYgfJR/Q4p4MPPirUKwQt2U7ZUq1syBcfAYIi47L3cQLBCIvD7tuIti
         xsWsttC3skEp4jaqH1xDk+E1USMXKtinN/Kps+8JXhGImmHsdG5MDsPXMIDqjiMzGcPq
         zmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=bEsiJd/ABJ6GfZVhG9n8srep4jX5Ng0oqWanjXKMf3M=;
        b=kBvdECdKSr8Fu7phVCtWBtKUL8XjzNByAENot02bUuuzDh/gFYdMG25WRpHY/BxiQI
         gYuBiHgE5yxDzrsVeVmit4DdcCmXKafQ3yMfXKr83AVbQPaKSI5acpFNXOILrFc6q3oa
         ErAgE9Kugho6F5AXVJrvoUzJ0g3JqeWYBJK3nOXrwHlNoJN2dt7dBbsxItBDq08wRoFK
         XCVowjNEeGo9WCvj0ArT0bjn2Zcbbhhp726MLLAaqCY4vzMlJpuiGyVqNhtmPDpuOKgg
         5n5rNRHL3FuQe3Av7Acqua9Fq3VCyxerBzRpIJgpS1CIqvMPQjuLDpp0Mno+OblP2Yq7
         AE+Q==
X-Gm-Message-State: ACrzQf1C7jyHFDlUrjiwJtU6tQhs+DS25oTiZ57frFywPe4/UREWYUoB
	t2iGEaogJ6x+gzTEUxTGsXCJRQ==
X-Google-Smtp-Source: AMsMyM5zQjSLuWsd99Ofx6D2TOw4gAeQDb4AO5KB8bpsuR/rhKVETepxlLfDTlGOKwf2sWnZ2pYplA==
X-Received: by 2002:a2e:92c8:0:b0:25d:6ddf:e71d with SMTP id k8-20020a2e92c8000000b0025d6ddfe71dmr3229734ljh.170.1663956694123;
        Fri, 23 Sep 2022 11:11:34 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z12-20020a2eb52c000000b00261e2aab7c2sm1491057ljm.58.2022.09.23.11.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 11:11:33 -0700 (PDT)
Message-ID: <a215ae81-10de-7880-1a15-b7b08d0d80d7@linaro.org>
Date: Fri, 23 Sep 2022 20:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 2/4] dt-bindings: net: snps,dwmac: add clk_csr property
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220923052828.16581-1-jianguo.zhang@mediatek.com>
 <20220923052828.16581-3-jianguo.zhang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220923052828.16581-3-jianguo.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_111138_167278_C6A5D622 
X-CRM114-Status: UNSURE (   8.31  )
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

On 23/09/2022 07:28, Jianguo Zhang wrote:
> The clk_csr property is parsed in driver for generating MDC clock
> with correct frequency. A warning('clk_csr' was unexpeted) is reported
> when runing 'make_dtbs_check' because the clk_csr property
> has been not documented in the binding file.

Your subject is not accurate anymore. Maybe mention that instead of
existing clk_csr, you add a different property.

With commit msg fixes:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


