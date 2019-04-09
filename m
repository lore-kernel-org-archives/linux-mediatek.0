From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH 03/14] [media] mtk-mipicsi: add color format support for
 mt2712
Date: Tue, 9 Apr 2019 14:18:29 +0800
Message-ID: <1554790709.10331.6.camel@mtksdaap41>
References: <1554724505-19882-1-git-send-email-stu.hsieh@mediatek.com>
 <1554724505-19882-4-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1554724505-19882-4-git-send-email-stu.hsieh@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stu Hsieh <stu.hsieh@mediatek.com>
Cc: srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Hi, Stu:

On Mon, 2019-04-08 at 19:54 +0800, Stu Hsieh wrote:
> This patch add color format support for mt2712

Without this patch, I think this driver still support these color
format. In this patch, you just check for the non-supported color
format.

> 
> Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
> ---
>  .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
> index a5ed720df900..ccf2d18a3e74 100644
> --- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
> +++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
> @@ -139,6 +139,25 @@ static void mtk_mipicsi_remove_device(struct soc_camera_device *icd)
>  	(void)pm_runtime_put_sync(icd->parent);
>  }
>  
> +static bool is_supported(struct soc_camera_device *icd, const u32 pixformat)

icd is useless, so remove it.

> +{
> +	bool ret = false;
> +
> +	switch (pixformat) {
> +	/* YUV422 */
> +	case V4L2_PIX_FMT_YUYV:
> +	case V4L2_PIX_FMT_UYVY:
> +	case V4L2_PIX_FMT_YVYU:
> +	case V4L2_PIX_FMT_VYUY:
> +		ret = true;

You could just return true.

> +		break;
> +	default:
> +		break;

You don't need the 'default' part.

> +	}
> +
> +	return ret;

You could just return false.

Regards,
CK

> +}
> +
>  static int mtk_mipicsi_set_fmt(struct soc_camera_device *icd,
>  				struct v4l2_format *f)
>  {
> @@ -154,6 +173,12 @@ static int mtk_mipicsi_set_fmt(struct soc_camera_device *icd,
>  	struct v4l2_mbus_framefmt *mf = &format.format;
>  	int ret = 0;
>  
> +	if (!is_supported(icd, pix->pixelformat)) {
> +		dev_err(dev, "Format %x not support. set V4L2_PIX_FMT_YUYV as default\n",
> +			pix->pixelformat);
> +		pix->pixelformat = V4L2_PIX_FMT_YUYV;
> +	}
> +
>  	xlate = soc_camera_xlate_by_fourcc(icd, pix->pixelformat);
>  	if (xlate == NULL) {
>  		dev_err(dev, "Format 0x%x not found\n", pix->pixelformat);
