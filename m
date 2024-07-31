Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FC9C3DA64
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 13:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGZMZdoZkE1oV9PZsNHbSfsrvmXyus/rom1MzcHNvKs=; b=rlqMZTXGnr7wbXgRmGPKcqEhlk
	uMu218yJfFax4W0AADYIqYSrAzKaacltJmlSXIihAANwMtEW3+Q6gQ4V14fq9BOHOI8sS2m8BuXkP
	Sd1KmAtAvtzWtqKDPoaGD5+9vB8kXzQTQ+fpjLmLNIUxAFht3cQ8oqE2f8gNIjc4YFLDovGYGq9Fd
	EKqqWzN9aztY4aI9dAl8QEH++gBUr66Eo2mUQjjMZulJ3giZhkop0/1Qim79nuQYjl5O4cPXNvb+t
	jxhx9qu02WKJvVG0aAqXGw1vkmHNKyKf836cUwla1LUKTffjfYd7mzFgI/jaFDbeSm9fVDfHH3IsH
	3oQKVFJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ9kF-00000001MrC-25Hf;
	Wed, 31 Jul 2024 13:51:59 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ9jl-00000001MiE-09Tg;
	Wed, 31 Jul 2024 13:51:30 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8822F85;
	Wed, 31 Jul 2024 15:50:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722433836;
	bh=xpw6F7XSh7e3ShH1slcaKE1e0vMjHFOJ5tOhmnzsnBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MAMVHZj3PrsxK4q8G25hetinqKao+Hx7PUY/cPDME1vWAvnDF8YD5F8SHyOure/hF
	 8hHUs4nq9FOq56V8IQ35NAApiQ6oF2MawjnrtHbsHkES+ysUfU2tAaYo8kQqkkT+pR
	 zQa+qiLM2XJJwfNBxjGSXJfR+tf0J2KY7TFk0nmM=
Date: Wed, 31 Jul 2024 16:51:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Andy Hsieh <andy.hsieh@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Louis Kuo <louis.kuo@mediatek.com>,
	Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH v6 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
Message-ID: <20240731135103.GE12477@pendragon.ideasonboard.com>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
 <20240729-add-mtk-isp-3-0-support-v6-3-c374c9e0c672@baylibre.com>
 <20240730132931.GM1552@pendragon.ideasonboard.com>
 <CAEHHSvaiwBWnV+kmjNG=RzPk3W9Y25saNQv5-KiU8EtampUbZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEHHSvaiwBWnV+kmjNG=RzPk3W9Y25saNQv5-KiU8EtampUbZQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_065129_239567_D240DC2E 
X-CRM114-Status: GOOD (  16.71  )
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

On Wed, Jul 31, 2024 at 03:33:59PM +0200, Julien Stephan wrote:
> Le mar. 30 juil. 2024 à 15:29, Laurent Pinchart a écrit :
> [...]
> > > +             mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0, DPHY_MODE, 0 /* 4D1C*/);
> >
> > As this is a V4L2 driver, I'm pretty sure someone will ask for
> >
> >                 mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> >                                   DPHY_MODE, 0 /* 4D1C*/);
> >
> > I wouldn't care too much about going slightly over 80 characters, but
> > getting close to 100 where lines could be wrapped without hindering
> > readability will likely upset some people. Same in other places where
> > applicable.
> 
> Hi Laurent,
> 
> On an early version of this series, Angelo asked me to un-wrap lines
> that can fit into 100 chars...
> Both are fine for me, we just need to agree on something here ....

For new V4L2 drivers I have a preference for a soft 80 columns limit,
but I don't insist too much usually. Some other V4L2 core developers do
insist more.

> [...]
> > > +     /* Configure timestamp */
> > > +     writel(SENINF_TIMESTAMP_STEP, input->base + SENINF_TG1_TM_STP);
> >
> > Can we have a mtk_seninf_input_write(), the same way we have
> > mtk_seninf_mux_write() ? Same for writes to priv->base below, with a
> > mtk_seninf_write() inline function.
> 
> ... and here :) In an early review Angelo also  asked me to remove
> these accessors.
> 
> I can add them back and reduce line chars if needed.

With my V4L2 hat, trying to achieve some level of consistency between
drivers in the subsystem, I'd like to have wrappers around writel() and
readl(). Angelo, I hope you don't mind my overruling you in this case.

-- 
Regards,

Laurent Pinchart

