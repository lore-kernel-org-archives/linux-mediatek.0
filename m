Return-Path: <SRS0=+cmX=FW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9186AC4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 05:58:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18AC023A63
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 05:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18AC023A63
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C/3UZioXmhUkdcWGgX5Xftxnm3bg0LhVpbIGmYvAZh0=; b=kke69uuE2WTJJePiyEXPoo9+a
	skRZmEbJOpPJ/tnp0aGR2OT6umxkeyVsyrhx7EGCbBzOSJwhTBeGoghBEaS2+k+LlESE0eY5JCwxW
	sF/DAvddPbFCjEvDTd2W4SbrDh8NSUFFaNo3Z6bh2HmVmCULuKhRAlpO3nfg0WtQC4cYTv6qjiZNh
	QMq8F1iAFSh6wg7qwrhTAQ+SI2Amb7wN50lweICr5BIb64qfCvs553RVMCDZtQkeglQ+dczK2om1j
	RNgaP6hsQGcm21GID5yB/N9UeO50uQiqkD6Zh5WizZUZlAI1E86zdKrUPC0EWzA959jmRxJwHqXM/
	J2CTYKylQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq8mN-0005GJ-8L; Fri, 18 Dec 2020 05:58:15 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq8mK-0005Fw-DT
 for linux-mediatek@lists.infradead.org; Fri, 18 Dec 2020 05:58:13 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608271091; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=v417IjGYwt35O1w5OS2PXV+iuMpPkHV54/TeKwYE8Kw=;
 b=cwaKsn4kbOT3IMj5jfoX57lGnRirKWAzolgireV5JnZA6g/fjGX4LeHwNXVCWbmqdrCk83Dv
 tyrwBElrG6Y8X+Mm5ty2eDcXdW5mydCnlhukrqelCF6YDgMnqt9RrmSYVj1phSFfw3jfMPZy
 D02v6IiQ7CxzVk5yaLiqGJrE1Ns=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5fdc44f275ab652e87ae6f10 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Dec 2020 05:58:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BCC03C43465; Fri, 18 Dec 2020 05:58:07 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6423CC433CA;
 Fri, 18 Dec 2020 05:58:06 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 18 Dec 2020 13:58:06 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v2 2/4] scsi: ufs: Remove redundant null checking of
 devfreq instance
In-Reply-To: <20201216131639.4128-3-stanley.chu@mediatek.com>
References: <20201216131639.4128-1-stanley.chu@mediatek.com>
 <20201216131639.4128-3-stanley.chu@mediatek.com>
Message-ID: <185dca66fbfd881d80f74dacf453aa9f@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_005812_491669_DF5D0A6B 
X-CRM114-Status: GOOD (  15.11  )
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
Cc: jiajie.hao@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, andy.teng@mediatek.com, jejb@linux.ibm.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cc.chou@mediatek.com, avri.altman@wdc.com,
 alice.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 asutoshd@codeaurora.org, chaotian.jing@mediatek.com, bvanassche@acm.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-12-16 21:16, Stanley Chu wrote:
> hba->devfreq is zero-initialized thus it is not required
> to check its existence in ufshcd_add_lus() function which
> is invoked during initialization only.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufshcd.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index a91b73a1fc48..9cc16598136d 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -7636,15 +7636,13 @@ static int ufshcd_add_lus(struct ufs_hba *hba)
>  			&hba->pwr_info,
>  			sizeof(struct ufs_pa_layer_attr));
>  		hba->clk_scaling.saved_pwr_info.is_valid = true;
> -		if (!hba->devfreq) {

Just FYI, checking this was due to consideration for supporting UFS 
cards
which can do hot-plug. But UFS cards seems out of the picture for a long 
time.
Anyways, if someday UFS cards come back in future, let's add these 
checks back again.

Thanks,

Can Guo.

> -			hba->clk_scaling.is_allowed = true;
> -			ret = ufshcd_devfreq_init(hba);
> -			if (ret)
> -				goto out;
> +		hba->clk_scaling.is_allowed = true;
> +		ret = ufshcd_devfreq_init(hba);
> +		if (ret)
> +			goto out;
> 
> -			hba->clk_scaling.is_enabled = true;
> -			ufshcd_clkscaling_init_sysfs(hba);
> -		}
> +		hba->clk_scaling.is_enabled = true;
> +		ufshcd_clkscaling_init_sysfs(hba);
>  	}
> 
>  	ufs_bsg_probe(hba);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
