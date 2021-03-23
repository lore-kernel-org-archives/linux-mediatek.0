Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20763C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 20:17:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4F4E619CB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 20:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4F4E619CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CeB9PbtUbSgsZ8uU2wlZtebcV9B80VV4I6PVy8guwGw=; b=LbAko3tCc9pdAGKeggl7hXoaic
	enUZwkr/b8ySWyxUD1iOHHqeCGpy/mQQGyQKuZdpEz93BoX9ST13mk2G1kEoLA6HW4MC7Sg/pt6ek
	BQ/juorECD91z4Il39cpx+7a+oy90JQT1vs4RXFj15K5pBSPsxO+383GKovkhAqcdiO8W8lyqN2+k
	6UYgRM8Q19DzgG5z/iqu4gZUF0AjT7H67ffPl5LuY9G0DzhFUkhLrzC7uVCGDM4sVn/KcaeRGxNdI
	kW4dgQKS/NxhgBOY5gIFbzhfMFT/uXy9av2LPycqXXyfOzPU90XlVMcQQ++xsFBsqDHRCHilASSJv
	oU/HDkgw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOnSl-00FdqX-KK; Tue, 23 Mar 2021 20:17:15 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOnSW-00Fdnm-VK; Tue, 23 Mar 2021 20:17:03 +0000
Received: by mail-io1-f45.google.com with SMTP id k25so6979633iob.6;
 Tue, 23 Mar 2021 13:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=20xlh8LGB3xwHBaeVz4zoEufs7vqABRi50X0pBG/dOI=;
 b=i0xqMZdzyCvLSmmQ4yYVWmbKjEocN70OK1+SFpuRlZwDn9Rc6d7BtwLp3KoHPrCCcB
 0y2T68cODiduu5TtVhG4LXkp9THeaIh9V/jd3+IcSoS0qt2371gZoZaIoSRWSEqCoqQr
 CtNodTlRJlvtgTc/ezLSOn/zxw9OOyY0ngA4gvRh3LHsORTzJ8RBd0LhLeaxe38sPb89
 cY+z9LKic0NqAWSgw9AFFG2cVtcWLh/FeetmX8mYOKz04bsZalK05SggjndYM7SJ4um1
 +Xalvwte98wWdJ5pctYpX7oYnqfRCiPGpBM1mAKTULcAu0hXlPRGnyt+IWBYl7SMHxCf
 xZ0w==
X-Gm-Message-State: AOAM532Df9zvu8Bn3YJ2Bx/PKAKDQNg5zLqxVSofsKGyy5IJs9xyghrQ
 +49Px45B8ncavzERxu+JCx8Zy0n5NA==
X-Google-Smtp-Source: ABdhPJwm5asRgRsRfOt9jGTSe8CCVpgMEZSzeTd8NVMQZp1yHuSHEBoVyGY9b1E8x2PRYMY5cFm2sA==
X-Received: by 2002:a05:6602:82:: with SMTP id h2mr5993265iob.20.1616530619907; 
 Tue, 23 Mar 2021 13:16:59 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id r5sm9700408ilb.75.2021.03.23.13.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 13:16:59 -0700 (PDT)
Received: (nullmailer pid 1244769 invoked by uid 1000);
 Tue, 23 Mar 2021 20:16:47 -0000
From: Rob Herring <robh@kernel.org>
To: Roger Lu <roger.lu@mediatek.com>
Cc: HenryC Chen <HenryC.Chen@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
 YT Lee <yt.lee@mediatek.com>, Kevin Hilman <khilman@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Nishanth Menon <nm@ti.com>, Charles Yang <Charles.Yang@mediatek.com>,
 linux-kernel@vger.kernel.org, Enric Balletbo Serra <eballetbo@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Angus Lin <Angus.Lin@mediatek.com>,
 linux-pm@vger.kernel.org, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>
In-Reply-To: <20210323135657.2701-2-roger.lu@mediatek.com>
References: <20210323135657.2701-1-roger.lu@mediatek.com>
 <20210323135657.2701-2-roger.lu@mediatek.com>
Subject: Re: [PATCH v13 1/7] dt-bindings: soc: mediatek: add mtk svs
 dt-bindings
Date: Tue, 23 Mar 2021 14:16:47 -0600
Message-Id: <1616530607.423782.1244768.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_201701_337511_03893E11 
X-CRM114-Status: GOOD (  11.66  )
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

On Tue, 23 Mar 2021 21:56:51 +0800, Roger Lu wrote:
> Document the binding for enabling mtk svs on MediaTek SoC.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>  .../bindings/soc/mediatek/mtk-svs.yaml        | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml: properties:nvmem-cells:maxItems: False schema does not allow 2
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml: ignoring, error in schema: properties: nvmem-cells: maxItems
warning: no schema found in file: ./Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml

See https://patchwork.ozlabs.org/patch/1457219

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
