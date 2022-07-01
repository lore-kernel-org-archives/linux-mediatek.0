Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDEEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 15:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DW6OoI9ck7pg2WGkEj/Pza3ljDH6aP6yay+QPKIoSAY=; b=2GHfuv6dQLbFkGlE60nukqRrau
	A4K+KGZO9vFYtNZ2qnT14BC5dyjegMl2prbSFhxjBA3bqW2P7HD3pUz4P5taC9TYF/J0jlpUH/bQm
	TqEhT1SiEScVy6o5ckXuopMiI/ANGQ5kev5Zt5QYZnxjVh3NHKn0hfVbOueFwPIUJ55k87M5LEvZP
	vh9o+Kkh/6xwQ6bldmU2V6zVoX51Qd6LIk10U5XxM+N1+Yqev0NdBcsZeU3U3A43FsvdQR0kO1Y1s
	Nx9RSDtrJebaD/YFgkfZoGFnFVkDNmXZNjaI2pZhhQ+NyE2/dexpPdxZoc9T7KVKjj0nMwalIYLKW
	Ju/R84iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Ic6-005hQW-3O; Fri, 01 Jul 2022 15:31:22 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Ibs-005hGR-9t; Fri, 01 Jul 2022 15:31:09 +0000
Received: by mail-il1-f177.google.com with SMTP id f15so1613918ilj.11;
        Fri, 01 Jul 2022 08:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DW6OoI9ck7pg2WGkEj/Pza3ljDH6aP6yay+QPKIoSAY=;
        b=B1DfPbeaNcp8aNUlAif8Y3kC88rxbAnGQEMmMP5+0PsWnIorQ0xN+llsFLkdu0O13l
         s8aTQ5xhgMLm+zqgZG78nugRP7vQS3KhGCYrzICmA31cTo559KlX8F1x1UERzIfDBbEY
         5M+0bmVeeS2YzjX5+5wAgbgabxGlMfAqfwLbawBMBAidzIqllqCsjEimQN6P1jYCo0Bd
         a62m+ofjEN0pE2LrVbOfc8PRlrTVf3WlKTDkeT+xA2NMFQyRiay361PI4UBsn+z9bsS7
         WcggXCwDsdNG29LIgsbWfmL7391jeuGY+yoPOqHq5yln6EO7BTboPis2NRruo4HsJV85
         dKmA==
X-Gm-Message-State: AJIora9sBCH1EomOljXd9TnqKkunvC4mRD2wno7iosHc4ZV8ab+4rKG7
	OPgM8tUO/ffZr4h4s2+jYA==
X-Google-Smtp-Source: AGRyM1vjWw9m4eWVGZ6vgiHQ5P0wZ0Ayk7sZG+ShF80xwbJewoL7/fwhv/c/x4vCvL2pv3kBenXPSw==
X-Received: by 2002:a05:6e02:b44:b0:2da:7b63:34aa with SMTP id f4-20020a056e020b4400b002da7b6334aamr8922805ilu.281.1656689464065;
        Fri, 01 Jul 2022 08:31:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d137-20020a02628f000000b00339c5bff7c0sm9735893jac.134.2022.07.01.08.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 08:31:03 -0700 (PDT)
Received: (nullmailer pid 984299 invoked by uid 1000);
	Fri, 01 Jul 2022 15:31:02 -0000
Date: Fri, 1 Jul 2022 09:31:02 -0600
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>, angelogioacchino.delregno@collabora.com, nicolas.dufresne@collabora.com, wenst@chromium.org, Project_Global_Chrome_Upstream_Group@mediatek.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>, xia.jiang@mediatek.com, maoguang.meng@mediatek.com, kyrie wu <kyrie.wu@mediatek.com>, srv_heupstream@mediatek.com
Subject: Re: [V10,1/7] dt-bindings: mediatek: Add mediatek, mt8195-jpgenc
 compatible
Message-ID: <20220701153102.GA981371-robh@kernel.org>
References: <20220627025625.8956-1-irui.wang@mediatek.com>
 <20220627025625.8956-2-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627025625.8956-2-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_083108_360213_B81ABFA2 
X-CRM114-Status: GOOD (  12.05  )
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

On Mon, Jun 27, 2022 at 10:56:19AM +0800, Irui Wang wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> Add mediatek,mt8195-jpgenc compatible to binding document.

Same comments as the decoder.

> 
> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>

Also, this needs your S-o-b too.

> ---
>  .../media/mediatek,mt8195-jpegenc.yaml        | 154 ++++++++++++++++++
>  1 file changed, 154 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml

