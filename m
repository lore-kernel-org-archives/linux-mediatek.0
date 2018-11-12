From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v2 3/5] phy: ocelot-serdes: convert to use eth phy mode
 and submode
Date: Mon, 12 Nov 2018 16:12:38 +0530
Message-ID: <7fbbaae0-6c6d-a813-109c-15c45e20555e@ti.com>
References: <20181109234755.21687-1-grygorii.strashko@ti.com>
 <20181109234755.21687-4-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181109234755.21687-4-grygorii.strashko@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>, "David S. Miller" <davem@davemloft.net>, Russell King - ARM Linux <linux@armlinux.org.uk>, Quentin Schulz <quentin.schulz@bootlin.com>
Cc: netdev@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Vivek Gautam <vivek.gautam@codeaurora.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Carlo Caione <carlo@caione.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Manu Gautam <mgautam@codeaurora.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: linux-mediatek@lists.infradead.org

Hi Quentin, David Miller

Need your ACK on this patch.

Thanks
Kishon

On 10/11/18 5:17 AM, Grygorii Strashko wrote:
> Convert ocelot-serdes PHY driver to use recently introduced
> PHY_MODE_ETHERNET and phy_set_mode_ext().
> 
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
>  drivers/net/ethernet/mscc/ocelot.c   |  9 ++-------
>  drivers/phy/mscc/phy-ocelot-serdes.c | 14 ++++++++++----
>  2 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mscc/ocelot.c b/drivers/net/ethernet/mscc/ocelot.c
> index 3238b9e..3edb608 100644
> --- a/drivers/net/ethernet/mscc/ocelot.c
> +++ b/drivers/net/ethernet/mscc/ocelot.c
> @@ -472,7 +472,6 @@ static int ocelot_port_open(struct net_device *dev)
>  {
>  	struct ocelot_port *port = netdev_priv(dev);
>  	struct ocelot *ocelot = port->ocelot;
> -	enum phy_mode phy_mode;
>  	int err;
>  
>  	/* Enable receiving frames on the port, and activate auto-learning of
> @@ -484,12 +483,8 @@ static int ocelot_port_open(struct net_device *dev)
>  			 ANA_PORT_PORT_CFG, port->chip_port);
>  
>  	if (port->serdes) {
> -		if (port->phy_mode == PHY_INTERFACE_MODE_SGMII)
> -			phy_mode = PHY_MODE_SGMII;
> -		else
> -			phy_mode = PHY_MODE_QSGMII;
> -
> -		err = phy_set_mode(port->serdes, phy_mode);
> +		err = phy_set_mode_ext(port->serdes, PHY_MODE_ETHERNET,
> +				       port->phy_mode);
>  		if (err) {
>  			netdev_err(dev, "Could not set mode of SerDes\n");
>  			return err;
> diff --git a/drivers/phy/mscc/phy-ocelot-serdes.c b/drivers/phy/mscc/phy-ocelot-serdes.c
> index c61a9890..f525a21 100644
> --- a/drivers/phy/mscc/phy-ocelot-serdes.c
> +++ b/drivers/phy/mscc/phy-ocelot-serdes.c
> @@ -11,6 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> +#include <linux/phy.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> @@ -116,8 +117,10 @@ struct serdes_mux {
>  	.mux = _mux,						\
>  }
>  
> -#define SERDES_MUX_SGMII(i, p, m, c) SERDES_MUX(i, p, PHY_MODE_SGMII, m, c)
> -#define SERDES_MUX_QSGMII(i, p, m, c) SERDES_MUX(i, p, PHY_MODE_QSGMII, m, c)
> +#define SERDES_MUX_SGMII(i, p, m, c) \
> +	SERDES_MUX(i, p, PHY_INTERFACE_MODE_SGMII, m, c)
> +#define SERDES_MUX_QSGMII(i, p, m, c) \
> +	SERDES_MUX(i, p, PHY_INTERFACE_MODE_QSGMII, m, c)
>  
>  static const struct serdes_mux ocelot_serdes_muxes[] = {
>  	SERDES_MUX_SGMII(SERDES1G(0), 0, 0, 0),
> @@ -164,12 +167,15 @@ static int serdes_set_mode(struct phy *phy, enum phy_mode mode, int submode)
>  	unsigned int i;
>  	int ret;
>  
> +	if (mode != PHY_MODE_ETHERNET)
> +		return -EINVAL;
> +
>  	for (i = 0; i < ARRAY_SIZE(ocelot_serdes_muxes); i++) {
>  		if (macro->idx != ocelot_serdes_muxes[i].idx ||
> -		    mode != ocelot_serdes_muxes[i].mode)
> +		    submode != ocelot_serdes_muxes[i].mode)
>  			continue;
>  
> -		if (mode != PHY_MODE_QSGMII &&
> +		if (submode != PHY_INTERFACE_MODE_QSGMII &&
>  		    macro->port != ocelot_serdes_muxes[i].port)
>  			continue;
>  
> 
