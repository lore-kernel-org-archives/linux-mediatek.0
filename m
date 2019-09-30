From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] media: i2c: ov5695: Modify the function of async
 register subdev related devices
Date: Mon, 30 Sep 2019 10:58:51 +0300
Message-ID: <20190930075851.GB19037@paasikivi.fi.intel.com>
References: <20190927071824.18675-1-dongchun.zhu@mediatek.com>
 <20190927071824.18675-2-dongchun.zhu@mediatek.com>
 <CAAFQd5B1htFA1R92iQQ93dMQujkSWNqHkx94GG+bdUscRA4gDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAFQd5B1htFA1R92iQQ93dMQujkSWNqHkx94GG+bdUscRA4gDQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, shengnan.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Louis Kuo <louis.kuo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sj Huang <sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Dongchun Zhu <dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cao Bing Bu <bingbu.cao-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Tomasz, Dongchun,

(Removed randomly cc'd people from distribution.)

On Sat, Sep 28, 2019 at 09:17:11PM +0900, Tomasz Figa wrote:
> On Fri, Sep 27, 2019 at 4:18 PM Dongchun Zhu <dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> >
> > This patch adds support for registering a sensor sub-device to the async sub-device framework and parse set up common
> > sensor related devices such as actuator/VCM.
> 
> nit: The description should be wrapped around the 80th column.
> 
> Sakari, do we need to resent or you could just rewrap when applying?

I'll rewrap.

> 
> >
> > Signed-off-by: Dongchun Zhu <dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  drivers/media/i2c/ov5695.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
> > index e65a943..b6ee62c 100644
> > --- a/drivers/media/i2c/ov5695.c
> > +++ b/drivers/media/i2c/ov5695.c
> > @@ -1328,7 +1328,7 @@ static int ov5695_probe(struct i2c_client *client,
> >                 goto err_power_off;
> >  #endif
> >
> > -       ret = v4l2_async_register_subdev(sd);
> > +       ret = v4l2_async_register_subdev_sensor_common(sd);
> >         if (ret) {
> >                 dev_err(dev, "v4l2 async register subdev failed\n");
> >                 goto err_clean_entity;
> > --
> > 2.9.2
> >
> 
> Otherwise:
> 
> Reviewed-by: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Thanks!

-- 
Sakari Ailus
sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
