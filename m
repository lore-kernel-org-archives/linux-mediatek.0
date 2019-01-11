From: CK Hu <ck.hu@mediatek.com>
Subject: Re: Aw: Re: [PATCH] drm/mediatek: Add MTK Framebuffer-Device (mt7623)
Date: Fri, 11 Jan 2019 09:31:28 +0800
Message-ID: <1547170288.29836.2.camel@mtksdaap41>
References: <20190102084917.4049-1-frank-w@public-files.de>
 <20190107103640.GH21184@phenom.ffwll.local>
 <CAKMK7uEqxz4TAt_iwEC+dMWboVxCeCduyABsSwD0Ns7k=Z_UWA@mail.gmail.com>
 <trinity-0da588a3-1277-4421-ad6b-1f6aeb129dd6-1547146897687@3c-app-gmx-bs35>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <trinity-0da588a3-1277-4421-ad6b-1f6aeb129dd6-1547146897687@3c-app-gmx-bs35>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Alexander Ryabchenko <d3adme4t@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

Hi, Frank:

On Thu, 2019-01-10 at 20:01 +0100, Frank Wunderlich wrote:
> Hi Daniel,
> 
> > > Would be good to use the new generic fbdev emulation code here, for even
> > > less code. Or at least know why this isn't possible to use for mtk (and
> > > maybe address that in the core code). Hand-rolling fbdev code shouldn't be
> > > needed anymore.
> > 
> > Back on the mailing list, no private replies please:
> 
> i don't wanted to spam all people with dumb questions ;)
> 
> > For examples please grep for drm_fbdev_generic_setup(). There's also a
> > still in-flight series from Gerd Hoffmann to convert over bochs. That,
> > plus all the kerneldoc linked from there should get you started.
> > -Daniel
> 
> this is one of google best founds if i search for drm_fbdev_generic_setup:
> 
> https://lkml.org/lkml/2018/12/19/305
> 
> not very helpful...
> 
> so i tried kernel-doc
> 
> https://www.kernel.org/doc/html/latest/gpu/drm-kms-helpers.html?highlight=drm_fbdev_generic_setup#c.drm_fbdev_generic_setup
> 
> which is nice function-reference but i've found no generic workflow
> 
> as the posted driver is "only" a driver ported from kernel 4.4 by Alexander, i don't know if this new framework can be used and which parts need to be changed. I only try to bring his code Mainline....
> Maybe CK Hu can help here because driver is originally from him and he knows internals. Or maybe you can help here?

I could help on this but I'm a little busy now, so I'm not sure how long
this process takes.

Regards,
CK

> 
> i personally make my first steps as spare-time kernel-developer :)
> 
> regards Frank
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
