Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC48ED3B7F6
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2024 10:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzxK7UzHYFLAvx45ReQYNRy8OP1cQB/cdNUwRGNZfUg=; b=q9Ki9HQNYCUEP20PxiAP2fpm5e
	Z1vgyCcBo1invyXrdc5dcKF+in1KBXL39R/Mt3/26YslXNvNb54DOFBMaxx16SbEQrPKf1sjaqTY1
	YQGObh4cEyaQTVErwpqBhY/+JUpL21Dt5Cz7lFlu4z+oMzEi6LA8gw3qSb9odB2Op55DyUIbNV59b
	QAtOnhHJGHKESlyNDvEhtx2hbUKZk0EIKJW+CeFJxv/ErkebCdzL7aM7WQgnBFv0vBPbRnXPtBOVv
	YugCiutKoKboDex7IPOlQbch3q4hm2t6uVChVRG3hozKXWG09WUSJYASyLcBgUE6kV6jePOXF4A8e
	p7h8F2EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFW9n-00000007hfm-17sb;
	Mon, 25 Nov 2024 10:17:27 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVZe-00000007brQ-1g0l;
	Mon, 25 Nov 2024 09:40:07 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63C924AD;
	Mon, 25 Nov 2024 10:39:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732527581;
	bh=fjvHCtsrcUmA++YpYkQVAoscDYRnPiL5YwSB8toYJko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ViisyC8QDyeKlOdGMoyCDkkUz9lS2mUe7RDbQolPD0vVgAwat79kxKWiZ0y+sV7yY
	 a8Cxznb39RqLQ7SllZskTPC3A3U3DbaDDeRwJTzfr6t+Vnlh+Oqch9RH39Y+X51wiu
	 zNFm6iD3tPTyMW8JbNn0OrO5dLB33347M0i0Y1no=
Date: Mon, 25 Nov 2024 11:39:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	Andy Hsieh =?utf-8?B?KOisneaZuueakyk=?= <Andy.Hsieh@mediatek.com>,
	Julien Stephan <jstephan@baylibre.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Message-ID: <20241125093953.GM19381@pendragon.ideasonboard.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
 <a9aa69dc8d025f0b133f33de6428ffec5a881a2a.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9aa69dc8d025f0b133f33de6428ffec5a881a2a.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_014006_576796_2822A35E 
X-CRM114-Status: GOOD (  17.25  )
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

On Mon, Nov 25, 2024 at 06:59:59AM +0000, CK Hu (胡俊光) wrote:
> Hi, Julien:
> 
> On Thu, 2024-11-21 at 09:53 +0100, Julien Stephan wrote:
> >
> > From: Phi-bang Nguyen <pnguyen@baylibre.com>
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
> > +static const struct mtk_cam_conf camsv30_conf = {
> > +       .tg_sen_mode = 0x00010002U, /* TIME_STP_EN = 1. DBL_DATA_BUS = 1 */
> > +       .module_en = 0x40000001U, /* enable double buffer and TG */
> > +       .imgo_con = 0x80000080U, /* DMA FIFO depth and burst */
> > +       .imgo_con2 = 0x00020002U, /* DMA priority */
> 
> Now support only one SoC, so it's not necessary make these SoC variable.
> They could be constant symbol now.

This I would keep as a mtk_cam_conf structure instance, as I think it
makes it clear what we consider to be model-specific without hindering
readability. I don't have a very strong opinion though.

> > +};
> > +

-- 
Regards,

Laurent Pinchart

