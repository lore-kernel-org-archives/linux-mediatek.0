Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C03AC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Mar 2022 02:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pTRk7/kHIxluTOm4x7aJb0rk3GykQOfr1rs0C8LkdKo=; b=l1+B0caWSgoofS
	EqBaxjV7CjFraFEsrrMcPKqQEmhGn7rqGNi/sluM52FMB+iQ1tIW+CNhMyQjZYqADOjo+WCjkxTZo
	tw78pnZ8peCpjPWlhffbvKMtfzIp381XB9H6nmMMuBwTS3RbnBQg/+aAwgiM3O24pNZqp6QRPtlAp
	OHLoKNSC25eKJxxTaBi6nQxoUkR9LllDfOwomIAPrTTbEMbuxfwxd1QirOvFog7oSsLfMBK782Zwo
	e5vMqRLaix1ZK13v4Cli59Obl5lX11TiyFZvePoKyKjBYGnmqFliOERERbLdAmo2TyfFQLYvtOGXt
	8k3dng1A9wdMJaejDHxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVl51-004dK9-9V; Sun, 20 Mar 2022 02:14:03 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVl4n-004dFr-0x; Sun, 20 Mar 2022 02:13:50 +0000
Received: by mail-io1-f50.google.com with SMTP id h63so13354252iof.12;
 Sat, 19 Mar 2022 19:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=EcBP75kXnzxIJCHk9xGycw2UXPhg1tlo3uKzCGAClzs=;
 b=Sq3fGTVQLEdMPSUYMN/j/7RChbuEMhiT9+iB/3ntJn85PVVLofaidjidvJtynjEZTP
 O3xl8LYogAxdsMqBuOYAehfAzYY8Q1H/rhlPfndHFk7iORK+CpFqK2mAyd6r0n/vrAX/
 U5JwkNb/F8WbFsLBhsE/uKaq7uGij9ZDOpNuMwLGqoLmLjzkvdyt8JMP/SmBTzh6Hfe9
 BMLFLEbzuABgvmC7nDtfTNl3srMcFU3KfXvf/PMExHPRIaFoJKHO27/XlofWRf0R7zJ6
 GvoSg5r7V6riEayy7KZkXyOiY1oeqbYHaWcCg9EVFbOrDgvYJZMkSZWPAPCQOM2JPI/m
 sqrw==
X-Gm-Message-State: AOAM531LWPsbBZVVwZ74SdC6Cjc0sehHFFWdAuuzmlB163Z0JnKrA6RC
 oclIfwwTj0egcVCn1YBMIg==
X-Google-Smtp-Source: ABdhPJxJDPbpWKi67EujRKBkRH8RtGb7+aW3ugz6xBNYrcq3XreB500+i0t7U2WL1fo2Plmn4BTXug==
X-Received: by 2002:a05:6638:1402:b0:319:fe13:8eee with SMTP id
 k2-20020a056638140200b00319fe138eeemr8538086jad.130.1647742423702; 
 Sat, 19 Mar 2022 19:13:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a05660225d000b00645c8db7767sm6506688iop.35.2022.03.19.19.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Mar 2022 19:13:42 -0700 (PDT)
Received: (nullmailer pid 2990519 invoked by uid 1000);
 Sun, 20 Mar 2022 02:13:33 -0000
From: Rob Herring <robh@kernel.org>
To: Axe Yang <axe.yang@mediatek.com>
Cc: Tian Tao <tiantao6@hisilicon.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Yue Hu <huyue2@yulong.com>, linux-arm-kernel@lists.infradead.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Jeffery <andrew@aj.id.au>, angelogioacchino.delregno@collabora.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>, Eric Biggers <ebiggers@google.com>,
 Satya Tangirala <satyat@google.com>, Stephen Boyd <swboyd@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mediatek@lists.infradead.org,
 Lucas Stach <dev@lynxeye.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Kiwoong Kim <kwmad.kim@samsung.com>
In-Reply-To: <20220317101215.24985-2-axe.yang@mediatek.com>
References: <20220317101215.24985-1-axe.yang@mediatek.com>
 <20220317101215.24985-2-axe.yang@mediatek.com>
Subject: Re: [RESEND v7 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
Date: Sat, 19 Mar 2022 20:13:33 -0600
Message-Id: <1647742413.962309.2990518.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220319_191349_088885_007B6D89 
X-CRM114-Status: GOOD (  13.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 17 Mar 2022 18:12:13 +0800, Axe Yang wrote:
> Extend interrupts and pinctrls for SDIO wakeup interrupt feature.
> This feature allow SDIO devices alarm asynchronous interrupt to host
> even when host stop providing clock to SDIO card. An extra wakeup
> interrupt and pinctrl states for SDIO DAT1 pin state switching are
> required in this scenario.
> 
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> ---
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 24 ++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/mtk-sd.yaml: properties:pinctrl-names: {'description': 'Should at least contain default and state_uhs. To support SDIO in-band wakeup, dat1 pin will be switched between GPIO mode and SDIO DAT1 mode, state_eint and state_dat1 are mandatory in this scenarios.', 'minItems': 2, 'maxItems': 4, 'items': [{'const': 'default'}, {'const': 'state_uhs'}, {'const': 'state_eint'}, {'const': 'state_dat1'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/mtk-sd.yaml: ignoring, error in schema: properties: pinctrl-names
Documentation/devicetree/bindings/mmc/mtk-sd.example.dt.yaml:0:0: /example-0/mmc@11230000: failed to match any schema with compatible: ['mediatek,mt8173-mmc']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1606491

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
