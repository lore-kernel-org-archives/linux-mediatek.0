Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F06AC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 00:48:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE91123370
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 00:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE91123370
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=86QcVYr0Vs6CEgiz0XkEgG5djT4p6bpYt8KV2tClQBs=; b=rm9CVhJ7skFRtKS58LJKajtUE
	PX2IOIxlsKQDxgUCOOrJt2D+aoL7LAymkfk1lkBTWUuDDJWENZSBeVSxAP8+/+jmqlJke4ggfa9jt
	sUpQgDCAHd16nEdZ11o20ULsEBkdpoeo+VZDxtWg96bx4HZs8UGDbUhu85TzhYeVtt5UCcaBd+kkl
	EB52UGlt5BafpCWc7LMPc0B9x8eGGY+MqRXbF0uMyYzatizybI2unYph1RdWwjL81q/8a/DKrCV8h
	rwZn+UvbryjVQrukMAl8t92lGhgfy8/C/z6hAm7yr+npORHYaCXYQnRrQlQD5g1sOBmz5oLPCHjRk
	o7nfXTtzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzqoF-0002V1-QG; Thu, 14 Jan 2021 00:48:19 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzqoC-0002Tu-1X
 for linux-mediatek@lists.infradead.org; Thu, 14 Jan 2021 00:48:17 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610585296; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=kslj8Wj8U87VV6ybtvsgQSgYNIBVEXh0ztirzXBMiJ0=;
 b=Kxmm5u+0G1MA79xLuiJkc/AN1xOw9e2c/fAAq86P4+gkkJ0km/v9GxRsGjO8Izm7ar+YM6eS
 kl5HI9GFAFpek7CUTkSV2xrFCIfxBRCedvQfKl8kkXvH/AXJP70Qc3M7SEk8HrFfTHpQCol2
 Bw2JsD1w5jI9R9jq69ij/H9QQA0=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fff94c82a47972bcc009945 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 Jan 2021 00:48:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E18A7C43464; Thu, 14 Jan 2021 00:48:07 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C32BC433C6;
 Thu, 14 Jan 2021 00:48:06 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 14 Jan 2021 08:48:06 +0800
From: Can Guo <cang@codeaurora.org>
To: Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH v4 2/2] scsi: ufs: Protect PM ops and err_handler from
 user access through sysfs
In-Reply-To: <b32a2064-4ff9-509c-cdaf-434264837917@intel.com>
References: <1610546230-14732-1-git-send-email-cang@codeaurora.org>
 <1610546230-14732-3-git-send-email-cang@codeaurora.org>
 <b32a2064-4ff9-509c-cdaf-434264837917@intel.com>
Message-ID: <6908e7103529d12fd6ca0e5fa696b4bc@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_194816_394508_07BC65F5 
X-CRM114-Status: GOOD (  15.35  )
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
Cc: "moderated list:ARM/Mediatek SoC
 support" <linux-arm-kernel@lists.infradead.org>, Bean Huo <beanhuo@micron.com>,
 rnayak@codeaurora.org, saravanak@google.com, linux-scsi@vger.kernel.org,
 Nitin Rawat <nitirawa@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, nguyenb@codeaurora.org,
 Satya Tangirala <satyat@google.com>, Avri Altman <avri.altman@wdc.com>,
 "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 salyzyn@google.com, Alim Akhtar <alim.akhtar@samsung.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, kernel-team@android.com,
 hongwus@codeaurora.org, asutoshd@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2021-01-13 22:53, Adrian Hunter wrote:
> On 13/01/21 3:57 pm, Can Guo wrote:
>> User layer may access sysfs nodes when system PM ops or error handling
>> is running, which can cause various problems. Rename eh_sem to 
>> host_sem
>> and use it to protect PM ops and error handling from user layer 
>> intervene.
>> 
>> Acked-by: Avri Altman <avri.altman@wdc.com>
>> Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
>> Signed-off-by: Can Guo <cang@codeaurora.org>
>> ---
>>  drivers/scsi/ufs/ufs-sysfs.c | 106 
>> ++++++++++++++++++++++++++++++++++++-------
>>  drivers/scsi/ufs/ufshcd.c    |  42 ++++++++++-------
>>  drivers/scsi/ufs/ufshcd.h    |  10 +++-
>>  3 files changed, 125 insertions(+), 33 deletions(-)
>> 
>> diff --git a/drivers/scsi/ufs/ufs-sysfs.c 
>> b/drivers/scsi/ufs/ufs-sysfs.c
>> index 0e14384..7cafffc 100644
>> --- a/drivers/scsi/ufs/ufs-sysfs.c
>> +++ b/drivers/scsi/ufs/ufs-sysfs.c
>> @@ -154,18 +154,29 @@ static ssize_t auto_hibern8_show(struct device 
>> *dev,
>>  				 struct device_attribute *attr, char *buf)
>>  {
>>  	u32 ahit;
>> +	int ret;
>>  	struct ufs_hba *hba = dev_get_drvdata(dev);
>> 
>>  	if (!ufshcd_is_auto_hibern8_supported(hba))
>>  		return -EOPNOTSUPP;
>> 
>> +	down(&hba->host_sem);
>> +	if (!ufshcd_is_sysfs_allowed(hba)) {
> 
> I expect debugfs has the same potential problem, so maybe
> ufshcd_is_sysfs_allowed() is not quite the right name.

I noticed your debugfs change - currently it is only printing
error counts recorded in hba struct, which is fine.
Even in this patch, the check is only added for those entries
which need to talk with HW. Sysfs nodes like show/store rpm/spm_lvl
does not need this check.

Thanks,
Can Guo.

> 
>> +		ret = -EBUSY;
>> +		goto out;
>> +	}
>> +

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
