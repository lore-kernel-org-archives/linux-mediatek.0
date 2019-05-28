From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [RFCv1 07/12] media: mtk-vcodec: abstract firmware interface
Date: Tue, 28 May 2019 11:10:05 +0200
Message-ID: <1bfc3919-d0a4-c156-a23d-694d3ba65671@xs4all.nl>
References: <20190528055635.12109-1-acourbot@chromium.org>
 <20190528055635.12109-8-acourbot@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528055635.12109-8-acourbot@chromium.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On 5/28/19 7:56 AM, Alexandre Courbot wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.com>
> 
> MT8183's codec firwmare is run by a different remote processor from
> MT8173. While the firmware interface is basically the same, the way to
> invoke it differs. Abstract all firmware calls under a layer that will
> allow us to handle both firmware types transparently.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> [acourbot: refactor, cleanup and split]
> ---
>  drivers/media/platform/mtk-vcodec/Makefile    |   4 +-
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  47 ++----
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |   1 -
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   5 +-
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  46 ++---
>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |   2 -
>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 157 ++++++++++++++++++
>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |  36 ++++
>  .../platform/mtk-vcodec/mtk_vcodec_util.c     |   1 -
>  .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |   1 -
>  .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |   1 -
>  .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |   1 -
>  .../media/platform/mtk-vcodec/vdec_drv_base.h |   2 -
>  .../media/platform/mtk-vcodec/vdec_drv_if.c   |   1 -
>  .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  10 +-
>  .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  11 +-
>  .../platform/mtk-vcodec/venc/venc_h264_if.c   |  15 +-
>  .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   8 +-
>  .../media/platform/mtk-vcodec/venc_drv_if.c   |   1 -
>  .../media/platform/mtk-vcodec/venc_vpu_if.c   |  15 +-
>  .../media/platform/mtk-vcodec/venc_vpu_if.h   |   5 +-
>  21 files changed, 270 insertions(+), 100 deletions(-)
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
> 

<snip>

> +EXPORT_SYMBOL(mtk_vcodec_fw_select);
> +
> +int mtk_vcodec_fw_load_firmware(struct mtk_vcodec_fw *fw)
> +{
> +	return fw->ops->load_firmware(fw);
> +}
> +EXPORT_SYMBOL(mtk_vcodec_fw_load_firmware);
> +
> +unsigned int mtk_vcodec_fw_get_vdec_capa(struct mtk_vcodec_fw *fw)
> +{
> +	return fw->ops->get_vdec_capa(fw);
> +}
> +EXPORT_SYMBOL(mtk_vcodec_fw_get_vdec_capa);
> +
> +unsigned int mtk_vcodec_fw_get_venc_capa(struct mtk_vcodec_fw *fw)
> +{
> +	return fw->ops->get_venc_capa(fw);
> +}
> +EXPORT_SYMBOL(mtk_vcodec_fw_get_venc_capa);
> +
> +void *mtk_vcodec_fw_map_dm_addr(struct mtk_vcodec_fw *fw, u32 mem_addr)
> +{
> +	return fw->ops->map_dm_addr(fw, mem_addr);
> +}
> +EXPORT_SYMBOL(mtk_vcodec_fw_map_dm_addr);
> +
> +int mtk_vcodec_fw_ipi_register(struct mtk_vcodec_fw *fw, int id,
> +	mtk_vcodec_ipi_handler handler, const char *name, void *priv)
> +{
> +	return fw->ops->ipi_register(fw, id, handler, name, priv);
> +}
> +EXPORT_SYMBOL(mtk_vcodec_fw_ipi_register);

I recommend using EXPORT_SYMBOL_GPL instead.

Regards,

	Hans
