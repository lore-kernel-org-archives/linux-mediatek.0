Return-Path: <SRS0=B1Xv=2P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27905C2D0DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Dec 2019 08:19:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC86120643
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Dec 2019 08:18:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qYHhUgbW";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="Y8WfRtI1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC86120643
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VQZZD1//9ynnANH+zDsI0J9pZ0SKwUXSley9chj/QiI=; b=qYHhUgbW5gei1tpLHhrVj1Qkg
	dahm1BxYi3fNNLqMoAvF7G490/Sj7qVcqG2zeIV8tz5CvBIE4D2dGyztW6592C6NAaHa3WZmlfSpv
	CHWgtrpvN1irXWDhSLZunKL/7D6hcY3YmNBQmoUQVNTVgDcOYUcTZRinm0DHd6dp7ENMOvuGNPcKn
	q6EtbQyCwsU1kTihH5rTqwWfyq15RJlo0gEUcCLSlbP0edWKTAG6oUzoVXt9/UuueLLH1SLiEbl+l
	07lfRP1x5tzFc60YIoZGeRRJIW49bqjPhHLzkZTvjCo9TxBXn2eZ72+3qw20O0DmYpXCkD+twcph4
	/0Ide61KQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ik1sV-0002zL-H7; Wed, 25 Dec 2019 08:18:47 +0000
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ik1sS-0002xo-V7
 for linux-mediatek@lists.infradead.org; Wed, 25 Dec 2019 08:18:46 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1577261921; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=RiSbEYGAd8tj1/i8Rgfcv4ZB+PqlDH70iICtBq7Oqs8=;
 b=Y8WfRtI1bFPlfi2TyKByKH6+ZVmDndy10bsuSL1ne59lgmJcuQQhhfMy0nCG9E35cxnvRUEJ
 dGy3JDRl21fmTeS8QXPGY8XlLB26u4YjhM1Cw2r/GTrzAL/L7aelZOx6siBFmah1iCaQB2x2
 860xyT5NMb4+c0RB4M/KwwQp3bc=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e031b5b.7fc28e2781b8-smtp-out-n01;
 Wed, 25 Dec 2019 08:18:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 439B6C4479F; Wed, 25 Dec 2019 08:18:35 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 90274C433CB;
 Wed, 25 Dec 2019 08:18:34 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 25 Dec 2019 16:18:34 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1 2/2] scsi: ufs: use ufshcd_vops_dbg_register_dump for
 vendor specific dumps
In-Reply-To: <1577192466-20762-3-git-send-email-stanley.chu@mediatek.com>
References: <1577192466-20762-1-git-send-email-stanley.chu@mediatek.com>
 <1577192466-20762-3-git-send-email-stanley.chu@mediatek.com>
Message-ID: <bcd1f1aa6bcc94951f1f52de9d4b0e38@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191225_001845_062865_BBE51819 
X-CRM114-Status: GOOD (  12.27  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, pedrom.sousa@synopsys.com,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2019-12-24 21:01, Stanley Chu wrote:
> We already have ufshcd_vops_dbg_register_dump() thus all
> "hba->vops->dbg_register_dump" references can be replaced by it.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufshcd.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index b6b9665..1ac9272 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -428,8 +428,7 @@ static void ufshcd_print_host_regs(struct ufs_hba 
> *hba)
> 
>  	ufshcd_print_clk_freqs(hba);
> 
> -	if (hba->vops && hba->vops->dbg_register_dump)
> -		hba->vops->dbg_register_dump(hba);
> +	ufshcd_vops_dbg_register_dump(hba);
>  }
> 
>  static

Reviewed-by: Can Guo <cang@codeaurora.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
