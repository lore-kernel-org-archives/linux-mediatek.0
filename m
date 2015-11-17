From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RESEND] phy: core: Get a refcount to phy in
 devm_of_phy_get_by_index()
Date: Tue, 17 Nov 2015 14:00:26 +0800
Message-ID: <20151117140026.270a408e@xhacker>
References: <1447739808-29472-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1447739808-29472-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arun Ramamurthy <arun.ramamurthy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi,

On Tue, 17 Nov 2015 13:56:48 +0800
Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:

> On driver detach, devm_phy_release() will put a refcount to
> the phy, so gets a refconut to it before return.
> 
> Change-Id: I56fe428bf945f19c38d56245978c8ca17340eb2c

This line need to be removed



> Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/phy/phy-core.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index fc48fac..8c7f27d 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -636,8 +636,9 @@ EXPORT_SYMBOL_GPL(devm_of_phy_get);
>   * @np: node containing the phy
>   * @index: index of the phy
>   *
> - * Gets the phy using _of_phy_get(), and associates a device with it using
> - * devres. On driver detach, release function is invoked on the devres data,
> + * Gets the phy using _of_phy_get(), then gets a refcount to it,
> + * and associates a device with it using devres. On driver detach,
> + * release function is invoked on the devres data,
>   * then, devres data is freed.
>   *
>   */
> @@ -651,13 +652,21 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
>  		return ERR_PTR(-ENOMEM);
>  
>  	phy = _of_phy_get(np, index);
> -	if (!IS_ERR(phy)) {
> -		*ptr = phy;
> -		devres_add(dev, ptr);
> -	} else {
> +	if (IS_ERR(phy)) {
>  		devres_free(ptr);
> +		return phy;
>  	}
>  
> +	if (!try_module_get(phy->ops->owner)) {
> +		devres_free(ptr);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	get_device(&phy->dev);
> +
> +	*ptr = phy;
> +	devres_add(dev, ptr);
> +
>  	return phy;
>  }
>  EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
