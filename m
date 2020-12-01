Return-Path: <SRS0=+qQs=FF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D015C64E7B
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 16:44:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A6DE206B7
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 16:44:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="InRsM1aH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="hIHS9byH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A6DE206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XocOBNW82TBI17nFdRRjgPx1IPqVu2t84dGoVqhm69k=; b=InRsM1aHldwnSBsrPvCjuod1x
	Hn/bG41PFUVC/V4BpBQsqwP+dk0KvYlAlLmx+QZT7A2tEFWRGUJGdHinNgxG7/pVOrCAQXQcbZkGq
	7aLSC9AUmSWfIz249fOictJhXrAqIkgqRMsS/L+2m5s9jFduwhmrSMt+HQ5HA19wmQiS0WtdItytD
	JrQUm4AolmFWa5MqzSKvD23wXllcPprNISSTqYF27LWFQOmpE1HNDLVmT3fcBJ2FrD5HQyXTZz4WB
	k5meAKkChaiEz8HneVAQrByGxS/Dx0bitYVl75ln3tdupwywpey+V6YRAQfy7d8GmOZCUdvTn51bK
	AfhmNYrVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk8kq-0002MN-M2; Tue, 01 Dec 2020 16:43:52 +0000
Received: from a2.mail.mailgun.net ([198.61.254.61])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk8kl-0002LH-G0
 for linux-mediatek@lists.infradead.org; Tue, 01 Dec 2020 16:43:49 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606841028; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=J4NInOiSsOXx9djpu9n6TUdGlG96H46ZcKWid9CcFaU=;
 b=hIHS9byHEQmiWbeIdCP6HVpYeZgnsg5e4W7aE4ZypHVNy/n5A6K9/cyn+lj132LZuWRyxEWY
 qHa3YgJr4spgYgBlV5apTktbMbIUs4ep6AqE9a2hGqXMjHnSev25ngzDSsug6R5KhTV/0AEY
 C7nB2ibes0PXpnPPPeyBv5ceQDg=
X-Mailgun-Sending-Ip: 198.61.254.61
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fc672b4f2eedd9084f18488 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Dec 2020 16:43:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 26097C43461; Tue,  1 Dec 2020 16:43:31 +0000 (UTC)
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9D80AC433ED;
 Tue,  1 Dec 2020 16:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9D80AC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v2] scsi: ufs: Remove pre-defined initial voltage values
 of device powers
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
References: <20201201065114.1001-1-stanley.chu@mediatek.com>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <1ad24257-70cd-b16a-6ad4-c6705189a0e6@codeaurora.org>
Date: Tue, 1 Dec 2020 08:43:27 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201201065114.1001-1-stanley.chu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_114349_030242_C66A613E 
X-CRM114-Status: GOOD (  27.68  )
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
Cc: alice.chao@mediatek.com, bvanassche@acm.org, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, nguyenb@codeaurora.org, jiajie.hao@mediatek.com,
 cang@codeaurora.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com, bjorn.andersson@linaro.org,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/30/2020 10:51 PM, Stanley Chu wrote:
> UFS specficication allows different VCC configurations for UFS devices,
> for example,
> 	(1). 2.70V - 3.60V (Activated by default in UFS core driver)
> 	(2). 1.70V - 1.95V (Activated if "vcc-supply-1p8" is declared in
>                            device tree)
> 	(3). 2.40V - 2.70V (Supported since UFS 3.x)
> 
> With the introduction of UFS 3.x products, an issue is happening that
> UFS driver will use wrong "min_uV-max_uV" values to configure the
> voltage of VCC regulator on UFU 3.x products with the configuration (3)
> used.
> 
> To solve this issue, we simply remove pre-defined initial VCC voltage
> values in UFS core driver with below reasons,
> 
> 1. UFS specifications do not define how to detect the VCC configuration
>     supported by attached device.
> 
> 2. Device tree already supports standard regulator properties.
> 
> Therefore VCC voltage shall be defined correctly in device tree, and
> shall not changed by UFS driver. What UFS driver needs to do is simply
> enable or disable the VCC regulator only.
> 
> Similar change is applied to VCCQ and VCCQ2 as well.
> 
> Note that we keep struct ufs_vreg unchanged. This is allow vendors to
> configure proper min_uV and max_uV of any regulators to make
> regulator_set_voltage() works during regulator toggling flow.
> Without specific vendor configurations, min_uV and max_uV will be NULL
> by default and UFS core driver will enable or disable the regulator
> only without adjusting its voltage.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---

Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>

>   drivers/scsi/ufs/ufshcd-pltfrm.c | 16 ----------------
>   1 file changed, 16 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c b/drivers/scsi/ufs/ufshcd-pltfrm.c
> index a6f76399b3ae..09e2f04bf4f6 100644
> --- a/drivers/scsi/ufs/ufshcd-pltfrm.c
> +++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
> @@ -133,22 +133,6 @@ static int ufshcd_populate_vreg(struct device *dev, const char *name,
>   		vreg->max_uA = 0;
>   	}
>   
> -	if (!strcmp(name, "vcc")) {
> -		if (of_property_read_bool(np, "vcc-supply-1p8")) {
> -			vreg->min_uV = UFS_VREG_VCC_1P8_MIN_UV;
> -			vreg->max_uV = UFS_VREG_VCC_1P8_MAX_UV;
> -		} else {
> -			vreg->min_uV = UFS_VREG_VCC_MIN_UV;
> -			vreg->max_uV = UFS_VREG_VCC_MAX_UV;
> -		}
> -	} else if (!strcmp(name, "vccq")) {
> -		vreg->min_uV = UFS_VREG_VCCQ_MIN_UV;
> -		vreg->max_uV = UFS_VREG_VCCQ_MAX_UV;
> -	} else if (!strcmp(name, "vccq2")) {
> -		vreg->min_uV = UFS_VREG_VCCQ2_MIN_UV;
> -		vreg->max_uV = UFS_VREG_VCCQ2_MAX_UV;
> -	}
> -
>   	goto out;
>   
>   out:
> 


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
