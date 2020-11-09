Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BABEC4741F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 15:43:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4040206C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 15:43:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J2qEd9PN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4040206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FXCLzqIEtv0xMJbQKlsC+MtF1BP9IeBwGeSI170bmL0=; b=J2qEd9PNQyr9SMx7MuHSZBwIR
	+pzJj8W3bjodcuTlbuQ+eByf2VgIPGmT7HDv5Uhq6k8yGiw7UrxwWSGlyEN0GN0YNPe6SBP8LIXkK
	awTQFJSZAE3LO7rgHb/zpl1hemIvZp5wy8Xf8j1oF8e70pVWVBlCFKDTHH2pCOwE3ZuCu4sFY0aT0
	XakU1KmIbYgi76kbMzX7PZEv3a0XerpZXLqpo6fkrBu1qKvT7RoM+cOasoM+6qjtN9Wf+CJc9JS+G
	+TR+ztyy6ENCUfwizt7uy93+TyrM8xc7bbjLApjEOrLq0XdFgpzbVGDrqnOcWnSXz0GXU+XpOTqcN
	DZZ/zEe+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc9KU-0004ZE-Rj; Mon, 09 Nov 2020 15:43:38 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc9KR-0004XH-6K
 for linux-mediatek@lists.infradead.org; Mon, 09 Nov 2020 15:43:36 +0000
Received: by mail-oi1-f195.google.com with SMTP id u127so10657693oib.6
 for <linux-mediatek@lists.infradead.org>; Mon, 09 Nov 2020 07:43:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vmPHdNO2V3xVagdFRruugzUwa4mox3r4vQd+uFULzzw=;
 b=X6Yo6Ey3ar3+nLNfxIdhwCi7dRfBlIiTXGh3KPdnwTWVMsoX/xZwzDNL1LpFyGiw89
 XDC85ss1qU8q21nV4nbGHX/DyR5sRq5xgXZzWFxTIjyyxzt7ee2Y12oPBoRtR25MQ0yn
 Ge8rsc5Ew47+KvDD4giN463mUYz1GQApfsLUUcPquZ0CxnWbCVQJnQu8r0KUW3gvJkMH
 bo8GOHGuPUi3QREDC1Ln8peeFCl3y+qPIdi/8oJ8IKLfNf1Ut4TMvO1OAYtcYA9g3imB
 JOyQvKbaEq1J+jXxqA1XFvOX35EysbrpIpr/mGsuAdStR2n+dkTEpS4mVgFaPP8HnxZE
 wuSQ==
X-Gm-Message-State: AOAM531Zb0lbrpYco3Db4KACxOtPgELwr/3L4FfZJeFPlfPVTmgVNX5W
 Tt6InPvvSspwoWJDMvCxdw==
X-Google-Smtp-Source: ABdhPJxsJMnZlM8cAmgzrjW2o+B/SEhk2NbAJOapmL1tBceQyHQk9y349zXQ+hMtx1DpCM0G7yaJVA==
X-Received: by 2002:aca:3882:: with SMTP id f124mr8819448oia.111.1604936612223; 
 Mon, 09 Nov 2020 07:43:32 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m17sm2570898otq.57.2020.11.09.07.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 07:43:31 -0800 (PST)
Received: (nullmailer pid 1343597 invoked by uid 1000);
 Mon, 09 Nov 2020 15:43:30 -0000
Date: Mon, 9 Nov 2020 09:43:30 -0600
From: Rob Herring <robh@kernel.org>
To: Shane Chien <shane.chien@mediatek.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: mediatek: mt6359: Add new property
 for mt6359
Message-ID: <20201109154330.GA1343292@bogus>
References: <1604914209-9174-1-git-send-email-shane.chien@mediatek.com>
 <1604914209-9174-3-git-send-email-shane.chien@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604914209-9174-3-git-send-email-shane.chien@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_104335_328391_E52A4209 
X-CRM114-Status: GOOD (  13.41  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 chipeng.chang@mediatek.com, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 09 Nov 2020 17:30:09 +0800, Shane Chien wrote:
> From: "Shane.Chien" <shane.chien@mediatek.com>
> 
> This patch add "LDO_VAUD18-supply" property to
> control vaud18 regulator. It is labeled as required
> due to mt6359 audio path always need to enable vaud18.
> 
> Signed-off-by: Shane.Chien <shane.chien@mediatek.com>
> ---
>  .../devicetree/bindings/sound/mt6359.yaml          |    9 +++++++++
>  1 file changed, 9 insertions(+)
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/mt6359.yaml: properties:LDO_VAUD18-supply: Additional properties are not allowed ('ref' was unexpected)
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/mt6359.yaml: properties:LDO_VAUD18-supply: 'ref' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'type', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/mt6359.yaml: ignoring, error in schema: properties: LDO_VAUD18-supply
warning: no schema found in file: ./Documentation/devicetree/bindings/sound/mt6359.yaml


See https://patchwork.ozlabs.org/patch/1396618

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
