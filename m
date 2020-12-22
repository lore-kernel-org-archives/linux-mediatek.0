Return-Path: <SRS0=m1jb=F2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDC2C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 11:34:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B097123124
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 11:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B097123124
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7CQx0S/87T6RsHybxjKpbZ34rxT3vBhQwAf5o5+3PH8=; b=gAO5LZdrztZX5No5doabq+8IU
	AKmRxwnsyKbSJa8nMNWG2ul3qhXL2OKyXho4PYTK0tgVJHwva0/1UA9i6iJg11DJ3d1LcFubqLNPX
	hHzABXQzJCz/tbZBZYrbuU+E1WtRiuhN8qZ4bhMvw4JdvbvwIAmuIbDDxKOxuT49Vu3oTSc2rGDBY
	sbMGP3k0RuNk980dSGW9nqRPuEqmXmCmQkQEUg5MjnLTtOIF80CP2j7Aij1t/sre99Jrds6i+G5CX
	fxitiYR1ObYQ2/nLxkgXmLHJpE9VC0Bu3zufxXfnCqgPl/uDow73p4Q8lwP/TJi+/JV2bIIsV6L78
	eqnA+NweA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krfvo-00049Q-Mx; Tue, 22 Dec 2020 11:34:20 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krfvj-00040Z-Dk
 for linux-mediatek@lists.infradead.org; Tue, 22 Dec 2020 11:34:18 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608636858; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=CGuxgbpv0qWFddC98LkeZGfeYaVURHqEjzHXuReTvxw=;
 b=T3LolI2VvIujuBTQkJ0p9WMP4sAAWW6lHZMQGt8n5ol/n3zX8+ZEHY4R2vGsTcY7GjmHoc57
 VxvR7u4HIiXRBJ0B2IDaKpmDcUcmf/7/hCIVzpVlXHikTI9NwoGZBzlAhkwKdpvDkjGwgsDL
 sx6G4fgjTBDLGYD/OkSWAKHA8qE=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fe1d9afcfd94dd328491194 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Dec 2020 11:34:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 14374C43463; Tue, 22 Dec 2020 11:34:07 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 49C85C433C6;
 Tue, 22 Dec 2020 11:34:06 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 22 Dec 2020 19:34:06 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v2 2/2] scsi: ufs: Relax the condition of
 UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL
In-Reply-To: <20201222072905.32221-3-stanley.chu@mediatek.com>
References: <20201222072905.32221-1-stanley.chu@mediatek.com>
 <20201222072905.32221-3-stanley.chu@mediatek.com>
Message-ID: <948718782f2a1f82b3c6de964a37f8ac@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_063418_180724_5527A21B 
X-CRM114-Status: GOOD (  16.37  )
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

On 2020-12-22 15:29, Stanley Chu wrote:
> UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL is aimed to skip enabling
> fWriteBoosterBufferFlushEn while WriteBooster is initializing.
> Therefore it is better to apply the checking during WriteBooster
> initialization only.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufshcd.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 9d61dc3eb842..e50b19925236 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -289,7 +289,8 @@ static inline void ufshcd_wb_config(struct ufs_hba 
> *hba)
>  	if (ret)
>  		dev_err(hba->dev, "%s: En WB flush during H8: failed: %d\n",
>  			__func__, ret);
> -	ufshcd_wb_toggle_flush(hba, true);
> +	if (!(hba->quirks & UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL))
> +		ufshcd_wb_toggle_flush(hba, true);
>  }
> 
>  static void ufshcd_scsi_unblock_requests(struct ufs_hba *hba)
> @@ -5401,9 +5402,6 @@ static int
> ufshcd_wb_toggle_flush_during_h8(struct ufs_hba *hba, bool set)
> 
>  static inline void ufshcd_wb_toggle_flush(struct ufs_hba *hba, bool 
> enable)
>  {
> -	if (hba->quirks & UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL)
> -		return;
> -
>  	if (enable)
>  		ufshcd_wb_buf_flush_enable(hba);
>  	else

Thanks for the change, I was thinking about the same.

Reviewed-by: Can Guo <cang@codeaurora.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
