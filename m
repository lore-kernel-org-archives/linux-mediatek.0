Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43282C61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 07:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkGiHmQdXc5FM3Ws+nDWjPOJQWPQv+uYe8De+i16v9A=; b=sXtaYbJnxE9NKUEED0n69Rr9vE
	V7LOA9dqb5OZWLOWcljJtt5WhZHyc4DZixA0rugoZs2nmc0bIul6dUDJcnWWm+QM4WJP0nKFltBtZ
	VQhVWsDamUsEUaPzBpm7nZvS7Q5AQnnHyQqjrOo1CHxos1nPUx159/5BHnKT8uqx7XtPq3UKQs6bP
	wr6jSSQcuVev/Jf8hFON2c52TtlP57KMIuOQYk7LfoeVFtGSVXZc3dRFvEFLOFICxMmJjPe1dUyYB
	/+NVj2cHu9+VzOF0zh83jpe4fcW8j/3oDSw1I70n+znNX9VGhRZt2KKtpC/djetUnkR2gnutlGp8d
	rMf3JooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUN4u-006tsH-43; Tue, 21 Feb 2023 07:28:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUN4j-006tpq-Es; Tue, 21 Feb 2023 07:28:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DBA3660F26;
	Tue, 21 Feb 2023 07:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC9AC433D2;
	Tue, 21 Feb 2023 07:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676964512;
	bh=yrEXHlD+OGvdKZR47aQcY+a66pmfUFJm1C18b22BmkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzq2UwLbV8oJcbduSvS38Q+3wATyxt1VIUgplYDzUNqQXXGRstOt80Khkd122WQPM
	 l4c985Od9zzW8xxGcWGhxG0SXqionhv68Ig5RYURlyo2c9IumK7ZeSBu0EjlXZjH8l
	 w3DXaIcGjFNcoNmE2z15twbFO7iYpjyAjheG7ZnY/0bEAevnDVw7oRD5H3NeLXY7WM
	 zPHyHkvTbf5F4aXB0V0TtGnkDZ438ZTOLaDIgkkS+fyz35J8knc1NVM+JRJ5aXhjxD
	 eA9boBX2iehs+wL7Oi7cuC6Exd0rKZK/fcTxXJZu9zxbcI1OgyF5KJAn3V+qTyMzCe
	 ySh7RPbMuc9Fw==
Date: Tue, 21 Feb 2023 12:58:22 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Stephen Zhang <starzhangzsd@gmail.com>
Cc: jejb@linux.ibm.com, artin.petersen@oracle.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, beanhuo@micron.com,
	bvanassche@acm.org, avri.altman@wdc.com,
	yoshihiro.shimoda.uh@renesas.com, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, zhangshida@kylinos.cn,
	k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH v2] scsi: ufs: Guard the ufs_mtk_runtime_suspend and
 ufs_mtk_runtime_resume with CONFIG_PM
Message-ID: <20230221072822.GA99958@thinkpad>
References: <20230221025055.1031342-1-zhangshida@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230221025055.1031342-1-zhangshida@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_232833_591945_BD8765B7 
X-CRM114-Status: GOOD (  21.59  )
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

On Tue, Feb 21, 2023 at 10:50:55AM +0800, Stephen Zhang wrote:
> From: Shida Zhang <zhangshida@kylinos.cn>
> 

Subject could be fixed as:

"scsi: ufs: mediatek: Guard runtime PM functions"

> In a configuration with CONFIG_SCSI_UFS_MEDIATEK set to 'm' and
> CONFIG_PM set to 'n', errors occur at compile time:
> 
> ====
> ../drivers/ufs/host/ufs-mediatek.c: In function ‘ufs_mtk_runtime_suspend’:
> ../drivers/ufs/host/ufs-mediatek.c:1621:8: error: implicit declaration of function ‘ufshcd_runtime_suspend’; did you mean ‘ufs_mtk_runtime_suspend’? [-Werror=implicit-function-declaration]
> ../drivers/ufs/host/ufs-mediatek.c: In function ‘ufs_mtk_runtime_resume’:
> ../drivers/ufs/host/ufs-mediatek.c:1636:9: error: implicit declaration of function ‘ufshcd_runtime_resume’; did you mean ‘ufs_mtk_runtime_resume’? [-Werror=implicit-function-declaration]
> ====
> 
> This patch fixes these by guarding these functions with CONFIG_PM.
> 

Remove reference to "patch" in the commit message as it will be meaningless
once merged. The line could be reworded as,

"Fix these errors by guarding the runtime PM functions with CONFIG_PM"

> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>

With the changes,

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
> Changes in v2:
>   Guarding these functions with CONFIG_PM instead of selecting the config.
> 
>  drivers/ufs/host/ufs-mediatek.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
> index 21d9b047539f..73e217260390 100644
> --- a/drivers/ufs/host/ufs-mediatek.c
> +++ b/drivers/ufs/host/ufs-mediatek.c
> @@ -1613,6 +1613,7 @@ static int ufs_mtk_system_resume(struct device *dev)
>  }
>  #endif
>  
> +#ifdef CONFIG_PM
>  static int ufs_mtk_runtime_suspend(struct device *dev)
>  {
>  	struct ufs_hba *hba = dev_get_drvdata(dev);
> @@ -1635,6 +1636,7 @@ static int ufs_mtk_runtime_resume(struct device *dev)
>  
>  	return ufshcd_runtime_resume(dev);
>  }
> +#endif
>  
>  static const struct dev_pm_ops ufs_mtk_pm_ops = {
>  	SET_SYSTEM_SLEEP_PM_OPS(ufs_mtk_system_suspend,
> -- 
> 2.27.0
> 

-- 
மணிவண்ணன் சதாசிவம்

