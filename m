Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FF6C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 13:59:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 218FD60F92
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 13:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 218FD60F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jG4Nh9z48EXXC+0U58ckyFNjvKBXBQt9DwBKOSWRIAI=; b=zwlGkSN2GVJoIX
	aHHWctXKfC2oUvTWn0B8oXiA0wsMfexRR8ENSvpLiMEO09hA6v1tMIYQArP4s4o3S717aMFdHES/G
	Qdmlm+Dy1cspAorRbInLSulo53kt1foBhP+HvbG131NwbQPzfYo2m4PDeK/4IhxjgOmgAqM1wwLuS
	LBtevyGhOjDh8i8o7tgs7Gonsb8lxUeRdeMEqmWjPjXfwGuRaVXfDnJpASd7BoKgVceBeIYa+HGA3
	tbIg2YNq3v0jwaBqt2OfSMWBKZSt0QCohCRE/pTkRppGM2G1untpPi1QV0E1btkxz+VR47HVJkrbB
	cL1deBHnb+skuGaqFJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAuxJ-0037e0-C0; Tue, 03 Aug 2021 13:59:41 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAuxG-0037dZ-Bt; Tue, 03 Aug 2021 13:59:39 +0000
Received: by mail-il1-f177.google.com with SMTP id f8so16294748ilr.4;
 Tue, 03 Aug 2021 06:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=YJEwfvXxEQoCSvi3Imkoy2A3S44+KPxOIY3UOxwGxYQ=;
 b=l/2GoSyx4060jko6gSVtw+NVrnrBdVeUVmn08/ALxKV5KiRr1RXUfTEJe8lvNSGiiu
 CSZ41uEclXYniGTM8fOxSHnNuHomzulAxSkGqTFNMFnX/sQmtNW5CJMATOcC3gzSLsL0
 41w/KXDT2fD8HxkFazmIAFozV4+iZmAbAy740LwbtJihiO3ZCIRuc0FWHgPlT7JL65S+
 0wSh7KC9qpDqZm8UG5f825BBBnc23qoBSgdWHQr0UOknKhh0e6g1+qfkuRBlUtJaMG1F
 Unwvxy29KISqCLXhsA1W/3N2IqwQF2SKmcisjrlOpG8hv31nrsCYGXUQfeWMFZ6VL9D2
 X96w==
X-Gm-Message-State: AOAM530Q+5BrtQpcPH0uwwZ9VX/+IqMSUnF2q0pyef0WvhL5wNb+wEdy
 zERyLYKjML19YZjeGVycrQ==
X-Google-Smtp-Source: ABdhPJydosHbUMC3l3Q5iokZVtVDy0/O4JeNWAppyEHHOo14g7SwbkcNcU6C2ZSn78b0VCB1rUrOgw==
X-Received: by 2002:a92:c043:: with SMTP id o3mr876190ilf.189.1627999176150;
 Tue, 03 Aug 2021 06:59:36 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id d9sm7561292ilu.9.2021.08.03.06.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 06:59:34 -0700 (PDT)
Received: (nullmailer pid 3179056 invoked by uid 1000);
 Tue, 03 Aug 2021 13:59:32 -0000
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Andy Teng <andy.teng@mediatek.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <20210803051318.2570994-3-hsinyi@chromium.org>
References: <20210803051318.2570994-1-hsinyi@chromium.org>
 <20210803051318.2570994-3-hsinyi@chromium.org>
Subject: Re: [PATCH v3 3/3] dt-bindings: mediatek: convert pinctrl to yaml
Date: Tue, 03 Aug 2021 07:59:32 -0600
Message-Id: <1627999172.502726.3179055.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_065938_453745_1F5B1CF9 
X-CRM114-Status: GOOD (  14.32  )
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

On Tue, 03 Aug 2021 13:13:19 +0800, Hsin-Yi Wang wrote:
> Convert mt65xx, mt6796, mt7622, mt8183 bindings to yaml.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v2->v3:
> fix comments in v2.
> ---
>  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      | 206 ++++++++
>  .../pinctrl/mediatek,mt6797-pinctrl.yaml      | 173 +++++++
>  .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 373 +++++++++++++
>  .../pinctrl/mediatek,mt8183-pinctrl.yaml      | 228 ++++++++
>  .../bindings/pinctrl/pinctrl-mt65xx.txt       | 156 ------
>  .../bindings/pinctrl/pinctrl-mt6797.txt       |  83 ---
>  .../bindings/pinctrl/pinctrl-mt7622.txt       | 490 ------------------
>  .../bindings/pinctrl/pinctrl-mt8183.txt       | 132 -----
>  8 files changed, 980 insertions(+), 861 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt6797.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8183.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.example.dts:21:18: fatal error: dt-bindings/pinctrl/mt8183-pinfunc.h: No such file or directory
   21 |         #include <dt-bindings/pinctrl/mt8183-pinfunc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1419: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):
MAINTAINERS: Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
MAINTAINERS: Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt

See https://patchwork.ozlabs.org/patch/1512734

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
