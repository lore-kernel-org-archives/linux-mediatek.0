From: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [RFC PATCH V0 7/7] [media] platform: mtk-isp: Add Mediatek ISP
 Pass 1 driver
Date: Thu, 21 Mar 2019 12:33:08 +0900
Message-ID: <CAAFQd5Addbh8cQBwKnW_g_KWBO6wPbF6MJXX7+gxDmOPg9+zmQ@mail.gmail.com>
References: <1549348966-14451-1-git-send-email-frederic.chen@mediatek.com>
 <1549348966-14451-8-git-send-email-frederic.chen@mediatek.com>
 <CAAFQd5CWdZUXVb4F9BLhQdN8WHjzA8acPDx1i+WcoudsdGsfUg@mail.gmail.com>
 <1550372163.11724.59.camel@mtksdccf07>
 <CAAFQd5CaXz_Lqz8NhGK4DvaxPvuYLj-Y73sG7wFaqW44j+tZQw@mail.gmail.com>
 <1550647867.11724.80.camel@mtksdccf07>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1550647867.11724.80.camel@mtksdccf07>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jungo Lin <jungo.lin@mediatek.com>
Cc: =?UTF-8?B?UnlhbiBZdSAo5L2Z5a2f5L+uKQ==?= <ryan.yu@mediatek.com>, =?UTF-8?B?RnJhbmtpZSBDaGl1ICjpgrHmloflh7Ep?= <frankie.chiu@mediatek.com>, ryan_yu@mediatek.com, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>, Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>, Hans Verkuil <hans.verkuil@cisco.com>, frankie_chiu@mediatek.com, Frederic Chen <frederic.chen@mediatek.com>, =?UTF-8?B?U2VyYXBoIEh1YW5nICjpu4PlnIvpm4Qp?= <Seraph.Huang@mediatek.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, =?UTF-8?B?SG9sbWVzIENoaW91ICjpgrHmjLop?= <holmes.chiou@mediatek.com>, seraph_huang@mediatek.com, Sj Huang <sj.huang@mediatek.com>, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, list@263.net:IOMMU DRIVERS <iommu
List-Id: linux-mediatek@lists.infradead.org

On Wed, Feb 20, 2019 at 4:31 PM Jungo Lin <jungo.lin@mediatek.com> wrote:
>
> On Tue, 2019-02-19 at 17:51 +0900, Tomasz Figa wrote:
> > Hi Jungo,
> >
> > On Sun, Feb 17, 2019 at 11:56 AM Jungo Lin <jungo.lin@mediatek.com> wrote:
> > >
> > > On Wed, 2019-02-13 at 18:50 +0900, Tomasz Figa wrote:
> > > > (() . ( strHi Frederic, Jungo,
> > > >
> > > > On Tue, Feb 5, 2019 at 3:43 PM Frederic Chen <frederic.chen@mediatek.com> wrote:
> > > > >
> > > > > From: Jungo Lin <jungo.lin@mediatek.com>
> > > > >
> > > > > This patch adds the driver for Pass unit in Mediatek's camera
> > > > > ISP system. Pass 1 unit is embedded in Mediatek SOCs. It
> > > > > provides RAW processing which includes optical black correction,
> > > > > defect pixel correction, W/IR imbalance correction and lens
> > > > > shading correction.
> > > > >
> > > > > The mtk-isp directory will contain drivers for multiple IP
> > > > > blocks found in Mediatek ISP system. It will include ISP Pass 1
> > > > > driver, sensor interface driver, DIP driver and face detection
> > > > > driver.
> > > >
> > > > Thanks for the patches! Please see my comments inline.
> > > >
> > >
> > > Dear Thomas:
> > >
> > > Thanks for your comments.
> > >
> > > We will revise the source codes based on your comments.
> > > Since there are many comments to fix/revise, we will categorize &
> > > prioritize these with below list:
> > >
> > > 1. Coding style issues.
> > > 2. Coding defects, including unused codes.
> > > 3. Driver architecture refactoring, such as removing mtk_cam_ctx,
> > > unnecessary abstraction layer, etc.
> > >
> >
> > Thanks for replying to the comments!
> >
> > Just to clarify, there is no need to hurry with resending a next patch
> > set with only a subset of the changes. Please take your time to
> > address all the comments before sending the next revision. This
> > prevents forgetting about some remaining comments and also lets other
> > reviewers come with new comments or some alternative ideas for already
> > existing comments. Second part of my review is coming too.
> >
> > P.S. Please avoid top-posting on mailing lists. If replying to a
> > message, please reply below the related part of that message. (I've
> > moved your reply to the place in the email where it should be.)
> >
> > [snip]
>
> Hi, Tomasz,
>
> Thanks for your advice.
> We will prepare the next patch set after all comments are revised.
>
>
> > > > > +       phys_addr_t paddr;
> > > >
> > > > We shouldn't need physical address either. I suppose this is for the
> > > > SCP, but then it should be a DMA address obtained from dma_map_*()
> > > > with struct device pointer of the SCP.
> > > >
> > >
> > > Yes, this physical address is designed for SCP.
> > > For tuning buffer, it will be touched by SCP and
> > > SCP can't get the physical address by itself. So we need to get
> > > this physical address in the kernel space via mtk_cam_smem_iova_to_phys
> > > function call and pass it to the SCP. At the same time, DMA address
> > > (daddr) is used for ISP HW.
> > >
> >
> > Right, but my point is that in the kernel phys_addr_t is the physical
> > address from the CPU point of view. Any address from device point of
> > view is dma_addr_t and should be obtained from the DMA mapping API
> > (even if it's numerically the same as physical address).
> >
>
> OK.
> In order to clarify the address usage, is it ok to rename "dma_addr_t
> scp_addr"?

Sounds good to me.

> Moreover, below function will be also renamed.
> dma_addr_t mtk_cam_smem_iova_to_scp_phys(struct device *dev,
>                                       dma_addr_t iova)

Perhaps mtk_cam_smem_iova_to_scp_addr() for consistency with the
struct field above?
