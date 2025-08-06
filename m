Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29261C87FD3
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Aug 2025 12:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKGDRsqFgvk2YU3exuaMI1xuCkXUmQU/g9XtAmSq1/M=; b=QMmldZPZhnWNcS3P3X1R4sH32L
	b26XTikuzlOqPpWBZCPM6ujYzEQ0nG5HJBnf8F0xsbnzbeWulKlz274U0PObeqTdZb1I4s9IDqXW0
	fOK+Jxw4IG/5Fhzk5r7PlSHXUfoNJw+j9CurXzYkFOwDXyzaf9SicTz2sNFMafRczw1KjoutuVUvJ
	7AIYRZhynCBo6R+cDHZyEPncocZXw9Sh6uyxh7Eb4XqhI25zOq9xZGXCrlfcPkt8Ly5hEOvlr57CJ
	1EbBhKzu0Uhdc5/j+1j1E2uaUEe04WUgkcvQ/VvPelZhoaEI0SCyVnGC7pAuoofqCUWRSJbzykS1z
	9zR/a1rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujdXy-0000000FCVG-1cB6;
	Wed, 06 Aug 2025 12:47:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujdWT-0000000FCDb-2NGJ;
	Wed, 06 Aug 2025 12:45:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F522601FA;
	Wed,  6 Aug 2025 12:45:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4AAC4CEE7;
	Wed,  6 Aug 2025 12:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754484336;
	bh=vrDmqWuCtRp3CsCvQLuDwTzU8RUf2CvrKumyU6zb3Ok=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=piY2QrqAz8Re20EZatq7znUbw5pHCiVHNr0AmhNRPE0MDM10HmfpdWd02d9i8tbdW
	 E75PTNGi/w0FYgFIJnvX/BXnS/SvXPyQ9seXxkOyOZ7zJ0aOfRRVdb4s/IB6OlYGWX
	 eGzXx+834KiDOoCU+8nK8fwVzqTKOTwSyOvq/we5j7dBgmFBvFnhVcaikg4QxsG3Ow
	 eNHI0m7J7krY4D/AW4W0Ic/ki873otG6+qi8XZAxpJKL+nl6ve+/h5UhD3smasksSI
	 31GfEPq8TJIP3QV/nzR3fqXJ0rFvGtrMjgIfsvva9ewHG8nil9RVHiEcnK1j0r7efu
	 ou/p/iGbORZsA==
Message-ID: <e9aaf929-5e0d-4379-996b-a564acd3e331@kernel.org>
Date: Wed, 6 Aug 2025 14:45:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 27/65] media: Reset file->private_data to NULL in
 v4l2_fh_del()
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Devarsh Thakkar
 <devarsht@ti.com>, Benoit Parrot <bparrot@ti.com>,
 Hans Verkuil <hverkuil@kernel.org>, Mike Isely <isely@pobox.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
 Christian Gromm <christian.gromm@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Shi
 <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
 Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Andy Walls <awalls@md.metrocast.net>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, Ming Qian <ming.qian@nxp.com>,
 Zhou Peng <eagle.zhou@nxp.com>, Xavier Roumegue
 <xavier.roumegue@oss.nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nas Chung <nas.chung@chipsnmedia.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Steve Longerbeam <slongerbeam@gmail.com>, Maxime Ripard
 <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mjpeg-users@lists.sourceforge.net
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-27-eb140ddd6a9d@ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20250802-media-private-data-v1-27-eb140ddd6a9d@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 02/08/2025 11:22, Jacopo Mondi wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Multiple drivers that use v4l2_fh and call v4l2_fh_del() manually reset
> the file->private_data pointer to NULL in their video device .release()
> file operation handler. Move the code to the v4l2_fh_del() function to
> avoid direct access to file->private_data in drivers. This requires
> adding a file pointer argument to the function.
> 
> Changes to drivers have been generated with the following coccinelle
> semantic patch:
> 
> @@
> expression fh;
> identifier filp;
> identifier release;
> type ret;
> @@
> ret release(..., struct file *filp, ...)
> {
> 	<...
> -	filp->private_data = NULL;
> 	...
> -	v4l2_fh_del(fh);
> +	v4l2_fh_del(fh, filp);
> 	...>
> }
> 
> @@
> expression fh;
> identifier filp;
> identifier release;
> type ret;
> @@
> ret release(..., struct file *filp, ...)
> {
> 	<...
> -	v4l2_fh_del(fh);
> +	v4l2_fh_del(fh, filp);
> 	...
> -	filp->private_data = NULL;
> 	...>
> }
> 
> @@
> expression fh;
> identifier filp;
> identifier release;
> type ret;
> @@
> ret release(..., struct file *filp, ...)
> {
> 	<...
> -	v4l2_fh_del(fh);
> +	v4l2_fh_del(fh, filp);
> 	...>
> }
> 
> Manual changes have been applied to Documentation/ to update the usage
> patterns, to drivers/media/v4l2-core/v4l2-fh.c to update the
> v4l2_fh_del() prototype and reset file->private_data, and to
> include/media/v4l2-fh.h to update the v4l2_fh_del() function prototype
> and its documentation.
> 
> Additionally, white space issues have been fixed manually in
> drivers/usb/gadget/function/uvc_v4l2.c
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  Documentation/driver-api/media/v4l2-fh.rst                         | 4 ++--
>  Documentation/translations/zh_CN/video4linux/v4l2-framework.txt    | 4 ++--
>  drivers/media/pci/cx18/cx18-fileops.c                              | 4 ++--
>  drivers/media/pci/ivtv/ivtv-fileops.c                              | 4 ++--
>  drivers/media/pci/saa7164/saa7164-encoder.c                        | 2 +-
>  drivers/media/pci/saa7164/saa7164-vbi.c                            | 2 +-
>  drivers/media/platform/allegro-dvt/allegro-core.c                  | 2 +-
>  drivers/media/platform/amlogic/meson-ge2d/ge2d.c                   | 2 +-
>  drivers/media/platform/amphion/vpu_v4l2.c                          | 4 ++--
>  drivers/media/platform/chips-media/coda/coda-common.c              | 4 ++--
>  drivers/media/platform/chips-media/wave5/wave5-helper.c            | 2 +-
>  drivers/media/platform/imagination/e5010-jpeg-enc.c                | 4 ++--
>  drivers/media/platform/m2m-deinterlace.c                           | 2 +-
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c               | 4 ++--
>  drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c                  | 4 ++--
>  drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c                | 4 ++--
>  .../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c    | 4 ++--
>  .../media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c    | 4 ++--
>  drivers/media/platform/nvidia/tegra-vde/v4l2.c                     | 2 +-
>  drivers/media/platform/nxp/dw100/dw100.c                           | 2 +-
>  drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c                     | 4 ++--
>  drivers/media/platform/nxp/imx-pxp.c                               | 2 +-
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c                 | 2 +-
>  drivers/media/platform/nxp/mx2_emmaprp.c                           | 2 +-
>  drivers/media/platform/qcom/iris/iris_vidc.c                       | 3 +--
>  drivers/media/platform/qcom/venus/core.c                           | 2 +-
>  drivers/media/platform/renesas/rcar_fdp1.c                         | 2 +-
>  drivers/media/platform/renesas/rcar_jpu.c                          | 4 ++--
>  drivers/media/platform/renesas/vsp1/vsp1_video.c                   | 2 +-
>  drivers/media/platform/rockchip/rga/rga.c                          | 2 +-
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c                    | 2 +-
>  drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c                | 4 ++--
>  drivers/media/platform/samsung/exynos4-is/fimc-m2m.c               | 4 ++--
>  drivers/media/platform/samsung/s5p-g2d/g2d.c                       | 2 +-
>  drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c                | 4 ++--
>  drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c                   | 4 ++--
>  drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c                   | 4 ++--
>  drivers/media/platform/st/sti/delta/delta-v4l2.c                   | 4 ++--
>  drivers/media/platform/st/sti/hva/hva-v4l2.c                       | 4 ++--
>  drivers/media/platform/st/stm32/dma2d/dma2d.c                      | 2 +-
>  drivers/media/platform/sunxi/sun8i-di/sun8i-di.c                   | 2 +-
>  drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c           | 2 +-
>  drivers/media/platform/ti/omap3isp/ispvideo.c                      | 5 ++---
>  drivers/media/platform/ti/vpe/vpe.c                                | 2 +-
>  drivers/media/platform/verisilicon/hantro_drv.c                    | 4 ++--
>  drivers/media/test-drivers/vicodec/vicodec-core.c                  | 2 +-
>  drivers/media/test-drivers/vim2m.c                                 | 2 +-
>  drivers/media/test-drivers/visl/visl-core.c                        | 2 +-
>  drivers/media/usb/pvrusb2/pvrusb2-v4l2.c                           | 3 +--
>  drivers/media/v4l2-core/v4l2-fh.c                                  | 7 ++++---
>  drivers/media/v4l2-core/v4l2-subdev.c                              | 5 ++---
>  drivers/staging/media/imx/imx-media-csc-scaler.c                   | 4 ++--
>  drivers/staging/media/meson/vdec/vdec.c                            | 2 +-
>  drivers/staging/media/sunxi/cedrus/cedrus.c                        | 2 +-
>  drivers/staging/most/video/video.c                                 | 4 ++--
>  drivers/usb/gadget/function/uvc_v4l2.c                             | 3 +--
>  include/media/v4l2-fh.h                                            | 5 ++++-
>  57 files changed, 89 insertions(+), 90 deletions(-)
> 

<snip>

> diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
> index b59b1084d8cdf1b62da12879e21dbe56c2109648..df3ba9d4674bd25626cfcddc2d0cb28c233e3cc3 100644
> --- a/drivers/media/v4l2-core/v4l2-fh.c
> +++ b/drivers/media/v4l2-core/v4l2-fh.c
> @@ -67,7 +67,7 @@ int v4l2_fh_open(struct file *filp)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fh_open);
>  
> -void v4l2_fh_del(struct v4l2_fh *fh)
> +void v4l2_fh_del(struct v4l2_fh *fh, struct file *filp)

Instead of adding a second argument, perhaps it is better to
just provide the filp pointer. After all, you can get the v4l2_fh
from filp->private_data.

It simplifies the code a bit.

Regards,

	Hans

>  {
>  	unsigned long flags;
>  
> @@ -75,6 +75,8 @@ void v4l2_fh_del(struct v4l2_fh *fh)
>  	list_del_init(&fh->list);
>  	spin_unlock_irqrestore(&fh->vdev->fh_lock, flags);
>  	v4l2_prio_close(fh->vdev->prio, fh->prio);
> +
> +	filp->private_data = NULL;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fh_del);
>  
> @@ -94,10 +96,9 @@ int v4l2_fh_release(struct file *filp)
>  	struct v4l2_fh *fh = file_to_v4l2_fh(filp);
>  
>  	if (fh) {
> -		v4l2_fh_del(fh);
> +		v4l2_fh_del(fh, filp);
>  		v4l2_fh_exit(fh);
>  		kfree(fh);
> -		filp->private_data = NULL;
>  	}
>  	return 0;
>  }

<snip>

> diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
> index d8fcf49f10e09452b73499f4a9bd1285bc2835a5..5e4c761635120608e0b588e0b0daf63e69588d38 100644
> --- a/include/media/v4l2-fh.h
> +++ b/include/media/v4l2-fh.h
> @@ -114,12 +114,15 @@ int v4l2_fh_open(struct file *filp);
>   * v4l2_fh_del - Remove file handle from the list of file handles.
>   *
>   * @fh: pointer to &struct v4l2_fh
> + * @filp: pointer to &struct file associated with @fh
> + *
> + * The function resets filp->private_data to NULL.
>   *
>   * .. note::
>   *    Must be called in v4l2_file_operations->release\(\) handler if the driver
>   *    uses &struct v4l2_fh.
>   */
> -void v4l2_fh_del(struct v4l2_fh *fh);
> +void v4l2_fh_del(struct v4l2_fh *fh, struct file *filp);
>  
>  /**
>   * v4l2_fh_exit - Release resources related to a file handle.
> 


