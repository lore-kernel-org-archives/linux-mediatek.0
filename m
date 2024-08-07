Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1642CC52D71
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Aug 2024 15:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v21APQGU/utN2DYU31lVNFvOwnFuyN1gDoVGXt7ruJY=; b=3MxaHZth/8nc7pwPi3G6EQTPpW
	eiBbN4tBVGDL6KGtHsYU/6ZULa8twBTQ2OxBT1w0YOMEc1pAcKhI0GwBo06V08qVDl2zwqLHLUEnp
	XeVefhU6UnDy9rzGNjveXHDzsNqHuCQ5lcOHwEKWN5KTCpNB+2dPIGPPbvK0lNTQCm05Xs1C8VrHs
	VCB+D0NWqTVLCP+xg7bRgT6AWKS4+thrAOBHhpRR9k2j2vQ4NZ5bD0CqM82hZCAA0OBdFPvCv9PUq
	ocGpz/RXlMe86ZiZVWMw6M6UFZQTXeW02UmgcqlBW7GEkL72elzy+g0qAbU3i+BZ2rcGdehgmoY9w
	SoVVFzSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbiUN-00000005UZE-0S2K;
	Wed, 07 Aug 2024 15:22:11 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbiTB-00000005UGq-2Pbi;
	Wed, 07 Aug 2024 15:20:59 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BBC2A6AF;
	Wed,  7 Aug 2024 17:19:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723044000;
	bh=W21qXUGI24TuhC78WlGUMYCFeu9yFRSWaPh4zZaK2As=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UES/YOVf7zcHAEx57eOgp1Ve1BbRtTr4TjOaf1PVu1DuCtTYvubMsNJIZBTFHWl2i
	 j5966Oo0bzHtKtl4XzwxfUAS2npUt5blSgTBO7TKrTNIKycsTj2Mq44AV+eiuti1V+
	 x+Id6hwIXXi1KQXZSezjkv21PmZpv+rLW+K/4m9k=
Date: Wed, 7 Aug 2024 18:20:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	Andy Hsieh =?utf-8?B?KOisneaZuueakyk=?= <Andy.Hsieh@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"jstephan@baylibre.com" <jstephan@baylibre.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v6 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Message-ID: <20240807152027.GC18695@pendragon.ideasonboard.com>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
 <20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com>
 <6a7467cde347600015078fe7aa25c4b46c45e96d.camel@mediatek.com>
 <20240731082958.GM8146@pendragon.ideasonboard.com>
 <289ea20cb549f8fd76343776bf2a0871a33d4068.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <289ea20cb549f8fd76343776bf2a0871a33d4068.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_082057_764743_AF06B572 
X-CRM114-Status: GOOD (  27.82  )
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

Hi CK,

On Wed, Aug 07, 2024 at 01:31:57AM +0000, CK Hu (胡俊光) wrote:
> On Wed, 2024-07-31 at 11:29 +0300, Laurent Pinchart wrote:
> > On Wed, Jul 31, 2024 at 02:59:51AM +0000, CK Hu (胡俊光) wrote:
> > > On Mon, 2024-07-29 at 16:48 +0200, Julien Stephan wrote:
> > > >  From: Phi-bang Nguyen <pnguyen@baylibre.com>
> > > >
> > > > This driver provides a path to bypass the SoC ISP so that image data
> > > > coming from the SENINF can go directly into memory without any image
> > > > processing. This allows the use of an external ISP.
> > > >
> > > > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > > > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > > > [Paul Elder fix irq locking]
> > > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> > > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > > ---
> > >
> > > [snip]
> > >
> > > > +
> > > > +static void mtk_cam_cmos_vf_enable(struct mtk_cam_dev *cam_dev,
> > > > +   bool enable, bool pak_en)
> > > > +{
> > > > +struct device *dev = cam_dev->dev;
> > > > +
> > > > +if (pm_runtime_get_sync(dev) < 0) {
> > > > +dev_err(dev, "failed to get pm_runtime\n");
> > > > +goto out;
> > > > +}
> > > > +
> > > > +if (enable)
> > > > +cam_dev->hw_functions->mtk_cam_cmos_vf_hw_enable(cam_dev);
> > >
> > > Directly call mtk_camsv30_cmos_vf_hw_enable().
> >
> > The goal, when this was developed, was to support multiple generations
> > of hardware with a single driver. I think it's a worthwhile goal, but at
> > the same time, I'm not sure that will ever happen as I'm not aware of
> > plans to upstream Genio 350 and 500 support (which is a bad sad, as it's
> > more or less working out-of-tree). I'm thus fine either way, and if we
> > think the most likely outcome is that this driver will only support
> > Genio 300, I'm fine dropping the abstraction layer.
> 
> I know this goal.
> For the mtk_camsv_30_setup(), in new SoC, if only one line in this function is different,
> should we duplicate the whole function and modify only one line?
> I think we don't know what would happen in future,
> so we should not design for something which we have no any information.

For future platforms, I fully agree with you. For Genio 350 and 500 we
have already identified some common elements. However, as there's no
point to upstream those at the moment, and as we can't review an
abstraction layer properly if support for only a single platform is
available, I'm fine dropping the abstraction.

> > > > +else
> > > > +cam_dev->hw_functions->mtk_cam_cmos_vf_hw_disable(cam_dev);
> > >
> > > Directly call mtk_camsv30_cmos_vf_hw_disable().
> > >
> > > > +
> > > > +out:
> > > > +pm_runtime_put_autosuspend(dev);
> > > > +}
> > > > +

-- 
Regards,

Laurent Pinchart

