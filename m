Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B533EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 19:44:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AD926113E
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 19:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AD926113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U8KG3SfY362zIUFljt0fhK4AmzYD33cAC/xOlyquSgE=; b=pNuVuit7BB9SDt
	iYsbv9Vc4ReF81OEEMpxo6GUJPSVKZ/rS3KmIh3211PDqrXDbfSmHYmbv86v7DEuh2IRKZVi15mXD
	hRV6osyhjwp3CK7LC4VYjm1xfb4JUwo9VefZ40Bwom39/SHv8BJwMrDkGDMsgLNOS46t+FaltblN9
	3Pq6KCIKk6F0lDfK5NQHoJiHHiFFcV0mCjtD2SHg78AqvkaZJspUd8et+ZIMhaXdSgWsiXfvlsXp0
	Z6Fk6lgdZqNJCHUVC18yr8uw5nr0z+NAkS9uHaq6HERrIc6UufNDW7PqA+fvJm0l6DKAAsVkdglib
	sDyt7CULGfoPJj4Ym9+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mktWE-006BWU-P9; Wed, 10 Nov 2021 19:44:26 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mktWC-006BVp-NJ; Wed, 10 Nov 2021 19:44:26 +0000
Received: by mail-oi1-f175.google.com with SMTP id q25so1698314oiw.0;
 Wed, 10 Nov 2021 11:44:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=likDWmDbN5o7SnT6cQ2yzO1g3PQ+qTt1FP1WspXaXGk=;
 b=4ECLOI4S45+fzghFfpM350zM7cBFatOz9MFChkFcOVezN6YRpfTyPyleV8kX7Zbhda
 +Upkd2ipBkbbge2WHTVe6aXTRIqiZhAMmz0rLroqZWCIv1ZGl2UY/ue85asqWY3bJWAV
 iZv05KSGXan8llitN2BD8neQseiYT3b+iYv8qd0GB7PPvWGiOpqOS7Qgbz0135djVoA7
 B6OjQNFGEGJw1Uwvjdq/h5lHUnk1w55T27IZUh4SBXfTE+JjGomWeG0nxauOiugq94QP
 FiuKyrxU8w2/LhnRhm/y8e2+pTdF+B1id7YJ9WxXTGQY7KlnOl/TpDk5yRSP/npQNxuf
 u2hA==
X-Gm-Message-State: AOAM5324AKMH6O8onPTsB1RdJr0axlTB24lLcoh1aaGbsRClgZkkndwQ
 hjlZufCMV4+8i3cLHjnafQ==
X-Google-Smtp-Source: ABdhPJwlYFTqlf/pRDAF7GOesoK3aqCR/9qaTWoFXcVxyzNBSZ+QDPSjYJOp7qkgxie7eyK+wcyhhg==
X-Received: by 2002:aca:be54:: with SMTP id o81mr14764752oif.64.1636573462569; 
 Wed, 10 Nov 2021 11:44:22 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 3sm162484otl.60.2021.11.10.11.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:44:22 -0800 (PST)
Received: (nullmailer pid 1783736 invoked by uid 1000);
 Wed, 10 Nov 2021 19:44:20 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: davem@davemloft.net, Jose Abreu <joabreu@synopsys.com>,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, macpaul.lin@mediatek.com,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
In-Reply-To: <20211110083948.6082-5-biao.huang@mediatek.com>
References: <20211110083948.6082-1-biao.huang@mediatek.com>
 <20211110083948.6082-5-biao.huang@mediatek.com>
Subject: Re: [PATCH 4/5] dt-bindings: net: dwmac: Convert mediatek-dwmac to DT
 schema
Date: Wed, 10 Nov 2021 13:44:20 -0600
Message-Id: <1636573460.872424.1783735.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_114424_782698_1A55F0B8 
X-CRM114-Status: GOOD (  13.34  )
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

On Wed, 10 Nov 2021 16:39:47 +0800, Biao Huang wrote:
> Convert mediatek-dwmac to DT schema, and delete old mediatek-dwmac.txt.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.txt           |  91 ---------
>  .../bindings/net/mediatek-dwmac.yaml          | 179 ++++++++++++++++++
>  2 files changed, 179 insertions(+), 91 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.txt
>  create mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml: properties:mediatek,tx-delay-ps: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml: properties:mediatek,rx-delay-ps: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml: properties:clocks: {'minItems': 5, 'maxItems': 6, 'items': [{'description': 'AXI clock'}, {'description': 'APB clock'}, {'description': 'MAC clock gate'}, {'description': 'MAC Main clock'}, {'description': 'PTP clock'}, {'description': 'RMII reference clock provided by MAC'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml: ignoring, error in schema: properties: mediatek,tx-delay-ps
warning: no schema found in file: ./Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
Documentation/devicetree/bindings/net/mediatek-dwmac.example.dt.yaml:0:0: /example-0/ethernet@1101c000: failed to match any schema with compatible: ['mediatek,mt2712-gmac', 'snps,dwmac-4.20a']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1553304

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
