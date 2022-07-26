Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41971C00140
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 15:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDvrtynZ3hRRPjRo258DMKcSELwH+UE1E2x1LvwmJOM=; b=l8bYMCYvD+p7oIV3rMbCUi6iel
	FhAvupPUIHesOGzJqaDy57G5dzvaAIH3GnioXnNDazfaHeG0EAioZ15dOk6oFMjLEOXPp2Hqm71GB
	RF/1j2gJzUAuRyUA/siCRh1AwkKvSXrL2TGH7y7rHBy15Jwf+vTYTvlTrMJZ3MS/5sccBuk6+OfCa
	gZaKVeEvU5zsaPcBbkD5ubJfmxBXvFXaHE6oYmCDIPebFgoXzH0U+yccopukiPo+Mn/ON1TULx+s9
	Dp4lXrEiUqaJ/FQ/7o7dZFcd65ne9RX+RnCQacS6zxw8Rqtf4lfo5Bt4Da85qcCOtEpMTKZkgDWJK
	1StV0njw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGM7u-000RiA-Us; Tue, 26 Jul 2022 15:05:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGM7s-000Rgu-HW
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 15:05:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2917E60688;
	Tue, 26 Jul 2022 15:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B11C433C1;
	Tue, 26 Jul 2022 15:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1658847935;
	bh=PyA1TS9ySl7LrDhyRcyjQljVl5Q3NH7xSHY8ccNSeCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jR4MqOwu8XxZo4Y5Dvf1Oc+rssVaQ0TxfUYSvuFPPITm4ST6I9lIWkVQ9hhS/u6t5
	 RrwOBV14b3nKGYfAOVODrx5zhPXdOQlMXO2BQJFVvsIO4hiQzwVSpDMgzC4SDlidvl
	 rH8Ftw/KBJ07cVG+oR2BdEgP1Q+63q1vME8I/K3E=
Date: Tue, 26 Jul 2022 17:05:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: peter.wang@mediatek.com
Cc: stanley.chu@mediatek.com, linux-scsi@vger.kernel.org,
	martin.petersen@oracle.com, avri.altman@wdc.com,
	alim.akhtar@samsung.com, jejb@linux.ibm.com,
	wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
	cc.chou@mediatek.com, chaotian.jing@mediatek.com,
	jiajie.hao@mediatek.com, powen.kao@mediatek.com,
	qilin.tan@mediatek.com, lin.gui@mediatek.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] ufs: core: correct ufshcd_shutdown flow
Message-ID: <YuACuoUszpHSvFnM@kroah.com>
References: <20220726113653.25024-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726113653.25024-1-peter.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_080536_637095_9A7882BC 
X-CRM114-Status: GOOD (  19.86  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 26, 2022 at 07:36:53PM +0800, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> In normal case: ufshcd_wl_shutdown -> ufshcd_shtdown
> ufshcd_shtdown should turn off clock/power after ufshcd_wl_shutdown
> which set device power off and link off.
> 
> Also remove pm_runtime_get_sync.
> The reason why here can remove pm_runtime_get_sync is because,
> (1) ufshcd_wl_shutdown -> pm_runtime_get_sync, will resume hba->dev too.
> (2) device resume(turn on clk/power) is not required, even if device is in RPM_SUSPENDED.
> 
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> ---
>  drivers/ufs/core/ufshcd.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index c7b337480e3e..d13c76983555 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -9462,12 +9462,8 @@ EXPORT_SYMBOL(ufshcd_runtime_resume);
>  int ufshcd_shutdown(struct ufs_hba *hba)
>  {
>  	if (ufshcd_is_ufs_dev_poweroff(hba) && ufshcd_is_link_off(hba))
> -		goto out;
> -
> -	pm_runtime_get_sync(hba->dev);
> +		ufshcd_suspend(hba);
>  
> -	ufshcd_suspend(hba);
> -out:
>  	hba->is_powered = false;
>  	/* allow force shutdown even in case of errors */
>  	return 0;
> -- 
> 2.18.0
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

