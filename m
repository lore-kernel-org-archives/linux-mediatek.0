Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF24C64ED6
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 07:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gW77Tu/gWHZPXXhmqyRuxP4yvuZwvDvx4jRK6VAIUE=; b=xMTfS+l62s1BPBXOW/YgAIEKPd
	Mm9Q13X2Ij6Yj0E6N5yA8DZjZYayGoel9jT6x2rMfbtHBtHz2fTIOTZOZnNI3zPcb1qAduj4TG4sL
	1lc1xUjdxTUBWKe3LRw7jDcqBZSIGx1JGXCaAzLrsezSyaf+WEY1VbY0+49HirYxYAI8yjtS5cfSP
	TanTQZUWD9I47Z8lJ+huCUa3yWoXGa9f0mvQMTCw0zYnjl93rdXqExNdgY2OR20eteFv0CszmDPWY
	Rg3mjre4waV1TYW20mdaYU7qJVv4L3f+98UG6Fj1Jhc0BIWgL6wDU8Y0AnEAgIJF3QKw1vSOlPAJ9
	0ff6gCOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXGf7-00FI9H-M1; Wed, 01 Mar 2023 07:14:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXGew-00FI6U-Dz; Wed, 01 Mar 2023 07:13:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 01C7B6120F;
	Wed,  1 Mar 2023 07:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF839C433EF;
	Wed,  1 Mar 2023 07:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677654833;
	bh=VVjtIw697MHFtpFrNzPIOtIoEgOIJZddjFWia0e2YOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jQh5G3TsD9+m7NKc2gLstYDmY+ly7VLc3LvgNlJavLbx6Bxw4FSG6ksAujPmJ1RiR
	 lIjIc0FAeZBztU0Wi9DyHdaTUm6EXn1YnYWa4GPuX9PHOZjXi1HET7mpbEyKfJKdoT
	 uw70lHntFfHjWczzJEwkVbI2kSQT7P44o6pAA2cgnYEozeRNu9MEr75cX6I/+emYUq
	 8lsU8XiSJ1HKRJqvdw3VAZtZmG0Jmzw8UESHu/YWoKy61Jj1/fwlcASgzpoeq/ALPx
	 Tow4DXnAOnoiMv78I6j6ybosnv9fbli4St2vEFMA4ssJwkdIT4pYV+paSzf32boAZm
	 I40b8HH2NOfXQ==
Date: Wed, 1 Mar 2023 12:43:43 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Po-Wen Kao <powen.kao@mediatek.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	wsd_upstream@mediatek.com, peter.wang@mediatek.com,
	stanley.chu@mediatek.com, alice.chao@mediatek.com,
	naomi.chu@mediatek.com, chun-hung.wu@mediatek.com,
	cc.chou@mediatek.com, eddie.huang@mediatek.com,
	mason.zhang@mediatek.com, chaotian.jing@mediatek.com,
	jiajie.hao@mediatek.com
Subject: Re: [PATCH v3 3/6] scsi: ufs: core: Fix mcq nr_hw_queues
Message-ID: <20230301071343.GC5409@thinkpad>
References: <20230223152757.13606-1-powen.kao@mediatek.com>
 <20230223152757.13606-4-powen.kao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230223152757.13606-4-powen.kao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_231354_532263_505BF8BE 
X-CRM114-Status: GOOD (  17.56  )
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

On Thu, Feb 23, 2023 at 11:27:53PM +0800, Po-Wen Kao wrote:
> Since MAXQ is 0 based value, add one to obtain number of hardware queue.
> 
> Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
>  drivers/ufs/core/ufs-mcq.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index a39746b2a8be..f9af658b4ba2 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -150,7 +150,8 @@ static int ufshcd_mcq_config_nr_queues(struct ufs_hba *hba)
>  	u32 hba_maxq, rem, tot_queues;
>  	struct Scsi_Host *host = hba->host;
>  
> -	hba_maxq = FIELD_GET(MAX_QUEUE_SUP, hba->mcq_capabilities);
> +	/* maxq is 0 based value */
> +	hba_maxq = FIELD_GET(MAX_QUEUE_SUP, hba->mcq_capabilities) + 1 ;
>  
>  	tot_queues = UFS_MCQ_NUM_DEV_CMD_QUEUES + read_queues + poll_queues +
>  			rw_queues;
> -- 
> 2.18.0
> 

-- 
மணிவண்ணன் சதாசிவம்

