From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH net] net: dsa: mt7530: Use NULL instead of plain integer
Date: Tue, 3 Apr 2018 10:18:24 +0800
Message-ID: <1522721904.18424.51.camel@mtkswgap22>
References: <20180402232414.19671-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180402232414.19671-1-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2018-04-02 at 16:24 -0700, Florian Fainelli wrote:
> We would be passing 0 instead of NULL as the rsp argument to
> mt7530_fdb_cmd(), fix that.
> 

Acked-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

BTW, does the part of the commit message should be updated with "passing
NULL instead of 0"?


> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/net/dsa/mt7530.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 4e53c5ce23ff..a7f6c0a62fc7 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -917,7 +917,7 @@ mt7530_port_fdb_add(struct dsa_switch *ds, int port,
>  
>  	mutex_lock(&priv->reg_mutex);
>  	mt7530_fdb_write(priv, vid, port_mask, addr, -1, STATIC_ENT);
> -	ret = mt7530_fdb_cmd(priv, MT7530_FDB_WRITE, 0);
> +	ret = mt7530_fdb_cmd(priv, MT7530_FDB_WRITE, NULL);
>  	mutex_unlock(&priv->reg_mutex);
>  
>  	return ret;
> @@ -933,7 +933,7 @@ mt7530_port_fdb_del(struct dsa_switch *ds, int port,
>  
>  	mutex_lock(&priv->reg_mutex);
>  	mt7530_fdb_write(priv, vid, port_mask, addr, -1, STATIC_EMP);
> -	ret = mt7530_fdb_cmd(priv, MT7530_FDB_WRITE, 0);
> +	ret = mt7530_fdb_cmd(priv, MT7530_FDB_WRITE, NULL);
>  	mutex_unlock(&priv->reg_mutex);
>  
>  	return ret;
> @@ -1293,7 +1293,7 @@ mt7530_setup(struct dsa_switch *ds)
>  	}
>  
>  	/* Flush the FDB table */
> -	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, 0);
> +	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
>  	if (ret < 0)
>  		return ret;
>  
