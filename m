Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A836ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 18:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFYj3SzmCSDPlkEMmdzkWyN5W3U24WerlpydHPBUtDY=; b=ADqz9jehiBwZAplSlXbrjUl3PL
	lRGaiAVePNTrE31PTX99EgPWOZJPonsF9b8mm8+F13rtbCuY5S694iUqwtB/VXvlTUdoexJVDaXF8
	pFCaFTxtp7uT7WTaeJgRgAZp6JEL0465ptHHD2NWxevPDCb6zsndDlmkH9bgGd3/O6oEhJGSvCNUZ
	HS3il/exeh/5NoagemGYN2fYAUdPa7sVYmqGpVyNAbwLY17l5Ua2Fqu3IwZzkluQ86CE6luMVeeiA
	u43N59OYmfUsTgS89qt6SuLnQuSrk4/i1v8MS/IVoxgElRHZNCQBvnBwFCI23yzaoFJ08CzFr5I9T
	K5Br5OIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUBGl-009Gj2-94; Fri, 02 Sep 2022 18:19:55 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUBGh-009GcM-Tj; Fri, 02 Sep 2022 18:19:53 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-11f0fa892aeso6691069fac.7;
        Fri, 02 Sep 2022 11:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=DFYj3SzmCSDPlkEMmdzkWyN5W3U24WerlpydHPBUtDY=;
        b=O4OpZ2yLdm7vWLf81YE+le00NKjy9q5DAZvAVc2XUQQbw++SYTlMHpQ7+ls26TNtSj
         yuK+iiVLpEGyL0VAvNRK93qBOmXpPqQIgzsWxhdV8wAmfxOcmBA2RuCoZ0eDZLxLB0GH
         qFSAMdIoGxX61jPSGVSAjsK1NiZ02YuEghZeyqtuQWKPpkcZ6tZGYlek2tbWjl9Yv+0v
         58fAsqhryDtGo0yV7c/ARo6uxwScJUQ7renFl6SNO9GO4+NbtL1qAg4dZniuEKh2/YzK
         waRbMpEPgkg9PFwTyfFs/5pFq1pIKGN6fgyY5zP7/Q3uKULfuLcgB31eZS+a0xt1ojz4
         m+KA==
X-Gm-Message-State: ACgBeo08czOdl6y4QHksas5bgSzHSvowIvIuMsPKLf04sqqtD1B0fbJi
	6Mi2wKa5nDi4q7IQOZPCEUa7qpW9Qw==
X-Google-Smtp-Source: AA6agR7NieM49Immp0yg7zhLlvCYsYHzsJ8oBKkIeFWd8pV9cIX90lhfljoXMzPYm2bpuDTyyvOK3A==
X-Received: by 2002:a05:6870:8090:b0:122:7289:bd59 with SMTP id q16-20020a056870809000b001227289bd59mr2954932oab.284.1662142790802;
        Fri, 02 Sep 2022 11:19:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 22-20020aca0916000000b00344adbc3492sm1238492oij.24.2022.09.02.11.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 11:19:50 -0700 (PDT)
Received: (nullmailer pid 173081 invoked by uid 1000);
	Fri, 02 Sep 2022 18:19:49 -0000
Date: Fri, 2 Sep 2022 13:19:49 -0500
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, maoguang.meng@mediatek.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, nicolas.dufresne@collabora.com, Project_Global_Chrome_Upstream_Group@mediatek.com, Tzung-Bi Shih <tzungbi@chromium.org>, kyrie wu <kyrie.wu@mediatek.com>, angelogioacchino.delregno@collabora.com, Tomasz Figa <tfiga@chromium.org>, linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, wenst@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, xia.jiang@mediatek.com
Subject: Re: [V13,1/7] dt-bindings: mediatek: Add mediatek, mt8195-jpgenc
 compatible
Message-ID: <20220902181949.GA173040-robh@kernel.org>
References: <20220826092956.10340-1-irui.wang@mediatek.com>
 <20220826092956.10340-2-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220826092956.10340-2-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_111951_991177_DBC949EA 
X-CRM114-Status: GOOD (  10.61  )
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

On Fri, 26 Aug 2022 17:29:50 +0800, Irui Wang wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> Add mediatek,mt8195-jpgenc compatible to binding document.
> 
> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> Signed-off-by: irui wang <irui.wang@mediatek.com>
> ---
>  .../media/mediatek,mt8195-jpegenc.yaml        | 147 ++++++++++++++++++
>  1 file changed, 147 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

