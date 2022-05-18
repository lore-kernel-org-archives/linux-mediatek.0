Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25170C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 01:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TiYuoP0q58WCagKn9pa+mTzYm/4DxJCzmEky1inzfvo=; b=tm2F/XfguVzVhi
	f4dC1kn4ShB4AxXY/33K36O8f+aHq7tdmwJ5YbxCPTGuet6c3paRHK8PYIqtgxhVer3Hl1DCklFYd
	dqy/hByJ72Tyaxlof6hT/QgrBBbXYCfp7+mm9SsxRdSToBjWDgnNLxslWxEXE1FXTnE9KDBbkhB3p
	a2ULUH0hZJyBTtrQnwLUZZDDqPW6UEVC4s/q8XECpZ8GN/8q+LnwcXMzd1qAFsT0hNHk+3QeaZIC2
	Lz7CWiJBWPIHYJXSQC1ZmSErnERsmWd/r+JpI0ce56CKcSdtOW+Pjr8mKnTCkEOgo8TUGHX8tpHpN
	ai+SFGc5G5Fop0htpQAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr8hq-00GcBN-4u; Wed, 18 May 2022 01:42:30 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr8hc-00Gc6r-KA; Wed, 18 May 2022 01:42:20 +0000
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-edf3b6b0f2so882249fac.9; 
 Tue, 17 May 2022 18:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=crkI7+HwsdAoc3Iq1GjjnJUYtoumtzV3pILJENOsucw=;
 b=yWnL412FX2TBy1NJ5dIJIazVib4BiNHiXqCVEiVUy4v+TUvhA7tcRUb2skzQGDk+Om
 o5LYRPjWYeQdey3rPHbcZYOeNXmogiPT+4dTl9rpx8Bs/DH6ljAtE0cCyyzL7WBKeUsi
 gn+ubIyFWjFfOVGsXGZ+eVsgHjnP7IcdPURBzsgvnJ2DjuHuCSixJhT3ooTjJCN3LZdv
 KfX4MeYOgjlX2+sv7wZ4QFPcwwTvgWhZITu5SK5fKkQRgNrEuPEIhnjmmX47EyoZ8jj+
 B8HDlkIOjI8JuFyx0239Pzt+lZ8eGBuS/ydnIY+dE5Ih/6JGM+Nz7SsY+pOACpL6HoKc
 Qdqw==
X-Gm-Message-State: AOAM533AWBCvQedJnUqeqT1nyL3R5qWagmDU78zI3oZNoaERGdbQp5tZ
 x1x3Y/1O9MkXb1Yg1hBjwA==
X-Google-Smtp-Source: ABdhPJxdxYNaSg4qceB2OCZjxphvGORaZqyQisZZrLDaSde4Qt++qmPmm1WVwJIhjbJG92ClP0kR9g==
X-Received: by 2002:a05:6870:65a5:b0:f1:9153:c355 with SMTP id
 fp37-20020a05687065a500b000f19153c355mr8456281oab.163.1652838134589; 
 Tue, 17 May 2022 18:42:14 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r41-20020a05687017a900b000f15ca674b2sm406734oae.52.2022.05.17.18.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 18:42:13 -0700 (PDT)
Received: (nullmailer pid 2045103 invoked by uid 1000);
 Wed, 18 May 2022 01:42:12 -0000
Date: Tue, 17 May 2022 20:42:12 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: joro@8bytes.org, krzysztof.kozlowski+dt@linaro.org, yong.wu@mediatek.com,
 will@kernel.org, iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com
Subject: Re: [PATCH 8/8] dt-bindings: iommu: mediatek: Require
 mediatek,pericfg for mt8195-infra
Message-ID: <20220518014212.GA2045069-robh@kernel.org>
References: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
 <20220517132107.195932-9-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220517132107.195932-9-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_184216_690899_A670215E 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

On Tue, 17 May 2022 15:21:07 +0200, AngeloGioacchino Del Regno wrote:
> The MT8195 SoC has IOMMU related registers in the pericfg_ao iospace:
> require a phandle to that.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> 
> Note for Rob: as of now, there's no iommu node in upstream mt8195 devicetrees yet.
> 
>  .../devicetree/bindings/iommu/mediatek,iommu.yaml      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
