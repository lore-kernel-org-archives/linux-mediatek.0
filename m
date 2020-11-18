Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9080BC56202
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 04:38:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F05A124248
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 04:38:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xpaodb2v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F05A124248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BbiNHPO8PJ9V7V9QMIJko0SwNrZjcc0cIJwcd2JM4Xo=; b=Xpaodb2v+LPwj0HFfLgxqwgNW
	CzzASWhgM9B+H51XpGOz98sbA32zmfQpEqNGfkVzT2A4We10SHU8SKsJrJYESk/nX3o4Mev36ym2M
	kYUyNG4SlE+7Yxf9EyZFXy8HpmJcEP2j1ryaqb9C97ootjv8srg4DOxqeY30rvXH4CuKNDErU+k3y
	3X6FRpJmJqaubqRQpJeLFqVm9+UwDyq24mylDeLY0ITgL4g39rwjpQQFV8H1WuYoyRT6E3OifU8tk
	zZ/8+P03NUldJKtmR6xzh6YMk+B77WMW9dHPM33kz2PmDoex+7kcTRcOR6DlDZVgOo+xvLwwWfN+s
	QVKvGcDKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfFEb-0003wP-An; Wed, 18 Nov 2020 04:38:21 +0000
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfFEY-0003vz-Op; Wed, 18 Nov 2020 04:38:19 +0000
Received: by mail-pg1-f196.google.com with SMTP id v21so341061pgi.2;
 Tue, 17 Nov 2020 20:38:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PL94uEPHkPgwoSTEUJTRIWLNjp6IL0BpUZlGz8omUG0=;
 b=p28KomaiGDJLcwTpkTauUt/nnMMcnt2mBu/mfHCu6DDvVZQXtSoYH9VGdVzDglTnMx
 EIRFIfD6sLPFKHDxSdVQizE/kx67KdJb57lEcGAvfc42Ge+cslSebBsCf742kbkAp6lD
 oLbjfEpqiDUsWBZWh4V5GadhG6wwqQDovaPyPrwy5Err7EspdF8cGRZIh5sFHVft51dh
 c8noNlHiCbZof2PTvzDMDAFgNvb+2jQZzJVnsrQ8M4RxfzBRh3ytyYRs+lpVgpopDgL1
 +/6hk9ywi/Lvfa7mT86lzkwJ5bKd9Dgt6q0BqEqAXVnl8zn1vQWhuvEH47lG20A/ZKf7
 iUkg==
X-Gm-Message-State: AOAM532JJT+EpxO1xIsHTzQkL/XFjK6CaZ8w4aSjC33BEIhzMUBWyX/n
 EvWY3bppAZ89gvYu3yJrEe6iBVNMndY=
X-Google-Smtp-Source: ABdhPJycdQm5sVRY0NmyvKoJHUlSfU28PhA3bdEB9g/SGEJmWN03zqCB7ZXzrkb5VHRuRkvrDp8sjw==
X-Received: by 2002:a63:e00c:: with SMTP id e12mr6376270pgh.441.1605674295582; 
 Tue, 17 Nov 2020 20:38:15 -0800 (PST)
Received: from [192.168.3.218] (c-73-241-217-19.hsd1.ca.comcast.net.
 [73.241.217.19])
 by smtp.gmail.com with ESMTPSA id o132sm22760038pfg.100.2020.11.17.20.38.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 20:38:14 -0800 (PST)
Subject: Re: [PATCH RFC v1 1/1] scsi: pm: Leave runtime resume along if block
 layer PM is enabled
To: Can Guo <cang@codeaurora.org>
References: <1605249009-13752-1-git-send-email-cang@codeaurora.org>
 <1605249009-13752-2-git-send-email-cang@codeaurora.org>
 <97dea590-5f2e-b4e3-ac64-7c346761c523@acm.org>
 <20f447a438aa98afb18be4642c8888b3@codeaurora.org>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <6d774277-b055-6924-cf2d-01e874ac3f7b@acm.org>
Date: Tue, 17 Nov 2020 20:38:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20f447a438aa98afb18be4642c8888b3@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_233818_821497_19B977B2 
X-CRM114-Status: GOOD (  15.42  )
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
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, rnayak@codeaurora.org,
 saravanak@google.com, linux-scsi@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, nguyenb@codeaurora.org,
 ziqichen@codeaurora.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 salyzyn@google.com, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, kernel-team@android.com,
 hongwus@codeaurora.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/15/20 5:42 PM, Can Guo wrote:
> Actually, I am thinking about removing all the pm_runtime_set_active()
> codes in both scsi_bus_resume_common() and scsi_dev_type_resume() - we
> don't need to forcibly set the runtime PM status to RPM_ACTIVE for either
> SCSI host/target or SCSI devices.
> 
> Whenever we access one SCSI device, either block layer or somewhere in
> the path (e.g. throgh sg IOCTL, sg_open() calls scsi_autopm_get_device())
> should runtime resume the device first, and the runtime PM framework makes
> sure device's parent (and its parent's parent and so on)gets resumed as
> well.
> Thus, the pm_runtime_set_active() seems redundant. What do you think?

Hi Can,

It is not clear to me why the pm_runtime_set_active() calls occur in the
scsi_pm.c source file since the block layer automatically activates
block devices if necessary. Maybe these calls are a leftover from a time
when runtime suspended devices were not resumed automatically by the
block layer? Anyway, I'm fine with removing these calls.

Thanks,

Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
