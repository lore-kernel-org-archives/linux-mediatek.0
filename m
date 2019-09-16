From: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v2 3/3] scsi: ufs-mediatek: enable auto suspend capability
Date: Mon, 16 Sep 2019 14:29:52 +0800
Message-ID: <1568615392.16730.17.camel@mtkswgap22>
References: <1568270135-32442-1-git-send-email-stanley.chu@mediatek.com>
 <1568270135-32442-4-git-send-email-stanley.chu@mediatek.com>
 <160452c7-c53c-155c-49a9-4365166032a8@acm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <160452c7-c53c-155c-49a9-4365166032a8@acm.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bart Van Assche <bvanassche@acm.org>
Cc: sthumma@codeaurora.org, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, marc.w.gonzalez@free.fr, vivek.gautam@codeaurora.org, subhashj@codeaurora.org, jejb@linux.ibm.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com, evgreen@chromium.org, avri.altman@wdc.com, linux-mediatek@lists.infradead.org, peter.wang@mediatek.com, alim.akhtar@samsung.com, andy.teng@mediatek.com, matthias.bgg@gmail.com, pedrom.sousa@synopsys.com, linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
List-Id: linux-mediatek@lists.infradead.org

Hi Bart,


> > @@ -147,6 +152,8 @@ static int ufs_mtk_init(struct ufs_hba *hba)
> >  	if (err)
> >  		goto out_variant_clear;
> >  
> > +	ufs_mtk_set_caps(hba);
> > +
> >  	/*
> >  	 * ufshcd_vops_init() is invoked after
> >  	 * ufshcd_setup_clock(true) in ufshcd_hba_init() thus
> 
> Please inline the ufs_mtk_set_caps() function. Introducing single line
> functions like is done in this patch doesn't improve readability.
> 

OK! Will be fixed in next version.

Thanks,
Stanley
