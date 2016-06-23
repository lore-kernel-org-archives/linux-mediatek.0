From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH v3 0/2] nvmem: remove regmap dependency
Date: Thu, 23 Jun 2016 20:07:13 +0200 (CEST)
Message-ID: <541115749.18852.dd1915ce-f885-44a4-a743-86ca28f8b9fd.open-xchange@email.1und1.de>
References: <1462214174-469-1-git-send-email-srinivas.kandagatla@linaro.org>
 <7eec3215-b455-6567-28a2-e2a860e1d3ec@i2se.com>
 <20160601175542.GA19241@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20160601175542.GA19241-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi Greg,

> Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> hat am 1. Juni 2016 um 19:55
> geschrieben:
> 
> 
> On Wed, Jun 01, 2016 at 10:27:49AM +0200, Stefan Wahren wrote:
> > Hi Greg,
> > 
> > Am 02.05.2016 um 20:36 schrieb Srinivas Kandagatla:
> > > Hi Greg, 
> > >
> > > This is v3 patchset for the leftover 2 patches for nvmem regmap
> > > removal series [1]. These patches are based on char-misc tree.
> > >
> > > nvmem uses regmap_raw_read/write apis to read/write data from providers,
> > > With recent patch 922a9f936e40 ("regmap: mmio: Convert to regmap_bus
> > > and fix accessor usage") nvmem providers based on regmap-mmio stopped
> > > working, as nvmem core was using raw accessors.
> > > This issue can be fixed temporarly by moving to other regmap apis,
> > > but we might hit same issue in future, and regmap looks like an
> > > overdo for nvmem. Moving to interfaces based on read/write callbacks
> > > from providers would be more robust.
> > >
> > > This patchset converts the nvmem core and nvmem provider drivers to
> > > use the new callbacks. Tested this patchset on qfprom and at24 drivers.
> > > Other driver are only compile tested, any testing on them would be great.
> > >
> > > Most of the patches have been applied to char-misc tree, these are the
> > > two patches which had some outstanding comments on mxs nvmemprovider,
> > > which are now fixed.
> > >
> > > Changes since v2:
> > >  - Fixed the mxs size and dt data pointer spotted by Stefan and Fabio
> > >
> > > Changes since v1:
> > >  - rebased mtk-efuse on top of char-misc
> > >  - addressed concerns raised by Stefan Wahren.
> > >
> > > [1]
> > > https://www.mail-archive.com/linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg1130026.html
> > >
> > > Thanks,
> > > srini
> > >
> > > Srinivas Kandagatla (2):
> > >   nvmem: mtk-efuse: remove nvmem regmap dependency
> > >   nvmem: mxs-ocotp: remove nvmem regmap dependency
> > >
> > >  drivers/nvmem/Kconfig     |  1 -
> > >  drivers/nvmem/mtk-efuse.c | 47 ++++++++++++++++++---------
> > >  drivers/nvmem/mxs-ocotp.c | 83
> > > +++++++++++++----------------------------------
> > >  3 files changed, 54 insertions(+), 77 deletions(-)
> > >
> > 
> > any objections about this series or is it still in queue?
> 
> still in my queue...
> 

gently ping ...
