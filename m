From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH -next] usb: mtu3: fix dbginfo in qmu_tx_zlp_error_handler
Date: Fri, 7 Dec 2018 13:17:45 +0800
Message-ID: <1544159865.32173.116.camel@mhfsdcap03>
References: <1544154763-156094-1-git-send-email-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1544154763-156094-1-git-send-email-yuehaibing@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: YueHaibing <yuehaibing@huawei.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi Haibing,

On Fri, 2018-12-07 at 03:52 +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/usb/mtu3/mtu3_qmu.c: In function 'qmu_tx_zlp_error_handler':
> drivers/usb/mtu3/mtu3_qmu.c:385:22: warning:
>  variable 'req' set but not used [-Wunused-but-set-variable]
> 
> It seems dbginfo original intention is print 'req' other than 'mreq'
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/usb/mtu3/mtu3_qmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_qmu.c b/drivers/usb/mtu3/mtu3_qmu.c
> index 73ac042..09f19f7 100644
> --- a/drivers/usb/mtu3/mtu3_qmu.c
> +++ b/drivers/usb/mtu3/mtu3_qmu.c
> @@ -402,7 +402,7 @@ static void qmu_tx_zlp_error_handler(struct mtu3 *mtu, u8 epnum)
>  		return;
>  	}
>  
> -	dev_dbg(mtu->dev, "%s send ZLP for req=%p\n", __func__, mreq);
> +	dev_dbg(mtu->dev, "%s send ZLP for req=%p\n", __func__, req);
>  
>  	mtu3_clrbits(mbase, MU3D_EP_TXCR0(mep->epnum), TX_DMAREQEN);
> 
Acked-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks a lot
> 
> 
