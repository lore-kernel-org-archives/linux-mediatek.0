Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AA1FA373E
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 20:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCcoXzqCOTLs/OXhRR73dWp6fEmoY2vqrJfVEZfm4bk=; b=DQX9uq968He7cyjYoJD0G0h9lS
	rJi1TddCUNsnLCCJjpFK7pBLDNDohQjbX9VX7h392ciAvkj2nHf/PTtiSutO2TsDbdCk6yE4gA7+H
	dUQ9p+z+Mn0nyV40IuISNZgZpRTB4hYQ8zX1Bl8x8PftjW2XfZgSllshKdnec8Lzmzrm0PeOPVE94
	/dkR7DFmRHb6HAatPEf0HYKReqE/GuxVxeA5nszqYzxe22dS3AbuoKt1l+GAPcjh63DqnZId8rh4G
	cBMV3BRpeUr9LVmagfjy8Y1vKcJq7+uyMhQQtF5rxnAhYzX8PI+XZDGpS2ciQ5cFQUB+dUtxfyGHE
	ka1kKYAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onQAp-0072Fe-3L; Tue, 25 Oct 2022 20:05:19 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onQAd-0072B9-Nc; Tue, 25 Oct 2022 20:05:09 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1322fa1cf6fso17165686fac.6;
        Tue, 25 Oct 2022 13:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eCcoXzqCOTLs/OXhRR73dWp6fEmoY2vqrJfVEZfm4bk=;
        b=Q3fEBNJzKgtrPH5oT9CIrZW3P2eIpM9xHokOGSTOVHHsjr0krsU4ItFT4Uv8aFbeR3
         GtLKxrXgMkVkzdMW9lckumG3UbqOpMsPnnh6JvE7Ekyfr2LLd4pOap880pr3yRJdQboa
         2UcY2ERf6h4uU5otc/DD2fQmLlp0XkDlvoW9bT7sZcAm1mYEhOA5WB6wMPv/fvoCPe8n
         vSTRiYNIgih8GrnKtXI4IXo8pEjQMQCpO9w3FhQtrOZVJyZJdngECTdLUFHaoSl8k8SP
         Ry4JiInq5oa07IVWzi/qy3Qv7/b41DnLaNcyIe9DaoW/9mJjp5weaJaE8IzL9QPJXViq
         GkrQ==
X-Gm-Message-State: ACrzQf0EGA8+N/GiShDO8h4LdW5ODAnU5e7sqewBhfIWx6cecBc8daxI
	ketQgPlU4/nsbFF+bqj/pQ==
X-Google-Smtp-Source: AMsMyM6mcgNjxW6i/qnU+iYP+pBcCoyzMgXv5PdueWJlslCfweAIm0U9+f++poSxkgEwaRpzT1rZlQ==
X-Received: by 2002:a05:6870:d107:b0:137:11e5:6a95 with SMTP id e7-20020a056870d10700b0013711e56a95mr15898oac.146.1666728305645;
        Tue, 25 Oct 2022 13:05:05 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y16-20020a056871011000b0010e73e252b8sm2095073oab.6.2022.10.25.13.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 13:05:05 -0700 (PDT)
Received: (nullmailer pid 3155080 invoked by uid 1000);
	Tue, 25 Oct 2022 20:05:02 -0000
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Eric Dumazet <edumazet@google.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Lee Jones <lee@kernel.org>, Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Landen Chao <Landen.Chao@mediatek.com>, John Crispin <john@phrozen.org>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, =?utf-8?b?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20221025050355.3979380-8-colin.foster@in-advantage.com>
References: <20221025050355.3979380-1-colin.foster@in-advantage.com> <20221025050355.3979380-8-colin.foster@in-advantage.com>
Message-Id: <166672723302.3138577.18331816371776997839.robh@kernel.org>
Subject: Re: [PATCH v1 net-next 7/7] dt-bindings: net: mscc,vsc7514-switch: utilize generic ethernet-switch.yaml
Date: Tue, 25 Oct 2022 15:05:02 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_130507_793609_54C17DC1 
X-CRM114-Status: GOOD (  13.11  )
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

On Mon, 24 Oct 2022 22:03:55 -0700, Colin Foster wrote:
> Several bindings for ethernet switches are available for non-dsa switches
> by way of ethernet-switch.yaml. Remove these duplicate entries and utilize
> the common bindings for the VSC7514.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> ---
>  .../bindings/net/mscc,vsc7514-switch.yaml     | 36 +------------------
>  1 file changed, 1 insertion(+), 35 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/net/ethernet-switch.yaml
Documentation/devicetree/bindings/net/mscc,vsc7514-switch.example.dtb:0:0: /example-0/switch@1010000: failed to match any schema with compatible: ['mscc,vsc7514-switch']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


