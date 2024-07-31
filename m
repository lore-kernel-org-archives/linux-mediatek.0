Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFA1C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 08:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEl6O//DUpdv2s/2pwbjZMQDv+rK2gjzp+kZQ0XuskY=; b=anth9GS7bptC8AjfSPMZitMimz
	raoX9SLBeY2WOYGDHJn3JAsRwvwP4R25qjSzt1XjFRxkFjW0X8Qnct56pbmsoWUays3mXINs4aT9M
	MMdCmCHa8T3mINVL70z9KfkP4fQLPYVl+tWKjeTk2z/QnpVS32gioAiD22ydvcx0Mt6uRYVnoj32R
	yBPquNVuCrLLlL/epOLD1g6WIH22EIdh7Dmi5nfAyCWWnCWEUVfjMoJUwUSCq5m0YhMA8sxCYh5cL
	721ZVHpxQLxqDsrTvIcRHk9icIhakuld6F//cmIQJ/eVnaaxjpErQAMJDSSAf2UhCmyUh3QE712J4
	jRw27mhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ4jS-00000000KNQ-2LBR;
	Wed, 31 Jul 2024 08:30:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ4iz-00000000KCi-1WOX;
	Wed, 31 Jul 2024 08:30:22 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61D527E4;
	Wed, 31 Jul 2024 10:29:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722414571;
	bh=pjw/UlZpX9tFuIUC4j7+LvlinTu1b35XlaxhKH1fHqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cRDIygWWqC6vaEQRZBb28o6at6wEtrrWEUJ4QwiDEn7WmDD+3T4tZGivw207OGM39
	 0HJAABhxW8BfhBQ4r+WGCwI96gUYTL6SgnAEyljLrjNPw1s+pQxMEaG0D9JKvYvPc/
	 TzHaCvbqEYDICyL1i4392/aZtvtO3BKnPcKa7iK4=
Date: Wed, 31 Jul 2024 11:29:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	Andy Hsieh =?utf-8?B?KOisneaZuueakyk=?= <Andy.Hsieh@mediatek.com>,
	"jstephan@baylibre.com" <jstephan@baylibre.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>,
	"pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v6 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Message-ID: <20240731082958.GM8146@pendragon.ideasonboard.com>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
 <20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com>
 <6a7467cde347600015078fe7aa25c4b46c45e96d.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a7467cde347600015078fe7aa25c4b46c45e96d.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_013021_565630_DEEB2FD5 
X-CRM114-Status: GOOD (  17.16  )
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

On Wed, Jul 31, 2024 at 02:59:51AM +0000, CK Hu (胡俊光) wrote:
> On Mon, 2024-07-29 at 16:48 +0200, Julien Stephan wrote:
> >  From: Phi-bang Nguyen <pnguyen@baylibre.com>
> >
> > This driver provides a path to bypass the SoC ISP so that image data
> > coming from the SENINF can go directly into memory without any image
> > processing. This allows the use of an external ISP.
> >
> > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > [Paul Elder fix irq locking]
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> 
> [snip]
> 
> > +
> > +static void mtk_cam_cmos_vf_enable(struct mtk_cam_dev *cam_dev,
> > +   bool enable, bool pak_en)
> > +{
> > +struct device *dev = cam_dev->dev;
> > +
> > +if (pm_runtime_get_sync(dev) < 0) {
> > +dev_err(dev, "failed to get pm_runtime\n");
> > +goto out;
> > +}
> > +
> > +if (enable)
> > +cam_dev->hw_functions->mtk_cam_cmos_vf_hw_enable(cam_dev);
> 
> Directly call mtk_camsv30_cmos_vf_hw_enable().

The goal, when this was developed, was to support multiple generations
of hardware with a single driver. I think it's a worthwhile goal, but at
the same time, I'm not sure that will ever happen as I'm not aware of
plans to upstream Genio 350 and 500 support (which is a bad sad, as it's
more or less working out-of-tree). I'm thus fine either way, and if we
think the most likely outcome is that this driver will only support
Genio 300, I'm fine dropping the abstraction layer.

> > +else
> > +cam_dev->hw_functions->mtk_cam_cmos_vf_hw_disable(cam_dev);
> 
> Directly call mtk_camsv30_cmos_vf_hw_disable().
> 
> > +
> > +out:
> > +pm_runtime_put_autosuspend(dev);
> > +}
> > +

-- 
Regards,

Laurent Pinchart

