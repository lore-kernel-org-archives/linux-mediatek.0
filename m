Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5FBC64EC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 22:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WN5YTYhqTbVCzcKLTe9OtgUcH+lE2+wfpoASVKIG8U8=; b=AHoZriLc0EWWqX/eAU73dNyQGp
	dk9MqD0tjX7pOAilu2y7AseDZm58zsnRSaO54z206ky1yZIxgUzuLG2YmJK6a51W3khO69qovdY7J
	hlLqgTuBr0wIWZs/j92MA3teFUpnoNsFgKdDQQeUW6dYiGDR8KV5+a7x5NpLNN6VlooPzktslADX7
	X0/i3yjJ2dSkGPPIGKabxt1g12O2skrwrWtuTpXTPDrFwYTq6d3+kBivLEXFImqSOb8uC4zDZoIm/
	yKp+0o/Yx5lzFmi3NF3YEHsFktVf5SiDMlnF5l6sP4TRQuKEPviXijTUbOwuNhDAFG/hFlQRkDd8W
	JhMyrkZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX84s-00ERVJ-O1; Tue, 28 Feb 2023 22:04:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX84c-00ERP5-Qv; Tue, 28 Feb 2023 22:03:52 +0000
Received: from notapiano (unknown [194.36.25.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6422166021C4;
	Tue, 28 Feb 2023 22:03:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677621825;
	bh=IYU+tKsnp3PIx+wju4+3RcegqJqr5FahXF/+fSaoWRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y49y19EVKT4U+TdGhA7ZqIo9yqj3uV79sKdd//G8beYwKb/1JGZBvN+7AmgKcHpyL
	 gNc/ib3GCsVNyJnvXrT5Fr/bKqtoQwbAB6D0DRqOMHrs1C8Mhhayf2dUHR7pzFqOY9
	 xkB/DB/jXFwUscJ4G72KfEqBsa2g2pmfPIksYdnDZ48ClpvKpdGzhppEcNQpu6m6B8
	 7Kz3OdKCZgufS+3lBi0HV+ThuXJfsmmu0qj0+/Sj8vshtM6w9RHFev6tsDApvAhU9G
	 A+YhpZQChjGZCppJN+42tyK3dJiJ6B1J1aqJ1mtU+QIlv7ZNekMO8HQ9zdBvI0jsO9
	 eHAkFptw1+3Jg==
Date: Tue, 28 Feb 2023 17:03:36 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Yunfei Dong =?utf-8?B?KOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"frkoenig@chromium.org" <frkoenig@chromium.org>,
	Tiffany Lin =?utf-8?B?KOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"stevecho@chromium.org" <stevecho@chromium.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"hsinyi@chromium.org" <hsinyi@chromium.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] media: mediatek: vcodec: Force capture queue format
 to MM21
Message-ID: <20230228220336.gnainmcyi42l2a6r@notapiano>
References: <20230210055518.6017-1-yunfei.dong@mediatek.com>
 <e972c2ac1a7a6f0ce258c8056b82bdc87e4d8ceb.camel@ndufresne.ca>
 <f6148f4c4864d324b52a52cc87b8785d958ceeb5.camel@mediatek.com>
 <20230222211154.mhl7mihycl7eq5v6@notapiano>
 <f3d53cf7bfbaf092e1020c41316668b9f53b890b.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3d53cf7bfbaf092e1020c41316668b9f53b890b.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_140351_174136_715EA417 
X-CRM114-Status: GOOD (  35.97  )
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

On Mon, Feb 27, 2023 at 02:17:08AM +0000, Yunfei Dong (董云飞) wrote:
> Hi Nicolas,
> 
> Thanks for your suggestion.
> On Wed, 2023-02-22 at 16:11 -0500, Nícolas F. R. A. Prado wrote:
> > Hi,
> > 
> > On Tue, Feb 14, 2023 at 02:28:04AM +0000, Yunfei Dong (董云飞) wrote:
> > > Hi Nicolas,
> > > 
> > > Thanks for your suggestion.
> > > On Fri, 2023-02-10 at 10:36 -0500, Nicolas Dufresne wrote:
> > > > Le vendredi 10 février 2023 à 13:55 +0800, Yunfei Dong a écrit :
[..]
> > > > > diff --git
> > > > > a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > > > > b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > > > > index 641f533c417f..4f5e9c20214f 100644
> > > > > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > > > > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > > > > @@ -41,7 +41,7 @@ static bool mtk_vdec_get_cap_fmt(struct
> > > > > mtk_vcodec_ctx *ctx, int format_index)
> > > > >  	const struct mtk_video_fmt *fmt;
> > > > >  	struct mtk_q_data *q_data;
> > > > >  	int num_frame_count = 0, i;
> > > > > -	bool ret = true;
> > > > > +	bool ret = false;
> > 
> > This change doesn't do anything, so I'd drop it.
> > 
> This change is useful when capture fourcc is MT21 will return false,
> not support even if scp support mm21 and mt21.

But you have

	default:
		ret = true;
		break;

down below, so you're handling all cases in the switch, and the original value
doesn't matter. It could even be left uninitialized.

> > > > >  
> > > > >  	for (i = 0; i < *dec_pdata->num_formats; i++) {
> > > > >  		if (dec_pdata->vdec_formats[i].type !=
> > > > > MTK_FMT_FRAME)
> > > > > @@ -63,7 +63,7 @@ static bool mtk_vdec_get_cap_fmt(struct
> > > > > mtk_vcodec_ctx *ctx, int format_index)
> > > > >  	case V4L2_PIX_FMT_H264_SLICE:
> > > > >  	case V4L2_PIX_FMT_VP9_FRAME:
> > > > >  		if (fmt->fourcc == V4L2_PIX_FMT_MM21)
> > > > > -			ret = false;
> > > > > +			ret = true;
> > > > 
> > > > This makes the VP8 and the other cases identical, leaving
> > > > anything
> > > > that touches
> > > > MT21 as dead code. I'm not sure, cause I cannot test it, but it
> > > > should in theory
> > > > render MT8192 unusable, unless a new firmware has been submitted
> > > > to
> > > > linux-
> > > > firmware with MM21 support ?
> > > > 
> > > 
> > > If the firmware only support MT21 => won't exist for vp8 need to
> > > use
> > > MM21.
> > 
> > And that's the issue, the scp.img for MT8192 on linux-firmware only
> > supports
> > MT21 [1]. Can you please update it to support both MM21 and MT21?
> > 
> > For MT8195, only MM21 is supported in scp.img [2], but since the
> > hardware
> > supports both MM21 and MT21, the firmware should also support both.
> > So please
> > also update it on linux-firmware.
> > 
> > [1] 
> > https://lore.kernel.org/all/20230112204626.ciaff4amseoidybw@notapiano/
> > [2] 
> > https://lore.kernel.org/all/20230112205825.wb5qcqhh5kwvyi3y@notapiano/
> > 
> > Thanks,
> > Nícolas
> > 
> MT8192 always use MM21 from the beginning, MT21 have not been enabled.

That's not true, and you can verify through the following:

	$ curl https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/mediatek/mt8192/scp.img > /lib/firmware/mediatek/mt8192/scp.img

	$ sha256sum /lib/firmware/mediatek/mt8192/scp.img
	fb9b4727f5e7cd82b2c63a8a2604d02e8c0f390eae2e9fd87aa1ae0797fb01b3  /lib/firmware/mediatek/mt8192/scp.img

	$ v4l2-ctl -d1 --list-formats -D
	Driver Info:
		Driver name      : mtk-vcodec-dec
		Card type        : MT8192 video decoder
		Bus info         : platform:16000000.video-codec
		Driver version   : 6.2.0
		Capabilities     : 0x84204000
			Video Memory-to-Memory Multiplanar
			Streaming
			Extended Pix Format
			Device Capabilities
		Device Caps      : 0x04204000
			Video Memory-to-Memory Multiplanar
			Streaming
			Extended Pix Format
	Media Driver Info:
		Driver name      : mtk-vcodec-dec
		Model            : mtk-vcodec-dec
		Serial           :
		Bus info         : platform:16000000.video-codec
		Media version    : 6.2.0
		Hardware revision: 0x00000000 (0)
		Driver version   : 6.2.0
	Interface Info:
		ID               : 0x0300000c
		Type             : V4L Video
	Entity Info:
		ID               : 0x00000001 (1)
		Name             : mtk-vcodec-dec-source
		Function         : V4L2 I/O
		Pad 0x01000002   : 0: Source
		 Link 0x02000008: to remote pad 0x1000004 of entity 'mtk-vcodec-dec-proc' (Video Decoder): Data, Enabled, Immutable
	ioctl: VIDIOC_ENUM_FMT
		Type: Video Capture Multiplanar

		[0]: 'MT21' (Mediatek Compressed Format, compressed)


So the decoder video node is clearly only exposing MT21 in the capture pad.

Furthermore, with

	$ echo module mtk_vcodec_dec +pmf > /sys/kernel/debug/dynamic_debug/control

and re-running the v4l2-ctl command, you'll see

	[ 3164.998781] mtk_vcodec_dec:fops_vcodec_open: fops_vcodec_open(),212: decoder capability 740

and if you check drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h:

	enum mtk_vdec_format_types {
		MTK_VDEC_FORMAT_MM21 = 0x20,
		MTK_VDEC_FORMAT_MT21C = 0x40,
		MTK_VDEC_FORMAT_H264_SLICE = 0x100,
		MTK_VDEC_FORMAT_VP8_FRAME = 0x200,
		MTK_VDEC_FORMAT_VP9_FRAME = 0x400,
		MTK_VCODEC_INNER_RACING = 0x20000,
	};

meaning the scp.img firmware is exposing the MT21C but not the MM21 format.

So, again, the mt8192 scp.img firmware needs to be fixed.

Thanks,
Nícolas

