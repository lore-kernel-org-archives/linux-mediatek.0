Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BFBC77B7D
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6PGsaxxe+r0/tgEPfoiZneEqJdU4NADxCmDaQhFL68=; b=f1PFnuzXRnFqIusA/kDThvngNW
	S4WA9CGvzCcJExaJAsYWFf0jj3U83bx3wt1PeUuWFZMQSYQK/4ZUIpNIrBUyJQx/M7LI4JNWQL7Bp
	julY8v9yQS/ScL0F1ErJW68GzGBlY0mxms3WYnZRQBbenKvkrHzcoSq3/KZCWMSuXzXZqJF+Bfj6O
	LpYVlEtnUH1Fqvu+hOoooiuRcwnFv7PJ1aDdqkhD2LYNX1d5GkVwnNAQrvOcaYPGOwYQ00o/o3uIk
	Yo39dYhHH1pPN9jzSWqa9hkUI+kxginYCKWUvrOzdASeq+Ml7IgYAPPHUymKCxqcB0Bq/boaFvv76
	z9uLuFqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyZYe-002T50-0G;
	Mon, 15 May 2023 14:52:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyZYb-002T2F-0I
	for linux-mediatek@lists.infradead.org;
	Mon, 15 May 2023 14:52:14 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f4c6c4b425so37567345e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 15 May 2023 07:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684162326; x=1686754326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I6PGsaxxe+r0/tgEPfoiZneEqJdU4NADxCmDaQhFL68=;
        b=QBUPDu0mnTKpIi/wGbo9UgpiCqziYGcMj3hQWPNefHgGAfqJ8lVJErWsufoP7gVWl/
         MuKN4tEX1pZzLr340OCucG7rs4ehSVdPZ56+kGhAkPSHTFEanh+UOGRKxl0frSuERoQi
         znFDPcNKbBBfN9G+5GNepJLzQ0wZAO8nLN1JBJsH87VkOTZzGqNF3dV7QfkvbFQbWwzC
         8JItnIfYJ0m+YlLGiaXwATFgD5y70Nki5rbnME2c/ITNCpP6jTEfV2/BTzQHtJXbr5Ix
         ZLYZvkgxPg66jjZAKiLqfZ7H0BYHkg7RRJ+3Kpz8v/kkce6/YnkPjUmtUNTBVfQ11JjK
         kiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684162326; x=1686754326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6PGsaxxe+r0/tgEPfoiZneEqJdU4NADxCmDaQhFL68=;
        b=eNNBn5+eF+6Yo9bfI19kQe7+asP6g+UHRh7yCNrf+nNxeh3ZzJLYypG6cycb2fWrmy
         QFBrZYoQ2MG1HWtmZtzqRPLA5hNDrBkDBcEHNMsrU1U8HnsLF/K7rCBrZQUXUtSuVWna
         BZ1/tobTU7U8cqT+GcBgP7OtgxCKjdWOCHCQzgvUHKnmx2YLE3PblvALbJvRESZQtrtv
         8CokZ2QH068YNnBQBlM8rbysO19B1a+OS7FqhOGPJNbPE4GqCw2nLHs1T3iGqyS3SPPB
         3oQynR4SrcH9ru8M6YkCtgprg5wTDtOStvsTWA3he6euI3+4jH0GcUq4FDwUH2Aa2NI7
         YZBQ==
X-Gm-Message-State: AC+VfDx0w/sAMaxCHbNsQhwldKmVGyptwa5wLNH7p3DFQhkey78W+F5y
	tOHjGQE3UDXJ85vGAhNcybaMgQ==
X-Google-Smtp-Source: ACHHUZ5PnVTE8/BjOvD4cpmnU1SfNcpaeP+ththsz81R4NjZ9b8l1B6aIXxY1tdG8cXWxh3+7kD4ow==
X-Received: by 2002:a1c:f310:0:b0:3f1:74bd:bc22 with SMTP id q16-20020a1cf310000000b003f174bdbc22mr22887492wmq.6.1684162326437;
        Mon, 15 May 2023 07:52:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:55f:21e0:fd3b:9fed:e621:cc8f])
        by smtp.gmail.com with ESMTPSA id p1-20020a05600c204100b003f4e47c6504sm14774860wmg.21.2023.05.15.07.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 07:52:05 -0700 (PDT)
Date: Mon, 15 May 2023 16:52:05 +0200
From: Julien Stephan <jstephan@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzysztof.kozlowski@linaro.org, robh@kernel.org, 
	chunkuang.hu@kernel.org, linux-mediatek@lists.infradead.org, 
	Phi-bang Nguyen <pnguyen@baylibre.com>, Louis Kuo <louis.kuo@mediatek.com>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Andy Hsieh <andy.hsieh@mediatek.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek USB3 PHY DRIVER" <linux-arm-kernel@lists.infradead.org>, 
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>, 
	"open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] phy: mtk-mipi-csi: add driver for CSI phy
Message-ID: <jx2ndeoli3ozjiydygwclrpqmwftgf2gv4kfr6dyclf2cyh4hk@fnhvqeef5w4f>
References: <20230515090551.1251389-1-jstephan@baylibre.com>
 <20230515090551.1251389-3-jstephan@baylibre.com>
 <cd6067b2-660a-8f2c-697d-26814a9dc131@collabora.com>
 <ynrvqt24hjgng25r2xa3hxj35cvgotx7sdfrbqfjcvj3foegmr@4lqhen5yu6fh>
 <85500bcc-c5e8-8ce2-edea-233de86c2d35@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85500bcc-c5e8-8ce2-edea-233de86c2d35@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_075213_132001_54461EE9 
X-CRM114-Status: GOOD (  33.05  )
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

On Mon, May 15, 2023 at 04:22:38PM +0200, AngeloGioacchino Del Regno wrote:
> Il 15/05/23 15:36, Julien Stephan ha scritto:
> > On Mon, May 15, 2023 at 02:22:52PM +0200, AngeloGioacchino Del Regno wrote:
> > > Il 15/05/23 11:05, Julien Stephan ha scritto:
> >   ..snip..
> > > > +	port->is_cdphy = of_property_read_bool(dev->of_node, "mediatek,is_cdphy");
> > >
> > > This driver doesn't support C-PHY mode, so you either add support for that, or in
> > > my opinion you should simply refuse to probe it, as it is *dysfunctional* for the
> > > unsupported case (and might even introduce unstabilities).
> > >
> > > 	/* At the moment, only D-PHY mode is supported */
> > > 	if (!port->is_cdphy)
> > > 		return -EINVAL;
> > >
> > > Also, please don't use underscores for devicetree properties: "mediatek,is-cdphy"
> > > is fine.
> > >
> > Hi Angelo,
> > You are right this driver does not support C-PHY mode, but some of the
> > PHYs themselves support BOTH C-PHY AND D-PHY. The idea of `is_cdphy` variable
> > is to know if the CSI port supports BOTH C-PHY AND D-PHY or only DPHY.
> > For example mt8365 has 2 PHYs: CSI0 and CSI1. CSI1 support only D-PHY,
> > while CSI0 can be configured in C-PHY or D-PHY. Registers for CD-PHY and
> > D-PHY are almost identical, except that CD-PHY compatible has some extra
> > bitfields to configure properly the mode and the lanes (because supporting
> > trios for CD-PHY).
> > If C-PHY support is eventually added into the driver, I think we will need
> > another variable such as `mode` to know the mode. I was also thinking
> > of adding a phy argument to determine if the mode is C-PHY or D-PHY.
> >
> > So here, I don't want to stop the probe if `is_cdphy` variable is set to
> > true. Does it make sense ?
> >
>
> Comments in the code convinced me that the other PHYs providing only C or D PHY
> support weren't compatible at all with this driver.
>
> I got it now - but at this point can you please add a comment in the code actually
> clarifying that this driver supports both PHYs providing *only* D-PHY and ones
> providing selectable C-or-D PHY?
>
> That clarified, it would not make sense to stop probing if it's not a CDPHY because
> as you said there might be a D-only PHY that would be actually supported here.
>
> Regards,
> Angelo
>
>
Ok, I will add a comment in the code to make it more clear.

Regards
Julien

