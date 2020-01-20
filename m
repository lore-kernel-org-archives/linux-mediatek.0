Return-Path: <SRS0=AjBH=3J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35652C32771
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 20:52:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F173522522
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 20:52:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="onUpYebo";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="DoBBimC8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F173522522
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LmyK7CQ7ns856sGOnX8BCf5fkVIAaXQVzb7FNK5cGk4=; b=onUpYeboohEQtAz7+6TBvgxgH
	ZZUezGrHuhRXqXfsMn1LqjHyEiy/pWpUZvKdpmXUmcURwgpjTAyCrRXR6oo96ajsMwiyRs9scBAXw
	0k0AnMr0skeof7j9nZBk0QZN/G/WqQnwlAR/jQP1oAfl1iVSj5pakDDE7zBMFm3Agm5gMxtF75jzt
	t4tF9r2F6ber+fuCcph7i/vy+EYg4dwSD5qpZrnQkeAAmpJfetBk5e4J/QKI0+lyhjIE5G07RI5jY
	DWMh7B3A8qio4fofhkWRhfwMAvv1QRxNATDjhI11WyHcFDv8JhyEuut9z0t+tVwpoGinbg5E1Uxuq
	7VNFJxx1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ite2B-000186-Cs; Mon, 20 Jan 2020 20:52:31 +0000
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ite24-0000zH-T2
 for linux-mediatek@lists.infradead.org; Mon, 20 Jan 2020 20:52:26 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1579553545; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=/F/P/PamSf53/0NktI+vEIZjO2L7dILbSNYBUNX/1aI=;
 b=DoBBimC86L77ZDVQVIT+RW4lGLACCn8hlRzCszNWcWc/HUrjvuzwCNW0x1vEsyERAbvnDYOM
 pqrf5nW8yPdpQepVjGzggoktBhjd5T1wz8PHs+NokQKPta8P75AIVI1AsmPTICVwzm0OH+gw
 mf9mkiXHtGv1xM1x4dxWX+5yID0=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e261304.7fe176a441f0-smtp-out-n03;
 Mon, 20 Jan 2020 20:52:20 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8E223C4479F; Mon, 20 Jan 2020 20:52:19 +0000 (UTC)
Received: from [10.46.161.159] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E6EB9C433CB;
 Mon, 20 Jan 2020 20:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E6EB9C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v1 3/3] scsi: ufs-mediatek: enable low-power mode for
 hibern8 state
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
References: <20200117035108.19699-1-stanley.chu@mediatek.com>
 <20200117035108.19699-4-stanley.chu@mediatek.com>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <38b2614d-1fdd-8bad-63a1-e9bc5698cc66@codeaurora.org>
Date: Mon, 20 Jan 2020 12:52:17 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200117035108.19699-4-stanley.chu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_125225_299043_321E5EE2 
X-CRM114-Status: GOOD (  19.44  )
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 1/16/2020 7:51 PM, Stanley Chu wrote:
> In MediaTek Chipsets, UniPro link and ufshci can enter proprietary
> low-power mode while link is in hibern8 state.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---

Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>

>   drivers/scsi/ufs/ufs-mediatek.c | 53 +++++++++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
> 
> diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
> index d5194d0c4ef5..f32f3f34f6d0 100644
> --- a/drivers/scsi/ufs/ufs-mediatek.c
> +++ b/drivers/scsi/ufs/ufs-mediatek.c
> @@ -382,11 +382,60 @@ static void ufs_mtk_device_reset(struct ufs_hba *hba)
>   	dev_info(hba->dev, "device reset done\n");
>   }
>   
> +static int ufs_mtk_link_set_hpm(struct ufs_hba *hba)
> +{
> +	int err;
> +
> +	err = ufshcd_hba_enable(hba);
> +	if (err)
> +		return err;
> +
> +	err = ufshcd_dme_set(hba,
> +			     UIC_ARG_MIB_SEL(VS_UNIPROPOWERDOWNCONTROL, 0),
> +			     0);
> +	if (err)
> +		return err;
> +
> +	err = ufshcd_uic_hibern8_exit(hba);
> +	if (!err)
> +		ufshcd_set_link_active(hba);
> +	else
> +		return err;
> +
> +	err = ufshcd_make_hba_operational(hba);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +static int ufs_mtk_link_set_lpm(struct ufs_hba *hba)
> +{
> +	int err;
> +
> +	err = ufshcd_dme_set(hba,
> +			     UIC_ARG_MIB_SEL(VS_UNIPROPOWERDOWNCONTROL, 0),
> +			     1);
> +	if (err) {
> +		/* Resume UniPro state for following error recovery */
> +		ufshcd_dme_set(hba,
> +			       UIC_ARG_MIB_SEL(VS_UNIPROPOWERDOWNCONTROL, 0),
> +			       0);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
>   static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>   {
> +	int err;
>   	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
>   
>   	if (ufshcd_is_link_hibern8(hba)) {
> +		err = ufs_mtk_link_set_lpm(hba);
> +		if (err)
> +			return -EAGAIN;
>   		phy_power_off(host->mphy);
>   		ufs_mtk_setup_ref_clk(hba, false);
>   	}
> @@ -397,10 +446,14 @@ static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>   static int ufs_mtk_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>   {
>   	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
> +	int err;
>   
>   	if (ufshcd_is_link_hibern8(hba)) {
>   		ufs_mtk_setup_ref_clk(hba, true);
>   		phy_power_on(host->mphy);
> +		err = ufs_mtk_link_set_hpm(hba);
> +		if (err)
> +			return err;
>   	}
>   
>   	return 0;
> 


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
