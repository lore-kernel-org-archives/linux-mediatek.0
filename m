Return-Path: <SRS0=RaJc=P6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8649FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 14:58:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58E32610A2
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 14:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58E32610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMlXpIbQfK2zyrwqU9b7Ge0z6ry/o+g2hzkt6YzlGP8=; b=JUtQCtEF2siqw7
	5P11bxL2bsEVTZ8UWG0q3dnbD59G6Veimf9cF+xiuIX0SMszU5tllshuCwobT8xbbmmuSfi6vGhQX
	ir6EAQRz/OwS1SWpXLSAf/NvOcBI4glpLUy42BZcMA4EZiO4MqyiolRbAmrCFLQilrpODyh2sMtwa
	kknSX/ec8f0wp6fHVE/Z1Ia9GXM1+ak4OF2JPvCshIDajLJiAE1ZJVXmryJ/msEB+wmCGLu3IOwvB
	JDquo7gwhaLiFnvTANpgt1DYYuYAqUkYZcaVxV8GSJtcTJnUBRi1IzNNDSHX4tflOkYbumJ9rbhhq
	5RozKL1F4tb/R/04ao/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlBWZ-008CSp-JS; Thu, 11 Nov 2021 14:57:59 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlBWD-008CMP-Da; Thu, 11 Nov 2021 14:57:38 +0000
Received: by mail-oi1-f180.google.com with SMTP id m6so12081159oim.2;
 Thu, 11 Nov 2021 06:57:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=eOq5ir+TFZBL5cj7XaOZPw0GldpRN8fcVtMKUZ8KDPc=;
 b=A4pIZwd0oq/BPBVJhCj2I5EbL+rk6MlYD/mnSYdRrmjJ9So9ie/FH14Lgs+wC8Us/Z
 Z385OcX3ceMUzOyQLfIggnQ7wRuT6/+JcjxH76rdwM4iCqS3ceXjVEmuQzuAmptb8LeJ
 IO6ECMnHWf6IE8PYcMEb74arUtmZ26vgObjiWlsqJuG1HzuoI3InWVb+01AaDkxk1C+5
 wV4ELwRi96G3wAu+KGHtp+cr7LaXPOtwBYxYnob2S39nM23MIG6Cds1GtSrhDyXMNheA
 G0rDoU1IQxfP0j2S+U18IR4mSwXeEZPbicZ6iuHtqbvsEMhdNGrEvVzpPSza4K6wCRLG
 dSnA==
X-Gm-Message-State: AOAM533xmexrjsteU0wjSMGIcsymhK6q95vFGlmy6lMgYoX1ppgVmwZ2
 HhGcql+FJ06is22M2WLF/911HDMk1A==
X-Google-Smtp-Source: ABdhPJylUnRgVbfCJwWY8YapTYWcyJT8PtHaBGyigns+dkTO2lU8gHUIpbJagVcgphNPxro1ePlm2w==
X-Received: by 2002:a05:6808:159a:: with SMTP id
 t26mr20008829oiw.106.1636642655301; 
 Thu, 11 Nov 2021 06:57:35 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id ay42sm769577oib.22.2021.11.11.06.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 06:57:34 -0800 (PST)
Received: (nullmailer pid 3774089 invoked by uid 1000);
 Thu, 11 Nov 2021 14:57:26 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, srv_heupstream@mediatek.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 macpaul.lin@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, linux-mediatek@lists.infradead.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
In-Reply-To: <20211111071214.21027-5-biao.huang@mediatek.com>
References: <20211111071214.21027-1-biao.huang@mediatek.com>
 <20211111071214.21027-5-biao.huang@mediatek.com>
Subject: Re: [PATCH v2 4/5] dt-bindings: net: dwmac: Convert mediatek-dwmac to
 DT schema
Date: Thu, 11 Nov 2021 08:57:26 -0600
Message-Id: <1636642646.918741.3774088.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_065737_478656_2DEF7E9E 
X-CRM114-Status: GOOD (  11.25  )
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

On Thu, 11 Nov 2021 15:12:13 +0800, Biao Huang wrote:
> Convert mediatek-dwmac to DT schema, and delete old mediatek-dwmac.txt.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.txt           |  91 --------
>  .../bindings/net/mediatek-dwmac.yaml          | 211 ++++++++++++++++++
>  2 files changed, 211 insertions(+), 91 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.txt
>  create mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1553803


ethernet@1101c000: clock-names: ['axi', 'apb', 'mac_main', 'ptp_ref'] is too short
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: clocks: [[27, 34], [27, 37], [6, 154], [6, 155]] is too short
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: compatible: ['mediatek,mt2712-gmac'] does not contain items matching the given schema
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
