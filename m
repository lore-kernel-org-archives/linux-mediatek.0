From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [bug report] drm/mediatek: separate hdmi phy to different file
Date: Wed, 17 Oct 2018 15:28:09 +0300
Message-ID: <20181017122809.k6wy46cleil567l2@kili.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: chunhui.dai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hello chunhui dai,

This is a semi-automatic email about new static checker warnings.

The patch be28b6507c46: "drm/mediatek: separate hdmi phy to different 
file" from Oct 3, 2018, leads to the following Smatch complaint:

    drivers/gpu/drm/mediatek/mtk_hdmi_phy.c:109 mtk_hdmi_phy_dev_get_ops()
     error: we previously assumed 'hdmi_phy' could be null (see line 104)

drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
   103	{
   104		if (hdmi_phy && hdmi_phy->conf &&
                    ^^^^^^^^
This check can probably be removed, right?

   105		    hdmi_phy->conf->hdmi_phy_enable_tmds &&
   106		    hdmi_phy->conf->hdmi_phy_disable_tmds)
   107			return &mtk_hdmi_phy_dev_ops;
   108	
   109		dev_err(hdmi_phy->dev, "Failed to get dev ops of phy\n");
                        ^^^^^^^^^^^^^
Otherwise we get an Oops.

   110		return NULL;
   111	}

regards,
dan carpenter
