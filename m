Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1FEEB64DD
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 19:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XUVcthITwD6c64/gwi7/8Ao/ozIS5xv3W1HGd//C2eQ=; b=ANvAbPvKkSXil/uy4sCvlUi7aC
	+3Yy0xFA41+RhO2ORBajP/X6Oz+dh589Hq+t/s6xkYQ2ctQMJycQ8ok7W8Wnk02pFmIkgGFQbA6ex
	8Tyf6McZkgzhwEn4Wp93DHVuCuOtp9MTzwIw/Rgrj+xDaKWwQNAJLoRA+9lqSaSsVG1pz2Fx76H/W
	ZZnUADiprpyoBGTcMX+PTDlB12n6vbdtFET77qzHB/ROvRHC6ogzZQEV18MdZ84SAGrMbfy1uzvC4
	mCotZ6PQ1Wux3Q+9eGebQvCnUGwj6A+xh6EAHKpEHfFPjhQZea91wC7NVmDI33Svpi+3GUPPP5OoI
	JfZXLbrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO1cR-005KiU-0i;
	Mon, 24 Jul 2023 19:53:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO1cN-005KhP-1w;
	Mon, 24 Jul 2023 19:53:21 +0000
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:10:580::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C71586603203;
	Mon, 24 Jul 2023 20:53:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690228398;
	bh=PRkjd2dRnd+EsIcZtdobbsElZ0PbITrpELmxKRMqlKo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Mnt+n2sYU/YWGGZvargH1OGEje/HLjLt18r6XVEqBd4dZvWfIHmsbk18XE89NHhra
	 yPBslOaf3pCymMVRLJa2JEUjkitZXlmJJCzG4PhTmAFKxGuaSLVm4AF75mBl8nHBmf
	 Kl1ivsXDMwty7uprkXDqmrZG5uQE6f1LNsNjtG7/y9DR3OpcIAZQ2JTyVnj8nuqXGe
	 J/jexIdXHa1jiTSaNZYA1PKPO7EoDDt/ovo4H7wBEbGLi+wE5I+YX7I7613aOazlBk
	 pSswx//y+Ain44ezlEalmHDi0Tq6jN2ew9Z/TR61IY0sy6iKtIpT/kd8wW1qmfGpXs
	 sSHrJahrhYIAA==
Message-ID: <0c8877c39ced8e664c2901ad20fd36fbb90d9d4f.camel@collabora.com>
Subject: Re: [PATCH v2,0/3] media: mediatek: vcodec: Add driver to support
 10bit
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, =?ISO-8859-1?Q?N=EDcolas?= "F .
 R . A . Prado" <nfraprado@collabora.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>,  Mingjia Zhang
 <mingjia.zhang@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Mon, 24 Jul 2023 15:53:07 -0400
In-Reply-To: <20230722074448.30671-1-yunfei.dong@mediatek.com>
References: <20230722074448.30671-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_125319_827500_786599B8 
X-CRM114-Status: GOOD (  17.44  )
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

Hi Yunfei.

Le samedi 22 juillet 2023 =C3=A0 15:44 +0800, Yunfei Dong a =C3=A9crit=C2=
=A0:
> From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>
>=20
> Define two capture formats V4L2_PIX_FMT_MT2110R and
> V4L2_PIX_FMT_MT2110T to support 10bit in mt8195, mt8199 and more.
> Getting the size of each plane again when user space set 10bit
> syntax to driver.
>=20
> V4L2_PIX_FMT_MT2110R is used for H264, and V4L2_PIX_FMT_MT2110T
> is used for AV1/VP9/HEVC.
>=20
> patch 1 Add driver to support 10bit
> patch 2 Add capture format V4L2_PIX_FMT_MT2110T to support 10bit tile mod=
e
> patch 3 Add capture format V4L2_PIX_FMT_MT2110R to support 10bit raster m=
ode
> ---
> - compared with v1:
> - Fix set non sps return -EINVAL issue.
> - Driver test pass in mt8195/mt8188 with tast and Youtube.
> - Run v4l2 compliance in mt8195/mt8188 pass.
> - fluster test as below:
> - h264: (JVT-FR-EXT: 29/69  JVT-AVC_V1: 95/135)
> - h265: (JCT-VC-HEVC_V1: 142/147)
> - vp9 : (VP9-TEST-VECTORS: 1/6  VP9-TEST-VECTORS: 276/305)
> - av1 : (CHROMIUM-10bit-AV1-TEST-VECTORS: 22/23   CHROMIUM-8bit-AV1-TEST-=
VECTORS: 11/13
> -        AV1-TEST-VECTORS: Ran 237/239)

Thanks for the fluster reports, I cannot confirm this yet, since it does no=
t
apply. Note that you have forgot to provide V4L2 compliance report as reque=
sted.

>=20
> - send the first version v1:
> - Run 10bit VP9/AV1 fluster test pass.
> - Will return error when the 10bit parameter no correctly in function mtk=
_vdec_s_ctrl.
> ---
>=20
> Reference series:
> [1]: this series depends on v6 which is send by Yunfei Dong.
>      message-id: 20230704131349.8354-1-yunfei.dong@mediatek.com
>=20
> Mingjia Zhang (3):
>   media: mediatek: vcodec: Add capture format to support 10bit tile mode
>   media: mediatek: vcodec: Add capture format to support 10bit raster
>     mode
>   media: mediatek: vcodec: Add driver to support 10bit
>=20
>  .../media/v4l/pixfmt-reserved.rst             |  13 ++
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  |  22 ++-
>  .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   5 +
>  .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 144 +++++++++++++++++-

vcodec/decoder directory no longer exists. Can you rebase your work please =
?

Nicolas

>  drivers/media/v4l2-core/v4l2-common.c         |   4 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
>  include/uapi/linux/videodev2.h                |   2 +
>  7 files changed, 188 insertions(+), 4 deletions(-)
>=20


