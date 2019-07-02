From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 00/22] Associate ddc adapters with connectors
Date: Tue, 2 Jul 2019 16:08:30 +0100
Message-ID: <CACvgo502Yt90z9Tf+a8f_n3pgFa_NxFQ1LnEGmukT_jB2XaFzA__8781.99049491144$1562080122$gmane$org@mail.gmail.com>
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
 <20190628164514.GS12905@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190628164514.GS12905-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.h>
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Fri, 28 Jun 2019 at 17:45, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org> wrote:
>
> On Fri, Jun 28, 2019 at 06:01:14PM +0200, Andrzej Pietrasiewicz wrote:
> > It is difficult for a user to know which of the i2c adapters is for which
> > drm connector. This series addresses this problem.
> >
> > The idea is to have a symbolic link in connector's sysfs directory, e.g.:
> >
> > ls -l /sys/class/drm/card0-HDMI-A-1/ddc
> > lrwxrwxrwx 1 root root 0 Jun 24 10:42 /sys/class/drm/card0-HDMI-A-1/ddc \
> >       -> ../../../../soc/13880000.i2c/i2c-2
> >
> > The user then knows that their card0-HDMI-A-1 uses i2c-2 and can e.g. run
> > ddcutil:
> >
> > ddcutil -b 2 getvcp 0x10
> > VCP code 0x10 (Brightness                    ): current value =    90, max value =   100
> >
> > The first patch in the series adds struct i2c_adapter pointer to struct
> > drm_connector. If the field is used by a particular driver, then an
> > appropriate symbolic link is created by the generic code, which is also added
> > by this patch.
> >
> > The second patch is an example of how to convert a driver to this new scheme.
> >
> > v1..v2:
> >
> > - used fixed name "ddc" for the symbolic link in order to make it easy for
> > userspace to find the i2c adapter
> >
> > v2..v3:
> >
> > - converted as many drivers as possible.
> >
> > PATCHES 3/22-22/22 SHOULD BE CONSIDERED RFC!
>
> There's a lot more drivers than this I think (i915 is absent as an
> example, but there should be tons more). Why are those not possible?

While I fully agree there are more drivers, at the same time I wonder.
Is it a good idea to expect all of those to be fixed in one go and
block patches addressing 15+ drivers?

Personally I think it's reasonable to have this, alongside a TODO
entry for other drivers.

HTH
Emil
