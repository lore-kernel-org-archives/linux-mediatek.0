Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE21C54EE9
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 15:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AICgMCTu4ugKZVgKKYZSCEgyNXOHBsTus/rL4+rxADE=; b=3foojcaCmD8JWz6VgRNLaETL1w
	yKLcXWaWErEFzUx+HblWN2+mO002AUAf0z8TLaXY+OJYC8/maw7MTbUqbSOpMxzmqBAmQFGrgAThx
	Ay9whmvj/ulRKPATxKZMFK7OqW0oN8L31v66+TAI1YSXMp1k7UYY8dE3ZS6QlGBLyYOQDhg2ULT3o
	tvN1QX1x+4tL+kBYKswKpKGMe00Ud8ANN0gsRkFobgda+b6s6/Yvnt4fXqweWAAl1JW/LEetWhc0A
	usUxnvje/CnlJNi/pKiJbvGdeUSvY2uC05z7iARWPB/dFQ2BbgJOkKds1o3tENg2IrUgvSfrzD/6J
	32dL8w4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obNxR-00GN1h-M7; Thu, 22 Sep 2022 15:17:45 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obNnd-00GITz-7w
	for linux-mediatek@lists.infradead.org; Thu, 22 Sep 2022 15:07:40 +0000
Received: by mail-lf1-x12c.google.com with SMTP id f14so15202685lfg.5
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Sep 2022 08:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=AICgMCTu4ugKZVgKKYZSCEgyNXOHBsTus/rL4+rxADE=;
        b=V6OmMtcM8HwjnmW517gvagdimCQzKh4oEk+jCZREpCpQaMRh+CUYlJnjHhWQjY+sn6
         O2EMQ4TmRPc0YWA2AXrfK9EAIppOKDmxGDrlHPoDNfxJVW3XtHnP0Fgo5W/reRLAdYHm
         UVYMEVijD6WYE+JDTgZ0vUoZrmyKJTJtPlgAIrAp/2bsvx+1/X6ph9K33pGARnN0DkAP
         AgfZpohHy0hyLAk3+mnfVrclwPJDWSjxwZWLrJM9tgAB6aNIiSgHd7ef4jFxWuZMDLPK
         KNeogYycbDYEqtFUykDyC8n5Xxzcz1p0neVIj97isWerTZuHph+kEpakzCtG+d2YcUpa
         pKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=AICgMCTu4ugKZVgKKYZSCEgyNXOHBsTus/rL4+rxADE=;
        b=FiYAtjf6whgZH/3BnGcbFGtEZ2UWYCWAjZxvNlWOd3Ny5YcU1MKTFMiyRVbKKiN9q+
         fsK45IbRAGedzxyineE2Ml25BVmpBIdgceCXEb6vgqyk/hU0kn0769oEpZAbJR/mcBDt
         yoR2Dq8UumpcnB2A2WAp2t82Yz6IEoa/XAuQPGghW0hb3RI+Ba2QbgX8GvFORb0cImMQ
         PLP5UqGDBVWvr2jDoAkMD8ridP0Ns3NSCQmMyj4sRBteOHCNUD0/egwOIDHCQBYlvcZs
         ryFgtFQfCh+t9XzM1TgDvd66kddnypKx7UJVOG4Yu2sn2rgHsWPzAKmpXeAzZI9lsy7f
         hCyQ==
X-Gm-Message-State: ACrzQf1FEPiZ+bCta10SOYS623vIO0KMEBRoqQQbHcpHVNPFglQm4GCx
	JCQVoSGoiDyDf00eUq6ChZblbQ==
X-Google-Smtp-Source: AMsMyM5wWu4phY9miXzBVbKKyNmCh/6w2BSelex3t5iKGlg/9o62Y81D5nF1RPEPAveTSBkz6dR4Ww==
X-Received: by 2002:ac2:4422:0:b0:49f:5c95:9525 with SMTP id w2-20020ac24422000000b0049f5c959525mr1506912lfl.1.1663859254520;
        Thu, 22 Sep 2022 08:07:34 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u6-20020a05651220c600b0049771081b10sm986478lfr.31.2022.09.22.08.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 08:07:33 -0700 (PDT)
Message-ID: <04b9e5ef-f3c7-3400-f9df-2f585a084c5d@linaro.org>
Date: Thu, 22 Sep 2022 17:07:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [resend PATCH v4 2/2] dt-bindings: net: snps,dwmac: add clk_csr
 property
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
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Christophe Roullier <christophe.roullier@st.com>
References: <20220922092743.22824-1-jianguo.zhang@mediatek.com>
 <20220922092743.22824-3-jianguo.zhang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220922092743.22824-3-jianguo.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_080737_323142_4B795A02 
X-CRM114-Status: GOOD (  10.20  )
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

On 22/09/2022 11:27, Jianguo Zhang wrote:
> The clk_csr property is parsed in driver for generating MDC clock
> with correct frequency. A warning('clk_csr' was unexpeted) is reported
> when runing 'make_dtbs_check' because the clk_csr property
> has been not documented in the binding file.
> 

You did not describe the case, but apparently this came with
81311c03ab4d ("net: ethernet: stmmac: add management of clk_csr
property") which never brought the bindings change.

Therefore the property was never part of bindings documentation and
bringing them via driver is not the correct process. It bypasses the
review and such bypass cannot be an argument to bring the property to
bindings. It's not how new properties can be added.

Therefore I don't agree. Please make it a property matching bindings, so
vendor prefix, no underscores in node names.

Driver and DTS need updates.

Best regards,
Krzysztof


