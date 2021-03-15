Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB93C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 14:23:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A26A864F44
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 14:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A26A864F44
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIBOW2pQSodRxywb2kwNGZ3P88MepRUpPjdMsPCLkys=; b=Rodo96FZc489m2hPUaPtQMiuQg
	jq0a8mbrCRBv8FzwVlQA6McPLpzbqI1D3qMOT5XiG8ZnZIH5w+1AOhFeXonDn9s261yRJW4kQtXPh
	9AdiQ4Qdq7JdzlHc9YLqNjksXuvo0v7rKBSUyaOuk0urRnaMVEPvVp2VP+WVuKzdn8fZ6kowv+4en
	ac4KALrC2d7GE1OYPo2dIwqFtfuzZIIY7E0Ao9iNbGCJgL2dXDY6WC1MUnitj+Kkt8lduwXbKqexJ
	pb3SLuwOnSfKk/XbKfvHQtQBChgEckXL71mbSJox2wLV+JWTwV20ey63wIK3m3qDV66MGBeDxOZpj
	Pm+ZWceA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLo7s-00G4dh-GX; Mon, 15 Mar 2021 14:23:20 +0000
Received: from mail-il1-f180.google.com ([209.85.166.180])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLo7f-00G4cc-SH; Mon, 15 Mar 2021 14:23:10 +0000
Received: by mail-il1-f180.google.com with SMTP id e7so9482407ile.7;
 Mon, 15 Mar 2021 07:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=oLOVDEMXUd0z7d7GNWysLdHA6uYR45L2692BI1BuF8k=;
 b=En35faaW2tURD21cU34RSDB1DXI5e3XsqmJ4V/gnHMlzMmUCaMlSYOR8gjOcK1bTrj
 B8Vc+FW0E1S9KEPaA/cbfdd/TreS782hxvupHo2bWi9rQrJJQP4fK/v9hcWGvSi32V8G
 wMmiSKilXiVc5LkcQz8s3iacxRyCLdouYaSGwK9RG/Sa1/jtVW2CscrZT/rYqtNxlF/P
 LGoIXXju/cLlhub6OG+Ua8uU+dl8pN3Dq3ID/c5m5L2m94oFGc+g1juBjVj47RM3ujGK
 MxsZS/4LU55YyJXfG+KIaOSR55zc72NEqgiJ+q6ZjJnVRzxNXpYM/ilFeIvUln+X8j+b
 ZSig==
X-Gm-Message-State: AOAM5336P4iRpTo+vWSWx5i0PQrPxpWyXJfybSP1jSK3O/1HdTJ+G1FK
 2sLAeYqdx2nN0dZ/37Z15Q==
X-Google-Smtp-Source: ABdhPJyJaLzWwqZ0e33L04X+5XOEtJ4gyAKByRO3upILfxDT9jfNp9xwndSgJLLkoSLLkeNBmf8Xng==
X-Received: by 2002:a05:6e02:489:: with SMTP id
 b9mr11999835ils.37.1615818186233; 
 Mon, 15 Mar 2021 07:23:06 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id b9sm7132643ioz.49.2021.03.15.07.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 07:23:05 -0700 (PDT)
Received: (nullmailer pid 876374 invoked by uid 1000);
 Mon, 15 Mar 2021 14:22:57 -0000
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1615658453-3989-3-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1615658453-3989-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1615658453-3989-3-git-send-email-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v7 2/4] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
Date: Mon, 15 Mar 2021 08:22:57 -0600
Message-Id: <1615818177.192018.876373.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_142308_033488_750CFEFD 
X-CRM114-Status: GOOD (  13.25  )
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

On Sun, 14 Mar 2021 02:00:51 +0800, Hsin-Hsiung Wang wrote:
> This adds documentation for the SPMI controller found on Mediatek SoCs.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> changes since v6:
> - no changes.
> ---
>  .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dts:19:18: fatal error: dt-bindings/clock/mt8192-clk.h: No such file or directory
   19 |         #include <dt-bindings/clock/mt8192-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:349: Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1380: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1452529

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
