Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD2BC2D0C3
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 23:25:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D7B9206DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 23:25:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QGoNQ5kj";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="f3cUoSm0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D7B9206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2N4pk/OVx2Egdxb8zf/YBEgT2+tEq5YMjcO6Gi6tOnI=; b=QGoNQ5kjpspfYUu/ZPFjX4zRq
	HW3yw+mkkR5A0XTWp47AhPcHz1tjQAIX7CCowQdIbR2lY2tMTTevKfoOhZQaV6bo/Q2U3nHpuAPNY
	aaM/2YdboERlkOjyeIsPFqw7KbFuQ1EuFVzQOg0VI2nxzM/s9SnTljwH5is1zxDVn9IzCozwS58e8
	vgJtijGURORv/4WvVfBl5vOz7qhjQ5NqrngKEk0/pWQw7BLKlGoJG8L9OFhOFKBULlb0KCgw9owwE
	fuhsYX618NLmomIEcJwmL6K9SmzqXBoLb+U0Iyl0CJaCSDQyqaFkOHWq5he4TjnaL4/6PDdgPGnhq
	BAO3GgGZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1im4PV-0000FD-5e; Mon, 30 Dec 2019 23:25:17 +0000
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1im4PB-0007ET-Rv
 for linux-mediatek@lists.infradead.org; Mon, 30 Dec 2019 23:24:59 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1577748297; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=vBXvyWu/WmFpK3s/9QyjuCrueKEXWqV2Lek88cSNWSQ=;
 b=f3cUoSm0oeTnc+wYp/kPMhuVJ00VqBNQ1arvsjeTc1kuEtLatJiHPzk70Rad6h5uosE0O7tp
 oNGFq4LZHtQorAwRK0MjIWxIRM3/0NPJB/S2sQUTo5tvZ++O7JQ0rgbZVA+Y11ncUaZF5L1g
 iw2VJTxpNFhrCxTH8H7g58+9m5w=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0a8748.7f3b1a8a6d18-smtp-out-n03;
 Mon, 30 Dec 2019 23:24:56 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E7C68C447A2; Mon, 30 Dec 2019 23:24:55 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9A397C43383;
 Mon, 30 Dec 2019 23:24:54 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 30 Dec 2019 15:24:54 -0800
From: asutoshd@codeaurora.org
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1 1/2] scsi: ufs: set device as default active power mode
 during initialization only
In-Reply-To: <1577693546-7598-2-git-send-email-stanley.chu@mediatek.com>
References: <1577693546-7598-1-git-send-email-stanley.chu@mediatek.com>
 <1577693546-7598-2-git-send-email-stanley.chu@mediatek.com>
Message-ID: <fd129b859c013852bd80f60a36425757@codeaurora.org>
X-Sender: asutoshd@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_152457_965083_AE7632F5 
X-CRM114-Status: GOOD (  16.62  )
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
Cc: linux-scsi-owner@vger.kernel.org, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, subhashj@codeaurora.org, jejb@linux.ibm.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, avri.altman@wdc.com,
 cang@codeaurora.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, alim.akhtar@samsung.com, andy.teng@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, pedrom.sousa@synopsys.com,
 linux-arm-kernel@lists.infradead.org, bvanassche@acm.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Stanley,

On 2019-12-30 00:12, Stanley Chu wrote:
> Currently ufshcd_probe_hba() always sets device status as "active".
> This shall be by an assumption that device is already in active state
> during the boot stage before kernel.
> 
> However, if link is configured as "off" state and device is requested
> to enter "sleep" or "powerdown" power mode during suspend flow, device
> will NOT be waken up to "active" power mode during resume flow because
> device is already set as "active" power mode in ufhcd_probe_hba().
> 
> Fix it by setting device as default active power mode during
> initialization only, and skipping changing mode during PM flow
> in ufshcd_probe_hba().
> 
> Fixes: 7caf489b99a4 (scsi: ufs: issue link starup 2 times if device
> isn't active)
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Avri Altman <avri.altman@wdc.com>
> Cc: Bart Van Assche <bvanassche@acm.org>
> Cc: Bean Huo <beanhuo@micron.com>
> Cc: Can Guo <cang@codeaurora.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Subhash Jadavani <subhashj@codeaurora.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufshcd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index ed02a704c1c2..9abb7085a5d0 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -6986,7 +6986,8 @@ static int ufshcd_probe_hba(struct ufs_hba *hba)
>  	ufshcd_tune_unipro_params(hba);
> 
>  	/* UFS device is also active now */
> -	ufshcd_set_ufs_dev_active(hba);
> +	if (!hba->pm_op_in_progress)
> +		ufshcd_set_ufs_dev_active(hba);
>  	ufshcd_force_reset_auto_bkops(hba);
>  	hba->wlun_dev_clr_ua = true;

I see that there's a get_sync done before.
So, how would the suspend be triggered in that case?

Thanks,
asd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
