Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4B2C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 07:29:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E27FC2256F
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 07:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E27FC2256F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5CzrW/uOF6lmAzYPbQaqQ3oKsa/p5Ej9eNWX1/FIfR4=; b=dl9lplqjTn94aS4yX1AbruRIZ
	mumokCaZNVNZq/SXpY0FNP5257cOOZAIrUhW+fBgnI6Ztta24bvgV1Ihxghp82Y0IeV6uJzYrEP7D
	bmQXCl9er2UP1rVRPtvaEvWIJB3h7LX97Hhn28kDV0EmQZ7MBOLRv9A/S5Ay+TUdXahl08Fz01JDw
	oG0mIDcqblkpo8FP1SvDfZOHDGkJmoW7barR4t3KBoT4Y+goOqcuE0l4tH0/MKe/yTcwcGMZ/VRWI
	IFH41BGhyhe2mNHneKhrzFcFI4kKUCqQXqiYRiy/xnz+jDuT2PDe4laafMj0hqbhzPgwJrC6aauwO
	Dk/E1xdoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwgm3-0000TL-57; Tue, 05 Jan 2021 07:28:59 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwgm0-0000SP-JQ
 for linux-mediatek@lists.infradead.org; Tue, 05 Jan 2021 07:28:57 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1609831736; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=rlMezvFGRyW9K07G6YKtgfUDZelNds7a4+4Moz15juI=;
 b=ZAbo7I2L+Ncg377XL1H3ksz4WYAPYMeN/uMhO7bwx/Q95TeSr/+R94NDskwjkrpsllu9PZPa
 u+A2uHtkVm+k+qkrhtAJzRhuouRAXFcq/lTNnFUmAPtdflfEkr8aPQggVbwd+BZ9SDEhUaeE
 NxfynO4NdZBVZ9fn5bbefgHp8PY=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5ff41530d3eb3c36b4819798 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Jan 2021 07:28:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7AB34C43461; Tue,  5 Jan 2021 07:28:48 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2E8DEC433C6;
 Tue,  5 Jan 2021 07:28:47 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 05 Jan 2021 15:28:47 +0800
From: Can Guo <cang@codeaurora.org>
To: Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH RFC v4 1/1] scsi: ufs: Fix ufs power down/on specs
 violation
In-Reply-To: <b82dd5f1-179c-6834-9d8f-88005b74ce51@intel.com>
References: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
 <e8980753-fa48-7862-e5ce-0d756d5d97a6@intel.com>
 <X/NkktFnWI48XNcp@builder.lan>
 <b82dd5f1-179c-6834-9d8f-88005b74ce51@intel.com>
Message-ID: <ff2c3c4379cb8bc41580d5615b01f86a@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_022856_936684_A47520E2 
X-CRM114-Status: GOOD (  26.18  )
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
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, vinholikatti@gmail.com,
 Bean Huo <beanhuo@micron.com>, Satya Tangirala <satyat@google.com>,
 jejb@linux.vnet.ibm.com, Bart Van Assche <bvanassche@acm.org>,
 linux-scsi@vger.kernel.org, Ziqi Chen <ziqichen@codeaurora.org>,
 Andy Gross <agross@kernel.org>, kernel-team@android.com, salyzyn@google.com,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "James
 E.J. Bottomley" <jejb@linux.ibm.com>, Avri Altman <avri.altman@wdc.com>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, kwmad.kim@samsung.com,
 stanley.chu@mediatek.com, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, rnayak@codeaurora.org,
 saravanak@google.com, martin.petersen@oracle.com, nguyenb@codeaurora.org,
 open list <linux-kernel@vger.kernel.org>, hongwus@codeaurora.org,
 asutoshd@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2021-01-05 15:16, Adrian Hunter wrote:
> On 4/01/21 8:55 pm, Bjorn Andersson wrote:
>> On Mon 04 Jan 03:15 CST 2021, Adrian Hunter wrote:
>> 
>>> On 22/12/20 3:49 pm, Ziqi Chen wrote:
>>>> As per specs, e.g, JESD220E chapter 7.2, while powering
>>>> off/on the ufs device, RST_N signal and REF_CLK signal
>>>> should be between VSS(Ground) and VCCQ/VCCQ2.
>>>> 
>>>> To flexibly control device reset line, refactor the function
>>>> ufschd_vops_device_reset(sturct ufs_hba *hba) to ufshcd_
>>>> vops_device_reset(sturct ufs_hba *hba, bool asserted). The
>>>> new parameter "bool asserted" is used to separate device reset
>>>> line pulling down from pulling up.
>>> 
>>> This patch assumes the power is controlled by voltage regulators, but 
>>> for us
>>> it is controlled by firmware (ACPI), so it is not correct to change 
>>> RST_n
>>> for all host controllers as you are doing.
>>> 
>>> Also we might need to use a firmware interface for device reset, in 
>>> which
>>> case the 'asserted' value doe not make sense.
>>> 
>> 
>> Are you saying that the entire flip-flop-the-reset is a single 
>> firmware
>> operation in your case?
> 
> Yes
> 
>>                         If you look at the Mediatek driver, the
>> implementation of ufs_mtk_device_reset_ctrl() is a jump to firmware.
>> 
>> 
>> But perhaps "asserted" isn't the appropriate English word for saying
>> "the reset is in the resetting state"?
>> 
>> I just wanted to avoid the use of "high"/"lo" as if you look at the
>> Mediatek code they pass the expected line-level to the firmware, while
>> in the Qualcomm code we pass the logical state to the GPIO code which 
>> is
>> setup up as "active low" and thereby flip the meaning before hitting 
>> the
>> pad.
>> 
>>> Can we leave the device reset callback alone, and instead introduce a 
>>> new
>>> variant operation for setting RST_n to match voltage regulator power 
>>> changes?
>> 
>> Wouldn't this new function just have to look like the proposed 
>> patches?
>> In which case for existing platforms we'd have both?
>> 
>> How would you implement this, or would you simply skip implementing
>> this?
> 
> Functionally, doing a device reset is not the same as adjusting signal
> levels to meet power up/off ramp requirements.  However, the issue is 
> that
> we do not use regulators, so the power is not necessarily being changed 
> at
> those points, and we definitely do not want to reset instead of 
> entering
> DeepSleep for example.
> 
> Off the top of my head, I imagine something like a callback called
> ufshcd_vops_prepare_power_ramp(hba, bool on) which is called only if
> hba->vreg_info->vcc is not NULL.

Hi Adrian,

I don't see you have the vops device_reset() implemented anywhere in
current code base, how is this change impacting you? Do I miss anything
or are you planning to push a change which implements device_reset() 
soon?

Thanks,
Can Guo.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
