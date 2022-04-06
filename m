Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BDEC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 15:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8iqLF2E19BK0DztviFzlDD8dBdTpGXLNEmL8+6UJVs=; b=GH90RscahJBEmQ
	sMZsUd3IQ845RKRpIH7jsf9NR5K6voh1XXPhhzT1y9NNMCDRfuCCZThgMF68x7vRVsaMYMOhRZCKx
	46ijI9wLF7/SPrP+ZViCZjjvHWaIU/72QgGF9sUUPWxPKrf0NXepyIFodHwjLSX0Xfkxw8vvFKdOg
	q/a6CUWZPdvWeKbzuLK/hrxtD0YV6H3uaLiqHhvXxGYgXLCycXEn593bKicCEARsciP+sStNpdDDY
	s4TgW1023ydCBT9HHewtmZ59mDCN1auGnt8z3a+YxCyFmOkCD/HedBV3hqfiomUnOEIbPrO+gWq6x
	SJESzWJXX6VZdcHVkVxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc7NR-006mAp-6P; Wed, 06 Apr 2022 15:15:21 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc7NO-006mAJ-Cb; Wed, 06 Apr 2022 15:15:19 +0000
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-e1dcc0a327so3258554fac.1; 
 Wed, 06 Apr 2022 08:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RpvtWoojBQC/zAbnCARk8Keu9NdnUbRhNT220URCdbA=;
 b=zzpQ+oLlHJaUEOTKemPRLeQzNgGSc1DBm5oF5pkrouzfdPRXpEZk0Rkhrxz2oOkXjl
 1E6T6KRMkgcgmXnDSuFjWjQpJYkamUxAAr1/kJpOOCkL8f0/Frxh9zXWdSoKHJTy8rZg
 u3KkrsfuqQTxT+jsD32IMxw9uLPHXu+OcH+JV7Ll850d8lE3nQcUFRcGM4rA0NpnHvbD
 XlUZDTBBtSjYq0XTG7Z5WOiYsOXWaSfaQA2E3dq388wwP9NZBQ2TUBQQA/hQTzpqJa51
 yZv1aB/6y8zzj4oWW8AkL7oBHv9ggyG7NEiPcHKAGLtu9KmBtKpQtSTam+mHDAVWG946
 nvUw==
X-Gm-Message-State: AOAM533eerT7udUViahdA8iP5Qu5gVKUVq4YTCB/ZxvJf1ScZ4tuSQGr
 qzb1mqW4vhK64zngrbMYwQ==
X-Google-Smtp-Source: ABdhPJxPRAU35Z8YAsHokOrrhdeTBPlBAcUIPkn2lyOwPKuqU/qsErcv+UFsS47fLlo/nlTZi7C8HQ==
X-Received: by 2002:a05:6870:1807:b0:d7:2a4c:14b8 with SMTP id
 t7-20020a056870180700b000d72a4c14b8mr4123400oaf.97.1649258117511; 
 Wed, 06 Apr 2022 08:15:17 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q11-20020a4a330b000000b003289cbe97c6sm6422082ooq.13.2022.04.06.08.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 08:15:16 -0700 (PDT)
Received: (nullmailer pid 2263085 invoked by uid 1000);
 Wed, 06 Apr 2022 15:15:15 -0000
Date: Wed, 6 Apr 2022 10:15:15 -0500
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, jitao.shi@mediatek.com
Subject: Re: [PATCH v2,1/2] dt-bindings: display: mediatek: dpi: Add
 compatible for MediaTek MT8186
Message-ID: <Yk2ugxQukjPmYbFL@robh.at.kernel.org>
References: <1648727917-3099-1-git-send-email-xinlei.lee@mediatek.com>
 <1648727917-3099-2-git-send-email-xinlei.lee@mediatek.com>
 <e0d5a344c8ec1f92357bd9d5b8782dded862c549.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e0d5a344c8ec1f92357bd9d5b8782dded862c549.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_081518_462321_3AE201E9 
X-CRM114-Status: GOOD (  15.18  )
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

On Fri, Apr 01, 2022 at 09:38:20AM +0800, Rex-BC Chen wrote:
> On Thu, 2022-03-31 at 19:58 +0800, xinlei.lee@mediatek.com wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Add dt-binding documentation of dpi for MediaTek MT8186 SoC.
> > 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1
> > +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> > l
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> > l
> > index dd2896a40ff0..a73044c50b5f 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> > l
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> > l
> > @@ -22,6 +22,7 @@ properties:
> >        - mediatek,mt7623-dpi
> >        - mediatek,mt8173-dpi
> >        - mediatek,mt8183-dpi
> > +      - mediatek,mt8186-dpi
> >        - mediatek,mt8192-dpi
> >  
> >    reg:
> 
> Hello Xinlei,
> 
> From the dts we use, the dpi node needs other properties for MT8186.
> Please send another patch and add these properties to binding.
> 
> assigned-clocks = <&topckgen CLK_TOP_DPI>;
> assigned-clock-parents = <&topckgen CLK_TOP_TVDPLL_D2>;

Those are always allowed on any node with 'clocks', so no need to add 
them here.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
