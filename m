Return-Path: <SRS0=ylaU=GH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7E8C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 09:16:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF1EE21D79
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 09:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF1EE21D79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jbd9K9KdJ3WfCA+ZFznHu2NDEbyUZNe7spQCyscdUWo=; b=a6BXDvxsX3XCIv+TCcmvNvuUM
	3GghYXCmiL+7NMjuxxdFSnYqeBKLAxqmmJgOmxmKsHweqA49HBkDCrm3KVUO9Q7Ci3DvrXkj3lJ+Q
	MTtvHbqs9vYlUjMfPu/NOPTqUfO8klfwDpy0wujEwhVmtNcyFLEJ5ZvYwNtmw1hmZiEnNk/NeVmlP
	nh1vE+iW7BsAaz1/QlFzjCwPL9pYKoQYTwWgvYtYKYBlwEgRKyO6qS6IymmDTrnMElNRYu1UMcil1
	pN+oybLJpKnrIGmWvJkfdGwxJWYnHB2ZlywkHjeDdeD+YVidAEWOuOVyTDhCjgyzkPoNTCxdYWyQD
	a6CMTW6qw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwLy1-0002A7-S3; Mon, 04 Jan 2021 09:15:57 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwLxx-00028h-M0; Mon, 04 Jan 2021 09:15:54 +0000
IronPort-SDR: 0oZay5dmL37BiqtqbpkflyIH+BtN4si2QZVQl5isxCCT6hkV76I605o23VBZEVo3vpR7j9033r
 X8sUcStQfmFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9853"; a="176150882"
X-IronPort-AV: E=Sophos;i="5.78,473,1599548400"; d="scan'208";a="176150882"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2021 01:15:44 -0800
IronPort-SDR: b7X9+Jo+qFrJ1FgbRx9pH3NHIwGowsTxAjKIdaJ0mMTFSovdQ5+zqmk7fLyfZbmcMG0sDkIDUa
 T5szOEwBfyDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,473,1599548400"; d="scan'208";a="349833423"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.94])
 ([10.237.72.94])
 by fmsmga008.fm.intel.com with ESMTP; 04 Jan 2021 01:15:37 -0800
Subject: Re: [PATCH RFC v4 1/1] scsi: ufs: Fix ufs power down/on specs
 violation
To: Ziqi Chen <ziqichen@codeaurora.org>, asutoshd@codeaurora.org,
 nguyenb@codeaurora.org, cang@codeaurora.org, hongwus@codeaurora.org,
 rnayak@codeaurora.org, vinholikatti@gmail.com, jejb@linux.vnet.ibm.com,
 martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 kernel-team@android.com, saravanak@google.com, salyzyn@google.com,
 kwmad.kim@samsung.com, stanley.chu@mediatek.com
References: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <e8980753-fa48-7862-e5ce-0d756d5d97a6@intel.com>
Date: Mon, 4 Jan 2021 11:15:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_041553_877465_6FE81463 
X-CRM114-Status: GOOD (  12.86  )
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 open list <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Avri Altman <avri.altman@wdc.com>, Andy Gross <agross@kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Satya Tangirala <satyat@google.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 22/12/20 3:49 pm, Ziqi Chen wrote:
> As per specs, e.g, JESD220E chapter 7.2, while powering
> off/on the ufs device, RST_N signal and REF_CLK signal
> should be between VSS(Ground) and VCCQ/VCCQ2.
> 
> To flexibly control device reset line, refactor the function
> ufschd_vops_device_reset(sturct ufs_hba *hba) to ufshcd_
> vops_device_reset(sturct ufs_hba *hba, bool asserted). The
> new parameter "bool asserted" is used to separate device reset
> line pulling down from pulling up.

This patch assumes the power is controlled by voltage regulators, but for us
it is controlled by firmware (ACPI), so it is not correct to change RST_n
for all host controllers as you are doing.

Also we might need to use a firmware interface for device reset, in which
case the 'asserted' value doe not make sense.

Can we leave the device reset callback alone, and instead introduce a new
variant operation for setting RST_n to match voltage regulator power changes?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
