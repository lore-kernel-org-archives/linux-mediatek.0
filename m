Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF09C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 17:55:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E881D650DE
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 17:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E881D650DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmlnrCQtuKxZ1bPkaqlR6SoXcjrygyXZRZmj7wGR5Jg=; b=oZz7OTT6DKVAYerwSgXNtVnpdH
	1KYlr9uYw7ZnmD0+xT3gdlo7zMIvD7APy/KdlNy2STtp+lpwIl91njEhLaWugc3BVIozRH3BMR28w
	fzr1p01cdTGGgM1pilH1YMPhvCnzrouLKUTCecO8h6GD2olOUMKo6IIUS7e/WYJAHYjEsVDhGTuw3
	ubdwWMayypoRpvAOEbmsqajoJEUrYXspgdR0Zr6azkB9IvDZBl8GRU7syNNlii2+O8/5kYGN5JPlK
	yEGF+WKfC/y226jXqrF6exdfm/6RwJLZFbFPwXtRqKsETpbncq5OG1zO2sfV/4LzXKMNHBVfnh5eI
	ut28ouUg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMDuZ-001Trt-TN; Tue, 16 Mar 2021 17:55:20 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMDtW-001TSK-3D; Tue, 16 Mar 2021 17:54:18 +0000
Received: by mail-io1-f42.google.com with SMTP id n14so38170758iog.3;
 Tue, 16 Mar 2021 10:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Z93rlUj9sdWeq37uZfM03RuUP74yX70Y9MLTGZ1xQjw=;
 b=BuCyy4p+taq1r4f0gpgKcP42VXxayg5lxaYBSeTwNRah6sICD3VMEAbGpZWOumVfgK
 NOAnbDFNapRog1raoEJQ5vahyEFOkiNY5NVdZ2ukgldM5JCVFkshlBExgGRqaqCBR96R
 nwCeogoAMHgKMNc4xI28ZGKhYj4MCgR12diqDacSUbOyPo55nRMH/biazc3paZjJxjoh
 kmiIcPP33xoK0TMHqgqH4AwebR3ElSL1Av/eSHpjZ8su6g8lfq9ziPvwd+MdEdeUmcpM
 n2dpxri+kfKrO8Rv3iImBE4/7FeHVtl+sc4y9hyA47InS9jxGHQ8zb6cbTjHGPLmdp/c
 yz1Q==
X-Gm-Message-State: AOAM532KLaFdZf51dQYgKXXfZ+ZRJIChVHq/EdaEKCYIx3VPlPnsODkO
 L33ONn926wQPDTTc5cvt+Q==
X-Google-Smtp-Source: ABdhPJx9NqGassAFyEjEetsnxzPc4LiCv5OZO+q67dVfM9IFfAuk7yGqkR/agnODdaVp/QC2A1v/ig==
X-Received: by 2002:a05:6602:26cb:: with SMTP id
 g11mr4090124ioo.180.1615917252062; 
 Tue, 16 Mar 2021 10:54:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id l16sm9795688ils.11.2021.03.16.10.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 10:54:11 -0700 (PDT)
Received: (nullmailer pid 3326118 invoked by uid 1000);
 Tue, 16 Mar 2021 17:54:09 -0000
From: Rob Herring <robh@kernel.org>
To: Roger Lu <roger.lu@mediatek.com>
Cc: Kevin Hilman <khilman@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 HenryC Chen <HenryC.Chen@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>,
 Nicolas Boichat <drinkcat@google.com>, YT Lee <yt.lee@mediatek.com>,
 Stephen Boyd <sboyd@kernel.org>, Charles Yang <Charles.Yang@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Nishanth Menon <nm@ti.com>, linux-pm@vger.kernel.org
In-Reply-To: <20210315133018.4976-2-roger.lu@mediatek.com>
References: <20210315133018.4976-1-roger.lu@mediatek.com>
 <20210315133018.4976-2-roger.lu@mediatek.com>
Subject: Re: [PATCH v12 1/7] dt-bindings: soc: mediatek: add mtk svs
 dt-bindings
Date: Tue, 16 Mar 2021 11:54:09 -0600
Message-Id: <1615917249.208932.3326117.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_175414_590356_CECC0486 
X-CRM114-Status: GOOD (  11.24  )
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

On Mon, 15 Mar 2021 21:30:12 +0800, Roger Lu wrote:
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

See https://patchwork.ozlabs.org/patch/1453275

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
