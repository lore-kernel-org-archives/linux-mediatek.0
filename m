Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28116C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 13:03:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E400760F58
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 13:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E400760F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pY0j1U2AFG/i6WhSmo7doJisTvO0tWCh9oPT91OZgRU=; b=EFiZKnG9SrsiQU
	dfE64dGl60KKdYLMxN5fSm8UxA9ey5IuVmMR93S7KLU0NFlWCHDQFcuxvySCpJgpnZBdSNEzJctkM
	XABhO4TqT3WtKaA/xNHWHo7tkguAFrmy7ZMiWVFSgJ8fSW2fads2FNore0imh773qjSWvAf9hh3yb
	KX84adtfjF6v/u026WN6pi4UwEiZQYhs/ktuzD1CQaOAhE8xtIgO/sKrcbAmHQHuy6NkVJIUNmzaM
	a1Pkr+tKx28SNknQ/r8B68VONdNAkDcRd7yPCLzndKhYH42Zm9TC9MOqnlx4G//BrI1H37iRk6gQR
	zFsbEDy8001Oi5Y+bmFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ85q-005ozi-JR; Tue, 14 Sep 2021 13:03:22 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ85n-005oyQ-S8; Tue, 14 Sep 2021 13:03:21 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 i8-20020a056830402800b0051afc3e373aso18280649ots.5; 
 Tue, 14 Sep 2021 06:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=qnHLQlvfnxtVztuIYHK3ms7723UZCgnD6L/P89ZAJ0Q=;
 b=K9nzMoD4KY7K2YpL7KfT0zD+dHg+7j/kwkVsoyMK7m/sAj5Km+qw2WJ4nXmhYCxtIQ
 B6EO63WGc8g578cIkWeZcNZaOrNMwjvH8kYDZmH4/JJjytdSw35na8mP2tgKbnE5P77H
 9DOvzwms/Djucf2h+Bby5b7YNmirzv0mV6z+EjK1dOcTbbd2l01J4PwYC9zRstH08376
 OQ2wpU7EQ0B3rfb5IDUGOxMA+Elu9KNSdDekmIx/+4byiKsytBfDHEUI0ZT/dTzK19G2
 RHqsOY9BPAj6WAF9XKDtfs6zNFHlLo3hd1W9MjRuIl62C8jLsTWTGPH4iwUASkd7e074
 x6dw==
X-Gm-Message-State: AOAM531zBcWyePtdAIiTj1AHQwjbGjsX46L+hl/fMpkm9b+ywIdVF2Xi
 l4G7nL0TxAZMrVFeAooRsQ==
X-Google-Smtp-Source: ABdhPJx3NHf07YIw3RCc7Pa9JkTx4rPLNld3KvTBFvKz5sEfnX7HKpFTXMjEwHTpGXsdoYsDROG6Aw==
X-Received: by 2002:a05:6830:78c:: with SMTP id
 w12mr14116178ots.196.1631624597467; 
 Tue, 14 Sep 2021 06:03:17 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 99sm2628745otd.2.2021.09.14.06.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 06:03:15 -0700 (PDT)
Received: (nullmailer pid 3002728 invoked by uid 1000);
 Tue, 14 Sep 2021 13:03:14 -0000
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20210914090338.5945-3-hsin-hsiung.wang@mediatek.com>
References: <20210914090338.5945-1-hsin-hsiung.wang@mediatek.com>
 <20210914090338.5945-3-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v12 2/5] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
Date: Tue, 14 Sep 2021 08:03:14 -0500
Message-Id: <1631624594.142122.3002727.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_060319_955614_849F8D21 
X-CRM114-Status: GOOD (  11.76  )
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

On Tue, 14 Sep 2021 17:03:35 +0800, Hsin-Hsiung Wang wrote:
> This adds documentation for the SPMI controller found on Mediatek SoCs.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
> changes since v11:
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
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dt.yaml: example-0: spmi@10027000:reg:0: [0, 268595200, 0, 3584] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dt.yaml: example-0: spmi@10027000:reg:1: [0, 268603392, 0, 256] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dt.yaml: spmi@10027000: reg: [[0, 268595200, 0, 3584], [0, 268603392, 0, 256]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/spmi.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dt.yaml: spmi@10027000: reg: [[0, 268595200, 0, 3584], [0, 268603392, 0, 256]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1527797

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
