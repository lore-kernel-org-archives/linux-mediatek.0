Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB38BC10DCE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 11:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZeL1F+NyfKIHyM9j+QHFJMImwRrHYGbT1S3aj/asmYo=; b=2mWwxiU1vSgWcJxGv3wkU+LkzD
	RtYOP3QEDBrQd24k8YlimVQ9DBfVhLoPOYigP7XdHNqGw9/rTE2VcJrbePkrR17obaR/uAzE8E6l3
	N7y5CLkzqUeTtZ/KIIJlEHqz+H/bL5Da9SpDeekXZQn9yN6Im50eEzJ0+mXB65waTHO0dHogosZKf
	UnA4ZdE2089TbP6iCpD2dkZkYPy6iXtUP1aCxde8LTfhANpkOJ3/5Dg09yJtYXX0SvCzi6U8BsliL
	v0QwLyDTOwumxfmG0avQGAsFQy3WpLSAx6avpRz4C8Ldddy3JmTdQ97T6NP80/j4CwpH41e6ijGIp
	I4eCjYWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBCoa-00CiUi-2n;
	Thu, 07 Dec 2023 11:45:12 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBCoX-00CiTB-0L;
	Thu, 07 Dec 2023 11:45:10 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3C61552;
	Thu,  7 Dec 2023 12:44:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701949465;
	bh=NACyl09AvpTrdZ3tNyR3vmOK5XRdr6IgtkAqVWbjgtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TsClYi8HjV965xFtDpO6Jo40j59Fkg4dPlOdu1vHFICbtYuHYx2unsL6Yra6y8vuQ
	 zl5D9A+a1lMkGLwQ7fXCK4gnJXFlFQ9xnyz99OVGEN2/Vm1NHZ7nMTbemPeivSKvc/
	 KbLxucFyLWA0PcbG9eSjH6+xN4Ahlg1xK90Q7zRo=
Date: Thu, 7 Dec 2023 13:45:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Zhi Mao <zhi.mao@mediatek.com>
Cc: mchehab@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, shengnan.wang@mediatek.com,
	yaya.chang@mediatek.com, 10572168@qq.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	yunkec@chromium.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jacopo.mondi@ideasonboard.com, sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl, heiko@sntech.de, jernej.skrabec@gmail.com,
	macromorgan@hotmail.com, linus.walleij@linaro.org,
	hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
	gerald.loacker@wolfvision.net, andy.shevchenko@gmail.com,
	bingbu.cao@intel.com, dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 0/2] media: i2c: Add support for GC08A3 sensor
Message-ID: <20231207114513.GB6104@pendragon.ideasonboard.com>
References: <20231207052016.25954-1-zhi.mao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231207052016.25954-1-zhi.mao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_034509_290553_56D7324A 
X-CRM114-Status: GOOD (  17.26  )
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

Hi Zhi Mao,

I have reviewed your v1 before noticing the v2, sorry about that. Most
of the comments I made on v1 are still applicable, so I'll skip v2 and
review v3.

On Thu, Dec 07, 2023 at 01:20:14PM +0800, Zhi Mao wrote:
> This series adds YAML DT binding and V4L2 sub-device driver for Galaxycore's
> GC08A3 8-megapixel 10-bit RAW CMOS 1/4" sensor, with an MIPI CSI-2 image data
> interface and the I2C control bus.
> 
> The driver is implemented with V4L2 framework.
>  - Async registered as a V4L2 sub-device.
>  - As the first component of camera system including Seninf, ISP pipeline.
>  - A media entity that provides one source pad in common.
>  - Used in camera features on ChromeOS application.
> 
> Also this driver supports following features:
>  - manual exposure and analog gain control support
>  - vertical blanking control support
>  - test pattern support
>  - media controller support
>  - runtime PM support
>  - support resolution: 3264x2448@30fps, 1920x1080@60fps
> 
> Previous versions of this patch-set can be found here:
>  v1: https://lore.kernel.org/linux-media/20231123115104.32094-1-zhi.mao@mediatek.com/
> 
> Changes of v2 mainly address comments from Krzysztof/Rob Herring&Conor Dooley.
> Compared to v1:
>   - Fix some review comments  
>   - Add reviewed-by for sensor driver
>   - Fix some build-error and warning message 
>  
> Thanks
> 
> 
> Zhi Mao (2):
>   media: i2c: Add GC08A3 image sensor driver
>   media: dt-bindings: media: i2c: Document GC08A3 bindings
> 
>  .../bindings/media/i2c/galaxycore,gc08a3.yaml |  127 ++
>  .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
>  drivers/media/i2c/Kconfig                     |   14 +
>  drivers/media/i2c/Makefile                    |    1 +
>  drivers/media/i2c/gc08a3.c                    | 1888 +++++++++++++++++
>  5 files changed, 2032 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
>  create mode 100644 drivers/media/i2c/gc08a3.c

-- 
Regards,

Laurent Pinchart

