Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA41EC47088
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 14:39:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A40DC610A2
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 14:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A40DC610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/cV4tOASLXP7CjWlwaPyCToLNGmRPmen38svCTqJCRg=; b=hoZRLRtO6aY9wW
	WGSBpsVSwUILSzGvah+INGEFvhQuOfj8tyMkBbdinnBD2bp3EwaeFFnkwJ5D31SQG5BdR6tgpXlR+
	1k/JnN3MqwL/gdKI6wD7KJkQRynIewrTtX8WPL6B0wijPSBrLY5l3qXJH9fbu1kzw7/fg8cRsMJ2t
	ECG0N3RlWZfFk+jK0RXHi+PT/ilihobexwiL7qRxpNe0QKKHlOuRdrVPBaTVxy1IT8dUAK0hEEmIJ
	x6wLyfJt1YJYiDpSJCyPwigiDlIiQPcbYEWkHgv11IWcQSKfW06JGXOTl7+ysI6VsjFviQ3MkO22N
	/tVtLfUs4gONccuqpaUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llugh-00EygP-62; Wed, 26 May 2021 14:39:11 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llt52-00ECYe-BM; Wed, 26 May 2021 12:56:14 +0000
Received: by mail-oi1-f176.google.com with SMTP id c196so1352462oib.9;
 Wed, 26 May 2021 05:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=fs7e9A+XJ/srQYYXIBNRC8+bt0OfYmMIoJPIdWXMl4g=;
 b=WwkNKP85YaHQ8dS5BJvTYomCXQmToS7FtJ1wWdO97Cpm3fZu62t2sTbbA70awH6EZX
 0N8Oq0taUBnPDqu6fyjaIO7ntjucjPMr/hiSsqEGaoKZDDs2lw2Yy/eZrMkxbQPWPUX/
 Ov+38iyT8c2MQ+1rsKYHzEs0OlCgtaZBVV8nwz5quoiVo1gLhRfzA0kP7OlqaniN3UtJ
 OuxuS7yT7+CtTlfFzXueufUc9JL0ObTp7lTME30KmPMkkeTqgvxKcf3V7RYabJeLutLx
 w7+oRbuR0tZ3gUlSsnMpmcT/bBJC+8XKLW6OxYh8FtMQLfBCdlsi47jGF1T5APAxCsyC
 FSJQ==
X-Gm-Message-State: AOAM530rSGWWrOscrO382h0FJCo8jjm5guYnm+SdBqDnu5qkiOjsnZ+1
 c7mtjLaoM7atzMCcxBSsVQ==
X-Google-Smtp-Source: ABdhPJz5cSxik7of9vtoK0dE8Ba6tx8iuXcA/g2LpwT/q8f/f+dFRALbWORv7YbDdm7Uk4poIQ50+Q==
X-Received: by 2002:a05:6808:187:: with SMTP id
 w7mr1858125oic.108.1622033771014; 
 Wed, 26 May 2021 05:56:11 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x63sm816645oix.47.2021.05.26.05.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 05:56:10 -0700 (PDT)
Received: (nullmailer pid 2377041 invoked by uid 1000);
 Wed, 26 May 2021 12:56:03 -0000
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Stephen Boyd <sboyd@kernel.org>, srv_heupstream@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <1622025344-31888-3-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1622025344-31888-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1622025344-31888-3-git-send-email-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v8 2/4] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
Date: Wed, 26 May 2021 07:56:03 -0500
Message-Id: <1622033763.799295.2377040.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_055612_437463_78B7632C 
X-CRM114-Status: GOOD (  14.74  )
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

On Wed, 26 May 2021 18:35:42 +0800, Hsin-Hsiung Wang wrote:
> This adds documentation for the SPMI controller found on Mediatek SoCs.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
> changes since v7:
> - no change.
> ---
>  .../bindings/spmi/mtk,spmi-mtk-pmif.yaml           | 74 ++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dts:19:18: fatal error: dt-bindings/clock/mt8192-clk.h: No such file or directory
   19 |         #include <dt-bindings/clock/mt8192-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1483989

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
