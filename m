From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [RESEND PATCH v2] media: v4l2-compat-ioctl32: fix missing length
 copy in put_v4l2_buffer32
Date: Fri, 15 Jan 2016 09:33:59 +0100
Message-ID: <5698AEF7.5090003@xs4all.nl>
References: <1452828517-57392-1-git-send-email-tiffany.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1452828517-57392-1-git-send-email-tiffany.lin@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
To: Tiffany Lin <tiffany.lin@mediatek.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 01/15/2016 04:28 AM, Tiffany Lin wrote:
> In v4l2-compliance utility, test QUERYBUF required correct length
> value to go through each planar to check planar's length in
> multi-planar buffer type
> 
> Signed-off-by: Tiffany Lin <tiffany.lin@mediatek.com>
> ---
> Remove "Change-Id: I98faddc5711c24f17beda52e6d18c657add251ac"
> ---
> 
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> index 327e83a..6c01920 100644
> --- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> +++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> @@ -516,6 +516,9 @@ static int put_v4l2_buffer32(struct v4l2_buffer *kp, struct v4l2_buffer32 __user
>  		put_user(kp->reserved, &up->reserved))
>  			return -EFAULT;
>  
> +	if (put_user(kp->length, &up->length))
> +		return -EFAULT;
> +

This should also be done for get_v4l2_buffer32, and the other places where
length is used in put/get_user() can now be removed.

Regards,

	Hans

>  	if (V4L2_TYPE_IS_MULTIPLANAR(kp->type)) {
>  		num_planes = kp->length;
>  		if (num_planes == 0)
> 
