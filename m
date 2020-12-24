Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668BCC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 15:35:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBD7D22288
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 15:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBD7D22288
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V75IFre4hOOEri5f9MEAEVdwlScmApl3RS9o9VoSXqg=; b=uzZea9bJ55nmJo0zzZ5AyhShA
	fc5KGXTar527EyY+keERPdPuilvKvnIj9hBcP8ZP2TWFompNYTw/hJfxinfmXItjrxCnZedZEVyYo
	yA2xKOO+nNzsle/ACeF6SMwSz1FCQ4Pdaw3R3cGOdyC48BtSs0JvQb5f1jzED9EpCc+tM5FuiPw7k
	+P9dA+I6sJpkjIPuDNsTuM9qcgbRy5AQpNUfAM/d2yby2Ll/O4cTgv0M108SNVW8USsfUSQCpG2o0
	vNbihK1Jnxr60yf0kDIRMLjmLWctvLeAtUIxd5AAQ+Ed/LfvxkQxoRG/9Z9ZiZXRLDp6f+Cw1ljrW
	o/Exj4RKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksSeI-0000Ad-Kn; Thu, 24 Dec 2020 15:35:30 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksSeF-0000AJ-AD
 for linux-mediatek@lists.infradead.org; Thu, 24 Dec 2020 15:35:28 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608824127; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=VGluNjS3T/ZWqL505uMVq04VIUqXt/4P8rnllpXsAv0=;
 b=aIb2+BALY+a4s1LQDay+8B13d+7F0zdksPjDp5KeFv4I0wgtozi6Kr4ICLqvrgmCy8Inur0j
 pM4JWA5omka2IqHBWvhNEX30F+nC2OjeFCriXlG4RN1fDa5oDsGTtoD3cCinQTH2f5MB0Gpl
 AL8nH3fINcVU05IPmO+BHdrR6mY=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fe4b534b00c0d7ad45121b7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Dec 2020 15:35:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9800EC43469; Thu, 24 Dec 2020 15:35:15 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: ziqichen)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 18068C433C6;
 Thu, 24 Dec 2020 15:35:13 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 24 Dec 2020 23:35:12 +0800
From: ziqichen@codeaurora.org
To: Avri Altman <Avri.Altman@wdc.com>
Subject: Re: [PATCH RFC v4 1/1] scsi: ufs: Fix ufs power down/on specs
 violation
In-Reply-To: <DM6PR04MB65751FC6D1ED61E569AC095EFCDE0@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
 <DM6PR04MB65751FC6D1ED61E569AC095EFCDE0@DM6PR04MB6575.namprd04.prod.outlook.com>
Message-ID: <da374355ecabc7b989882c5a503b916f@codeaurora.org>
X-Sender: ziqichen@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_103527_548616_E85C33AC 
X-CRM114-Status: GOOD (  25.91  )
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
Cc: nguyenb@codeaurora.org, cang@codeaurora.org,
 Alim Akhtar <alim.akhtar@samsung.com>, vinholikatti@gmail.com,
 Bean Huo <beanhuo@micron.com>, Satya Tangirala <satyat@google.com>,
 jejb@linux.vnet.ibm.com, Bart Van Assche <bvanassche@acm.org>,
 linux-scsi@vger.kernel.org, kwmad.kim@samsung.com,
 Andy Gross <agross@kernel.org>, kernel-team@android.com, salyzyn@google.com,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, stanley.chu@mediatek.com,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, rnayak@codeaurora.org,
 saravanak@google.com, martin.petersen@oracle.com,
 Adrian Hunter <adrian.hunter@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, hongwus@codeaurora.org,
 asutoshd@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-12-24 04:45, Avri Altman wrote:
> Hi,
>> 
>> As per specs, e.g, JESD220E chapter 7.2, while powering
>> off/on the ufs device, RST_N signal and REF_CLK signal
>> should be between VSS(Ground) and VCCQ/VCCQ2.
>> 
>> To flexibly control device reset line, refactor the function
>> ufschd_vops_device_reset(sturct ufs_hba *hba) to ufshcd_
>> vops_device_reset(sturct ufs_hba *hba, bool asserted). The
>> new parameter "bool asserted" is used to separate device reset
>> line pulling down from pulling up.
> Sorry for my late response.
> Please allow few more days to consult internally about this.
> 
>> 
>> Cc: Kiwoong Kim <kwmad.kim@samsung.com>
>> Cc: Stanley Chu <stanley.chu@mediatek.com>
>> Signed-off-by: Ziqi Chen <ziqichen@codeaurora.org>
> 
> 
>> -static int ufs_qcom_device_reset(struct ufs_hba *hba)
>> +static int ufs_qcom_device_reset(struct ufs_hba *hba, bool asserted)
>>  {
>>         struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> 
>> @@ -1417,15 +1418,20 @@ static int ufs_qcom_device_reset(struct 
>> ufs_hba
>> *hba)
>>         if (!host->device_reset)
>>                 return -EOPNOTSUPP;
>> 
>> -       /*
>> -        * The UFS device shall detect reset pulses of 1us, sleep for 
>> 10us to
>> -        * be on the safe side.
>> -        */
>> -       gpiod_set_value_cansleep(host->device_reset, 1);
>> -       usleep_range(10, 15);
>> +       if (asserted) {
>> +               gpiod_set_value_cansleep(host->device_reset, 1);
>> 
>> -       gpiod_set_value_cansleep(host->device_reset, 0);
>> -       usleep_range(10, 15);
>> +               /*
>> +                * The UFS device shall detect reset pulses of 1us, 
>> sleep for 10us to
>> +                * be on the safe side.
>> +                */
>> +               usleep_range(10, 15);
>> +       } else {
>> +               gpiod_set_value_cansleep(host->device_reset, 0);
>> +
>> +                /* Some devices may need time to respond to rst_n */
>> +               usleep_range(10, 15);
> Since sleep the same on assert/de-assert can move it outside the
> if-else clause?

Hi Avri,

Even though there is same delay on assert/de-assert, they have different 
purposes. The delay
on assert is for JEDEC requirement while the delay on de-assert is for 
some devices requirement.
The latter is just a empirical value and is still controversial among 
SoC vendors. This value
may be changed in the further. So I don't think we should move it 
outside the if-else clause.

> 
>> +       }
>> 
>>         return 0;
>>  }
> 
> All the below changes, in suspend/resume, deserves some references in
> your commit log,
> And probably a separate patch.

Below changes adjusted the sequence of CLK, Rst_n, VCC and VCCQ/VCCQ2, 
These requirements
are referred in JEDEC and already quoted in my commit log. We don't need 
more descriptions.

Below changes have also modified common callback interface, we'd better 
keep implementation
and caller changes in one patch.


Best Regards,
Ziqi Chen

> 
> Thanks,
> Avri
> 
>> @@ -8686,8 +8696,6 @@ static int ufshcd_suspend(struct ufs_hba *hba,
>> enum ufs_pm_op pm_op)
>>         if (ret)
>>                 goto set_dev_active;
>> 
>> -       ufshcd_vreg_set_lpm(hba);
>> -
>>  disable_clks:
>>         /*
>>          * Call vendor specific suspend callback. As these callbacks 
>> may access
>> @@ -8703,6 +8711,9 @@ static int ufshcd_suspend(struct ufs_hba *hba,
>> enum ufs_pm_op pm_op)
>>          */
>>         ufshcd_disable_irq(hba);
>> 
>> +       if (ufshcd_is_link_off(hba))
>> +               ufshcd_vops_device_reset(hba, true);
>> +
>>         ufshcd_setup_clocks(hba, false);
>> 
>>         if (ufshcd_is_clkgating_allowed(hba)) {
>> @@ -8711,6 +8722,8 @@ static int ufshcd_suspend(struct ufs_hba *hba,
>> enum ufs_pm_op pm_op)
>>                                         hba->clk_gating.state);
>>         }
>> 
>> +       ufshcd_vreg_set_lpm(hba);
>> +
>>         /* Put the host controller in low power mode if possible */
>>         ufshcd_hba_vreg_set_lpm(hba);
>>         goto out;
>> @@ -8778,18 +8791,19 @@ static int ufshcd_resume(struct ufs_hba *hba,
>> enum ufs_pm_op pm_op)
>>         old_link_state = hba->uic_link_state;
>> 
>>         ufshcd_hba_vreg_set_hpm(hba);
>> +
>> +       ret = ufshcd_vreg_set_hpm(hba);
>> +       if (ret)
>> +               goto out;
>> +
>>         /* Make sure clocks are enabled before accessing controller */
>>         ret = ufshcd_setup_clocks(hba, true);
>>         if (ret)
>> -               goto out;
>> +               goto disable_vreg;
>> 
>>         /* enable the host irq as host controller would be active soon 
>> */
>>         ufshcd_enable_irq(hba);
>> 
>> -       ret = ufshcd_vreg_set_hpm(hba);
>> -       if (ret)
>> -               goto disable_irq_and_vops_clks;
>> -
>>         /*
>>          * Call vendor specific resume callback. As these callbacks 
>> may access
>>          * vendor specific host controller register space call them 
>> when the
>> @@ -8797,7 +8811,7 @@ static int ufshcd_resume(struct ufs_hba *hba,
>> enum ufs_pm_op pm_op)
>>          */
>>         ret = ufshcd_vops_resume(hba, pm_op);
>>         if (ret)
>> -               goto disable_vreg;
>> +               goto disable_irq_and_vops_clks;
>> 
>>         /* For DeepSleep, the only supported option is to have the 
>> link off */
>>         WARN_ON(ufshcd_is_ufs_dev_deepsleep(hba) &&
>> !ufshcd_is_link_off(hba));
>> @@ -8864,8 +8878,6 @@ static int ufshcd_resume(struct ufs_hba *hba,
>> enum ufs_pm_op pm_op)
>>         ufshcd_link_state_transition(hba, old_link_state, 0);
>>  vendor_suspend:
>>         ufshcd_vops_suspend(hba, pm_op);
>> -disable_vreg:
>> -       ufshcd_vreg_set_lpm(hba);
>>  disable_irq_and_vops_clks:
>>         ufshcd_disable_irq(hba);
>>         if (hba->clk_scaling.is_allowed)
>> @@ -8876,6 +8888,8 @@ static int ufshcd_resume(struct ufs_hba *hba,
>> enum ufs_pm_op pm_op)
>>                 trace_ufshcd_clk_gating(dev_name(hba->dev),
>>                                         hba->clk_gating.state);
>>         }
>> +disable_vreg:
>> +       ufshcd_vreg_set_lpm(hba);
>>  out:
>>         hba->pm_op_in_progress = 0;
>>         if (ret)
>> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
>> index 9bb5f0e..d5fbaba 100644
>> --- a/drivers/scsi/ufs/ufshcd.h
>> +++ b/drivers/scsi/ufs/ufshcd.h
>> @@ -319,7 +319,7 @@ struct ufs_pwr_mode_info {
>>   * @resume: called during host controller PM callback
>>   * @dbg_register_dump: used to dump controller debug information
>>   * @phy_initialization: used to initialize phys
>> - * @device_reset: called to issue a reset pulse on the UFS device
>> + * @device_reset: called to assert or deassert device reset line
>>   * @program_key: program or evict an inline encryption key
>>   * @event_notify: called to notify important events
>>   */
>> @@ -350,7 +350,7 @@ struct ufs_hba_variant_ops {
>>         int     (*resume)(struct ufs_hba *, enum ufs_pm_op);
>>         void    (*dbg_register_dump)(struct ufs_hba *hba);
>>         int     (*phy_initialization)(struct ufs_hba *);
>> -       int     (*device_reset)(struct ufs_hba *hba);
>> +       int     (*device_reset)(struct ufs_hba *hba, bool asserted);
>>         void    (*config_scaling_param)(struct ufs_hba *hba,
>>                                         struct devfreq_dev_profile 
>> *profile,
>>                                         void *data);
>> @@ -1216,10 +1216,10 @@ static inline void
>> ufshcd_vops_dbg_register_dump(struct ufs_hba *hba)
>>                 hba->vops->dbg_register_dump(hba);
>>  }
>> 
>> -static inline int ufshcd_vops_device_reset(struct ufs_hba *hba)
>> +static inline int ufshcd_vops_device_reset(struct ufs_hba *hba, bool
>> asserted)
>>  {
>>         if (hba->vops && hba->vops->device_reset)
>> -               return hba->vops->device_reset(hba);
>> +               return hba->vops->device_reset(hba, asserted);
>> 
>>         return -EOPNOTSUPP;
>>  }
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
>> Forum,
>> a Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
