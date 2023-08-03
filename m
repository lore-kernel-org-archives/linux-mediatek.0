Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E65DC00528
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 09:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/B0ToLExP+DiR9D97raY/1J2KSwUj5aVQTHcLopPW4=; b=UCjzKnFCmqFsfF/2CdTwD9xj7c
	so44ZuYMLDqkipNj57I0Ujao2Cnj9/GowSbdpkrkK55mZHwkpv5X0AwarzsxboeatXEsgVSel5hqE
	zs9RFROVg8m4MFdyfxchvRvYFPueKRyp5gNh6hnhYR6Xj90goaRyrUuB1PUzl/FI+D75T47vgm/1X
	D+LEvCt7Ani5fRJ30VMS5qWQV1yWfm4n2yrJoM2PtQ04gc7WNGnK7+x22yzhhrMWx4gvqWe0CMDBB
	NefCmOHB0x5cXZGEDmVSt9ZgZUwHPkUkhZ6UY9VaMBVi9NC7yvL4RdGbLXZ95P3RfMKL8c7Lal2eu
	h/tdryPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRV1Z-007Gkt-0y;
	Thu, 03 Aug 2023 09:53:41 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRV1W-007GjS-1C
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Aug 2023 09:53:40 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fe2bc27029so7882685e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 02:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691056416; x=1691661216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o/B0ToLExP+DiR9D97raY/1J2KSwUj5aVQTHcLopPW4=;
        b=hnii72+lRfd3fIj8r+WNkTKXqcHLxpE84fpR4zovZr6d4FRi/cSQ8Df191YVGBlsiC
         IPFvADsBsCMlNrZJpT+HaTU6fxodvjHbwmFhyc/GefTUYpyhqMwD6dfR9zehmjFhwrmw
         msdRDz9+zNRfViEUhW0t8UmAfACzDQ506jBsy7sNzGDXVMXQKpxQ5+AdQ2vDOvMnavNh
         Hjfoe/NerLWkfc4mvnQCJTDqil9W4pPKxArj8d+xZfnhMotyOtFHcJICur+WCDMpuvi9
         i5TI2AB2rTgc0HsXoYOABVfqAd4JlCS6zbRPUuVrdVHBC2/06xza3GFHWBz36B4uSC1B
         lzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691056416; x=1691661216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/B0ToLExP+DiR9D97raY/1J2KSwUj5aVQTHcLopPW4=;
        b=E/vMVlJZDh5N3PRArYT1yUT6wgISUb/ggUIk8HrRq43lLjECJ9Au8FwixXt66SLTDn
         3rZjzaelo5UutasOrLJDOMngOSv1vSY3S18nOos7faUEmVWSPS6BlPDVUdwg7U6xo8Mw
         FigbtnLICB5qbJvY7yW+RFsm4TW2RKzcUGt/yIHyX6k3ONAshzwthZ0n7/u5K4m6w+iq
         xiyRJwk6Gfjt9D+DJ1GwgnIAdLpoWwrOBfEelslzaafb49KeKNMv3hPMhX4jKk5CPPyh
         khXuCFIbgSPoRNF8AYonzQouVbcRe4B/mMWgStc0YbM0eqdN5PgxOTjyKQ3YSs1OVrSG
         Lzhw==
X-Gm-Message-State: ABy/qLbWY2aBTfk937FqvMc0JM84xGMYBCJ6YXs56sAVOqUvNHLfCGvC
	tXSV6MMldx3Hm4a/puU3DPLaGA==
X-Google-Smtp-Source: APBJJlEypDBS9JVFp+B8z1U3CVh5JzhVEqfWbu5Fxsi6niCNxUT0RBG20ys8Q2wWkY0Xe2Z09A8w2A==
X-Received: by 2002:a1c:7c0e:0:b0:3fe:2b69:fc6c with SMTP id x14-20020a1c7c0e000000b003fe2b69fc6cmr5373711wmc.39.1691056416186;
        Thu, 03 Aug 2023 02:53:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id t12-20020a7bc3cc000000b003fbc30825fbsm3800361wmj.39.2023.08.03.02.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 02:53:35 -0700 (PDT)
Date: Thu, 3 Aug 2023 11:53:35 +0200
From: Julien Stephan <jstephan@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Phi-bang Nguyen <pnguyen@baylibre.com>, 
	Florian Sylvestre <fsylvestre@baylibre.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andy Hsieh <andy.hsieh@mediatek.com>, 
	Conor Dooley <conor+dt@kernel.org>, daoyuan huang <daoyuan.huang@mediatek.com>, 
	devicetree@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
	Louis Kuo <louis.kuo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, 
	Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Vasily Gorbik <gor@linux.ibm.com>
Subject: Re: [PATCH v2 4/4] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Message-ID: <iq7jffjeaejdfb26a4ysjgjzuopov4ji2ecgzmv4563tdveaep@hh2gzgzkbdzj>
References: <20230630100321.1951138-1-jstephan@baylibre.com>
 <20230630100321.1951138-5-jstephan@baylibre.com>
 <0430ddab-6a6c-9fa3-95bd-05ce8ac5b94f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0430ddab-6a6c-9fa3-95bd-05ce8ac5b94f@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_025338_679113_E4C455A4 
X-CRM114-Status: GOOD (  14.44  )
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

On Mon, Jul 03, 2023 at 02:21:17PM +0200, AngeloGioacchino Del Regno wrote:
..snip..
> > +
> > +	mtk_cam_init_cfg(&cam->subdev, NULL);
>
> mtk_cam_init_cfg() returns an integer, and this is probably because you expect
> it to get logic to fail: in that case, check the result of that call here,
> otherwise, make that function void.
>

Hi Angelo,

mtk_cam_init_cfg returns an int because it should match v4l2_subdev_pad_ops->init_cfg prototype..

mtk_cam_init does not fail, always return 0, so I though it would be ok
to discard the return value here. What do you think?

> > +

..snip..

> > +	unsigned int bpp;
>
> Can we get any format that uses a billion bits per pixel? :-P
>
> u8 bpp;
>

I am preparing the driver for futur upgrades.. in a billion years ;)

Cheers
Julien

