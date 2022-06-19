Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC919C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Jun 2022 11:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JIO2mY682oPXJiHyGHgrm7/Q9vi5siXInrOrzmj3AUo=; b=lP/k8fx+ARCSXPx5NBEA3wBPtt
	sbdFhgcEJ5iW7icJQG+Kq5ewKNpsFpHVk+A8nlRGpq4W8cxb/V0CP+hgz5DEcbnPoRMRYEbs3yaEs
	CEoriRpQb25jtgj7hDButI+ITyov7Pa3EYKVD5dV+3v6BgChfw9/NIjp3wBQ5IwqhI930nX0PCnjj
	tiOs7OkW48MpGKogmeg01Xkr4ooWTwPO2qJukvlcRH4IGqMBbVdEinDiTiQRVGvsmiM+oi18NZm7/
	NN31XUQzf+RrptvDaBu0gMBXb3OlsVpM1JeUwPIaxQlbhHRK13+cVNGVhO2JTG0RRG4/0uXHPqVVt
	H/tQr+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2tPa-00E3xg-Oa; Sun, 19 Jun 2022 11:48:14 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2tNk-00E3Ep-KK
	for linux-mediatek@lists.infradead.org; Sun, 19 Jun 2022 11:46:22 +0000
Received: by mail-ej1-x633.google.com with SMTP id gl15so16258127ejb.4
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Jun 2022 04:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=JIO2mY682oPXJiHyGHgrm7/Q9vi5siXInrOrzmj3AUo=;
        b=wdwMtYbnB3sGlyq5lBSmHcAWE2vsrrpF/vtNGPPHqz8dnsvflVypNxXbyL3sZClRLN
         Txh8nCv5gntNEbG067+KrIUpeT1ndJbe5pKlowuafbGQ8YLlXY5H2MXMp0XqF22hkO6p
         2GBiB0fbY7KjLdEpoa1Mi3C33+E/ognIiGcRYF7SzSz0V4fu2f2rwm8RfYA8t6C7U7PQ
         s55KRClprD+V6LjCLA9Cv7PvmEg5CE/KC/O09D5ZzAjJikI3IDrDjdH0/K8UoNCu6DEV
         BML3PCmmgnVNW1qVhFr2GmWP+64xbBEeg6lrkca0P7GtaUAXNGA79+vqaYF/I5OWv55Q
         R80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JIO2mY682oPXJiHyGHgrm7/Q9vi5siXInrOrzmj3AUo=;
        b=atcTFyRcXn8Vjv5p+Yfo44EOJcbcSR7uvYF5C3Zat0Lk7oXjxGhNXAS5n6hHmIOuzv
         /zEslMe0oK2bsBtTFUbQydA0HFUcJ1fxm2QFYpq2VXdK4/iyX+IPjxCnuN54BdPVopWU
         2wFSyED27v5u8N/wiINuOB6RrrHA79v301H//3EKZyObMyqurdg2B92qwYxIGIs9DPrH
         tvK1wQIeG/pS7SToW3oRA5nCjUSp168+Y4HcTc4gmOE+u9vVlIcq5kg+gDeT05wVRw9D
         zzw1SaDwZkfTLVggogTveaWSoNLBrJi/lFwSRptCT2yrsEIGL482zpIx6R6JK/EcDCDy
         Hr/Q==
X-Gm-Message-State: AJIora/CMp1jXA+6PVWCuIW/VE4360dfdAVEgRS0tsBet2YuDbiEiMdp
	gdXGiIGP/3ExQ8x2vCgdsdb5CA==
X-Google-Smtp-Source: AGRyM1sePyl4/VzHcBtPb/raB3YCRxdOJNwaHxIh3b+epV2BiUpRnbkGH44ooVVXzFb9O5txZOn4/Q==
X-Received: by 2002:a17:907:9813:b0:711:d5ac:b9ef with SMTP id ji19-20020a170907981300b00711d5acb9efmr16721384ejc.95.1655639178872;
        Sun, 19 Jun 2022 04:46:18 -0700 (PDT)
Received: from [192.168.0.206] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g1-20020a17090604c100b006fec56c57e6sm4521040eja.46.2022.06.19.04.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jun 2022 04:46:18 -0700 (PDT)
Message-ID: <8fbee49a-8215-32b7-3545-66df70ecc38d@linaro.org>
Date: Sun, 19 Jun 2022 13:46:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] dt-bindings: phy: make phy-cells description a text
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Anderson <sean.anderson@seco.com>
References: <20220619113325.21396-1-krzysztof.kozlowski@linaro.org>
 <Yq8LHN+WGVpXDwiM@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yq8LHN+WGVpXDwiM@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_044620_723041_A9D2FE24 
X-CRM114-Status: GOOD (  13.72  )
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

On 19/06/2022 13:40, Laurent Pinchart wrote:
> Hi Krzysztof,
> 
> Thank you for the patch.
> 
> On Sun, Jun 19, 2022 at 01:33:25PM +0200, Krzysztof Kozlowski wrote:
>> The description field is a string, so using YAML inside phy-cells
>> description is not actually helpful.
> 
> Does it hurt though ? For xlnx,zynqmp-psgtr.yaml I wrote it that way to
> prepare for a future where it could be described using a YAML schema
> (but such future may never come).

No, it does not hurt. It is however confusing some folks and they think
schema goes into description. The description should be
readable/descriptive for humans, so if you think your approach is
better, I am perfectly fine with it.


Best regards,
Krzysztof

