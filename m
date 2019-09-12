From: Stanley Chu <stanley.chu@mediatek.com>
Subject: RE: [PATCH v1 3/3] scsi: ufs-mediatek: enable auto suspend capability
Date: Thu, 12 Sep 2019 13:39:26 +0800
Message-ID: <1568266766.16730.15.camel@mtkswgap22>
References: <1568194890-24439-1-git-send-email-stanley.chu@mediatek.com>
 <1568194890-24439-4-git-send-email-stanley.chu@mediatek.com>
 <MN2PR04MB6991A6F223D9C711A3D00B21FCB10@MN2PR04MB6991.namprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <MN2PR04MB6991A6F223D9C711A3D00B21FCB10@MN2PR04MB6991.namprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Avri Altman <Avri.Altman@wdc.com>
Cc: "sthumma@codeaurora.org" <sthumma@codeaurora.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "vivek.gautam@codeaurora.org" <vivek.gautam@codeaurora.org>, "andy.teng@mediatek.com" <andy.teng@mediatek.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>, "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>, "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>, "evgreen@chromium.org" <evgreen@chromium.org>, "subhashj@codeaurora.org" <subhashj@codeaurora.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "peter.wang@mediatek.com" <peter.wang@mediatek.com>, "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "beanhuo@micron.com" <beanhuo@micron.com>, pedrom.sousa@
List-Id: linux-mediatek@lists.infradead.org

Hi Avri,

On Wed, 2019-09-11 at 10:58 +0000, Avri Altman wrote:
> > 
> > Enable auto suspend capability in MediaTek UFS driver.
> > 
> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> Reviewed-by: Avri Altman <avri.altman@wdc.com>
> 
> > ---
> >  drivers/scsi/ufs/ufs-mediatek.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
> > index 0f6ff33ce52e..b7b177c6194c 100644
> > --- a/drivers/scsi/ufs/ufs-mediatek.c
> > +++ b/drivers/scsi/ufs/ufs-mediatek.c
> > @@ -117,6 +117,11 @@ static int ufs_mtk_setup_clocks(struct ufs_hba
> > *hba, bool on,
> >         return ret;
> >  }
> > 
> > +static void ufs_mtk_set_caps(struct ufs_hba *hba) {
> > +       hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND; }
> Even a one-liner deserve new line for its closing brackets

The wired format is just happening the same as
[PATCH v1 2/3] scsi: ufs: override auto suspend tunables for ufs

It looks fine in patchwork website:
https://patchwork.kernel.org/patch/11140757/

I'll try to fix it in v2.

Thanks,
Stanley
