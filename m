Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA1AC64E90
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 23:54:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 395DC206E9
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 23:54:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mb9aw0o4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="gBMEdCil"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 395DC206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TTXIP+pQIAgAVz+Il0eS+ImXMLejym89QmMg8b1lWtw=; b=Mb9aw0o40tQR/v9FKaGPObgwd
	6jPyHentsryokRvlySZRhcktOJ9whQeyPmlFkGHBdjf6b+MwJWtFGud8HpUXGGgaQHVMuhYpbCBc9
	ql+DMI3gZIHV0BspAZk/OUcxDP3bYivzhk6W3ZOqV+1HK8jnWHEkfvWWzvU1BTNdgLXn0ZlgDq918
	fCfBAw4HCpe+VnzY5ZficK64PthXdIabUKYrzDNAXpDegiUoE390Jy+bO2lxdKAqxxSscQnKOVsmr
	3ARF6aP5yUZeW69d7N/42lPcQBpbCJshmpkECtHKn8RJcuwx36L7BI07P0s3Iip5q1eUfjVRefHqu
	Yt9xSnK9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjt04-0004JU-Kq; Mon, 30 Nov 2020 23:54:32 +0000
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjt01-0004JA-Ob
 for linux-mediatek@lists.infradead.org; Mon, 30 Nov 2020 23:54:31 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606780470; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Anjw9xAl+I8GM2JabR+FePP4NW00fcO2jMQF31wcAEE=;
 b=gBMEdCilSE0+J5gPoQKVktioc93ybDSQ/Lw/7DdnS4V4lioZWiHQdXc3XQ0hsWjvewSlDkKR
 p85M7ONgLU8jznmdyI6EpEyyEb4O/5LaxIpYUyHzCuSHHOgKQ0R/HrAulXVVoc035qY+0hPh
 Siz4a0ktHMyGbRBQ+RG9QMwxLRI=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fc5863051762b1886dbff95 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 30 Nov 2020 23:54:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 98959C433C6; Mon, 30 Nov 2020 23:54:23 +0000 (UTC)
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 29D16C43460;
 Mon, 30 Nov 2020 23:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 29D16C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [RFC PATCH v1] scsi: ufs: Remove pre-defined initial VCC voltage
 values
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20201130091610.2752-1-stanley.chu@mediatek.com>
 <568660cd-80e6-1b8f-d426-4614c9159ff4@codeaurora.org>
 <X8V83T+Tx6teNLOR@builder.lan>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <4335d590-0506-d920-8e7f-f0f0372780f9@codeaurora.org>
Date: Mon, 30 Nov 2020 15:54:20 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <X8V83T+Tx6teNLOR@builder.lan>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_185430_450670_D77FA594 
X-CRM114-Status: GOOD (  27.86  )
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
Cc: nguyenb@codeaurora.org, matthias.bgg@gmail.com, cang@codeaurora.org,
 alim.akhtar@samsung.com, beanhuo@micron.com, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, peter.wang@mediatek.com, cc.chou@mediatek.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 avri.altman@wdc.com, linux-mediatek@lists.infradead.org,
 jiajie.hao@mediatek.com, Stanley Chu <stanley.chu@mediatek.com>,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 martin.petersen@oracle.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, alice.chao@mediatek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/30/2020 3:14 PM, Bjorn Andersson wrote:
> On Mon 30 Nov 16:51 CST 2020, Asutosh Das (asd) wrote:
> 
>> On 11/30/2020 1:16 AM, Stanley Chu wrote:
>>> UFS specficication allows different VCC configurations for UFS devices,
>>> for example,
>>> 	(1). 2.70V - 3.60V (By default)
>>> 	(2). 1.70V - 1.95V (Activated if "vcc-supply-1p8" is declared in
>>>                             device tree)
>>> 	(3). 2.40V - 2.70V (Supported since UFS 3.x)
>>>
>>> With the introduction of UFS 3.x products, an issue is happening that
>>> UFS driver will use wrong "min_uV/max_uV" configuration to toggle VCC
>>> regulator on UFU 3.x products with VCC configuration (3) used.
>>>
>>> To solve this issue, we simply remove pre-defined initial VCC voltage
>>> values in UFS driver with below reasons,
>>>
>>> 1. UFS specifications do not define how to detect the VCC configuration
>>>      supported by attached device.
>>>
>>> 2. Device tree already supports standard regulator properties.
>>>
>>> Therefore VCC voltage shall be defined correctly in device tree, and
>>> shall not be changed by UFS driver. What UFS driver needs to do is simply
>>> enabling or disabling the VCC regulator only.
>>>
>>> This is a RFC conceptional patch. Please help review this and feel
>>> free to feedback any ideas. Once this concept is accepted, and then
>>> I would post a more completed patch series to fix this issue.
>>>
>>> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
>>> ---
>>>    drivers/scsi/ufs/ufshcd-pltfrm.c | 10 +---------
>>>    1 file changed, 1 insertion(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c b/drivers/scsi/ufs/ufshcd-pltfrm.c
>>> index a6f76399b3ae..3965be03c136 100644
>>> --- a/drivers/scsi/ufs/ufshcd-pltfrm.c
>>> +++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
>>> @@ -133,15 +133,7 @@ static int ufshcd_populate_vreg(struct device *dev, const char *name,
>>>    		vreg->max_uA = 0;
>>>    	}
>>> -	if (!strcmp(name, "vcc")) {
>>> -		if (of_property_read_bool(np, "vcc-supply-1p8")) {
>>> -			vreg->min_uV = UFS_VREG_VCC_1P8_MIN_UV;
>>> -			vreg->max_uV = UFS_VREG_VCC_1P8_MAX_UV;
>>> -		} else {
>>> -			vreg->min_uV = UFS_VREG_VCC_MIN_UV;
>>> -			vreg->max_uV = UFS_VREG_VCC_MAX_UV;
>>> -		}
>>> -	} else if (!strcmp(name, "vccq")) {
>>> +	if (!strcmp(name, "vccq")) {
>>>    		vreg->min_uV = UFS_VREG_VCCQ_MIN_UV;
>>>    		vreg->max_uV = UFS_VREG_VCCQ_MAX_UV;
>>>    	} else if (!strcmp(name, "vccq2")) {
>>>
>>
>> Hi Stanley
>>
>> Thanks for the patch. Bao (nguyenb) was also working towards something
>> similar.
>> Would it be possible for you to take into account the scenario in which the
>> same platform supports both 2.x and 3.x UFS devices?
>>
>> These've different voltage requirements, 2.4v-3.6v.
>> I'm not sure if standard dts regulator properties can support this.
>>
> 
> What is the actual voltage requirement for these devices and how does
> the software know what voltage to pick in this range?
> 
> Regards,
> Bjorn
> 
>> -asd
>>
>>
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> Linux Foundation Collaborative Project

For platforms that support both 2.x (2.7v-3.6v) and 3.x (2.4v-2.7v), the 
voltage requirements (Vcc) are 2.4v-3.6v. The software initializes the 
ufs device at 2.95v & reads the version and if the device is 3.x, it may 
do the following:
- Set the device power mode to SLEEP
- Disable the Vcc
- Enable the Vcc and set it to 2.5v
- Set the device power mode to ACTIVE

All of the above may be done at HS-G1 & moved to max supported gear 
based on the device version, perhaps?

Am open to other ideas though.

-asd

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
