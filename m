Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAEBC00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 15:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvJltvpLiATrBKptkie6qJYNCDuxsOxuJz8Eo46/CtE=; b=TXyls5Z364j4d2wVBUN2z2sNOp
	+P4Ge/ilOK1DDdOjESm2cHoSwuiZp6Vsgik9gobKvnk53b/3JgkYt8sD5Fs76TfmFe057HtWn16JW
	j1/O/Y6XZ8fTg6zhg4+wDLl/FxpCbn8ny/9ioxNCrLVtZQqByEf2q2vTYdi+D7PK0tZ1fIZy0CDSx
	btj8GcAgvMEFaRDi/MbM1olqCc0RDtgX2alNMDHlQkqao/hP/b+ozG31zw/R8642FftuvH5RXusQJ
	JKBT+2MBA++cVji+ntf2VsE7N6mjjvcrd38JTp2oZPHFWMaZP+9QMZaQSdiylAv5FoPlP7ha5SD9o
	X96G/SWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHRcC-005l0m-Ls; Fri, 29 Jul 2022 15:09:24 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHRc0-005ktT-M9; Fri, 29 Jul 2022 15:09:14 +0000
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A0E7E6601B74;
	Fri, 29 Jul 2022 16:09:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659107346;
	bh=Zu5lk7Kl9pg8ut4UYb658O2221sGO1uY27/4BJ1EJpI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ALRWAU0Dk1gyRmwutC10tNbALQXKw6pp8/2KdYMwYngVlFsnRHjW0JWAK7tEBcPWY
	 YFrmYbHAse5lIXwnpsUVwc3I6mxZ+1Idql/av/NY8vmL7W9jASsSl+KK3/gEI7wY/f
	 jqGXsChbiL3YEWJC3A6NNNIpoD15dJ3LBF/6VLOS4L2QiMkwROkmyMxdw9Znn+eNx4
	 FrFUpVQ2Dt2kcltwgWZYy9VcuIJKSA2HuqrGvNrL27kJqpS2VW41qXLVuc8eUXe50Q
	 IYneHHZKRLN1hr5WTNP7x/zBdOYd/u6fjX1ayNOd57S/rVxCJNcTtQ9mOEZ4Pdwc3y
	 O5J36eqMgoMRg==
Message-ID: <8ae4bf37a743755d046f9d0a9e8ad303c7a5041d.camel@collabora.com>
Subject: Re: [PATCH v5, 0/8] Support H264 multi-core encoder on MT8195
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Irui Wang <irui.wang@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  angelogioacchino.delregno@collabora.com, Rob
 Herring <robh+dt@kernel.org>,  Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Courbot
 <acourbot@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT
 Chen <andrew-ct.chen@mediatek.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tomasz Figa <tfiga@google.com>
Cc: Maoguang Meng <maoguang.meng@mediatek.com>, Longfei Wang
	 <longfei.wang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Fri, 29 Jul 2022 11:08:55 -0400
In-Reply-To: <20220729035129.3634-1-irui.wang@mediatek.com>
References: <20220729035129.3634-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_080913_031804_18CB3297 
X-CRM114-Status: GOOD (  20.15  )
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

Hi Irui,

Le vendredi 29 juillet 2022 =C3=A0 11:51 +0800, Irui Wang a =C3=A9crit=C2=
=A0:
> MT8195 has two H264 encoder hardware, named core0 and core1, this two
> cores can encode two input frames separately at the same time to achieve
> higher performance.

I suspect you could provide some performance numbers on that specific HW be=
fore
and after your change ? This could help integrator regarding what type of g=
ain
they can expect of back-porting this feature. This is not strictly mandator=
y
though.

>=20
> This series of patches are used to enable the two H264 encoder cores,
> the difference between encoding process before and after enable two
> cores is just like as below:
> As-Is: Synchronous
> V4L2_VIDIOC_QBUF#0 --> device_run(triger encoder) --> wait encoder IRQ
> -->
> encoding done with result --> job_finish
> V4l2_VIDIOC_QBUF#1 --> device_run(triger encoder) --> wait encoder IRQ
> -->
> encoding done with result --> job_finish
> ...
> To-Be: Asynchronous
> V4L2_VIDIOC_QBUF#0 --> device_run(triger encoder) --> job_finish
> ..V4l2_VIDIOC_QBUF#1 --> device_run(triger encoder) --> job_finish
> (venc core0 may encode done here, done the encoding result to client)
> V4L2_VIDIOC_QBUF#2 --> device_run(triger encoder) --> job_finish.
>=20
> ---
> changes compared with v4:
> - reabse to the newer linux media stage tree.
> - remove "mediatek,venc-multi-core" property since sub-device can
>   be probed by of_platform_populate api directly.
> - some modifications for patch v4's review comments.
>=20
> changes compared with v3:
> - rebase to the newer linux media stage.
> - add a capability to indicate scp firmware support multi-core.
> - probe core0 as main device, core1 as sub-device.
>=20
> changes compared with v2:
> - update venc core dt-bindings, add two new properties for current
>   usage.
> - parse venc multi_core mode from device tree.
> - rebase to the newer linux media stage.
>=20
> changes compared with v1:
> - of_platform_populate was used in place of the component framework.
> - new yaml file for venc cores.
> - some modifications for patch v1's review comments.
> ---
>=20
> Irui Wang (8):
>   dt-bindings: media: mediatek: vcodec: Adds encoder cores dt-bindings
>     for mt8195
>   media: mediatek: vcodec: Enable venc dual core usage
>   media: mediatek: vcodec: Refactor venc power manage function
>   media: mediatek: vcodec: Add more extra processing for multi-core
>     encoding
>   media: mediatek: vcodec: Add venc power on/off function
>   media: mediatek: vcodec: Refactor encoder clock on/off function
>   media: mediatek: vcodec: Add multi-core encoding process
>   media: mediatek: vcodec: Return encoding result in asynchronous mode
>=20
>  .../media/mediatek,vcodec-encoder-core.yaml   | 218 ++++++++++++++++
>  .../media/mediatek,vcodec-encoder.yaml        |   1 -
>  .../media/platform/mediatek/vcodec/Makefile   |   4 +-
>  .../platform/mediatek/vcodec/mtk_vcodec_drv.h |  28 +-
>  .../platform/mediatek/vcodec/mtk_vcodec_enc.c | 113 ++++++--
>  .../platform/mediatek/vcodec/mtk_vcodec_enc.h |  11 +-
>  .../mediatek/vcodec/mtk_vcodec_enc_drv.c      |  44 +++-
>  .../mediatek/vcodec/mtk_vcodec_enc_hw.c       | 156 +++++++++++
>  .../mediatek/vcodec/mtk_vcodec_enc_hw.h       |  34 +++
>  .../mediatek/vcodec/mtk_vcodec_enc_pm.c       | 178 +++++++++++--
>  .../mediatek/vcodec/mtk_vcodec_enc_pm.h       |  11 +-
>  .../mediatek/vcodec/mtk_vcodec_util.c         |  19 ++
>  .../mediatek/vcodec/mtk_vcodec_util.h         |   3 +
>  .../mediatek/vcodec/venc/venc_h264_if.c       | 243 ++++++++++++++----
>  .../mediatek/vcodec/venc/venc_vp8_if.c        |   3 +-
>  .../platform/mediatek/vcodec/venc_drv_if.c    |  75 ++++--
>  .../platform/mediatek/vcodec/venc_drv_if.h    |   6 +
>  .../platform/mediatek/vcodec/venc_vpu_if.c    |   9 +-
>  .../platform/mediatek/vcodec/venc_vpu_if.h    |   3 +-
>  19 files changed, 1028 insertions(+), 131 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcod=
ec-encoder-core.yaml
>  create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc=
_hw.c
>  create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc=
_hw.h
>=20


