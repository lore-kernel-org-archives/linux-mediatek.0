Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD978C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 23:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIr/2j9LR1jIfb9YzWHXNooHqxKrRbLzbkzM0aNI0hY=; b=tsbzafs7UYlPeM9qZ9bG/ptnWi
	r2pcIFpgJA4LVhz60IdUHbqYPVD+LYcNumF+oRdBuBBlHTOH+oqdqOp0daIwN3G/i1cI32fo9Qzah
	1554OheNNjST5nCwZAlGyt7Ki1sWpgCp5ots+gtJgpUi9W/j/lkEsd8XVQH1RA+9xaoswD3+TdXW0
	u13wDK4Gc/gnj2h4V0If9V+ioW9XvfGmIUdPr6ryAUbHL4c0ewmk9b7o3p2ZSu1f7SwFeLqZ5WEIz
	PYU1E1zgOjiop+5OwZDsFO5i8NubZb0DiCNUc71NEG2mAG/FuHEESYnshyycObBU0Xb6qMgqcZBXY
	fZgAweUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0tGF-00BpYl-Me; Thu, 01 Dec 2022 23:46:35 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0sl3-00BaDq-Hx; Thu, 01 Dec 2022 23:14:22 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-142306beb9aso3880484fac.11;
        Thu, 01 Dec 2022 15:14:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIr/2j9LR1jIfb9YzWHXNooHqxKrRbLzbkzM0aNI0hY=;
        b=jWlF9tt2c285ba32hRHM2lnXdPdc6cu9UdIRFc0S6sXtQ8WNlAmcT8PEIp0L/DTJgy
         7olPAFGCyW9ORbJPQNnOFQd5Pp1FwGSHuWNhVSFLGMz4ZgvdYUZ/wUUpvc7xf3J0MktQ
         8OshxAEEDRi2YXjXKOT0dnI1YWk1hbCA0LfPsYY+TmdsALkYFW0KK1QSAAWH1uhFFEHb
         +TwBCdX2aEWrbx4joQwv4wxN6fvTFIs4bQ6fX2MTUfcjHX+QYTh7x25zr1z40Kbo0NaS
         d44Gpk0ZlbFCPT+EgY+DWgYSsPeW/74L1DivELA5SSSASOJnTtNarDNbHljiz47PGkP0
         VPTQ==
X-Gm-Message-State: ANoB5pno3OuK8qysB5CViZN/V2RreRX1dRqUy1ICmc+NdID02W5N6VuJ
	6sEjXonTJW+BTW+JYgKzFQ==
X-Google-Smtp-Source: AA0mqf6/AEyeJtfEHqUXesdIbRoCbHyrdgWlY2GE2eJ13EW0nBRgJuMGOIfp7YWvfzPUFn9MKaX3AA==
X-Received: by 2002:a05:6870:b39b:b0:142:aa9b:2668 with SMTP id w27-20020a056870b39b00b00142aa9b2668mr30841958oap.166.1669936460377;
        Thu, 01 Dec 2022 15:14:20 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q13-20020a056808200d00b0035b4b6d1bbfsm2410122oiw.28.2022.12.01.15.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 15:14:19 -0800 (PST)
Received: (nullmailer pid 1660505 invoked by uid 1000);
	Thu, 01 Dec 2022 23:14:19 -0000
Date: Thu, 1 Dec 2022 17:14:19 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, yunfei.dong@mediatek.com, Rob Herring <robh+dt@kernel.org>, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v5 2/3] media: dt-bindings: media: mediatek: Remove
 "dma-ranges" property for decoder
Message-ID: <166993645851.1660446.2817424583068885626.robh@kernel.org>
References: <20221128143832.25584-1-allen-kh.cheng@mediatek.com>
 <20221128143832.25584-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128143832.25584-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_151421_632610_338F0B5C 
X-CRM114-Status: GOOD (  11.64  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Mon, 28 Nov 2022 22:38:31 +0800, Allen-KH Cheng wrote:
> Since commit f1ad5338a4d5 ("of: Fix "dma-ranges" handling for bus
> controllers") was merge, we don't need a dma-ranges property for IOMMU
> in mediatek video codec.
> 
> We remove the dma-ranges property and fix the example in
> mediatek,vcodec-subdev-decoder.yaml
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml     | 7 -------
>  1 file changed, 7 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

