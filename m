From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: mt7621-eth: Fix sparse warning in ethtool.c
Date: Thu, 29 Mar 2018 11:56:37 +0200
Message-ID: <20180329095637.GA16778@kroah.com>
References: <20180328211848.11085-1-cmc@babblebit.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20180328211848.11085-1-cmc@babblebit.net>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Chris Coffey <cmc@babblebit.net>
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, NeilBrown <neil@brown.name>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, Mar 28, 2018 at 10:18:48PM +0100, Chris Coffey wrote:
> Include the local ethtool.h header file in mtk_eth_soc.h so
> implementation files have centralized access to it.
> 
> This fixes the following sparse warning:
> 
> drivers/staging/mt7621-eth/ethtool.c:213:6: warning: symbol
> 'mtk_set_ethtool_ops' was not declared. Should it be static?
> 
> Signed-off-by: Chris Coffey <cmc@babblebit.net>
> ---
>  drivers/staging/mt7621-eth/mtk_eth_soc.c | 1 -
>  drivers/staging/mt7621-eth/mtk_eth_soc.h | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/mt7621-eth/mtk_eth_soc.c b/drivers/staging/mt7621-eth/mtk_eth_soc.c
> index cbc7339843..0574e71573 100644
> --- a/drivers/staging/mt7621-eth/mtk_eth_soc.c
> +++ b/drivers/staging/mt7621-eth/mtk_eth_soc.c
> @@ -35,7 +35,6 @@
>  
>  #include "mtk_eth_soc.h"
>  #include "mdio.h"
> -#include "ethtool.h"

How about just moving ethtool.h above the mtk_eth_soc.h include?

Putting .h file dependancies in other .h files is generally not a good
idea if at all possible.  Keeping them "clean" is better, and this
driver has a bunch of work to go there, so let's not make it worse :)

thanks,

greg k-h
