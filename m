From: Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH v2 3/3] scsi: ufs-mediatek: enable auto suspend capability
Date: Thu, 12 Sep 2019 14:46:15 +0100
Message-ID: <160452c7-c53c-155c-49a9-4365166032a8@acm.org>
References: <1568270135-32442-1-git-send-email-stanley.chu@mediatek.com>
 <1568270135-32442-4-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1568270135-32442-4-git-send-email-stanley.chu@mediatek.com>
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
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, pedrom.sousa@synopsys.com, sthumma@codeaurora.org, jejb@linux.ibm.com
Cc: marc.w.gonzalez@free.fr, andy.teng@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com, evgreen@chromium.org, subhashj@codeaurora.org, linux-mediatek@lists.infradead.org, peter.wang@mediatek.com, vivek.gautam@codeaurora.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
List-Id: linux-mediatek@lists.infradead.org

On 9/12/19 7:35 AM, Stanley Chu wrote:
> Enable auto suspend capability in MediaTek UFS driver.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> Reviewed-by: Avri Altman <avri.altman@wdc.com>
> ---
>  drivers/scsi/ufs/ufs-mediatek.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
> index 0f6ff33ce52e..b7b177c6194c 100644
> --- a/drivers/scsi/ufs/ufs-mediatek.c
> +++ b/drivers/scsi/ufs/ufs-mediatek.c
> @@ -117,6 +117,11 @@ static int ufs_mtk_setup_clocks(struct ufs_hba *hba, bool on,
>  	return ret;
>  }
>  
> +static void ufs_mtk_set_caps(struct ufs_hba *hba)
> +{
> +	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
> +}
> +
>  /**
>   * ufs_mtk_init - find other essential mmio bases
>   * @hba: host controller instance
> @@ -147,6 +152,8 @@ static int ufs_mtk_init(struct ufs_hba *hba)
>  	if (err)
>  		goto out_variant_clear;
>  
> +	ufs_mtk_set_caps(hba);
> +
>  	/*
>  	 * ufshcd_vops_init() is invoked after
>  	 * ufshcd_setup_clock(true) in ufshcd_hba_init() thus

Please inline the ufs_mtk_set_caps() function. Introducing single line
functions like is done in this patch doesn't improve readability.

Thanks,

Bart.
