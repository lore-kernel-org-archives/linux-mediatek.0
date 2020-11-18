Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 748ABC56201
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 21:25:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D05FE246AD
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 21:25:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CLbLY0Ld"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D05FE246AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PPQSq7z+/sqTS3AYGh2jPQIR1nJ1yLzjXKdnE9kinaU=; b=CLbLY0LdwbwdqVLP48MZg1Sb0
	jH7kJ1OL4w3E1vTXHtuEm2Tt2PvkmgGvmhptqXQW7Is04F12qu0KQhtEAij0A2P6z2AiazhZoLDnN
	HMhIJtVDZKH5eFNI4wLNCEUYazMTac80ETdAf1+wnOIJRLv8lNVbGGn1P6IFNRpvU5XrDfF0b/V+D
	zocWdg7lNVdQwMP52pPWoskH4ILFF8O2VokEqVLb0TUG+kLgUX1MPtdX4DBAfHKAD0t8vTPDmnohC
	cXbhjmNKzTHsfbNUMLdbYm0KTEV4enE8l95sEbU+JjRfNVtVO/ZxdLiTgMl4Iw8NqXMKhrwDzk6In
	Y1Tx6/dIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfUwv-0002Cx-0e; Wed, 18 Nov 2020 21:25:09 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfUws-0002CF-KT; Wed, 18 Nov 2020 21:25:07 +0000
Received: by mail-ot1-f68.google.com with SMTP id l36so3262233ota.4;
 Wed, 18 Nov 2020 13:25:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dVopaicN4WO5jX3qlzk9Gxh2dwImscYqoXqAMkTLGu8=;
 b=ViySt18QalHyuJNHxn7EUYc9/KX6S8i4UT8aJ+4QVMpFh+0dyQnPLTvU7qkDtIR4JL
 q6U4KfN0oJJO7YNSef8T+srHH3cO2qyBdg6TORqwMcwIR0zgESQo2z0AKqGstUTfolEn
 KE7hoPLTcn8QJbm8T60zbwpQ481PlHIwLHWID4L/EnFoMga+bAWQnojnNgbdhNqMZXuJ
 xdvorrowAkqd1IaKDWRnwr7nFMr81kzcqHIr9UsNJc0x7t6jE0KxXCs2qLFpDyB650Ja
 z6FymMyBTSsqgU8o6JxssxYASq+JkTgWEOC7f1AyQ74pwVNweWledgQ2c95a0mR6+wXh
 T/EA==
X-Gm-Message-State: AOAM53242zlYu3scvmSkFcmWcegZpj7YlQ8YnHSlriwMdXwlVge7mC8R
 7WK3A3ow3OFPKu40A6XzRbAffsFuFw==
X-Google-Smtp-Source: ABdhPJzm/kk2CPACpsVZE1AAcctyqN5LX33XhWeNW5D2M0R6egknc3RR1Hv9LjS+QA9Yq/JuNdaKHA==
X-Received: by 2002:a9d:3b43:: with SMTP id z61mr7747094otb.178.1605734704947; 
 Wed, 18 Nov 2020 13:25:04 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j23sm7883400otr.80.2020.11.18.13.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 13:25:04 -0800 (PST)
Received: (nullmailer pid 1841192 invoked by uid 1000);
 Wed, 18 Nov 2020 21:25:02 -0000
Date: Wed, 18 Nov 2020 15:25:02 -0600
From: Rob Herring <robh@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v7 4/5] dt-bindings: leds: Add bindings for MT6360 LED
Message-ID: <20201118212502.GA1839537@bogus>
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-5-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605696462-391-5-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_162506_697537_E6894491 
X-CRM114-Status: GOOD (  12.88  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, dmurphy@ti.com, pavel@ucw.cz,
 matthias.bgg@gmail.com, shufan_lee@richtek.com, Wilma.Wu@mediatek.com,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 18 Nov 2020 18:47:41 +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for LED support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  .../devicetree/bindings/leds/leds-mt6360.yaml      | 164 +++++++++++++++++++++
>  1 file changed, 164 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/leds/leds-mt6360.yaml:57:2: [warning] wrong indentation: expected 2 but found 1 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-mt6360.example.dt.yaml: led-controller: led@3:color:0:0: 10 is greater than the maximum of 9
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-mt6360.example.dt.yaml: led-controller: led@3:color:0:0: 10 is greater than the maximum of 9
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-mt6360.yaml


See https://patchwork.ozlabs.org/patch/1402193

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
