Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8818FFA3740
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 20:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vB32b7hqffV8RKafvwJiZ3CGSQiM2gKHX903Imkipag=; b=if71JKqNimX+t26ZqI+WKIn25r
	M8snGMHW0PTB9+f1mIkDjdTphTHt2i1qEkFmRTbursVR1L8TlnmJ79zp3rV7EksWh2ObZJw7hRuWw
	QAK0op0nQhKTtyanhgGK3GAo5NZjL1H3cFjN5yQO8cvb6HburV9oOme2J3XM+2pBCn0a/v8De6N0e
	ZKFVNNwI4I/zasg9S9PRsV7kUSMujoD+qsxw2jhCcSNNalIh9ZFoswhrTjbZCN55RL7T4btGzuIWI
	aBK41qULvkpD7RLklybOsq1tkrj9bSpM7qd+uIbooHkja7aOvDqMB6bcUU5nBbsZU3xg7Qu2ShzgC
	khFZZJDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onQAo-0072FW-Ds; Tue, 25 Oct 2022 20:05:18 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onQAc-0072AJ-FF; Tue, 25 Oct 2022 20:05:07 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-13be3ef361dso4711799fac.12;
        Tue, 25 Oct 2022 13:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vB32b7hqffV8RKafvwJiZ3CGSQiM2gKHX903Imkipag=;
        b=3CEWq6vQOhsZHYMdSA16K9nED1f03zXaBn8Q8YGGsTj26MHenD/50th03xheW0ii6c
         wipl+03lkVz6rICbxjMtbz4zJVquOERwyJXOcPUyfxWQ1Tf+FUWnsG7CVt9NrhhP6nr/
         9aBEzZLZIqqOTZEBLqwC3Xic9IktXv4kmma0myvlcEL1vXUHl4Sx4nxBJY+aQdAS/avj
         vn8G7HEz6DtgRx3kojQsOF4ZeG8v8+ffKJABSFIJkFJoaYFnNXqWdSLddUNS0AqyEvtx
         Pd8VWu+10jD7o5tFFMm4va4nkb3lRxS2a40QZA5JaDhqgHY0NXZKFGQLkFYvY7mHQAUc
         FIJg==
X-Gm-Message-State: ACrzQf1/GpIyPbsNP2mxJMXpLum/DvrAvURB6F7Tj89F/SDlBUguH5Mu
	3iVXQlLx0HsjbPvbTMj0Xw==
X-Google-Smtp-Source: AMsMyM7iCwd1pVTnVpkPrTHLBKLtE87bCuRGb8WUI6j5d80nFpJ5ZRoJ/yfU55Rkz4J4Cc2IC6FkKQ==
X-Received: by 2002:a05:6870:c185:b0:137:5188:d2d7 with SMTP id h5-20020a056870c18500b001375188d2d7mr6381oad.296.1666728301917;
        Tue, 25 Oct 2022 13:05:01 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t6-20020a056871020600b0010d7242b623sm2049596oad.21.2022.10.25.13.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 13:05:01 -0700 (PDT)
Received: (nullmailer pid 3155077 invoked by uid 1000);
	Tue, 25 Oct 2022 20:05:02 -0000
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: =?utf-8?b?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>, Vivien Didelot <vivien.didelot@gmail.com>, netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org, DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Claudiu Manoil <claudiu.manoil@nxp.com>, devicetree@vger.kernel.org, John Crispin <john@phrozen.org>, "David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-mediatek@lists.infradead.org, Landen Chao <Landen.Chao@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Vladimir Oltean <olteanv@gmail.com>
In-Reply-To: <20221025050355.3979380-4-colin.foster@in-advantage.com>
References: <20221025050355.3979380-1-colin.foster@in-advantage.com> <20221025050355.3979380-4-colin.foster@in-advantage.com>
Message-Id: <166672723142.3138516.12575129595346889697.robh@kernel.org>
Subject: Re: [PATCH v1 net-next 3/7] dt-bindings: net: dsa: qca8k: utilize shared dsa.yaml
Date: Tue, 25 Oct 2022 15:05:02 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_130506_530791_ED4B601A 
X-CRM114-Status: GOOD (  13.35  )
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

On Mon, 24 Oct 2022 22:03:51 -0700, Colin Foster wrote:
> The dsa.yaml binding contains duplicated bindings for address and size
> cells, as well as the reference to dsa-port.yaml. Instead of duplicating
> this information, remove the reference to dsa-port.yaml and include the
> full reference to dsa.yaml.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> ---
>  .../devicetree/bindings/net/dsa/qca8k.yaml         | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/dsa/qca8k.example.dtb: switch@10: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/dsa/qca8k.example.dtb: switch@10: ports:port@6: Unevaluated properties are not allowed ('qca,sgmii-rxclk-falling-edge' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/dsa/qca8k.example.dtb: switch@10: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/dsa/qca8k.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


