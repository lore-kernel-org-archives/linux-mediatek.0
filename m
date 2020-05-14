Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84B4C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 17:00:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8224B2065F
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 17:00:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IVO9rz+b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="ifAhqz83"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8224B2065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3f6IDmTEdnx/TXlZUGPi+Pb5CuERFcb6wkKbPGhu8BI=; b=IVO9rz+bl6jK1lf3qOT/dL84y
	z1XXTzrkHExi5HwSInZRzkZB5KmSXik8t2Z56F4PVg7J06iUHOawPgjy3XVqwaqxmEiy+FYbKuGw9
	I0X/7xrXibfUXga2MDXKtW+9ytau90WXTaCKBVjI/yvwKKGfk8UGO9kwtrP0XsssY4sXZlaZBHpC9
	+MxW8g1MJ2pNhG8lS54tAX934hK7r4SYz+Dv8Ak/fv3UWR8spGRCRWQ9qLuiOw1iKT+G6d85AQe7Q
	/8b+6XzAHzjbuI0yKplNz6vlGpC5wWxV9CeCeGOhIaSP7XZrPf2hOneOr2vwOR3t5BjanUub5xo2J
	yAA6LH/AQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZHDS-0006eM-KB; Thu, 14 May 2020 17:00:15 +0000
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZHD2-0005R4-CL
 for linux-mediatek@lists.infradead.org; Thu, 14 May 2020 16:59:55 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1589475591; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0otaf4UY3NXJ4Hsxvlo2D2szfdAn1HRad9eqi5t7VMo=;
 b=ifAhqz83bw74/TsgGCymtMO6WIBBJyQMli11LdnUZb4la9AX1P9kqvNZFk8lwYIXe5JXF/Br
 4SyoBeryyggu1hMPPRH6qmktgj7es9J8bZ7Ydy4mdOhHq7ROa2S9oUK2HiHy4406KERVV/OI
 MccY2SrbD9JydrFSTr8TI1FDG68=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebd78ed.7f31d9fdde30-smtp-out-n02;
 Thu, 14 May 2020 16:59:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E0B02C44793; Thu, 14 May 2020 16:59:22 +0000 (UTC)
Received: from [192.168.8.150] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 441F1C433F2;
 Thu, 14 May 2020 16:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 441F1C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v1 4/4] scsi: ufs: Fix WriteBooster flush during runtime
 suspend
To: Stanley Chu <stanley.chu@mediatek.com>
References: <20200512104750.8711-1-stanley.chu@mediatek.com>
 <20200512104750.8711-5-stanley.chu@mediatek.com>
 <725d057c-2379-710e-287f-ac11a59c08bc@codeaurora.org>
 <1589423030.3197.94.camel@mtkswgap22> <1589467766.3197.100.camel@mtkswgap22>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <f26eec65-7591-fd98-bd17-d90267333637@codeaurora.org>
Date: Thu, 14 May 2020 09:59:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1589467766.3197.100.camel@mtkswgap22>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_095951_214852_5D9CEC91 
X-CRM114-Status: GOOD (  32.31  )
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
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "Andy Teng \($B{}G!9\(\(B\)" <Andy.Teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "bvanassche@acm.org" <bvanassche@acm.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 5/14/2020 7:49 AM, Stanley Chu wrote:
> Hi Asutosh,
> 
> On Thu, 2020-05-14 at 10:23 +0800, Stanley Chu wrote:
>> Hi Asutosh,
>>
>> On Wed, 2020-05-13 at 12:31 -0700, Asutosh Das (asd) wrote:
>>> On 5/12/2020 3:47 AM, Stanley Chu wrote:
>>>> Currently UFS host driver promises VCC supply if UFS device
>>>> needs to do WriteBooster flush during runtime suspend.
>>>>
>>>> However the UFS specification mentions,
>>>>
>>>> "While the flushing operation is in progress, the device is
>>>> in Active power mode."
>>>>
>>>> Therefore UFS host driver needs to promise more: Keep UFS
>>>> device as "Active power mode", otherwise UFS device shall not
>>>> do any flush if device enters Sleep or PowerDown power mode.
>>>>
>>>> Fix this by not changing device power mode if WriteBooster
>>>> flush is required in ufshcd_suspend().
>>>>
>>>> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
>>>> ---
>>>>    drivers/scsi/ufs/ufs.h    |  1 -
>>>>    drivers/scsi/ufs/ufshcd.c | 39 +++++++++++++++++++--------------------
>>>>    2 files changed, 19 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/drivers/scsi/ufs/ufs.h b/drivers/scsi/ufs/ufs.h
>>>> index b3135344ab3f..9e4bc2e97ada 100644
>>>> --- a/drivers/scsi/ufs/ufs.h
>>>> +++ b/drivers/scsi/ufs/ufs.h
>>>> @@ -577,7 +577,6 @@ struct ufs_dev_info {
>>>>    	u32 d_ext_ufs_feature_sup;
>>>>    	u8 b_wb_buffer_type;
>>>>    	u32 d_wb_alloc_units;
>>>> -	bool keep_vcc_on;
>>>>    	u8 b_presrv_uspc_en;
>>>>    };
>>>>    
>>>> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
>>>> index 169a3379e468..2d0aff8ac260 100644
>>>> --- a/drivers/scsi/ufs/ufshcd.c
>>>> +++ b/drivers/scsi/ufs/ufshcd.c
>>>> @@ -8101,8 +8101,7 @@ static void ufshcd_vreg_set_lpm(struct ufs_hba *hba)
>>>>    	    !hba->dev_info.is_lu_power_on_wp) {
>>>>    		ufshcd_setup_vreg(hba, false);
>>>>    	} else if (!ufshcd_is_ufs_dev_active(hba)) {
>>>> -		if (!hba->dev_info.keep_vcc_on)
>>>> -			ufshcd_toggle_vreg(hba->dev, hba->vreg_info.vcc, false);
>>>> +		ufshcd_toggle_vreg(hba->dev, hba->vreg_info.vcc, false);
>>>>    		if (!ufshcd_is_link_active(hba)) {
>>>>    			ufshcd_config_vreg_lpm(hba, hba->vreg_info.vccq);
>>>>    			ufshcd_config_vreg_lpm(hba, hba->vreg_info.vccq2);
>>>> @@ -8172,6 +8171,7 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>>>>    	enum ufs_pm_level pm_lvl;
>>>>    	enum ufs_dev_pwr_mode req_dev_pwr_mode;
>>>>    	enum uic_link_state req_link_state;
>>>> +	bool keep_curr_dev_pwr_mode = false;
>>>>    
>>>>    	hba->pm_op_in_progress = 1;
>>>>    	if (!ufshcd_is_shutdown_pm(pm_op)) {
>>>> @@ -8226,28 +8226,27 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>>>>    			/* make sure that auto bkops is disabled */
>>>>    			ufshcd_disable_auto_bkops(hba);
>>>>    		}
>>>> +
>>> Unnecessary newline, perhaps?
>>
>> Yap, I will remove it in next version.
>>
>>>>    		/*
>>>> -		 * With wb enabled, if the bkops is enabled or if the
>>>> -		 * configured WB type is 70% full, keep vcc ON
>>>> -		 * for the device to flush the wb buffer
>>>> +		 * If device needs to do BKOP or WB buffer flush, keep device
>>>> +		 * power mode as "active power mode" and its VCC supply.
>>>>    		 */
>>>> -		if ((hba->auto_bkops_enabled && ufshcd_is_wb_allowed(hba)) ||
>>>> -		    ufshcd_wb_keep_vcc_on(hba))
>>>> -			hba->dev_info.keep_vcc_on = true;
>>>> -		else
>>>> -			hba->dev_info.keep_vcc_on = false;
>>>> -	} else {
>>>> -		hba->dev_info.keep_vcc_on = false;
>>>> +		keep_curr_dev_pwr_mode = hba->auto_bkops_enabled ||
>>>> +			ufshcd_wb_keep_vcc_on(hba);
>>> Should the device be in UFS_ACTIVE_PWR_MODE to perform auto-bkops?
>>>
>>> Also, is it needed to keep the device in UFS_ACTIVE_PWR_MODE , if flush
>>> on hibern8 is enabled and the link is being put to hibern8 mode during
>>> runtime-suspend? Perhaps that should also be factored in here?
>>
>> Both auto-bkops and WriteBooster flush during Hibern8 need device power
>> mode to be "Active Power Mode".
>>
>> For auto-bkops, the spec mentions,
>>
>> "If the background operations enable bit is set and the device is in
>> Active power mode or Idle power mode, then the device is allowed to
>> execute any internal operations."
>>
>> For WriteBooster flush during Hibern8, the spec mentions,
>>
>> "While the flushing operation is in progress, the device is in Active
>> power mode."
>>
>> Therefore here we can use an unified "keep_curr_dev_pwr_mode" to
>> indicate the same requirements of above both features.
>>
>> Besides, both operations may access flash array inside UFS device thus
>> VCC supply shall be also kept.
>>
>> Before this patch, the original code will keep device power mode (stay
>> in Active Power Mode) if hba->auto_bkops_enabled is set as true during
>> runtime-suspend with UFSHCD_CAP_AUTO_BKOPS_SUSPEND capability is
>> enabled. This patch will not change this decision, just add
>> "WriteBooster flush during Hibern8" feature as another condition to do
>> so.
>>
>> Thank you so much to remind me that "Link shall be put in Hibern8" is a
>> necessary condition for "WriteBooster flush during Hibern8". I will add
>> more checking for keep_curr_dev_pwr_mode to prevent unnecessary power
>> drain.
>>
>>>>    	}
>>>>    
>>>> -	if ((req_dev_pwr_mode != hba->curr_dev_pwr_mode) &&
>>>> -	    ((ufshcd_is_runtime_pm(pm_op) && !hba->auto_bkops_enabled) ||
>>>> -	    !ufshcd_is_runtime_pm(pm_op))) {
>>>> -		/* ensure that bkops is disabled */
>>>> -		ufshcd_disable_auto_bkops(hba);
>>>> -		ret = ufshcd_set_dev_pwr_mode(hba, req_dev_pwr_mode);
>>>> -		if (ret)
>>>> -			goto enable_gating;
>>>> +	if (req_dev_pwr_mode != hba->curr_dev_pwr_mode) {
>>>> +		if ((ufshcd_is_runtime_pm(pm_op) && !hba->auto_bkops_enabled) ||
>>>> +		    !ufshcd_is_runtime_pm(pm_op)) {
>>>> +			/* ensure that bkops is disabled */
>>>> +			ufshcd_disable_auto_bkops(hba);
>>>> +		}
>>>> +
>>>> +		if (!keep_curr_dev_pwr_mode) {
>>>> +			ret = ufshcd_set_dev_pwr_mode(hba, req_dev_pwr_mode);
>>>
>>> Now, when the WB buffer is completely flushed out, the device should be
>>> put back into UFS_SLEEP_PWR_MODE or UFS_POWERDOWN_PWR_MODE. Say, the
>>> device buffer has to be flushed and during runtime-suspend, the device
>>> is put to UFS_ACTIVE_PWR_MODE and Vcc is kept ON; the device doesn't
>>> resume nor does the system enters suspend for a very long time, and with
>>> AH8 and hibern8 disabled, there will be an unnecessary power drain for
>>> that much time.
> 
> Another thought is that if keep_curr_dev_pwr_mode will be set as true
> only if link is put in Hibern8 or Auto-Hibern8 is enabled. By this way,
> the power consumption shall be very small after flush or auto-bkop is
> finished.
> 
> Then the checking of flush status during runtime-suspend may be not
> necessary.
> 
>>>
>>> How about a periodic interval checking of flush status if
>>> keep_curr_dev_pwr_mode evaluates to be true?
>>
>> This is a good point!
>>
>> The same thing also happens for auto-bkops. How about add a timer to
>> leave runtime suspend if keep_curr_dev_pwr_mode is set as true? This is
>> simple and also favors power. The timeout value could be adjustable
>> according to the available WriteBooster buffer size.
>>
>> A periodic interval checking of flush status needs to re-activate link
>> to communicate with the device. This would be tricky and the
>> re-activation flow is just like runtime-resume.
>>
>> What would you think?
>>
>> Thanks.
>> Stanley Chu
>>
>>
>> _______________________________________________
>> Linux-mediatek mailing list
>> Linux-mediatek@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 

Hi Stanley,
I think that'd work, but there's definitely a penalty of keeping Vcc ON.
And if we do want to keep it ON, then we'd have to measure how much 
excess power is being used - after the flush is done.

I think setting keep_curr_dev_pwr_mode to true iff h8 and ah8 are 
enabled is a good idea. In addition to that, adding a timer to check 
flush status if keep_curr_dev_pwr_mode is set to true would keep the 
power consumption to a minimum. So I suggest to have the delayed check 
of flush status as well.

Thanks,
-asd

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
