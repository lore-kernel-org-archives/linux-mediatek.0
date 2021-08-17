Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCD1C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 18:18:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7BB56103A
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 18:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7BB56103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRyv8+e72njSoqEzwkuLRZgsK94VDAfCVH8sUVtYGjc=; b=bqgE7piTn7OAGy
	GtE7OQUHoxh96BXMKQS/uBlpL+eyf2DxyBAQjkYHsYMR7yxLjYpfPJcoKRW3ArgItlab/sTsIIG2q
	t0RoxkrLacLfHMPQaH64uWnBlwwGfSyvO1yXeBv+V68p0Q5LIgt0u3kUSmB2/D48kZfh8AQSXG0la
	nFQUwG7P5t41lrMrPpan+KqG6aVc+QlqYwWbG+GTjaoOY1VDyLr3T+jY9D6V5zgqrXbG0291ZuWDk
	9bXE1hNM+XoX0J3FGm9yt83mzoTamw8jLrfIUZZyjEAR7FEgdjB4SRzGvvuHLo7YThKzT7La9pD/x
	usfV3pjZWB5dCGyOyIhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG3ew-003DZ9-J4; Tue, 17 Aug 2021 18:17:58 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG3er-003DYD-H2; Tue, 17 Aug 2021 18:17:57 +0000
Received: by mail-oo1-f41.google.com with SMTP id
 w2-20020a4a9e420000b02902859adadf0fso6162791ook.1; 
 Tue, 17 Aug 2021 11:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=DLWFI+GPG5JMvw8QB510k7IFEr+jZGWWgLmkQQbrRKo=;
 b=duY2tnjBnz7o8ZWpfEl4KVOxZg/MDIm9wth9QVmw/xzJGYJ74SQwUAtc4iGkN2in/o
 m2jp9Ak1eKzZUcxNjAo5NDFLBAE10ZfFPn2dGsXbXxkWHcAh9IYmGXkw7drWPDwQSdqt
 oI+jTYmiVBpU2YQq86nptaaZVk/mY0h6/8C03xiBqJAYhrOcFRl3989bG3gV6v7f14TI
 pu72t4qP+9QdYNNXtVSM6jQ351fzf8slMcaATNbemWYQcdTA4EdjQI19EnxIBUhubNKZ
 I6+QK6pBnapb1h6tkIb/Qky7N+KKIzJYqzsMKW98+e+81fVaG/wYUQiQAqa5tBTxvgEQ
 vhhA==
X-Gm-Message-State: AOAM533r1t0Sh5R/i6bLLOI5zu0c5K5Il4g4M92197/6cnIkUAYFiREY
 z4SCRwCVWHHKzfgyJJGs6Q==
X-Google-Smtp-Source: ABdhPJxKzWPRH2R4lMGCh2vpZEkEho1oQHFMv1Kw1X5iQCV+eQQriQ5tWlVqpdSC0eCYWsRUHu3sEw==
X-Received: by 2002:a4a:e874:: with SMTP id m20mr3537958oom.29.1629224272205; 
 Tue, 17 Aug 2021 11:17:52 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e2sm526769otk.14.2021.08.17.11.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 11:17:51 -0700 (PDT)
Received: (nullmailer pid 589512 invoked by uid 1000);
 Tue, 17 Aug 2021 18:17:50 -0000
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, james.lo@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1629193630-19994-3-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1629193630-19994-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1629193630-19994-3-git-send-email-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v11 2/5] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
Date: Tue, 17 Aug 2021 13:17:50 -0500
Message-Id: <1629224270.762546.589511.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_111753_614052_60A671D3 
X-CRM114-Status: GOOD (  13.84  )
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

On Tue, 17 Aug 2021 17:47:07 +0800, Hsin-Hsiung Wang wrote:
> This adds documentation for the SPMI controller found on Mediatek SoCs.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> changes since v10:
> - No change.
> ---
>  .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
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
make: *** [Makefile:1419: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1517677

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
