Return-Path: <SRS0=Wwml=5N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC9DC43331
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Mar 2020 02:31:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF4E5206F6
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Mar 2020 02:31:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GkQn0rNr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="Hq3jHHmP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF4E5206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JO5T6LKGeEF61ZQan/P3iGwJnzup0x4kIQ3Zb0NM3aU=; b=GkQn0rNrigfBr21q6fYodl8Bi
	LyaotQU5KKZHa6e5YZ/h04KLUUD0ZOg99iCZodiDpfSQsrZbXxnStWxRZq4jSgUkmkh0tA6dGdJgG
	u9wAcwlbTItu82GCzmrMS98/I+f6a3i74ocw/ePgMy2VVcJIy+lUfrmflCe4t/+jDOqtS/mX78+7D
	iz1FUe5QFzU9gbUow5ixVFho4Z0jwoLG/VevDysRNb+sVPzA9zDzDyWdlMSQJefUgAsJ53b9GUfR5
	flP28Fkf7OzD7r7TkbgWRbt5amKJXfJ8rcUCxOW580f4pc0j+38ehhf/KSuA5MFaTDTqTpD4C0GTq
	Ah3XzUrSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jI1G4-0001Vo-1p; Sat, 28 Mar 2020 02:31:36 +0000
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jI1Fu-0001Ow-1l
 for linux-mediatek@lists.infradead.org; Sat, 28 Mar 2020 02:31:28 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585362686; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Of5ocX2I8A4I7iRsteJ/OLVXwTCgwzzL3AIvQdlsXYI=;
 b=Hq3jHHmPXTvLI3zzKF/DAWkZmVDeHVA5y1iMEgqFvkEgkP7uOWz7G+u0OM9g84DM2YnhY8c+
 J8aGow8WuacUNUOSK23d0a5NQXTeyTuxZadmmNxLwXyxMBCS7eAIzn3USjAnz2hSjLoGWupa
 tTp2GeaelSVWmImXb0JfmgcJcE4=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7eb6e1.7fcbd6496960-smtp-out-n04;
 Sat, 28 Mar 2020 02:30:57 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 86A4AC44788; Sat, 28 Mar 2020 02:30:56 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EA983C433D2;
 Sat, 28 Mar 2020 02:30:54 +0000 (UTC)
MIME-Version: 1.0
Date: Sat, 28 Mar 2020 10:30:54 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1 1/1] scsi: ufs: set device as active power mode after
 resetting device
In-Reply-To: <d5096a58cce94669fef459834134ffab@codeaurora.org>
References: <20200327095835.10293-1-stanley.chu@mediatek.com>
 <d5096a58cce94669fef459834134ffab@codeaurora.org>
Message-ID: <354de5d2a3bc4d19d2972885fa9189d1@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_193126_963105_B2619E3D 
X-CRM114-Status: GOOD (  12.47  )
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

Hi Stanley,

On 2020-03-28 10:14, Can Guo wrote:
> On 2020-03-27 17:58, Stanley Chu wrote:
>> Currently ufshcd driver assumes that bInitPowerMode parameter
>> is not changed by any vendors thus device power mode can be set as
>> "Active" during initialization.
>> 
>> According to UFS JEDEC specification, device power mode shall be
>> "Active" after HW Reset is triggered if the bInitPowerMode parameter
>> in Device Descriptor is default value.
>> 
>> By above description, we can set device power mode as "Active" after
>> device reset is triggered by vendor's callback. With this change,
>> the link startup performance can be improved in some cases
>> by not setting link_startup_again as true in ufshcd_link_startup().
>> 
>> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
>> ---
>>  drivers/scsi/ufs/ufshcd.c | 13 -------------
>>  drivers/scsi/ufs/ufshcd.h | 14 ++++++++++++++
>>  2 files changed, 14 insertions(+), 13 deletions(-)
>> 
>> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
>> index 227660a1a446..f0a35b289b7c 100644
>> --- a/drivers/scsi/ufs/ufshcd.c
>> +++ b/drivers/scsi/ufs/ufshcd.c
>> @@ -171,19 +171,6 @@ enum {
>>  #define ufshcd_clear_eh_in_progress(h) \
>>  	((h)->eh_flags &= ~UFSHCD_EH_IN_PROGRESS)
>> 
>> -#define ufshcd_set_ufs_dev_active(h) \
>> -	((h)->curr_dev_pwr_mode = UFS_ACTIVE_PWR_MODE)
>> -#define ufshcd_set_ufs_dev_sleep(h) \
>> -	((h)->curr_dev_pwr_mode = UFS_SLEEP_PWR_MODE)
>> -#define ufshcd_set_ufs_dev_poweroff(h) \
>> -	((h)->curr_dev_pwr_mode = UFS_POWERDOWN_PWR_MODE)
>> -#define ufshcd_is_ufs_dev_active(h) \
>> -	((h)->curr_dev_pwr_mode == UFS_ACTIVE_PWR_MODE)
>> -#define ufshcd_is_ufs_dev_sleep(h) \
>> -	((h)->curr_dev_pwr_mode == UFS_SLEEP_PWR_MODE)
>> -#define ufshcd_is_ufs_dev_poweroff(h) \
>> -	((h)->curr_dev_pwr_mode == UFS_POWERDOWN_PWR_MODE)
>> -
>>  struct ufs_pm_lvl_states ufs_pm_lvl_states[] = {
>>  	{UFS_ACTIVE_PWR_MODE, UIC_LINK_ACTIVE_STATE},
>>  	{UFS_ACTIVE_PWR_MODE, UIC_LINK_HIBERN8_STATE},
>> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
>> index b7bd81795c24..7a9d1d170719 100644
>> --- a/drivers/scsi/ufs/ufshcd.h
>> +++ b/drivers/scsi/ufs/ufshcd.h
>> @@ -129,6 +129,19 @@ enum uic_link_state {
>>  #define ufshcd_set_link_hibern8(hba) ((hba)->uic_link_state = \
>>  				    UIC_LINK_HIBERN8_STATE)
>> 
>> +#define ufshcd_set_ufs_dev_active(h) \
>> +	((h)->curr_dev_pwr_mode = UFS_ACTIVE_PWR_MODE)
>> +#define ufshcd_set_ufs_dev_sleep(h) \
>> +	((h)->curr_dev_pwr_mode = UFS_SLEEP_PWR_MODE)
>> +#define ufshcd_set_ufs_dev_poweroff(h) \
>> +	((h)->curr_dev_pwr_mode = UFS_POWERDOWN_PWR_MODE)
>> +#define ufshcd_is_ufs_dev_active(h) \
>> +	((h)->curr_dev_pwr_mode == UFS_ACTIVE_PWR_MODE)
>> +#define ufshcd_is_ufs_dev_sleep(h) \
>> +	((h)->curr_dev_pwr_mode == UFS_SLEEP_PWR_MODE)
>> +#define ufshcd_is_ufs_dev_poweroff(h) \
>> +	((h)->curr_dev_pwr_mode == UFS_POWERDOWN_PWR_MODE)
>> +
>>  /*
>>   * UFS Power management levels.
>>   * Each level is in increasing order of power savings.
>> @@ -1091,6 +1104,7 @@ static inline void
>> ufshcd_vops_device_reset(struct ufs_hba *hba)
>>  {
>>  	if (hba->vops && hba->vops->device_reset) {
>>  		hba->vops->device_reset(hba);
>> +		ufshcd_set_ufs_dev_active(hba);
>>  		ufshcd_update_reg_hist(&hba->ufs_stats.dev_reset, 0);
>>  	}
>>  }
> 
> Reviewed-by: Can Guo <cang@codeaurora.org>

I guess what you also want my patch -

"scsi: ufs: full reinit upon resume if link was off"

Please help review it, thanks.

Best regard,
Can Guo.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
