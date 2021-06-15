Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0663C48BE8
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 16:15:14 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ECBE61585
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 16:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9ECBE61585
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWq78UqcvGbI9reD72D0PcVLjMBsUOYy8IUAXavWSt8=; b=ZhZDp6NsstWQfTjteoiv/G/q/V
	UUhdmCrmhBOBLb7OTrjQR6FmseRBrmV/yG/BSJ6TAOp3e9mZzNyZGSoUEgpDKpOtbLnSBZMFrJu0v
	ruej55YCH4uAtUn3rcP9yPI6N8WVEiO20+CWVfO2JOPdETErDfm2pPu3tD9wVLla2H1+3s2JnhwLf
	UXpMVVNtxHIwnO2bxYatzQTocw6+uILO319uoE1R9+NO1LE7cFm558HrcWy0PDQL2wnJa11vfkIqK
	ySRCsv28hA9wpp5Zfd1oEyukPwXDO25b0fVYr9TZqW3QGv3xfRy1kmpUp86h5BrFBcU1UtvTOlMdK
	DyPk0iVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltBi4-001GtU-UB; Tue, 15 Jun 2021 16:14:40 +0000
Received: from mail-il1-f182.google.com ([209.85.166.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9gc-000RDN-Pp; Tue, 15 Jun 2021 14:05:05 +0000
Received: by mail-il1-f182.google.com with SMTP id i13so15400496ilk.3;
 Tue, 15 Jun 2021 07:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Ul7S+YmegefjytTCybJFOmbLUpYojuCju7Gxif7Sbhw=;
 b=VV9h8QbA+tkvwaTHmHyFr5lMDQTkwTmX4PjJ5B1dU01UETJF2tC5YKx0wps6MMCAtO
 NjfLJh4qewADQL7O2mdWZsAtap+uz5nW8gs6ApnzIa8uKSzWKZXIEjGTNlhitHpGTSfn
 f8NAtOEEKtZoFZox0FzAVcjOi5uACrwThzYa1IUlhL5yxIT9z0Iv+VM1Yutq9Bp6hprt
 pfP7vHa2HwZ0O/yNy9QQ0gqbKuq6zLZ8rf5BSoE87krLPQ9S+StIvhYV74U/YlutKIrF
 BbqOiiaduvc3WYyrGVig6FJz1x5AbIeZbRepc48DmCQCNXXYBC4Z4mKtGxaNxcsAhVlo
 ymbg==
X-Gm-Message-State: AOAM532xkljErDpqwrQBJtG7GgerSEEHGPGlf7x2XLwyfz4MFPCZDaCY
 kgTSbb1DrcJ0g4RSdW62GN2IW/5+gQ==
X-Google-Smtp-Source: ABdhPJxlnUeLKisaHXDilxBGNC4oZcH3BSSM4B2ikEr4N4pEw8d4AZXuCBOQPgy54qWgugEGKRfulg==
X-Received: by 2002:a05:6e02:809:: with SMTP id
 u9mr18073417ilm.63.1623765900676; 
 Tue, 15 Jun 2021 07:05:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id d5sm9299257ilf.55.2021.06.15.07.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 07:04:59 -0700 (PDT)
Received: (nullmailer pid 487355 invoked by uid 1000);
 Tue, 15 Jun 2021 14:04:53 -0000
From: Rob Herring <robh@kernel.org>
To: =?utf-8?b?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>
Cc: linux-mediatek@lists.infradead.org, dongsheng.qiu@ingenic.com,
 netdev@vger.kernel.org, peppe.cavallaro@st.com, devicetree@vger.kernel.org,
 joabreu@synopsys.com, kuba@kernel.org, davem@davemloft.net,
 sihui.liu@ingenic.com, alexandre.torgue@st.com, mcoquelin.stm32@gmail.com,
 aric.pzqi@ingenic.com, linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jun.jiang@ingenic.com,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 rick.tyliu@ingenic.com, sernia.zhou@foxmail.com, alexandre.torgue@foss.st.com
In-Reply-To: <1623690937-52389-2-git-send-email-zhouyanjie@wanyeetech.com>
References: <1623690937-52389-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623690937-52389-2-git-send-email-zhouyanjie@wanyeetech.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: dwmac: Add bindings for new Ingenic
 SoCs.
Date: Tue, 15 Jun 2021 08:04:53 -0600
Message-Id: <1623765893.376832.487354.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_070502_923801_F4162811 
X-CRM114-Status: GOOD (  12.77  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1271795928310407939=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============1271795928310407939==
Content-Type: text/plain

On Tue, 15 Jun 2021 01:15:36 +0800, 周琰杰 (Zhou Yanjie) wrote:
> Add the dwmac bindings for the JZ4775 SoC, the X1000 SoC,
> the X1600 SoC, the X1830 SoC and the X2000 SoC from Ingenic.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
> 
> Notes:
>     v1->v2:
>     No change.
> 
>     v2->v3:
>     Add "ingenic,mac.yaml" for Ingenic SoCs.
> 
>  .../devicetree/bindings/net/ingenic,mac.yaml       | 76 ++++++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml        | 15 +++++
>  2 files changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ingenic,mac.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ingenic,mac.example.dt.yaml: ethernet@134b0000: compatible: ['ingenic,x1000-mac', 'snps,dwmac'] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ingenic,mac.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ingenic,mac.example.dt.yaml: ethernet@134b0000: compatible: Additional items are not allowed ('snps,dwmac' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ingenic,mac.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ingenic,mac.example.dt.yaml: ethernet@134b0000: 'phy-mode' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/snps,dwmac.yaml
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1491797

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.



--===============1271795928310407939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1271795928310407939==--
