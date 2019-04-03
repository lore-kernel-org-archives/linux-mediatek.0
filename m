From: Jungo Lin <jungo.lin@mediatek.com>
Subject: Re: [PATCH v1] media: media_device_enum_links32: fix missing
 reserved field copy
Date: Wed, 3 Apr 2019 08:30:04 +0800
Message-ID: <1554251404.30711.2.camel@mtksdccf07>
References: <jungo.lin@mediatek.com>
 <1554199444-16827-1-git-send-email-jungo.lin@mediatek.com>
 <20190402113339.GT4805@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190402113339.GT4805@pendragon.ideasonboard.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ryan.yu@mediatek.com, Jerry-ch.Chen@mediatek.com, laurent.pinchart+renesas@ideasonboard.com, Rynn.Wu@mediatek.com, frankie.chiu@mediatek.com, hans.verkuil@cisco.com, frederic.chen@mediatek.com, seraph.huang@mediatek.com, linux-media@vger.kernel.org, holmes.chiou@mediatek.com, sj.huang@mediatek.com, Jungo Lin <jungo.lin@mediatek.corp-partner.google.com>, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com, srv_heupstream@mediatek.com, tfiga@chromium.org, yuzhao@chromium.org, christie.yu@mediatek.com, zwisler@chromium.org
List-Id: linux-mediatek@lists.infradead.org

Hi, Laurent,

On Tue, 2019-04-02 at 14:33 +0300, Laurent Pinchart wrote:
> Hi Jungo,
> 
> Thank you for the patch.
> 
> On Tue, Apr 02, 2019 at 06:04:04PM +0800, Jungo Lin wrote:
> > From: Jungo Lin <jungo.lin@mediatek.corp-partner.google.com>
> > 
> > In v4l2-compliance utility, test MEDIA_IOC_ENUM_ENTITIES
> > will check whether reserved field of media_links_enum filled
> > with zero. Reserved field is filled with zero in media_device_enum_links.
> > 
> > However, for 32 bit program, the reserved field is missing
> > copy from kernel space to user space in media_device_enum_links32
> > function.
> > 
> > This patch copies reserved field of media_links_enum from kernel space
> > to user space.
> > 
> > Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> > ---
> >  drivers/media/media-device.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/media-device.c b/drivers/media/media-device.c
> > index b8ec886..f420829 100644
> > --- a/drivers/media/media-device.c
> > +++ b/drivers/media/media-device.c
> > @@ -502,6 +502,7 @@ static long media_device_enum_links32(struct media_device *mdev,
> >  {
> >  	struct media_links_enum links;
> >  	compat_uptr_t pads_ptr, links_ptr;
> > +	int ret;
> >  
> >  	memset(&links, 0, sizeof(links));
> >  
> > @@ -513,7 +514,15 @@ static long media_device_enum_links32(struct media_device *mdev,
> >  	links.pads = compat_ptr(pads_ptr);
> >  	links.links = compat_ptr(links_ptr);
> >  
> > -	return media_device_enum_links(mdev, &links);
> > +	ret = media_device_enum_links(mdev, &links);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (copy_to_user(ulinks->reserved, &links.reserved,
> > +			 sizeof(links.reserved)))
> > +		return -EFAULT;
> 
> I think it would be better to zero the reserved field here instead of
> copying it, as we know it has to be zero.
> 

Got it.
We will revise the implementation and deliver the v2 patch.

Thanks,

Jungo 

> > +
> > +	return 0;
> >  }
> >  
> >  #define MEDIA_IOC_ENUM_LINKS32		_IOWR('|', 0x02, struct media_links_enum32)
> 
