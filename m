Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A1BC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 17:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d94m8A4mnC43bFCgCMyqlrhWiu3NByipxHjP5JFmrF8=; b=2ZM6IP43VriVlFZvgNehlDrGAF
	oIVlaj/vtb/SMZ6jYg9rSIgMU0kXNvpwTym0gTJ4qMCak6RqIxExpfKA47S6Rn1dWTFnPGah2wznC
	ngJjYniUppVmQobTXhUL0SH8yiuzExfqmp8X0M/3y6l3NB8DKewckOpDsn1Z9G92DLhts+XjtrYoV
	8dQSjpLlK0EfduMfaeAlzybcFsk+gHC0oCfF+hbOC+Ha5b/gXRcXXfLyUO4dMO6EwNuKniHcnFUvi
	dcHhEGffbCBV6t5sUU+NZxZUQKmqHX2/wX8FXp40xyxNIqHKC9G7pO8P9nzDgeVOEG+4EQ7o5hj9m
	Ebw4+h3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovMFF-006R5E-Ab; Wed, 16 Nov 2022 17:30:41 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovMFC-006R3O-TW; Wed, 16 Nov 2022 17:30:40 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-141ca09c2fbso11283550fac.6;
        Wed, 16 Nov 2022 09:30:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d94m8A4mnC43bFCgCMyqlrhWiu3NByipxHjP5JFmrF8=;
        b=PS1VVXjVrg762e5ygdPLNdDO9YjxZkev9RRUJ2sUclKdTjrvYfXREkceuL6XyWTQa3
         z9c/YObOYZGXhgmF7NlgU6XKoCloVc/By9n/aKm6lMKeodwgQ9pICMmUnImEhHzowiSE
         4SiJexwWEcJ7hKvqcPWAOkrGd/QSxHES4xIVegsqt/PCYFlD7S9pJSAFe+DwvHwF8oKq
         nHA7kFckkfKBr+Hx+HPbvJLd4FFC356Ko77iERT5lDKWgyc81z7zituOtX09/5UOX1Gk
         b9J67OApbndBdUsSns85+udI6rhioISaVOByUxtyp32p4EFFgCwx6Nb7QFV/dgERDrkI
         3Oqg==
X-Gm-Message-State: ANoB5plQfNW8li0HjvI4JDSpnFNFOEux9dwWe+57Ygsh/l8dTIZaDrHj
	rK+eHaQ1sCQpWM7JY/vS7w==
X-Google-Smtp-Source: AA0mqf4W9ic8trKFbcLCupIweHpywnpJAlbo74qba9pJnN/1t1QeCfL5Lgix9ZRfDFycFgC2Pz6D9Q==
X-Received: by 2002:a05:6870:b40d:b0:136:b625:9d4b with SMTP id x13-20020a056870b40d00b00136b6259d4bmr2234868oap.247.1668619836444;
        Wed, 16 Nov 2022 09:30:36 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o2-20020a4aa802000000b0047537233dfasm6208359oom.21.2022.11.16.09.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 09:30:35 -0800 (PST)
Received: (nullmailer pid 555476 invoked by uid 1000);
	Wed, 16 Nov 2022 17:30:38 -0000
Date: Wed, 16 Nov 2022 11:30:38 -0600
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Tiffany Lin <tiffany.lin@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, linux-mediatek@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Project_Global_Chrome_Upstream_Group@mediatek.com, Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, Steve Cho <stevecho@chromium.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2,2/3] media: dt-bindings: media: mediatek: vcodec:
 Adding racing control register base
Message-ID: <166861983726.555415.9641697136442986438.robh@kernel.org>
References: <20221110102834.8946-1-yunfei.dong@mediatek.com>
 <20221110102834.8946-2-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110102834.8946-2-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_093038_965097_C7F135B4 
X-CRM114-Status: GOOD (  12.23  )
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


On Thu, 10 Nov 2022 18:28:33 +0800, Yunfei Dong wrote:
> Need to add racing control register base in device node for mt8195 support
> inner racing mode. Removing 'maxItems' and adding 'minItems'.
> 
> Adding description for each reg.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> compared with v1:
> - add description for 'VDEC_SYS'
> - add description for 'VDEC_RACING_CTRL'
> - add description for 'VDEC_MISC'
> - change maxItems -> minItems according to AngeloGioacchino's suggestion
> - Fix dt_binding_check fail
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml    | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

