Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA429C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 20:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CX+7LtPSCXGbXPl8SAsptqdekPbVKnp83XZNVyztqcA=; b=oOzdqSg0NWb2Mh
	y6D4llKHAFS2D2NgelMBICz/6/qBn5asm0CJxB56LE7x1GCeZ9KCcuZO9u34mW6zBNl2T7YHwTyaN
	ERALX+B9Dfkh/Xauv1Vl+E2TOrpCQYmUAFbWKFGzft3biQ0VJMPNLXaPrXY2hHdZNtHbXTavPn0dV
	q9nwYk9tRJrCG+GDzbqlwHqBfsTSQVmPna5EO1XW6D6OWAMi3AeVqcbp24mt9X+be21dOxj4Ocss5
	j0JZk5gVcE3z9IE+lDIEneQ4hXvYOweYIkLROeFfDgBwpj4tCVihE0PNKl3zrYT5zA7YvhPXebxvJ
	nk50pjQkUnEDtguft1tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNL3X-002NBO-Cr; Thu, 24 Feb 2022 20:49:43 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNL3J-002N85-Ml; Thu, 24 Feb 2022 20:49:31 +0000
Received: by mail-oi1-f181.google.com with SMTP id k2so4927977oia.2;
 Thu, 24 Feb 2022 12:49:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ad4J5+9RdUyS+Z6nJ1tSy2gtAoNHPdi9y1eK0/M4fGc=;
 b=2FmaIy8dx1zWWM/DL/3v8jWp880HbKGzRqsL4YYlJBro5w+I361agGoIQaD0wTrWkl
 DjElxdlZFUgpIp71k0Qr7x7iAen3tABvbToCsFKd16SYxIDB0uvxaEL1aW3Dz1r07ejR
 sHmXvYHe9aicA1g6230io21imV/7vxpKiXfoGVbPlvqdDTH8OL0MxfU7fDgHPI/OSRNF
 lnxYmYb/NB+nPEAFQu2ltaogW1Nc2gM7qhGWT7ug9n1NFcCsB6JZ0104AwBb76cBxjZs
 x28KI+FUCGrOPDPDq1KAOzA/r4sF2xnkHR2nGNBeM7xtXmD8lbJknKIKn7V1P2ot5qyx
 n/2g==
X-Gm-Message-State: AOAM5327XmC4Im+BZ1B5ZKF2/24NtcFdUW1I69YMhynJhkchIAHOusHn
 AJuWDapvvIJIyukWjMQ5Uw==
X-Google-Smtp-Source: ABdhPJyNOaa8f2/SMomPS8HIDN+rN46ER7uWdTBb9aUTc5PuznLNa1TL+sk5tH4Dr49CjtvFltA65w==
X-Received: by 2002:a05:6808:2213:b0:2d4:f6a4:cc99 with SMTP id
 bd19-20020a056808221300b002d4f6a4cc99mr2401266oib.195.1645735768488; 
 Thu, 24 Feb 2022 12:49:28 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 i11-20020a056830402b00b005af1411565bsm174855ots.78.2022.02.24.12.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 12:49:27 -0800 (PST)
Received: (nullmailer pid 3560757 invoked by uid 1000);
 Thu, 24 Feb 2022 20:49:26 -0000
Date: Thu, 24 Feb 2022 14:49:26 -0600
From: Rob Herring <robh@kernel.org>
To: "xinlei.lee" <xinlei.lee@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, thierry.reding@gmail.com,
 lee.jones@linaro.org, linux-pwm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, allen-kh.cheng@mediatek.com,
 u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org,
 Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
Subject: Re: [v2,1/4] dt-bindings: pwm: Convert pwm-mtk-disp.txt to
 mediatek,pwm-disp.yaml format
Message-ID: <YhfvVmtX9hj6E6KQ@robh.at.kernel.org>
References: <1645003971-16908-1-git-send-email-xinlei.lee@mediatek.com>
 <1645003971-16908-2-git-send-email-xinlei.lee@mediatek.com>
 <1645051913.078742.1825836.nullmailer@robh.at.kernel.org>
 <0f8c014c077d0fc75c8552e457482d9daf68d73b.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f8c014c077d0fc75c8552e457482d9daf68d73b.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_124929_767156_522EC22C 
X-CRM114-Status: GOOD (  24.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 17, 2022 at 08:35:58PM +0800, xinlei.lee wrote:
> On Wed, 2022-02-16 at 16:51 -0600, Rob Herring wrote:
> > On Wed, 16 Feb 2022 17:32:48 +0800, xinlei.lee@mediatek.com wrote:
> > > From: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
> > > 
> > > Convert pwm-mtk-disp.txt to mediatek,pwm-disp.yaml format as
> > > suggested by maintainer
> > > 
> > > Signed-off-by: Xinlei Lee <
> > > xinlei.lee@mediatek.corp-partner.google.com>
> > > ---
> > >  .../bindings/pwm/mediatek,pwm-disp.yaml       | 71
> > > +++++++++++++++++++
> > >  .../devicetree/bindings/pwm/pwm-mtk-disp.txt  | 44 ------------
> > >  2 files changed, 71 insertions(+), 44 deletions(-)
> > >  create mode 100755
> > > Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-
> > > disp.txt
> > > 
> > 
> > Running 'make dtbs_check' with the schema in this patch gives the
> > following warnings. Consider if they are expected or the schema is
> > incorrect. These may not be new warnings.
> > 
> > Note that it is not yet a requirement to have 0 warnings for
> > dtbs_check.
> > This will change in the future.
> > 
> > Full log is available here: 
> > https://patchwork.ozlabs.org/patch/1593550
> > 
> > 
> > pwm@1400a000: compatible:0: 'mediatek,mt7623-disp-pwm' is not one of
> > ['mediatek,mt2701-disp-pwm', 'mediatek,mt6595-disp-pwm',
> > 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-disp-pwm']
> > 	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dt.yaml
> > 	arch/arm/boot/dts/mt7623n-rfb-emmc.dt.yaml
> > 
> > pwm@1400a000: compatible: ['mediatek,mt7623-disp-pwm',
> > 'mediatek,mt2701-disp-pwm'] is too long
> > 	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dt.yaml
> > 	arch/arm/boot/dts/mt7623n-rfb-emmc.dt.yaml
> > 
> > pwm@1400a000: 'oneOf' conditional failed, one must be fixed:
> > 	arch/arm/boot/dts/mt2701-evb.dt.yaml
> > 	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dt.yaml
> > 	arch/arm/boot/dts/mt7623n-rfb-emmc.dt.yaml
> > 
> > pwm@1400a000: 'power-domains' is a required property
> > 	arch/arm/boot/dts/mt2701-evb.dt.yaml
> > 	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dt.yaml
> > 	arch/arm/boot/dts/mt7623n-rfb-emmc.dt.yaml
> > 
> > pwm@1401e000: compatible: ['mediatek,mt8173-disp-pwm',
> > 'mediatek,mt6595-disp-pwm'] is too long
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8173-evb.dt.yaml
> > 
> > pwm@1401e000: 'oneOf' conditional failed, one must be fixed:
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8173-evb.dt.yaml
> > 
> > pwm@1401e000: 'power-domains' is a required property
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8173-evb.dt.yaml
> > 
> > pwm@1401f000: compatible: ['mediatek,mt8173-disp-pwm',
> > 'mediatek,mt6595-disp-pwm'] is too long
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8173-evb.dt.yaml
> > 
> Hi Rob:
> 
> Thanks for your review. I'm trying to modify the dtbs_check warning you
> mentioned. I would like to ask what cmd I can use to test the modified
> dtbs_check locally.

# Enable building all dtbs
make allmodconfig

make dtbs_check DT_SCHEMA_FILES=path/to/schema.yaml

> Also for WARNING: DT binding docs and includes should be a separate
> patch. I've also made some attempts including splitting the delete .txt
> and create .yaml files into two patches, but the warning doesn't
> resolve. Do you have any suggestions for the results of checkpatch
> ?This will help a lot with the next edition I send out.

Ignore it for conversion patches.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
