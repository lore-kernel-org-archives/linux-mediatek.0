Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08B1C48BE8
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 02:49:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61BC0610CA
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 02:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61BC0610CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EZIIqj7lk5IqrrroUqtx9+XwfbNbfqRliiFj8XUwB68=; b=lIoYBmFXxdO8NzcyAp5mVRFGxH
	Ly36orW75k/qUB6MsRzt+rbWDnClt/5LO5+GJ08+tTXmgJFBaUGLy6YfiEoqVlzyjZKKHS2we/dt4
	acMs3F8ltPtAwk6mnFJvzQ0LlbjcqKxdI9WdDwctpNgEmn+Ss7D6ZSsHc3qeN5WUrLD3vwnFivx6H
	EGKr3rQf0mZb0V4vaTEm1yRbcunQ0X0shrc+Lwz51TErGcBPDtQsL+QsjWLGU97Ri6Xj7niIqlEkJ
	A/2059UYXmUoz+WSf0cc43x/RQL6s9wixnCgp8ZzmRPLvluDbzrtFBiPTrSu+X8TQrkX4xjLzziUH
	yXPH8Q5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lti5d-008a08-43; Thu, 17 Jun 2021 02:49:09 +0000
Received: from mail-pf1-f176.google.com ([209.85.210.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lti5a-008ZzZ-EH; Thu, 17 Jun 2021 02:49:07 +0000
Received: by mail-pf1-f176.google.com with SMTP id h12so3815389pfe.2;
 Wed, 16 Jun 2021 19:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PU09GkpdOebA1Js4BBORPX4b2AbSyG+VI/fibqpS/xU=;
 b=mYtUDN2uH3BaU+Nlw0BoBRkfWpu9GFYkpHBx50RM2Zl0mZqM3UGyM3nAtGGZJi2UzG
 kdQ6yscq4MmJ9U0OQJkF26fhzx/VEDWh7VxhUtT2f0/E/3ZHGbzMt0nQKKXNhgpvirnN
 4P3igMMGRr1L21e56kdfEPJAzRQBXnaba4Pu9S+GNKhAwuRWpSMYCMbmxmWHgIKEq4cp
 ypFdRJl4PGUUrfszpJDSPwkRF9C+qPOIZ7U/803l8jgm87KCRNxjnSNPeCn+UJvn9SXj
 35Xc0eFmjdIYkJjBI0TnHq/C2STnzYkoc8uERWovafn4uzDV+FIMSExCrhskqeh4LgeN
 v4EQ==
X-Gm-Message-State: AOAM530tXzuxZmyoolQRY7865CWQ2fHHJgZ7sEA53SL4HddTaiCubniA
 LAFTmH5zFp4O/TJr7a5IgIUCCGDa280d5Q==
X-Google-Smtp-Source: ABdhPJwvpKAme/JRba83mhU7fhxECxrIxIQHPhHr5N5r3j8OvecsPl0thpfr9xdZAupImqkqM1CQ4A==
X-Received: by 2002:a63:1f50:: with SMTP id q16mr2762916pgm.170.1623898144888; 
 Wed, 16 Jun 2021 19:49:04 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net.
 [73.241.217.19])
 by smtp.gmail.com with ESMTPSA id gl13sm6517896pjb.5.2021.06.16.19.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 19:49:04 -0700 (PDT)
Subject: Re: [PATCH v1 2/3] scsi: ufs: Optimize host lock on transfer requests
 send/compl paths
To: Can Guo <cang@codeaurora.org>, asutoshd@codeaurora.org,
 nguyenb@codeaurora.org, hongwus@codeaurora.org, linux-scsi@vger.kernel.org,
 kernel-team@android.com
Cc: Stanley Chu <stanley.chu@mediatek.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bean Huo <beanhuo@micron.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Satya Tangirala <satyat@google.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <1621845419-14194-1-git-send-email-cang@codeaurora.org>
 <1621845419-14194-3-git-send-email-cang@codeaurora.org>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <a29164e1-ab7d-6dbc-0fb9-029f203de735@acm.org>
Date: Wed, 16 Jun 2021 19:49:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1621845419-14194-3-git-send-email-cang@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_194906_537664_197C6C6C 
X-CRM114-Status: GOOD (  19.12  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 5/24/21 1:36 AM, Can Guo wrote:
> @@ -2688,6 +2705,43 @@ static int ufshcd_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *cmd)
> +	case UFSHCD_STATE_EH_SCHEDULED_FATAL:
> +		/*
> +		 * pm_runtime_get_sync() is used at error handling preparation
> +		 * stage. If a scsi cmd, e.g. the SSU cmd, is sent from hba's
> +		 * PM ops, it can never be finished if we let SCSI layer keep
> +		 * retrying it, which gets err handler stuck forever. Neither
> +		 * can we let the scsi cmd pass through, because UFS is in bad
> +		 * state, the scsi cmd may eventually time out, which will get
> +		 * err handler blocked for too long. So, just fail the scsi cmd
> +		 * sent from PM ops, err handler can recover PM error anyways.
> +		 */
> +		if (hba->pm_op_in_progress) {
> +			hba->force_reset = true;
> +			set_host_byte(cmd, DID_BAD_TARGET);
> +			cmd->scsi_done(cmd);
> +			goto out;
> +		}
> +		fallthrough;

Hi Can,

I know that this patch only moves the above code and that the above code
has not been introduced by this patch. Anyway, is my understanding
correct that ufshcd_err_handler() can change the host controller state
from UFSHCD_STATE_EH_SCHEDULED_FATAL into UFSHCD_STATE_RESET and next
into UFSHCD_STATE_OPERATIONAL? If so, if the above code completes a READ
with status DID_BAD_TARGET and if recovery by the error handler
succeeds, will that cause the filesystem above the UFS driver to change
into read-only mode? If the above code completes a WRITE with status
DID_BAD_TARGET, will that cause data corruption? Is there any other
solution to prevent data corruption than merging the
UFSHCD_STATE_EH_SCHEDULED_FATAL and UFSHCD_STATE_EH_SCHEDULED_NON_FATAL
back into a single state and changing the ufshcd_rpm_get_sync(hba) call
in ufshcd_err_handling_prepare() into a pm_runtime_get_noresume() call?

Thanks,

Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
