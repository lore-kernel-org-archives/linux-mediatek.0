From: Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH] soc: Allow test-building of MediaTek drivers
Date: Mon, 16 Oct 2017 15:31:59 +0800
Message-ID: <1508139119.21840.47.camel@mtkswgap22>
References: <20171005111743.6367f128@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171005111743.6367f128@endymion>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jean Delvare <jdelvare@suse.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, 2017-10-05 at 11:17 +0200, Jean Delvare wrote:
> The COMPILE_TEST alternative dependency allows test-building the
> drivers but only as long as the build system itself will look into
> the directory where the drivers reside.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Sean Wang <sean.wang@mediatek.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>

Acked-by: Sean Wang <sean.wang@mediatek.com>

> ---
>  drivers/soc/Makefile |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-4.14-rc3.orig/drivers/soc/Makefile	2017-09-17 00:47:51.000000000 +0200
> +++ linux-4.14-rc3/drivers/soc/Makefile	2017-10-05 09:44:01.478589469 +0200
> @@ -10,7 +10,7 @@ obj-$(CONFIG_MACH_DOVE)		+= dove/
>  obj-y				+= fsl/
>  obj-$(CONFIG_ARCH_MXC)		+= imx/
>  obj-$(CONFIG_SOC_XWAY)		+= lantiq/
> -obj-$(CONFIG_ARCH_MEDIATEK)	+= mediatek/
> +obj-y				+= mediatek/
>  obj-$(CONFIG_ARCH_MESON)	+= amlogic/
>  obj-$(CONFIG_ARCH_QCOM)		+= qcom/
>  obj-y				+= renesas/
> 
> 
