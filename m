Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B85C35254
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 12:58:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA65A20578
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 12:58:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g4Vp/358";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="MIxw0PcT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA65A20578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f2Dbay0EyIgAuMY/j65mahXOD7E3bHCRH/08xCulEWo=; b=g4Vp/358+2HDvIsNczyh9v4wr
	OYPnqKasWTU04hSoVjGaJXbQL+dTtxJF5Gs9KZyAE7i1AWuKKTzxY9AgMMxYB12nV3roXOANjP6HK
	XGypdqPIrufFN6SeKbTF41GHtOQJ9zN2YduHhv9jF4Pz0yd6RkINhO5suzoZE+6sNcbS3N1tcRNyK
	euPTpZdtFOnxPYz2OiNNPYfObjxgwdf0ojQS/OKvDW3FwBkIVtqtU2Mnge0APtxkNqetE82FcDHvL
	G5Si3t2Hp4tw/PrYV+9P9IdkrSzD7mS1YjiLOjtngrNM2WWS0UczkvOvpo1tzCl3bn9Vplgh5FFIk
	nqSQiGNZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3fz2-0008AJ-VV; Mon, 17 Feb 2020 12:58:44 +0000
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3fyi-0007v7-CM
 for linux-mediatek@lists.infradead.org; Mon, 17 Feb 2020 12:58:26 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1581944304; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=F6hhLqoUemqMuF73oXb4UEU9cz/dkxAFWWHo7Eh0TSQ=;
 b=MIxw0PcTVbatfgGCgiqkN+Sxy1SWbyAg/Yw/KagbOcQLqmECfGyOoJNQlSs+SWXOk6plUDm5
 dJ3yyrqhmsdEPBIXC5y0mlwTajbr+FCV6w6bQeXskARvVQJROekrsQZXpYUto1NZYmRGxkAN
 8hU/Co7pq54Tw3grWZQ5W8i/coE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4a8dee.7f5b2223c9d0-smtp-out-n03;
 Mon, 17 Feb 2020 12:58:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C662EC433A2; Mon, 17 Feb 2020 12:58:22 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E5411C4479D;
 Mon, 17 Feb 2020 12:58:20 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 17 Feb 2020 20:58:20 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1 1/2] scsi: ufs: add required delay after gating
 reference clock
In-Reply-To: <20200217093559.16830-2-stanley.chu@mediatek.com>
References: <20200217093559.16830-1-stanley.chu@mediatek.com>
 <20200217093559.16830-2-stanley.chu@mediatek.com>
Message-ID: <c6874825dd60ea04ed401fbd1b5cb568@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_045824_532219_EA9B28C9 
X-CRM114-Status: GOOD (  17.91  )
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
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, asutoshd@codeaurora.org,
 bvanassche@acm.org, linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-02-17 17:35, Stanley Chu wrote:
> In UFS version 3.0, a newly added attribute bRefClkGatingWaitTime 
> defines
> the minimum time for which the reference clock is required by device 
> during
> transition to LS-MODE or HIBERN8 state.
> 
> Currently this time is detected and stored in
> hba->dev_info.clk_gating_wait_us but applied to vendor implementatios 
> only.
> Make it applied to reference clock named as "ref_clk" in device tree in
> common path.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufshcd.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 744b8254220c..7f60721f54d1 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -7417,8 +7417,10 @@ static int __ufshcd_setup_clocks(struct ufs_hba
> *hba, bool on,
>  	struct ufs_clk_info *clki;
>  	struct list_head *head = &hba->clk_list_head;
>  	unsigned long flags;
> +	unsigned long wait_us;
>  	ktime_t start = ktime_get();
>  	bool clk_state_changed = false;
> +	bool ref_clk;
> 
>  	if (list_empty(head))
>  		goto out;
> @@ -7436,7 +7438,8 @@ static int __ufshcd_setup_clocks(struct ufs_hba
> *hba, bool on,
> 
>  	list_for_each_entry(clki, head, list) {
>  		if (!IS_ERR_OR_NULL(clki->clk)) {
> -			if (skip_ref_clk && !strcmp(clki->name, "ref_clk"))
> +			ref_clk = !strcmp(clki->name, "ref_clk") ? true : false;
> +			if (skip_ref_clk && ref_clk)
>  				continue;
> 
>  			clk_state_changed = on ^ clki->enabled;
> @@ -7449,6 +7452,9 @@ static int __ufshcd_setup_clocks(struct ufs_hba
> *hba, bool on,
>  				}
>  			} else if (!on && clki->enabled) {
>  				clk_disable_unprepare(clki->clk);
> +				wait_us = hba->dev_info.clk_gating_wait_us;
> +				if (ref_clk && wait_us)
> +					usleep_range(wait_us, wait_us + 10);

Hi Stanley,

If wait_us is 1us, it would be inappropriate to use usleep_range() here.
You have checks of the delay in patch #2, but why it is not needed here?

Thanks,
Can Guo.

>  			}
>  			clki->enabled = on;
>  			dev_dbg(hba->dev, "%s: clk: %s %sabled\n", __func__,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
