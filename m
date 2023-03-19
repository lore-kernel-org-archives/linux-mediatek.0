Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A954C7618A
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Mar 2023 23:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51L3MHl4gEziOUXQiRya6xIKGnnRh6qXtZOfJGSmU+k=; b=Ib/RxwyFKXAkTm2bH76kwPx8c5
	BPmaYDQyLEPzsTnYw6MYOlJYWxE+8fqHc2bLFjviWNlVd6LxAC0BWFKYBD1xR6padqr+/ToL9kIPv
	Z+YreBlEQPOBbFnXb09+iy6OFN/XhO4FDAXwULQQ8GdOYjjoa1WyJYJ3d24wCkSZllpetP58VcVQn
	JocULJuvwLpZwu5TVf9HkYnLdui8zFxzI88UexmtJtCayIujs2WQV/wGrGSxgdGHxYaQtk0i9ffAb
	Wf30XNonEzFm14STfpNxBUbw/hRpN0233EFtespFJdPr2rRJfiaj4UYzybEBuTxTj+4avQebxs32i
	cLKoRdpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe2XN-007eLj-2r;
	Sun, 19 Mar 2023 23:34:05 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe2XB-007eGR-2Z;
	Sun, 19 Mar 2023 23:33:55 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 289A11449;
	Mon, 20 Mar 2023 00:33:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1679268832;
	bh=l2p4ZDBneAwEGOLjso6EkHUNvJxzex1xBmjmxf7QRGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aLcAv49AFw0OYSHbmnljKSRWyI2EloW7N3ryboN/dLV3MR3iF00oAyaxNlPwAjbTA
	 TRmqA5Cwa86orRcNH7geU2YfHVDB4sIM45GO+ZPVBETuvTSCzeVyunEXiZOfr0a/Jr
	 GPXVEd+Pz7pKmMVUVySEGmPANB3jS0kMSWW6MFxo=
Date: Mon, 20 Mar 2023 01:33:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: David Laight <David.Laight@ACULAB.COM>,
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
Message-ID: <20230319233358.GD20234@pendragon.ideasonboard.com>
References: <20230313135916.862852-1-benjamin.gaignard@collabora.com>
 <20230313135916.862852-3-benjamin.gaignard@collabora.com>
 <20230313181155.GC22646@pendragon.ideasonboard.com>
 <86df05244d974416903e919d387a0a0b@AcuMS.aculab.com>
 <e704b505-86d8-c6f2-8546-adccdab72622@xs4all.nl>
 <dc04d48e34ed40e58f43badd001a81d0@AcuMS.aculab.com>
 <cbf34cf1-e065-8136-8344-89ca1864f637@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cbf34cf1-e065-8136-8344-89ca1864f637@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_163353_982362_C1FF4BEA 
X-CRM114-Status: GOOD (  20.29  )
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

Hi Hans,

On Tue, Mar 14, 2023 at 11:42:46AM +0100, Hans Verkuil wrote:
> On 3/14/23 11:11, David Laight wrote:
> > From: Hans Verkuil
> >> Sent: 14 March 2023 08:55
> > ...
> >> Why not start with a dynamically allocated array of 32 vb2_buffer pointers?
> >> And keep doubling the size (reallocing) whenever more buffers are needed,
> >> up to some maximum (1024 would be a good initial value for that, I think).
> >> This max could be even a module option.

The kernel has IDR and IDA APIs, why not use them instead of reinventing
the wheel ?

> > I don't know the typical uses (or the code at all).
> > But it might be worth having a small array in the structure itself.
> > Useful if there are typically always (say) less than 8 buffers.
> > For larger sizes use the (IIRC) kmalloc_size() to find the actual
> > size of the structure that will be allocate and set the array
> > size appropriately.
> 
> The typical usage is that applications allocate N buffers with the
> VIDIOC_REQBUFS ioctl, and in most cases that's all they use.

Note that once we get DELETE_BUF (or DELETE_BUFS) support I'd like to
encourage applications to use the new API, and deprecate REQBUFS
(dropping it isn't on my radar, as it would take forever before no
userspace uses it anymore).

> The
> current max is 32 buffers, so allocating that initially (usually
> during probe()) will cover all current cases with a single one-time
> kzalloc.

Pre-allocating for the most common usage patterns is fine with me.

> Only if the application wants to allocate more than 32 buffers will
> there be a slight overhead.

-- 
Regards,

Laurent Pinchart

