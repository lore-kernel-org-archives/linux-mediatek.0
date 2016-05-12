From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: re: drm/mediatek: Add DPI sub driver
Date: Thu, 12 May 2016 13:26:23 +0300
Message-ID: <20160512102622.GA14068@mwanda>
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
To: jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hello Jie Qiu,

This is a semi-automatic email about new static checker warnings.

The patch 9e629c17aa8d: "drm/mediatek: Add DPI sub driver" from Jan 
4, 2016, leads to the following Smatch complaint:

drivers/gpu/drm/mediatek/mtk_dpi.c:436 mtk_dpi_set_display_mode()
	 error: we previously assumed 'dpi' could be null (see line 435)

drivers/gpu/drm/mediatek/mtk_dpi.c
   434	
   435		if (!dpi) {
                    ^^^^
Check.

   436			dev_err(dpi->dev, "invalid argument\n");
                                ^^^^^^^^^
Deref.  Can dpi even be NULL, btw?

   437			return -EINVAL;
   438		}

regards,
dan carpenter
