From: Avri Altman <Avri.Altman@wdc.com>
Subject: RE: [PATCH v1 3/3] scsi: ufs-mediatek: enable auto suspend capability
Date: Wed, 11 Sep 2019 10:58:39 +0000
Message-ID: <MN2PR04MB6991A6F223D9C711A3D00B21FCB10@MN2PR04MB6991.namprd04.prod.outlook.com>
References: <1568194890-24439-1-git-send-email-stanley.chu@mediatek.com>
 <1568194890-24439-4-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1568194890-24439-4-git-send-email-stanley.chu@mediatek.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stanley Chu <stanley.chu@mediatek.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>, "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "pedrom.sousa@synopsys.com" <pedrom.sousa@synopsys.com>, "sthumma@codeaurora.org" <sthumma@codeaurora.org>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>, "bvanassche@acm.org" <bvanassche@acm.org>
Cc: "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "andy.teng@mediatek.com" <andy.teng@mediatek.com>, "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>, "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>, "evgreen@chromium.org" <evgreen@chromium.org>, "subhashj@codeaurora.org" <subhashj@codeaurora.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "peter.wang@mediatek.com" <peter.wang@mediatek.com>, "vivek.gautam@codeaurora.org" <vivek.gautam@codeaurora.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "beanhuo@micron.com" <beanhuo@micron.com>
List-Id: linux-mediatek@lists.infradead.org

> 
> Enable auto suspend capability in MediaTek UFS driver.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>

> ---
>  drivers/scsi/ufs/ufs-mediatek.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
> index 0f6ff33ce52e..b7b177c6194c 100644
> --- a/drivers/scsi/ufs/ufs-mediatek.c
> +++ b/drivers/scsi/ufs/ufs-mediatek.c
> @@ -117,6 +117,11 @@ static int ufs_mtk_setup_clocks(struct ufs_hba
> *hba, bool on,
>         return ret;
>  }
> 
> +static void ufs_mtk_set_caps(struct ufs_hba *hba) {
> +       hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND; }
Even a one-liner deserve new line for its closing brackets

> +
>  /**
>   * ufs_mtk_init - find other essential mmio bases
>   * @hba: host controller instance
> @@ -147,6 +152,8 @@ static int ufs_mtk_init(struct ufs_hba *hba)
>         if (err)
>                 goto out_variant_clear;
> 
> +       ufs_mtk_set_caps(hba);
> +
>         /*
>          * ufshcd_vops_init() is invoked after
>          * ufshcd_setup_clock(true) in ufshcd_hba_init() thus
> --
> 2.18.0
