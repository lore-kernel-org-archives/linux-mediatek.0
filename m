From: Boris Brezillon <boris.brezillon-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 2/4] MAINTAINERS: Add entry for Mediatek NAND
 controller driver
Date: Sun, 22 Apr 2018 19:28:20 +0200
Message-ID: <20180422192820.06147c31@bbrezillon>
References: <1523864464-41059-1-git-send-email-xiaolei.li@mediatek.com>
 <1523864464-41059-3-git-send-email-xiaolei.li@mediatek.com>
 <20180420222451.20d72560@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180420222451.20d72560@bbrezillon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: richard-/L3Ra7n9ekc@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, 20 Apr 2018 22:24:51 +0200
Boris Brezillon <boris.brezillon-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:

> On Mon, 16 Apr 2018 15:41:02 +0800
> Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> 
> > Add entry for Mediatek NAND controller driver and its bindings.
> > 
> > Signed-off-by: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  MAINTAINERS | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d262f17..429ef09 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8838,6 +8838,13 @@ L:	linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >  S:	Maintained
> >  F:	drivers/net/wireless/mediatek/mt7601u/
> >  
> > +MEDIATEK NAND CONTROLLER DRIVER
> > +M:	Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > +L:	linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > +S:	Maintained
> > +F:	drivers/mtd/nand/raw/mtk_*
> > +F:	Documentation/devicetree/bindings/mtd/mtk-nand.txt  
> 
> Thanks for doing that.
> 
> I'll apply the patch, you can drop it from your v3.

Applied to nand/next.

Thanks,

Boris

> 
> > +
> >  MEDIATEK RANDOM NUMBER GENERATOR SUPPORT
> >  M:	Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >  S:	Maintained  
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
