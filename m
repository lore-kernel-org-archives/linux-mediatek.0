From: Stanley Chu <stanley.chu@mediatek.com>
Subject: RE: [PATCH v1 2/3] scsi: ufs: override auto suspend tunables for ufs
Date: Thu, 12 Sep 2019 13:37:31 +0800
Message-ID: <1568266651.16730.13.camel@mtkswgap22>
References: <1568194890-24439-1-git-send-email-stanley.chu@mediatek.com>
 <1568194890-24439-3-git-send-email-stanley.chu@mediatek.com>
 <MN2PR04MB6991D63EEF50367BE2CB062CFCB10@MN2PR04MB6991.namprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <MN2PR04MB6991D63EEF50367BE2CB062CFCB10@MN2PR04MB6991.namprd04.prod.outlook.com>
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

> > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c index
> > 30b752c61b97..d253a018a73b 100644
> > --- a/drivers/scsi/ufs/ufshcd.c
> > +++ b/drivers/scsi/ufs/ufshcd.c
> > @@ -88,6 +88,9 @@
> >  /* Interrupt aggregation default timeout, unit: 40us */
> >  #define INT_AGGR_DEF_TO        0x02
> > 
> > +/* default delay of autosuspend: 2000 ms */ #define
> Typo?
> 

This is wired because it looks fine in both my local patch and in
patchwork website: https://patchwork.kernel.org/patch/11140759/

Anyway I will try to fix and check it carefully in v2.

Thanks,
Stanley
