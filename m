Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C283C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 17:48:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E16AC2226A
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 17:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E16AC2226A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GEmsknkcVsqp4nWyrQMzESsnLe4pY3z8KFpaN0JCXlw=; b=uzCOheS9bYJ3Jj/K9Fp2o+ZcdX
	Gv7VNZfSXpBM+4gtw1tg+91je+7eLASCnD/nuY3UVvGgCjji2lp/N10+42CRpxNGUcfCrpOa2g4NC
	AePmJzvqANkkcT1or+BEw7xImGjsJNTC9hqr0Ch0IJyhJydp8FVIuNAzjc+uMApgEO0FNBnCd9Dzw
	8EFKBLeZqeXq6o60Q85KO7Q41TgtCrFhmgNqP1pCOKSF7/59A0ppCNggeRaYMAkRRJOEAAoKcccwd
	SKOJUb7DqSSB+qcz5+3suuj+uBPZnwRjiUMr0kbCGDZpBTbChE2X8xM4oO3+xHqpzZnzBGjClu2Jd
	djqjMcvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks8FJ-0003oG-OD; Wed, 23 Dec 2020 17:48:21 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks8F9-0003je-D2; Wed, 23 Dec 2020 17:48:12 +0000
Received: by mail-ot1-f54.google.com with SMTP id j20so15688289otq.5;
 Wed, 23 Dec 2020 09:48:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=NBaB9OjMijuFYsb2tvjMMoxL90yaFegnbgOp9iG8S6M=;
 b=LHo8yPZHg1hys2luv39aCRPD7UhBYLGr7gMcvT7oHGN/ctOZZ/0Ap3pitFgVPEUnDy
 xTPIXdVRUboJ49L05RPhtBbb4S59CrYZBtw+jKrr2iX0J23W99KlhAcDLRXNQAKuAumv
 1SayprSgT2KnwgwrykdxbqsRx3hie5WodnO9nNk6MdIzEM5XXZExKOpjNy26EoG6v3k9
 Plb8ZUBB2HwfyR2KnANQsZ+7a+mc+gDe6DDi7BkEmwePVWaUKmICYvPcEThxScRF3rud
 mPgeJXOei9wJnq/0ULplXoidT/vuEz6j+0JPfUZnT2IXKuxAQPalian9q4fngJ3SoQ4a
 w1OQ==
X-Gm-Message-State: AOAM530t62xQfK+7Cp3TdtO+AwM0XRq91H9h386yIGVzRCYKox0V16/3
 LwtfZCNreNDuKxbeBxCoHg==
X-Google-Smtp-Source: ABdhPJxoWwcQacwQfDzYmYHALN0inf1lF38zJ2gBpVT5+u1qnAmMGIgV8+VGj0Yi7/asyEjmU3iMxA==
X-Received: by 2002:a9d:39c8:: with SMTP id y66mr15195298otb.68.1608745688762; 
 Wed, 23 Dec 2020 09:48:08 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id a15sm5434563oii.50.2020.12.23.09.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 09:48:07 -0800 (PST)
Received: (nullmailer pid 762426 invoked by uid 1000);
 Wed, 23 Dec 2020 17:47:58 -0000
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
In-Reply-To: <1608691469-20919-3-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1608691469-20919-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1608691469-20919-3-git-send-email-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
Date: Wed, 23 Dec 2020 10:47:58 -0700
Message-Id: <1608745678.796615.762425.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_124811_470473_94CDF268 
X-CRM114-Status: GOOD (  14.18  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 srv_heupstream@mediatek.com, Geert Uytterhoeven <geert+renesas@glider.be>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 23 Dec 2020 10:44:27 +0800, Hsin-Hsiung Wang wrote:
> This adds documentation for the SPMI controller found on Mediatek SoCs.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
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
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dt.yaml] Error 1
make: *** [Makefile:1370: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1419576

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
