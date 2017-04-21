From: Tiffany Lin <tiffany.lin@mediatek.com>
Subject: Re: [PATCH] [media] mtk-vcodec: avoid warnings because of empty macros
Date: Fri, 21 Apr 2017 15:50:35 +0800
Message-ID: <1492761035.12924.0.camel@mtksdaap41>
References: <5bc3ebc3c6f57c2b30126f113bc35ec95c6f5b5d.1492599391.git.mchehab@s-opensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5bc3ebc3c6f57c2b30126f113bc35ec95c6f5b5d.1492599391.git.mchehab@s-opensource.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2017-04-19 at 07:56 -0300, Mauro Carvalho Chehab wrote:
> Remove those gcc warnings:
> 
> 	drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c: In function 'mtk_vcodec_dec_pw_on':
> 	drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c:114:51: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
> 	   mtk_v4l2_err("pm_runtime_get_sync fail %d", ret);
> 	                                                   ^
> 
> By adding braces.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
> index 12480837ff2e..237e144c194f 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
> @@ -66,15 +66,15 @@ extern bool mtk_vcodec_dbg;
>  
>  #else
>  
> -#define mtk_v4l2_debug(level, fmt, args...)
> -#define mtk_v4l2_err(fmt, args...)
> -#define mtk_v4l2_debug_enter()
> -#define mtk_v4l2_debug_leave()
> +#define mtk_v4l2_debug(level, fmt, args...) {}
> +#define mtk_v4l2_err(fmt, args...) {}
> +#define mtk_v4l2_debug_enter() {}
> +#define mtk_v4l2_debug_leave() {}
>  
> -#define mtk_vcodec_debug(h, fmt, args...)
> -#define mtk_vcodec_err(h, fmt, args...)
> -#define mtk_vcodec_debug_enter(h)
> -#define mtk_vcodec_debug_leave(h)
> +#define mtk_vcodec_debug(h, fmt, args...) {}
> +#define mtk_vcodec_err(h, fmt, args...) {}
> +#define mtk_vcodec_debug_enter(h) {}
> +#define mtk_vcodec_debug_leave(h) {}
>  
>  #endif
>  

Acked-by: Tiffany Lin <Tiffany.lin@mediatek.com>
