Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86748C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 15:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIOsra+dyZwSVbueOIgO3BNhnbCGUais9sT7b43tefc=; b=YL1lKCq3n4QbCBz1/x7UwwQBg0
	VlZ1UgPdsAebc2bMR52etJJ4sghahc0ShA2nqC+Jw6VYCHv8VjKzCKyfaGCmr/fZfg+wUiuOjuO2J
	UeDzYYERB92sI0W9jlbP2ZgupXyTEl6F9wv3xC77mOWmW2Fi3J2Ao5kb5clmCCLF07VB0yQPUdIZe
	/nQdSwYpyzbN+Dzn1/8iY3VFJBQ3vyhvo9ccAbzyTqDkNM4+MLoDMy1K7LdoQvK0QeF6CHMCsy3dn
	J2IBbGIebsbDkOvT4OOl6uB3ApaIjYZ3iFJwRRHulC39u2fWcu0clilcyX31Q7WdjnW4439eYL2lQ
	mD/A154w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pezyN-00GPxk-0e;
	Wed, 22 Mar 2023 15:01:55 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pezyJ-00GPw6-0G;
	Wed, 22 Mar 2023 15:01:52 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B113BC1;
	Wed, 22 Mar 2023 16:01:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1679497307;
	bh=Az9CmcJ+XBb4olbWe91Aj3r8+M/Mn03lE84beJHYWcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WKXlws0YL/fxPG1M5ZQGaWla8QrHlrOYNJMXI2o/UFolpE4TobnpdShV9cjraTqeO
	 MwA6homUVXpEZ5ca7dTz/vAQQhQlSiv7sA8a4cprGocH5iNqqFk8jBFOGn1mJ3u5mP
	 wimrpwmLpPfLk6YPVwEV2dY/f3itqV+8uUElZbK8=
Date: Wed, 22 Mar 2023 17:01:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	David Laight <David.Laight@ACULAB.COM>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	"tfiga@chromium.org" <tfiga@chromium.org>,
	"m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"ming.qian@nxp.com" <ming.qian@nxp.com>,
	"shijie.qin@nxp.com" <shijie.qin@nxp.com>,
	"eagle.zhou@nxp.com" <eagle.zhou@nxp.com>,
	"bin.liu@mediatek.com" <bin.liu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"tiffany.lin@mediatek.com" <tiffany.lin@mediatek.com>,
	"andrew-ct.chen@mediatek.com" <andrew-ct.chen@mediatek.com>,
	"yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>,
	"stanimir.k.varbanov@gmail.com" <stanimir.k.varbanov@gmail.com>,
	"quic_vgarodia@quicinc.com" <quic_vgarodia@quicinc.com>,
	"agross@kernel.org" <agross@kernel.org>,
	"andersson@kernel.org" <andersson@kernel.org>,
	"konrad.dybcio@linaro.org" <konrad.dybcio@linaro.org>,
	"ezequiel@vanguardiasur.com.ar" <ezequiel@vanguardiasur.com.ar>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	"kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [RFC 2/4] media: videobuf2: Replace bufs array by a list
Message-ID: <20230322150153.GO20234@pendragon.ideasonboard.com>
References: <20230313135916.862852-1-benjamin.gaignard@collabora.com>
 <20230313135916.862852-3-benjamin.gaignard@collabora.com>
 <20230313181155.GC22646@pendragon.ideasonboard.com>
 <86df05244d974416903e919d387a0a0b@AcuMS.aculab.com>
 <e704b505-86d8-c6f2-8546-adccdab72622@xs4all.nl>
 <dc04d48e34ed40e58f43badd001a81d0@AcuMS.aculab.com>
 <cbf34cf1-e065-8136-8344-89ca1864f637@xs4all.nl>
 <20230319233358.GD20234@pendragon.ideasonboard.com>
 <f085aa9225c573df906bdc7ff032a8fd591b18b3.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f085aa9225c573df906bdc7ff032a8fd591b18b3.camel@ndufresne.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_080151_286963_7A9A7186 
X-CRM114-Status: GOOD (  16.04  )
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

On Wed, Mar 22, 2023 at 10:50:52AM -0400, Nicolas Dufresne wrote:
> Hi Laurent,
> 
> Le lundi 20 mars 2023 à 01:33 +0200, Laurent Pinchart a écrit :
> > > The typical usage is that applications allocate N buffers with the
> > > VIDIOC_REQBUFS ioctl, and in most cases that's all they use.
> > 
> > Note that once we get DELETE_BUF (or DELETE_BUFS) support I'd like to
> > encourage applications to use the new API, and deprecate REQBUFS
> > (dropping it isn't on my radar, as it would take forever before no
> > userspace uses it anymore).
> 
> I was wondering if you can extend on this. I'm worried the count semantic might
> prevent emulating it over create_bufs() ops, but if that works, did you meant to
> emulate it so driver no longer have to implement reqbufs() if they have
> create_bufs() ?

For drivers it should be fairly simply, as the reqbufs and create_bufs
ioctl handlers should just point to the corresponding videobuf2 helpers.

What I meant is that I'd like to encourage userspace to use the
VIDIOC_CREATE_BUFS ioctl instead of VIDIOC_REQBUFS.

-- 
Regards,

Laurent Pinchart

