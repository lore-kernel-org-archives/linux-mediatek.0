Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9385DC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 07:17:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 112F5224F9
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 07:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 112F5224F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6K8mBQ4bLcaLpII7gdpVwQAEPC1k0NuR7I9ROdFY200=; b=oY4CetkHcMG97Ww4o7sxr+VkZ
	aswgLOvDNMdWk0PLVq90ZvqNZBlqq+dFtLJH/LT+yKyNYZ3tdozoNKe/hGWLuqOmEU05auMNKC+jQ
	0e8QMyuPGqq8oStmf7TMjoRMfwzxV71kNsy32D396zNAGYpXwxLCSI0kKmvQefWBimCq9VeYprjwN
	E75O+tm1U5zdb4TALdZoYocfD5NPtIt6ZG5jNpxnz3l0c7rWVzTo2j8qzJ5wYaoolRqz8vyB7Yy4G
	ynbsKAwQNtfQ2Tl2gwuar+bfI5tTrRQjMi36pVr6xh/oM2Vro0zvRNeXD2T1ecM67n5MEF2wgCcS5
	1AcXxMwYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwgas-0006Yb-4x; Tue, 05 Jan 2021 07:17:26 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwgao-0006Xt-6k; Tue, 05 Jan 2021 07:17:23 +0000
IronPort-SDR: DbzXzqMuOsYtdIuPHLNt31jCbAAG1d+Nz1byJVs0TcGflLlTPcDkmv5uB7m47SzLP4bfukukA0
 ewizK83r8O5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="195593504"
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; d="scan'208";a="195593504"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2021 23:17:17 -0800
IronPort-SDR: HLSXPmG/ebpymc5Cm5QUhu0Wx8yLFzlA89q0sMQI7czP2tHmZe4zZ//NvWy5o34vKgqefzg161
 uinHppj4AHOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; d="scan'208";a="462210163"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.94])
 ([10.237.72.94])
 by fmsmga001.fm.intel.com with ESMTP; 04 Jan 2021 23:17:09 -0800
Subject: Re: [PATCH RFC v4 1/1] scsi: ufs: Fix ufs power down/on specs
 violation
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
 <e8980753-fa48-7862-e5ce-0d756d5d97a6@intel.com>
 <X/NkktFnWI48XNcp@builder.lan>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <b82dd5f1-179c-6834-9d8f-88005b74ce51@intel.com>
Date: Tue, 5 Jan 2021 09:16:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <X/NkktFnWI48XNcp@builder.lan>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_021722_444620_036FC417 
X-CRM114-Status: GOOD (  27.65  )
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
Cc: open list <linux-kernel@vger.kernel.org>, cang@codeaurora.org,
 Alim Akhtar <alim.akhtar@samsung.com>, kwmad.kim@samsung.com,
 Bean Huo <beanhuo@micron.com>, Satya Tangirala <satyat@google.com>,
 vinholikatti@gmail.com, jejb@linux.vnet.ibm.com,
 Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org,
 Ziqi Chen <ziqichen@codeaurora.org>, Andy Gross <agross@kernel.org>,
 kernel-team@android.com, salyzyn@google.com,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Avri Altman <avri.altman@wdc.com>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, stanley.chu@mediatek.com,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, rnayak@codeaurora.org,
 saravanak@google.com, martin.petersen@oracle.com, nguyenb@codeaurora.org,
 hongwus@codeaurora.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 4/01/21 8:55 pm, Bjorn Andersson wrote:
> On Mon 04 Jan 03:15 CST 2021, Adrian Hunter wrote:
> 
>> On 22/12/20 3:49 pm, Ziqi Chen wrote:
>>> As per specs, e.g, JESD220E chapter 7.2, while powering
>>> off/on the ufs device, RST_N signal and REF_CLK signal
>>> should be between VSS(Ground) and VCCQ/VCCQ2.
>>>
>>> To flexibly control device reset line, refactor the function
>>> ufschd_vops_device_reset(sturct ufs_hba *hba) to ufshcd_
>>> vops_device_reset(sturct ufs_hba *hba, bool asserted). The
>>> new parameter "bool asserted" is used to separate device reset
>>> line pulling down from pulling up.
>>
>> This patch assumes the power is controlled by voltage regulators, but for us
>> it is controlled by firmware (ACPI), so it is not correct to change RST_n
>> for all host controllers as you are doing.
>>
>> Also we might need to use a firmware interface for device reset, in which
>> case the 'asserted' value doe not make sense.
>>
> 
> Are you saying that the entire flip-flop-the-reset is a single firmware
> operation in your case?

Yes

>                         If you look at the Mediatek driver, the
> implementation of ufs_mtk_device_reset_ctrl() is a jump to firmware.
> 
> 
> But perhaps "asserted" isn't the appropriate English word for saying
> "the reset is in the resetting state"?
> 
> I just wanted to avoid the use of "high"/"lo" as if you look at the
> Mediatek code they pass the expected line-level to the firmware, while
> in the Qualcomm code we pass the logical state to the GPIO code which is
> setup up as "active low" and thereby flip the meaning before hitting the
> pad.
> 
>> Can we leave the device reset callback alone, and instead introduce a new
>> variant operation for setting RST_n to match voltage regulator power changes?
> 
> Wouldn't this new function just have to look like the proposed patches?
> In which case for existing platforms we'd have both?
> 
> How would you implement this, or would you simply skip implementing
> this?

Functionally, doing a device reset is not the same as adjusting signal
levels to meet power up/off ramp requirements.  However, the issue is that
we do not use regulators, so the power is not necessarily being changed at
those points, and we definitely do not want to reset instead of entering
DeepSleep for example.

Off the top of my head, I imagine something like a callback called
ufshcd_vops_prepare_power_ramp(hba, bool on) which is called only if
hba->vreg_info->vcc is not NULL.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
