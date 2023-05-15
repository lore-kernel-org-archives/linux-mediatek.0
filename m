Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B48AC77B7D
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 14:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n75gxWwijMMTI9GiXx1bdZzw1eSKDQ/JY3MbdqyyfJ8=; b=XFZ7dSr/BAvNp5ToTB4pn5Ovdm
	2zWkqXMqHlLLxmobbNrtnO88wnHxigkucJPpGIFw35Ib9dp99VbIdenfQbtQpypFlElFINImkNcGY
	h1iO0wetZbnQiCAAkY1aa7NH6njwsgV3iMWBLXBNZ39ZZLuuBL6epIId3ZhufOjwQpRxNAJ1M8PZb
	tDliRqcoULZHAubTWQV3AdcbJDDs2wa43pdfEb9VcLFM/Xaywt7OJ/qbA+BN5ZNq8lLTcJ8h0rXnq
	QCx1J4doJ1N8u/XNMk2MraFxwZIVE8teRW5fGO31nVQg+H3kncQ5D6vTH3qv7PT/Ou/hjZZYGGJhe
	Sx/WBGIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyYr3-002LyF-2g;
	Mon, 15 May 2023 14:07:13 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyYr0-002Lx9-21
	for linux-mediatek@lists.infradead.org;
	Mon, 15 May 2023 14:07:11 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3063afa2372so11988260f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 May 2023 07:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684159629; x=1686751629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n75gxWwijMMTI9GiXx1bdZzw1eSKDQ/JY3MbdqyyfJ8=;
        b=MybEwHb7tKFR+czM65dq6Won8HWSGsgYs9IN4ez2NUgHvZhPq/Fjq3SQvBRDwj2apk
         TQlRnqRGsmPdmCCiuAQcNV5mzBWUfS345LKMeMaqnYmHN1XGmlqe+rc1IsW5hQGIN2hY
         Sk7HLb6fGLLzfm46sD0+z8iN/0C24ndOXGjNqF6egg+usyu0Bf3KHWzTofwatANRJWl4
         NM6U67P7oQUYPeY4ghnVyPngLeXR/uhODxoz4qrOAMKkje2MBG2F+8kinM7BX0ZLPHGd
         S/9F6uqsD+yaKQT/H6KccQdorGqjBBxvsrr+IBeIoiXO2e2PeafrSkbg/OX5wBedzpfb
         rR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684159629; x=1686751629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n75gxWwijMMTI9GiXx1bdZzw1eSKDQ/JY3MbdqyyfJ8=;
        b=KiGyL5/uqXUj26Q+98htJOAIoWlp5uNu0HDO+2MseTag5pMCyx3xg8+88Jud3NayLk
         a0QcPeJkiedXCrtFL2Jt4yPNoDCc9qiVfY0N4T4n4vKmn2810Xiv2ZSVdVINEvB9b2l+
         8LD4VAXvVRhFxs8lQ+P6ZIL634kXzMFoOfBclsGqtr3QfEKF+V1j2dZ4ThYQZaX2pF0T
         ib07Zc0UH7ySCwVSUoquktYJvcLsZ1TIDloiFxCe2ciwwFR/kDCPbZRqAiz009Kjkm1L
         AvaiJlx/lnjC0zCxrwVy8EzmKls//nS7wCiwRrHZ2G6aybTsQcN3mpSBAv00hi/xHRvy
         3ZBQ==
X-Gm-Message-State: AC+VfDzr8yCv+J30GnCrVHbf07o8QsF0VK3/OhlLwjfyQnr6xY5acXq0
	OB4gQf5niacTgwPJ3Eb9rSpi8Q==
X-Google-Smtp-Source: ACHHUZ79hANfbDvpP6oNPyXKE1ftm/gHtkEaa9Icb1GGlaeSnOsVu4I4PEo/Jz9DCazNFmJCLmAmFg==
X-Received: by 2002:adf:e492:0:b0:306:2dd6:95d3 with SMTP id i18-20020adfe492000000b003062dd695d3mr30832770wrm.22.1684159629085;
        Mon, 15 May 2023 07:07:09 -0700 (PDT)
Received: from localhost ([2a01:e0a:55f:21e0:fd3b:9fed:e621:cc8f])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b003f4253ddb7dsm23548392wmm.43.2023.05.15.07.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 07:07:08 -0700 (PDT)
Date: Mon, 15 May 2023 16:07:07 +0200
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
Message-ID: <b2nk4jw2hpy4ndoq4cojazkn6h3tra2zjffhiswb7aqryabf7q@mkbtzhzcbivv>
References: <20230515090551.1251389-1-jstephan@baylibre.com>
 <20230515090551.1251389-3-jstephan@baylibre.com>
 <cd6067b2-660a-8f2c-697d-26814a9dc131@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd6067b2-660a-8f2c-697d-26814a9dc131@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_070710_688228_FBBC32F6 
X-CRM114-Status: GOOD (  13.57  )
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

On Mon, May 15, 2023 at 02:22:52PM +0200, AngeloGioacchino Del Regno wrote:
> > +#define CSIxB_OFFSET		0x1000
>
> What if we grab two (or three?) iospaces from devicetree?
>
> - base (global)
> - csi_a
> - csi_b
>
> That would make it possible to maybe eventually extend this driver to more
> versions (older or newer) of the CSI PHY IP without putting fixes offsets
> inside of platform data structures and such.
>
Hi Angelo,
The register bank of the CSI port is divided into 2:
* from base address to base + 0x1000 (port A)
* from base + 0x1000 to base +0x2000 (port B)
Some CSI port can be configured in 4D1C mode (4 data + 1 clock) using
the whole register bank from base to base + 0x2000 or in 2D1C mode (2 data +
1 clock) and use either port A or port B.

For example  mt8365 has CSI0 that can be used either in 4D1C mode or in
2 * 2D1C and CSI1 which can use only 4D1C mode

2D1C mode can not be tested and is not implemented in the driver so
I guess adding csi_a and csi_b reg value may be confusing?

What do you think?

Regards,
Julien

