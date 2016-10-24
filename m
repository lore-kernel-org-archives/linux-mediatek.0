From: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
Subject: Re: [PATCH 2/4] mtk_mdp_vpu: remove a double unlock at the error
 path
Date: Mon, 24 Oct 2016 19:59:10 +0800
Message-ID: <1477310350.12745.1.camel@mtksdaap41>
References: <cd14afdb178cf490e257368bc899c7a0c690d140.1477058332.git.mchehab@s-opensource.com>
         <768767961c64dea3fdd86132c9eba87ae652d588.1477058332.git.mchehab@s-opensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <768767961c64dea3fdd86132c9eba87ae652d588.1477058332.git.mchehab@s-opensource.com>
Sender: linux-media-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2016-10-21 at 11:59 -0200, Mauro Carvalho Chehab wrote:
> As warned by smatch:
> 	drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c:98 mtk_mdp_vpu_send_msg() error: double unlock 'mutex:&ctx->mdp_dev->vpulock'
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> ---
>  drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c b/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c
> index b38d29e99f7a..5c8caa864e32 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c
> @@ -91,7 +91,6 @@ static int mtk_mdp_vpu_send_msg(void *msg, int len, struct mtk_mdp_vpu *vpu,
>  	mutex_lock(&ctx->mdp_dev->vpulock);
>  	err = vpu_ipi_send(vpu->pdev, (enum ipi_id)id, msg, len);
>  	if (err) {
> -		mutex_unlock(&ctx->mdp_dev->vpulock);

Hi Mauro,

It has been fixed by Hans in the later patch.

Author: Hans Verkuil <hverkuil@xs4all.nl>
Date:   Mon Sep 19 05:00:34 2016 -0300

    [media] mtk-mdp: fix double mutex_unlock

    Fix smatch error:

    media-git/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c:100
mtk_mdp_vpu_send_msg() error: double unlock 'mutex:&ctx->

    Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
    Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>



minghsiu

>  		dev_err(&ctx->mdp_dev->pdev->dev,
>  			"vpu_ipi_send fail status %d\n", err);
>  	}
