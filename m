Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E10C38A2D
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 21:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERb3pe6StZzna5ZtQJPnW7VI4odfFihYwdZmHNbXwgU=; b=Qtv63gxT4AgjnaZGM0UXFA+X27
	1ut3MBB1gIbcozR4Ix5fxV4h0ksZJWoXAdChuzTs8hDLn22vE51RY5hK86eWMw65KqGvnUFRWe4E2
	nfJn93NQS1FFEAkHvftQLV6wWQqhwbd7Y19/QS7furJlMsSQsNc0ImxnWCFz8u92CH+IGdYoEPEwv
	1NBUPNpYSls7Nex6jhuaorEXLRqpDJ9mFtY9ofatYNypl/AHp+gpNu3pEKdd6s1Y5fZxHBqhTRNwQ
	wZu8SFMzy+kJZ+K9Khsb3p0JFHL5TMcT4uckPT5qh/LAiDI2XDuv5sXn4YP9gYJDS2eXhNE46BPKM
	szC5fNyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olz82-009weQ-RL; Fri, 21 Oct 2022 21:00:30 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olz7z-009wdE-8u
	for linux-mediatek@lists.infradead.org; Fri, 21 Oct 2022 21:00:29 +0000
Received: by mail-oi1-f177.google.com with SMTP id o64so4553016oib.12
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Oct 2022 14:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ERb3pe6StZzna5ZtQJPnW7VI4odfFihYwdZmHNbXwgU=;
        b=wIY6cHPDbLL1qZZ/BypjLd6OtCC+M3uAmYZNCce39ZO3HU32ScdPpM2UD+QythV/vE
         umbdP+DwIG6Lg7giRLF1rnGmBWqWNP0duRsIlz96/oisBsXF4S3KPK8CqruiKKDOTiMk
         ehmInz4U8mNighQ16+5BgCJNT60+Hi2TypTlWwSEmZPuSxlnnGi6NEmaLgUX4nTpIkdl
         qgdPKpIdc+CL2NpgPfhe8FaqEYRQUWVZ0o6ep0b/LUV5IsVPt1UNRL14qrZ5A424k8v1
         7J4RZCEmhS7rJ944poN2Psh9MwKiSzMn/81vgZlLdF6Qe2VyirWaYdk+9nF+MQ3bN0i1
         Yc1A==
X-Gm-Message-State: ACrzQf2601lyCoJlXqntENSihIBmjGxJM4zgMWiDTHRcyfCgYL97eWOb
	x0/REZvhpWGUn3/J++8AQw==
X-Google-Smtp-Source: AMsMyM6XN8ugoSJwidUv7yRrhtQPQwwfy5a7UUCAQlFXGKyN6/phH0Kv14z497vMFEWBIZsWfDdO1g==
X-Received: by 2002:a54:4798:0:b0:355:d27:ca7a with SMTP id o24-20020a544798000000b003550d27ca7amr21174579oic.54.1666386025107;
        Fri, 21 Oct 2022 14:00:25 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x7-20020a056870e38700b0013297705e5dsm10533445oad.28.2022.10.21.14.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 14:00:24 -0700 (PDT)
Received: (nullmailer pid 314786 invoked by uid 1000);
	Fri, 21 Oct 2022 21:00:25 -0000
From: Rob Herring <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: lorenzo.bianconi@redhat.com, devicetree@vger.kernel.org, nbd@nbd.name, sujuan.chen@mediatek.com, Mark-MC.Lee@mediatek.com, evelyn.tsai@mediatek.com, daniel@makrotopia.org, kuba@kernel.org, sean.wang@mediatek.com, netdev@vger.kernel.org, Bo.Jiao@mediatek.com, ryder.Lee@mediatek.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, john@phrozen.org, pabeni@redhat.com, davem@davemloft.net, edumazet@google.com
In-Reply-To: <7a454984f0001a71964114b71f353cb47af95ee6.1666368566.git.lorenzo@kernel.org>
References: <cover.1666368566.git.lorenzo@kernel.org> <7a454984f0001a71964114b71f353cb47af95ee6.1666368566.git.lorenzo@kernel.org>
Message-Id: <166638584121.307593.16292067214114795446.robh@kernel.org>
Subject: Re: [PATCH net-next 2/6] dt-bindings: net: mediatek: add WED RX binding for MT7986 eth driver
Date: Fri, 21 Oct 2022 16:00:25 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_140027_335408_1B4A11F3 
X-CRM114-Status: GOOD (  10.99  )
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

On Fri, 21 Oct 2022 18:18:32 +0200, Lorenzo Bianconi wrote:
> Document the binding for the RX Wireless Ethernet Dispatch core on the
> MT7986 ethernet driver used to offload traffic received by WLAN NIC and
> forwarded to LAN/WAN one.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../arm/mediatek/mediatek,mt7622-wed.yaml     | 126 ++++++++++++++++++
>  .../arm/mediatek/mediatek,mt7986-wo-boot.yaml |  45 +++++++
>  .../arm/mediatek/mediatek,mt7986-wo-ccif.yaml |  49 +++++++
>  .../arm/mediatek/mediatek,mt7986-wo-dlm.yaml  |  66 +++++++++
>  4 files changed, 286 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml: properties:mediatek,wocpu_boot:maxItems: False schema does not allow 1
	hint: Scalar properties should not have array keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml: properties:mediatek,wocpu_ilm:maxItems: False schema does not allow 1
	hint: Scalar properties should not have array keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml: properties:mediatek,ap2woccif:maxItems: False schema does not allow 1
	hint: Scalar properties should not have array keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml: properties:mediatek,wocpu_dlm:maxItems: False schema does not allow 1
	hint: Scalar properties should not have array keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml: properties:mediatek,wocpu_data:maxItems: False schema does not allow 1
	hint: Scalar properties should not have array keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml: properties:mediatek,wocpu_emi:maxItems: False schema does not allow 1
	hint: Scalar properties should not have array keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.example.dtb:0:0: /example-1/soc/syscon@15000000: failed to match any schema with compatible: ['mediatek,mt7986-ethsys', 'syscon']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.example.dtb:0:0: /example-1/soc/syscon@15000000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.example.dtb:0:0: /example-1/soc/wocpu0_ilm@151e0000: failed to match any schema with compatible: ['mediatek,wocpu0_ilm']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.example.dtb:0:0: /example-0/soc/syscon@15000000: failed to match any schema with compatible: ['mediatek,mt7986-ethsys', 'syscon']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.example.dtb:0:0: /example-0/soc/syscon@15000000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


