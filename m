Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C019FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 22:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rO++eh06RfvOULD/MkcKiamjr7fSDk61HKvQkq+XD7g=; b=jUo2RLU6hDKvST
	t9I6ieDaqteooUDPdDSScJv2BlS/6eLBJVGaxxEz4zY393FJZ5CEOoz7xBycB9MHy+8aMbKw01aCi
	WEn47BfoKSfYdO/mendFp34kr5MhuBp4XDzLxU7Vld2Yl2fH74R93LS1hKz8KxEtKpZiH1kdvDHRB
	1xoHwmxCcbQYTmc2WhFuSmBCtjniNfLaB/e/cQwqBmoXAno2MKmU64mJBQlgtqauTKPfzdQVo0htc
	US5IS6X6jcMRXEGo/vuMp02b39Reza30DknlK+tA3u6Nb/dIH+p1V1TMeG+TjppLr51t5QSFxcbUJ
	iHyQ+Pc4yI59jsv/96dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmjqJ-000OFI-Ne; Thu, 05 May 2022 22:21:03 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmjq9-000OAV-3f; Thu, 05 May 2022 22:20:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 795391F40EB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651789245;
 bh=IqgWrsQ7M1kiyWJK+KEWncQxxmyl40O17cMv2BeJAZM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WINl7o4+WequxxSytUZt4txWZtOiVzMn8Oe/yw0ywq6gSVx8l6UxrDz3v0PpGlt6h
 UDitxFADuW19fZXUk/LzhWjSZwChusaokfIOVdXRSsgUprvXqPj9+sN1EJwgxueAdc
 OukGQCfmhJINyB7ZUJpneAtEaNF4dvpH2QC+lL3rXrSsUBosL08zBz6cPUdHd8p4xd
 cT2/UstKbK9OqDqqMn0QtVP/CaD8SkagtmZzuD+Mb1LTLangCsE9DGEfHyxdj/TD2+
 5x5tU/6u3gd7b7E/O12Lbkbb8xJmSvT4QwhrRHN8g7lusGir0xHHUoKh6HMYy/9lO4
 kOrFUb8fajxWQ==
Date: Thu, 5 May 2022 18:20:34 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>,
 George Sun <george.sun@mediatek.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v10, 16/17] media: mediatek: vcodec: support stateless
 VP9 decoding
Message-ID: <20220505222034.fxw6y7wdf7wy3qi4@notapiano>
References: <20220426100828.13429-1-yunfei.dong@mediatek.com>
 <20220426100828.13429-17-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220426100828.13429-17-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_152053_308111_667DE508 
X-CRM114-Status: GOOD (  12.71  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Apr 26, 2022 at 06:08:27PM +0800, Yunfei Dong wrote:
> Add support for VP9 decoding using the stateless API,
> as supported by MT8192. And the drivers is lat and core architecture.
> =

> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Signed-off-by: George Sun <george.sun@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
>  .../media/platform/mediatek/vcodec/Makefile   |    1 +
>  .../vcodec/mtk_vcodec_dec_stateless.c         |   26 +-
>  .../platform/mediatek/vcodec/mtk_vcodec_drv.h |    1 +
>  .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 2031 +++++++++++++++++
>  .../platform/mediatek/vcodec/vdec_drv_if.c    |    4 +
>  .../platform/mediatek/vcodec/vdec_drv_if.h    |    1 +
>  6 files changed, 2061 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_=
req_lat_if.c
> =


...

> +		use_128 =3D !frame_is_intra && !vsi->frame.uh.last_frame_type;
> +		v4l2_vp9_adapt_coef_probs(pre_frame_ctx_helper,
> +					  counts_helper,
> +					  use_128,
> +					  frame_is_intra);

Hi Yunfei,

I'm getting

ERROR: modpost: "v4l2_vp9_adapt_noncoef_probs" [drivers/media/platform/medi=
atek/vcodec/mtk-vcodec-dec.ko] undefined!
ERROR: modpost: "v4l2_vp9_adapt_coef_probs" [drivers/media/platform/mediate=
k/vcodec/mtk-vcodec-dec.ko] undefined!

when building this series.

Adding
	select V4L2_VP9
to
	config VIDEO_MEDIATEK_VCODEC
solved the issue.

Thanks,
N=EDcolas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
