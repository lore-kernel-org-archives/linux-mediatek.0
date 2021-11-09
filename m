Return-Path: <SRS0=Xaha=P4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00746C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 13:08:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB0F661130
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 13:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB0F661130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wl2W/6/lgBlisOWKNTyzaqyAx4QvvIPDjB/40N7LEXU=; b=W2Rq5naVVmFkMV
	MxTGIkHbQmMsKrx1jCa37kD3wL0ypbANT3xIDteTjG4iCem8vAO/TFJ9zbvKIFHgz0zJknVgIItcB
	mluxTTMABEwtyJwmSWkCbeeLOcWfw/BQSVIrR6gbOkelmQzO2OQqDo2S5/feGhvyVFM66Zx2LSxG4
	smKlQpZfHHyB6saFF7LZGjnBSMoO9uGV5Tiua8V18MvoA7451lme2pn68o5B+PSfbpyOARi08Mu4m
	20bPRwNtQT3QhAROHMMNgTvskZqj2fH8KE17QLeq9GgitgEbX43WbIH/B14mlU0mOcEfS9SyrwokC
	nuy4CYYQ7rohEJMimlXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkQr3-002FtU-3x; Tue, 09 Nov 2021 13:08:01 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkQmt-002DN5-N8; Tue, 09 Nov 2021 13:03:45 +0000
Received: by mail-oi1-f172.google.com with SMTP id m6so7591885oim.2;
 Tue, 09 Nov 2021 05:03:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Ko2dk4khs6TuCfZWpKr+X/YpD/2ivl7IRDSFpijQnZQ=;
 b=2HgshjtPJ2dXbgt9OiY3ogOF/ElYFLpwFtf5cgxQ3RCAd99fCEfJaGM0wWxvelNU2D
 fmT7NoN44tduv5Yap+hMDiPFVuJa6AEaIAiNclMerbw9mZxBHIdCfxyC9Sieb1OyTiSJ
 khFyldHe9wC/3K2Y2QmK6y5eiZ+wt6popKJAYB606RY66tmpexgdMuPvfZvko+YT/0DY
 LLuxWOBnj3dx3F5ogtAmvKscuxnQTZygAaeRY7Wwe8Q5UKbPZdRvSB8+fA8lnDI1Ct4E
 Q/A3YLQWkmruXvd+Y+6HCWs5YpUpi/okT74ysZ/2WYaIB8kQc+y3VcX5648iQht0anP2
 1p2A==
X-Gm-Message-State: AOAM531dEvXa32QQmBRe4O+pnH9lnECmBc3pviucFmsgNkSAeB7Qyjr3
 FzQSctfuqUe7gLa7YFlm+Q==
X-Google-Smtp-Source: ABdhPJxmdR8zOIBybiLQ024IstvrijeHVsUHBInHYbbRC9DtlS4ssG0CMH25NvJfKGD8AYaliw43tA==
X-Received: by 2002:a05:6808:14d6:: with SMTP id
 f22mr5390171oiw.101.1636463022146; 
 Tue, 09 Nov 2021 05:03:42 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l21sm4102513otb.65.2021.11.09.05.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 05:03:41 -0800 (PST)
Received: (nullmailer pid 1726441 invoked by uid 1000);
 Tue, 09 Nov 2021 13:03:40 -0000
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211109053334.1840273-7-hsinyi@chromium.org>
References: <20211109053334.1840273-1-hsinyi@chromium.org>
 <20211109053334.1840273-7-hsinyi@chromium.org>
Subject: Re: [PATCH v2 7/7] dt-bindings: arm64: dts: mediatek: Add sku22 for
 mt8183 kakadu board
Date: Tue, 09 Nov 2021 07:03:40 -0600
Message-Id: <1636463020.563453.1726440.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_050343_803933_B7F0533E 
X-CRM114-Status: GOOD (  12.16  )
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

On Tue, 09 Nov 2021 13:33:34 +0800, Hsin-Yi Wang wrote:
> Add sku22 which uses different audio codec than previous kakadu board.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v2: fix compatible items matching
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/mediatek.yaml: properties:compatible:oneOf:27:items: 'oneOf' conditional failed, one must be fixed:
	[{'oneOf': [{'items': [{'const': 'google,kakadu-rev3-sku22'}, {'const': 'google,kakadu-rev2-sku22'}]}, {'items': [{'const': 'google,kakadu-rev3'}, {'const': 'google,kakadu-rev2'}]}]}, {'const': 'google,kakadu'}, {'const': 'mediatek,mt8183'}] is not of type 'object'
	Additional properties are not allowed ('oneOf' was unexpected)
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/mediatek.yaml: ignoring, error in schema: properties: compatible: oneOf: 27: items
warning: no schema found in file: ./Documentation/devicetree/bindings/arm/mediatek.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1552630

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
