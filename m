Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83432C4332D
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 14:54:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45A3E23602
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 14:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45A3E23602
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sFNRBTWaY2nbW5bVLaxiLVyZB2m6f2WJgguykQdsv6E=; b=kjUqXEUZPa6X8YgllcApcw5ok
	VvqzbptbfBKXi4cJqcl1yG2Svn/Qj4RPhoMwyCah54cmQ69BQ2QNGmXUAkAWyXX6UaZYUyjvQBAPj
	r/0PWsiCpEhWq0nOzrs0pvzCKhRNrP19THgGllLDWAJCnR63/gUVVYxGV9yGDoeWnWI8OIbz4HsCA
	bw7ZS+AlG7KsONXid22aHL6gIKAkch/2A4uycX+Cu7/1J4ejz08KBDwQWRM+q+/Jud+ydoI928snl
	95XUXLLiRjPnL1ML7WC/jphgSqHjN7SbmlbrqdSukJfKocyVmd9G8rtfdiomtfHJRpGc2hbLlTsQ/
	orQucpNvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzhWu-0004dW-Tz; Wed, 13 Jan 2021 14:53:48 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzhWm-0004bR-Ep; Wed, 13 Jan 2021 14:53:45 +0000
IronPort-SDR: 1cbT6aTAJEGUavQXEG28Y1gT9D/p3gEbSGHatYY0PQisyBtc6Jie8584eOGfFArAnRaLkZFx96
 J1Q9nkg+FA/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="165886842"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="165886842"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 06:53:34 -0800
IronPort-SDR: HzcL5yAEpBEgCs+I1a3Zyi5Mnl2vl1gGIreeiUkOSjuip/oBB8/sf2Kxd+FjwuXfwLRcW93BGq
 vCRseHr1fwrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="464925238"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.149])
 ([10.237.72.149])
 by fmsmga001.fm.intel.com with ESMTP; 13 Jan 2021 06:53:29 -0800
Subject: Re: [PATCH v4 2/2] scsi: ufs: Protect PM ops and err_handler from
 user access through sysfs
To: Can Guo <cang@codeaurora.org>, asutoshd@codeaurora.org,
 nguyenb@codeaurora.org, hongwus@codeaurora.org, rnayak@codeaurora.org,
 linux-scsi@vger.kernel.org, kernel-team@android.com, saravanak@google.com,
 salyzyn@google.com
References: <1610546230-14732-1-git-send-email-cang@codeaurora.org>
 <1610546230-14732-3-git-send-email-cang@codeaurora.org>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <b32a2064-4ff9-509c-cdaf-434264837917@intel.com>
Date: Wed, 13 Jan 2021 16:53:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1610546230-14732-3-git-send-email-cang@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_095340_650588_3A2EA6A6 
X-CRM114-Status: GOOD (  18.60  )
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
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Nitin Rawat <nitirawa@codeaurora.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 open list <linux-kernel@vger.kernel.org>, Satya Tangirala <satyat@google.com>,
 Avri Altman <avri.altman@wdc.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 13/01/21 3:57 pm, Can Guo wrote:
> User layer may access sysfs nodes when system PM ops or error handling
> is running, which can cause various problems. Rename eh_sem to host_sem
> and use it to protect PM ops and error handling from user layer intervene.
> 
> Acked-by: Avri Altman <avri.altman@wdc.com>
> Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufs-sysfs.c | 106 ++++++++++++++++++++++++++++++++++++-------
>  drivers/scsi/ufs/ufshcd.c    |  42 ++++++++++-------
>  drivers/scsi/ufs/ufshcd.h    |  10 +++-
>  3 files changed, 125 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-sysfs.c b/drivers/scsi/ufs/ufs-sysfs.c
> index 0e14384..7cafffc 100644
> --- a/drivers/scsi/ufs/ufs-sysfs.c
> +++ b/drivers/scsi/ufs/ufs-sysfs.c
> @@ -154,18 +154,29 @@ static ssize_t auto_hibern8_show(struct device *dev,
>  				 struct device_attribute *attr, char *buf)
>  {
>  	u32 ahit;
> +	int ret;
>  	struct ufs_hba *hba = dev_get_drvdata(dev);
>  
>  	if (!ufshcd_is_auto_hibern8_supported(hba))
>  		return -EOPNOTSUPP;
>  
> +	down(&hba->host_sem);
> +	if (!ufshcd_is_sysfs_allowed(hba)) {

I expect debugfs has the same potential problem, so maybe
ufshcd_is_sysfs_allowed() is not quite the right name.

> +		ret = -EBUSY;
> +		goto out;
> +	}
> +

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
