Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68F1D5A6FD
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2024 08:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Abr/LQLQdhJzOb7O22BlTH5x947Nex9VHwgLUY7Xeiw=; b=JD4ExYRBEWxbaUYmu012xq2ca9
	9xTaOxo/RGD7qD1wUs9PBEK8sCCyq6zCScb0J+oJsitam9hcnYcC6RwVJkt9gnMymrkYRBLBE9ElI
	mbzNDZg6G461LaZIoaa9zBjqYaoDhVXqR++dsnczZH+YMohRaNIbX5sMxaQ2To5vSXdMk6bJvwYL2
	DBg9ReEa9kBLf7Caz6OB06/keQt7e8faSnldgUk6wmeAKICzGPPt14Ey8MVJjaKFhcdMwbSHHKLJT
	o1SBPcXIN10+IM73iT8/sjYkV9CI7zAbzMegVZTd/gJaTbLct78LrVBz+baKV1wYY6Apc9SekQoqR
	IiS0COwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrCC-00000009zev-01k8;
	Tue, 26 Nov 2024 08:45:20 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrAh-00000009zJx-2D4E;
	Tue, 26 Nov 2024 08:43:48 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D3C46BE;
	Tue, 26 Nov 2024 09:43:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732610603;
	bh=HuVyRClXhaSM8ZVR7Ab7Zv4aE1vJq8Al5X5SpC1lklE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BCiDhwyd7bsawseyl+EETONYSAC2fM3pjjuVWJLYNtZCHfXtpItr347dxf5EVG4rE
	 c0R32mk/65WqbkxhWjivJ9bI4oC1xYIOz4cm2IWlstsn7v+XUtkmqHMEfoKpALBLJU
	 ub61xODGZOIdPauVVzMqh4mHH458PjpRW/UlBycU=
Date: Tue, 26 Nov 2024 10:43:36 +0200
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
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>,
	"pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Message-ID: <20241126084336.GC19381@pendragon.ideasonboard.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
 <0e14e1d92be90c838ab097268a3674b38d48e51a.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e14e1d92be90c838ab097268a3674b38d48e51a.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_004347_700572_2B235D10 
X-CRM114-Status: GOOD (  16.51  )
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

On Tue, Nov 26, 2024 at 02:07:35AM +0000, CK Hu (胡俊光) wrote:
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
> > +static const u32 mtk_cam_mbus_formats[] = {
> > +       MEDIA_BUS_FMT_SBGGR8_1X8,
> > +       MEDIA_BUS_FMT_SGBRG8_1X8,
> > +       MEDIA_BUS_FMT_SGRBG8_1X8,
> > +       MEDIA_BUS_FMT_SRGGB8_1X8,
> > +       MEDIA_BUS_FMT_SBGGR10_1X10,
> > +       MEDIA_BUS_FMT_SGBRG10_1X10,
> > +       MEDIA_BUS_FMT_SGRBG10_1X10,
> > +       MEDIA_BUS_FMT_SRGGB10_1X10,
> > +       MEDIA_BUS_FMT_SBGGR12_1X12,
> > +       MEDIA_BUS_FMT_SGBRG12_1X12,
> > +       MEDIA_BUS_FMT_SGRBG12_1X12,
> > +       MEDIA_BUS_FMT_SRGGB12_1X12,
> > +       MEDIA_BUS_FMT_UYVY8_1X16,
> > +       MEDIA_BUS_FMT_VYUY8_1X16,
> > +       MEDIA_BUS_FMT_YUYV8_1X16,
> > +       MEDIA_BUS_FMT_YVYU8_1X16,
> > +};
> > +
> 
> Format in mtk_cam_mbus_formats[] is more than mtk_cam_format_info[].
> I would like these two to be consistent.
> Reduce mtk_cam_mbus_formats[] or enlarge mtk_cam_format_info[].
> Once these two are consistent, they could be merged into one array.

And the array could then be extended with fields to replace the
fmt_to_sparams() function.

> > +static const struct mtk_cam_format_info mtk_cam_format_info[] = {
> > +       {
> > +               .fourcc = V4L2_PIX_FMT_SBGGR8,
> > +               .code = MEDIA_BUS_FMT_SBGGR8_1X8,
> > +               .bpp = 8,
> > +       }, {
> > +               .fourcc = V4L2_PIX_FMT_SGBRG8,
> > +               .code = MEDIA_BUS_FMT_SGBRG8_1X8,
> > +               .bpp = 8,
> > +       }, {
> > +               .fourcc = V4L2_PIX_FMT_SGRBG8,
> > +               .code = MEDIA_BUS_FMT_SGRBG8_1X8,
> > +               .bpp = 8,
> > +       }, {
> > +               .fourcc = V4L2_PIX_FMT_SRGGB8,
> > +               .code = MEDIA_BUS_FMT_SRGGB8_1X8,
> > +               .bpp = 8,
> > +       }, {
> > +               .fourcc = V4L2_PIX_FMT_YUYV,
> > +               .code = MEDIA_BUS_FMT_YUYV8_1X16,
> > +               .bpp = 16,
> > +       }, {
> > +               .fourcc = V4L2_PIX_FMT_YVYU,
> > +               .code = MEDIA_BUS_FMT_YVYU8_1X16,
> > +               .bpp = 16,
> > +       }, {
> > +               .fourcc = V4L2_PIX_FMT_UYVY,
> > +               .code = MEDIA_BUS_FMT_UYVY8_1X16,
> > +               .bpp = 16,
> > +       }, {
> > +               .fourcc = V4L2_PIX_FMT_VYUY,
> > +               .code = MEDIA_BUS_FMT_VYUY8_1X16,
> > +               .bpp = 16,
> > +       },
> > +};
> > +

-- 
Regards,

Laurent Pinchart

