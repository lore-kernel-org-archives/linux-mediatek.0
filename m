Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19A2C352A2
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 11:10:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B53BB20720
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 11:10:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="chCKOYfB";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="ExunBnU+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B53BB20720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ok0Y4VJnQzbYtsIR8FRtN6cgWGi1Gx7D3k6qU4UsSRI=; b=chCKOYfB7Tv+Ui+MkkW1lmH3W
	GIZNZOp3kUeKyVKq0PHSXeBlqnXk5HVY9FLlQiBT/sx6hvkNPV+sxnivR+m6efFBiO82ePta9xJ6x
	VLA9UOJ1PL2DZUZWXLYKvq02AyU2vUoqEkgxKnW/x9//pdcg+myAFR10tzm4I60DElWT+TlYN9h0d
	FyINOzBjwSrs0No5X4qx1lc+cciLa7E5QWr+HdR/u3mRwNTXa6haKt1rTR0NKSkbCWTEoPTeAebAu
	NgmWRetjtwTC5yDw+BYJRzIy4S6ULJIIBKF8s1D/BfX803/gmMLxV4bshqoj2vH+K20wqBF0LfJSI
	jRwWuWsIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j01X1-0000AD-7C; Fri, 07 Feb 2020 11:10:43 +0000
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j01Wd-0008A6-T8
 for linux-mediatek@lists.infradead.org; Fri, 07 Feb 2020 11:10:22 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1581073819; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=7o3Bx8idpRAfBDQOr2DuJKKzpjZVKD4J1cykxS7PZ38=;
 b=ExunBnU+1eVyu/vIOCFj+G+RT5Qf58WM9FvjObAMk0DlC7lJ9qG9pyLRknKj8UukVQCuVX1o
 VJOQ5+XzB64XKezzm066WvvIlyW3+5EoyI9APC+vq4Yug28FT6epHY4z6Q8Ku/SD1+Aj9/BS
 +NqM4h1YZZjdTj4Hhqvn3LuGwlc=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3d4597.7f52f16557d8-smtp-out-n01;
 Fri, 07 Feb 2020 11:10:15 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A61C0C447A2; Fri,  7 Feb 2020 11:10:15 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 48752C43383;
 Fri,  7 Feb 2020 11:10:14 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 07 Feb 2020 19:10:14 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1 2/2] scsi: ufs: introduce common function to disable
 host TX LCC
In-Reply-To: <20200207070357.17169-3-stanley.chu@mediatek.com>
References: <20200207070357.17169-1-stanley.chu@mediatek.com>
 <20200207070357.17169-3-stanley.chu@mediatek.com>
Message-ID: <fedd167b5cd8b5dcfc107b48c0770b6a@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_031020_079257_ED41FC77 
X-CRM114-Status: GOOD (  14.86  )
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

On 2020-02-07 15:03, Stanley Chu wrote:
> Many vendors would like to disable host TX LCC during initialization
> flow. Introduce a common function for all users to make drivers easier 
> to
> read and maintained. This patch does not change any functionality.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>

Reviewed-by: Can Guo <cang@codeaurora.org>

> ---
>  drivers/scsi/ufs/cdns-pltfrm.c  | 2 +-
>  drivers/scsi/ufs/ufs-hisi.c     | 2 +-
>  drivers/scsi/ufs/ufs-mediatek.c | 2 +-
>  drivers/scsi/ufs/ufs-qcom.c     | 4 +---
>  drivers/scsi/ufs/ufshcd-pci.c   | 2 +-
>  drivers/scsi/ufs/ufshcd.h       | 5 +++++
>  6 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/cdns-pltfrm.c 
> b/drivers/scsi/ufs/cdns-pltfrm.c
> index 56a6a1ed5ec2..da065a259f6e 100644
> --- a/drivers/scsi/ufs/cdns-pltfrm.c
> +++ b/drivers/scsi/ufs/cdns-pltfrm.c
> @@ -192,7 +192,7 @@ static int cdns_ufs_link_startup_notify(struct 
> ufs_hba *hba,
>  	 * and device TX LCC are disabled once link startup is
>  	 * completed.
>  	 */
> -	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_LOCAL_TX_LCC_ENABLE), 0);
> +	ufshcd_disable_host_tx_lcc(hba);
> 
>  	/*
>  	 * Disabling Autohibern8 feature in cadence UFS
> diff --git a/drivers/scsi/ufs/ufs-hisi.c b/drivers/scsi/ufs/ufs-hisi.c
> index 5d6487350a6c..074a6a055a4c 100644
> --- a/drivers/scsi/ufs/ufs-hisi.c
> +++ b/drivers/scsi/ufs/ufs-hisi.c
> @@ -235,7 +235,7 @@ static int ufs_hisi_link_startup_pre_change(struct
> ufs_hba *hba)
>  	ufshcd_writel(hba, reg, REG_AUTO_HIBERNATE_IDLE_TIMER);
> 
>  	/* Unipro PA_Local_TX_LCC_Enable */
> -	ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(0x155E, 0x0), 0x0);
> +	ufshcd_disable_host_tx_lcc(hba);
>  	/* close Unipro VS_Mk2ExtnSupport */
>  	ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(0xD0AB, 0x0), 0x0);
>  	ufshcd_dme_get(hba, UIC_ARG_MIB_SEL(0xD0AB, 0x0), &value);
> diff --git a/drivers/scsi/ufs/ufs-mediatek.c 
> b/drivers/scsi/ufs/ufs-mediatek.c
> index 8f73c860f423..9d05962feb15 100644
> --- a/drivers/scsi/ufs/ufs-mediatek.c
> +++ b/drivers/scsi/ufs/ufs-mediatek.c
> @@ -318,7 +318,7 @@ static int ufs_mtk_pre_link(struct ufs_hba *hba)
>  	 * to make sure that both host and device TX LCC are disabled
>  	 * once link startup is completed.
>  	 */
> -	ret = ufshcd_dme_set(hba, UIC_ARG_MIB(PA_LOCAL_TX_LCC_ENABLE), 0);
> +	ret = ufshcd_disable_host_tx_lcc(hba);
>  	if (ret)
>  		return ret;
> 
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index c69c29a1ceb9..c2e703d58f63 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -554,9 +554,7 @@ static int ufs_qcom_link_startup_notify(struct 
> ufs_hba *hba,
>  		 * completed.
>  		 */
>  		if (ufshcd_get_local_unipro_ver(hba) != UFS_UNIPRO_VER_1_41)
> -			err = ufshcd_dme_set(hba,
> -					UIC_ARG_MIB(PA_LOCAL_TX_LCC_ENABLE),
> -					0);
> +			err = ufshcd_disable_host_tx_lcc(hba);
> 
>  		break;
>  	case POST_CHANGE:
> diff --git a/drivers/scsi/ufs/ufshcd-pci.c 
> b/drivers/scsi/ufs/ufshcd-pci.c
> index 3b19de3ae9a3..8f78a8151499 100644
> --- a/drivers/scsi/ufs/ufshcd-pci.c
> +++ b/drivers/scsi/ufs/ufshcd-pci.c
> @@ -44,7 +44,7 @@ static int ufs_intel_disable_lcc(struct ufs_hba *hba)
> 
>  	ufshcd_dme_get(hba, attr, &lcc_enable);
>  	if (lcc_enable)
> -		ufshcd_dme_set(hba, attr, 0);
> +		ufshcd_disable_host_tx_lcc(hba);
> 
>  	return 0;
>  }
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index 81c71a3e3474..8f516b205c32 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -914,6 +914,11 @@ static inline bool ufshcd_is_hs_mode(struct
> ufs_pa_layer_attr *pwr_info)
>  		pwr_info->pwr_tx == FASTAUTO_MODE);
>  }
> 
> +static inline int ufshcd_disable_host_tx_lcc(struct ufs_hba *hba)
> +{
> +	return ufshcd_dme_set(hba, UIC_ARG_MIB(PA_LOCAL_TX_LCC_ENABLE), 0);
> +}
> +
>  /* Expose Query-Request API */
>  int ufshcd_query_descriptor_retry(struct ufs_hba *hba,
>  				  enum query_opcode opcode,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
