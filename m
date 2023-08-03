Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCCEC001DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 22:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcIry1mrhc70xplksnRDogu5Y5PdR7Z+J+ZF79y2OCo=; b=caJm8tRRzWv5qAVZflfII2Xx1Z
	xGI6nS9bBaXd1Y4GPPolGiI0AD5OQTdTEwzTI1zUAu626ajyTYuo3egoU1DDSt4eCOLKCRly+UHOV
	el35Jt4/z5hF2JgwZQKopNn6NpbriOkiIHLAKYnFtdGFbugc1WdQndpRubjTVKTO4AG+qtjGxjex3
	oMKg4mq4uPQMnDrMQBswsbPwaE+kv3oVsvb4R1vJVZ7w0AA13UFG4bKNRQ30SRybIspFZXh42lrIK
	9YwWKwYpmbGoyRcldWl/y7AAy54qfX5QM1cNNS0p7OAsnuui8kdMf0X4o6ihgwbYubbYar5n4Lp7N
	X4DfG2rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRgq1-00Azgw-21;
	Thu, 03 Aug 2023 22:30:33 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRgpx-00AzgI-2o;
	Thu, 03 Aug 2023 22:30:31 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C288312E4;
	Fri,  4 Aug 2023 00:29:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1691101764;
	bh=LdfWIHFVh0wD7ytkzesn6ipqy1pHCP4s5brCJFt0pZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uBcmASI54b2A8zO/XorpCjFOoY63qQ4IWmiNFFz6/6Vzbl8XF6HbyQiLSUv8ohiFF
	 V/i6P3OsBTCmnrz710MIIILwOCvVaSx+qhfWjf8NccoFQFHSurGnPB3k1ngJflvGdH
	 KMch+ILrw2I4fNZXmXeUZr4f/yxSaHI2hOFqfJi0=
Date: Fri, 4 Aug 2023 01:30:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Phi-bang Nguyen <pnguyen@baylibre.com>,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>,
	daoyuan huang <daoyuan.huang@mediatek.com>,
	devicetree@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	Louis Kuo <louis.kuo@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Moudy Ho <moudy.ho@mediatek.com>,
	Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>
Subject: Re: [PATCH v2 4/4] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Message-ID: <20230803223034.GH9722@pendragon.ideasonboard.com>
References: <20230630100321.1951138-1-jstephan@baylibre.com>
 <20230630100321.1951138-5-jstephan@baylibre.com>
 <0430ddab-6a6c-9fa3-95bd-05ce8ac5b94f@collabora.com>
 <iq7jffjeaejdfb26a4ysjgjzuopov4ji2ecgzmv4563tdveaep@hh2gzgzkbdzj>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <iq7jffjeaejdfb26a4ysjgjzuopov4ji2ecgzmv4563tdveaep@hh2gzgzkbdzj>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_153030_078962_86A032CC 
X-CRM114-Status: GOOD (  15.21  )
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

On Thu, Aug 03, 2023 at 11:53:35AM +0200, Julien Stephan wrote:
> On Mon, Jul 03, 2023 at 02:21:17PM +0200, AngeloGioacchino Del Regno wrote:
> ..snip..
> > > +
> > > +	mtk_cam_init_cfg(&cam->subdev, NULL);
> >
> > mtk_cam_init_cfg() returns an integer, and this is probably because you expect
> > it to get logic to fail: in that case, check the result of that call here,
> > otherwise, make that function void.
> >
> 
> Hi Angelo,
> 
> mtk_cam_init_cfg returns an int because it should match v4l2_subdev_pad_ops->init_cfg prototype..
> 
> mtk_cam_init does not fail, always return 0, so I though it would be ok
> to discard the return value here. What do you think?

Fine with me.

> > > +
> 
> ..snip..
> 
> > > +	unsigned int bpp;
> >
> > Can we get any format that uses a billion bits per pixel? :-P
> >
> > u8 bpp;
> 
> I am preparing the driver for futur upgrades.. in a billion years ;)

-- 
Regards,

Laurent Pinchart

