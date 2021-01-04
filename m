Return-Path: <SRS0=ylaU=GH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00620C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 18:55:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 812D121D93
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 18:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 812D121D93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9GZ4uF1Wpw+fnw7sq5wVTlxA5NVh8fgv4axUIhqSv/s=; b=ay20mncA84w8fN6VBl8ARxXMG
	+eTKL9yOd5mh5MU8LBQhL9aEZXOc7wqK5EBOqX7QX/4CwAO/EtAjm0L0UrpyxoEujvpGndnwnNMPD
	OTPuNxoeE/KEajT6GtFTA8lDGS99Wpsfqu1HnhMSXSi8J3N2hTBMMzoTbMDnp3QNFjM/k/LMLG5fM
	TJ2ABwKF4+JnfxVEoRoTVdowHzR4ujopNNM+zkJIWbWqkIeEUjhtuC0G7LRlbU4amashfxqm6h0TU
	8wu2QKIQc9X13JxvRNeMoUtoI+YvCXiaGXtftCJoulsR22T41vhe946ALuSocda08HVKQ5XpB3CpI
	0fWhoxs+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwV0n-0004Ld-Sb; Mon, 04 Jan 2021 18:55:25 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwV0k-0004KT-BN
 for linux-mediatek@lists.infradead.org; Mon, 04 Jan 2021 18:55:23 +0000
Received: by mail-ot1-x334.google.com with SMTP id b24so27032325otj.0
 for <linux-mediatek@lists.infradead.org>; Mon, 04 Jan 2021 10:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HCHUr50eCN2Mq1BFEjsYp3XRTEkB08z4GhkrFu84N5o=;
 b=MjK0591SdWSZ9DLSVpf0BxQENcnVdirWQsQ7aDl6SyoT5QHmyA95wA785FtmQXb4eS
 kalXUkp+oEIy1oKVvEwQb747gpJ/vNJAP/sksy9Q7KnNyGNmzOlvCGW5cXwd4sbfJ8U5
 N+0Nc5AFrEkuxtm0bCRm3uB1KbagVWrJ1d+uH4o95u0HT3CAa7V0Tbapga2pBgY1KNNn
 PGnZiHKUt+CiQUzoZugw3/kBILSrkuo3avoJyYzLtjZggUou0EAVDUKaxyAyU6KwjlRn
 ofG3WBujQoLydHQJZtcYadoIeYkN7X7nzm0JducjXJZwBdo9J9PyEcVL2nfk16HgQr1q
 ragQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HCHUr50eCN2Mq1BFEjsYp3XRTEkB08z4GhkrFu84N5o=;
 b=ebzwRZU8JQD9eSiLykaMlRr/7eTRBuXN3/rIFGvNJmZHLVo2nQo5k3La323PGM7sxy
 5tdc8HVj8QtMeP20yZ/eEKf7tqfAG1k47cr+uwNrS+a7BW6UMAuT7FCOvIlSGkdQO6M9
 O6y7MWMwQXY/gwFv723m6Rb8/DMBSjdXlbeOwcAHPXry8RY11ARRIhWhLqRZpghJt5fp
 9CUEEBSS89WFvyq3btEmVfp6nBIWl8YjhjhiGreP1jBJHDkuKUP985pd96sm1J1sFoyM
 qKo4LhANsG1QRJOvyDE5bGGhdF54VRQ+x02/WdkjrT2fiTNqOnZgMe9oF+sJPHhKHVLx
 BgjA==
X-Gm-Message-State: AOAM5332o+rddVcOOWVdC1WYFunXeoN7oq/rLx/2VZzGHSirn7/2nZta
 yyuyJwAbzl2M6U48KJRw9bGoOQ==
X-Google-Smtp-Source: ABdhPJynIT9V4QDAnYlHEj69tBxT9FlrJStSU7PSfvdY1dZKE/6gjjiShTwSh2OmegYcv02AXOLbBw==
X-Received: by 2002:a05:6830:1e41:: with SMTP id
 e1mr54050557otj.143.1609786517769; 
 Mon, 04 Jan 2021 10:55:17 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t19sm14625846otp.36.2021.01.04.10.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 10:55:16 -0800 (PST)
Date: Mon, 4 Jan 2021 12:55:14 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH RFC v4 1/1] scsi: ufs: Fix ufs power down/on specs
 violation
Message-ID: <X/NkktFnWI48XNcp@builder.lan>
References: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
 <e8980753-fa48-7862-e5ce-0d756d5d97a6@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e8980753-fa48-7862-e5ce-0d756d5d97a6@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_135522_691796_48189706 
X-CRM114-Status: GOOD (  19.64  )
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

On Mon 04 Jan 03:15 CST 2021, Adrian Hunter wrote:

> On 22/12/20 3:49 pm, Ziqi Chen wrote:
> > As per specs, e.g, JESD220E chapter 7.2, while powering
> > off/on the ufs device, RST_N signal and REF_CLK signal
> > should be between VSS(Ground) and VCCQ/VCCQ2.
> > 
> > To flexibly control device reset line, refactor the function
> > ufschd_vops_device_reset(sturct ufs_hba *hba) to ufshcd_
> > vops_device_reset(sturct ufs_hba *hba, bool asserted). The
> > new parameter "bool asserted" is used to separate device reset
> > line pulling down from pulling up.
> 
> This patch assumes the power is controlled by voltage regulators, but for us
> it is controlled by firmware (ACPI), so it is not correct to change RST_n
> for all host controllers as you are doing.
> 
> Also we might need to use a firmware interface for device reset, in which
> case the 'asserted' value doe not make sense.
> 

Are you saying that the entire flip-flop-the-reset is a single firmware
operation in your case? If you look at the Mediatek driver, the
implementation of ufs_mtk_device_reset_ctrl() is a jump to firmware.


But perhaps "asserted" isn't the appropriate English word for saying
"the reset is in the resetting state"?

I just wanted to avoid the use of "high"/"lo" as if you look at the
Mediatek code they pass the expected line-level to the firmware, while
in the Qualcomm code we pass the logical state to the GPIO code which is
setup up as "active low" and thereby flip the meaning before hitting the
pad.

> Can we leave the device reset callback alone, and instead introduce a new
> variant operation for setting RST_n to match voltage regulator power changes?

Wouldn't this new function just have to look like the proposed patches?
In which case for existing platforms we'd have both?

How would you implement this, or would you simply skip implementing
this?

Regards,
Bjorn


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
