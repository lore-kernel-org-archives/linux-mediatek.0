Return-Path: <SRS0=+cmX=FW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A73FC4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 06:09:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E58E23128
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 06:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E58E23128
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rNHzCxZIJKukEjljS9faLhBl9Q3yrhEuPGjGmBOTMCg=; b=mzkFKjJ/wB0EsRk17zeLumwao
	Ye6Mt4cZAmKJq4paMtuRjutEBvyyDJMttpJUoapBXPOK0LeqDML/TZ+xqRrRVTe0SL0PqIlp/oyTh
	U1nxUOGmlHpqjodTDAnKm12O/k5PcejV05jPwxocW+GOD6fbbf7moh5FQ1Gf7ov7RJonCZkA9tXqU
	5DnKk+gEBYZJKgxV0lGCD5c8mcuFTDuzg1XsxeSMImWnDYAGozrNp84cS0WqjrokXBiKV4mQTALzJ
	I768tOcw8W9HNnPrF2P16Ibss8LTNx+gusVWTvssTgBGp6+GaXIO1m8a1dZfSgj8ChXqNvsbpNWzz
	R04FG5hhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq8xA-0005wW-2b; Fri, 18 Dec 2020 06:09:24 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq8x7-0005w2-Jd
 for linux-mediatek@lists.infradead.org; Fri, 18 Dec 2020 06:09:23 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608271762; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wvH4HZDno0lJ1hR1mOD7hwlzls6bXIAXkA0JtzPzJ6o=;
 b=i2Nc29qFpU8NsbJ0/fmDgTa1WhRisUJkGssXQOnXnlUraJ9YWTSgT/Z6Tdgd5KCxfTLRtGUb
 AKod5TCgaCb5QbzzhEC41Wzaw5YQALkyZ1cFZS+XlUMiW8QcmEFTpXyTPDNu1Ntt1eYuEinC
 Nl1M07baF/j2kYTd3w78Ei/VieM=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fdc478c0564dfefcd00fcce (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Dec 2020 06:09:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EBEC0C43464; Fri, 18 Dec 2020 06:09:15 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 195D2C433C6;
 Fri, 18 Dec 2020 06:09:15 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 18 Dec 2020 14:09:15 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v2 2/4] scsi: ufs: Remove redundant null checking of
 devfreq instance
In-Reply-To: <20201216131639.4128-3-stanley.chu@mediatek.com>
References: <20201216131639.4128-1-stanley.chu@mediatek.com>
 <20201216131639.4128-3-stanley.chu@mediatek.com>
Message-ID: <06d27572bb06ed44e914b830201b2e45@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_010922_647622_5FC0989A 
X-CRM114-Status: GOOD (  14.88  )
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

Reviewed-by: Can Guo <cang@codeaurora.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
