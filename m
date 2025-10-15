Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBC4CCD18E
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Oct 2025 10:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qo16wJSvEzXCa8MD6q3OvcPL/UDB8rmFD2tM1u4kTdc=; b=sQDnm5dJ31nMOsAxbLmfSlIp0H
	y8W8BTwPuM+fhrdG+IiSJijnGWsvpJWJvqBSSYXupDJemY2NGzEDPav3GOoeYtHhfj3+qm3X5RxE3
	kQKvJ9rTb1HnlQ58w5N1bJGw/uyKitb8McGXgSt9Jjw+P2suyd65/YicuAdepR1T+S68xUFO9cG8P
	EwbfmUumgxHOrnWA55S3VgWm5UzJ3Gigp2LuN4cFDqYxjqpLBJPAF9r4HqNN0unNLDqPavfQE5lGp
	dyKxZsUnAt6LykJQSG/haNR+F2iQ/HrwOiJt7rt0PNSFJuZ2BkgLERRbiS0OXeqTEbXSvYLu+T2nW
	w4+ls5kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8yU9-00000001F4e-191h;
	Wed, 15 Oct 2025 10:11:57 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8yU7-00000001F2c-0e5l
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Oct 2025 10:11:56 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v8yU1-0005fF-P4; Wed, 15 Oct 2025 12:11:49 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v8yTv-003hwe-3D;
	Wed, 15 Oct 2025 12:11:44 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v8yTv-000000007QM-3dJv;
	Wed, 15 Oct 2025 12:11:43 +0200
Message-ID: <14f49cddfcb1c86598105ee394cd43a2bdf7fa89.camel@pengutronix.de>
Subject: Re: [PATCH v2] media: v4l2-mem2mem: Don't copy frame flags in
 v4l2_m2m_buf_copy_metadata()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-staging@lists.linux.dev
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew-CT Chen	
 <andrew-ct.chen@mediatek.com>, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Bin Liu <bin.liu@mediatek.com>, Chen-Yu
 Tsai	 <wens@csie.org>, Daniel Almeida <daniel.almeida@collabora.com>,
 Detlev Casanova	 <detlev.casanova@collabora.com>, Devarsh Thakkar
 <devarsht@ti.com>, Dmitry Osipenko <digetx@gmail.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Hans Verkuil	 <hverkuil@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Jacob Chen	 <jacob-chen@iotwrt.com>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael
 Tretter	 <m.tretter@pengutronix.de>, Ming Qian <ming.qian@nxp.com>, Mirela
 Rabulea	 <mirela.rabulea@nxp.com>, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>,  Paul Kocialkowski	 <paulk@sys-base.io>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Steve Longerbeam
 <slongerbeam@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Xavier
 Roumegue	 <xavier.roumegue@oss.nxp.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Zhou Peng <eagle.zhou@nxp.com>
Date: Wed, 15 Oct 2025 12:11:43 +0200
In-Reply-To: <20251015100118.8755-1-laurent.pinchart@ideasonboard.com>
References: <20251015100118.8755-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_031155_183134_19BFA390 
X-CRM114-Status: GOOD (  13.98  )
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

On Mi, 2025-10-15 at 13:01 +0300, Laurent Pinchart wrote:
> The v4l2_m2m_buf_copy_metadata() function takes a boolean
> copy_frame_flags argument. When true, it causes the function to copy the
> V4L2_BUF_FLAG_KEYFRAME, V4L2_BUF_FLAG_BFRAME and V4L2_BUF_FLAG_PFRAME
> flags from the output buffer to the capture buffer.
>=20
> There is no use cases in any upstream driver for copying the flags.
> KEY/P/B frames are properties of the bitstream buffer in some formats.
> Once decoded, this is no longer a property of the video frame and should
> be discarded.
>=20
> It was considered useful to know if an uncompressed frame was decoded
> from a KEY/P/B compressed frame, and to preserve that information if
> that same uncompressed frame was passed through another M2M device (e.g.
> a scaler). However, the V4L2 documentation makes it clear that the flags
> are meant for compressed frames only.
>=20
> Drop the copy_frame_flags argument from v4l2_m2m_buf_copy_metadata().
> The change to drivers was performed with the following Coccinelle
> semantic patch:
>=20
> @@
> expression src;
> expression dst;
> expression flag;
> @@
> -       v4l2_m2m_buf_copy_metadata(src, dst, flag);
> +       v4l2_m2m_buf_copy_metadata(src, dst);
>=20
> include/media/v4l2-mem2mem.h and drivers/media/v4l2-core/v4l2-mem2mem.c
> have been updated manually.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

