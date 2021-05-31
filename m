Return-Path: <SRS0=FJ4T=K2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEBFC4708F
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 16:04:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C228F6135B
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 16:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C228F6135B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lb+G+NwbMRLztDQ6ZnfxsZQm8dAq8HvGsaveagZOwtQ=; b=mZCBDwILIXH1CB
	lYX3TkQnOjeB13eD9IsLrVCeJEqWoXHiCguypjijYO73df+3x4V8vTqfNLPl0lVs9Qko/YZlCnMEM
	B1G94pMITS4iMzqA02qdthSu3PaJpghcP8KtpUtW0S4PzTdLjh+Vx2QZ6btIc0N/j9KwtRAOEgp10
	LxWsL1RPjmD3NnQRyBzuXJWQcRCi2dv2KogIoC9+3ysz2inu+U5S60AZW82E4xOLaR16d+DaIhbz4
	Mk1dVLD9lU0T8fC+cUZ2Uuu4YZ1Qs4t6VyG09Ldxton5UrcCWsqyZZnEGvJHLn9MH9B2+pf57ZtFC
	LafgSxn/yVe3doRqhNaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnkP4-00Cn2k-C6; Mon, 31 May 2021 16:04:34 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnkOq-00Cn1N-FV; Mon, 31 May 2021 16:04:21 +0000
Received: by mail-wr1-x436.google.com with SMTP id z8so6289125wrp.12;
 Mon, 31 May 2021 09:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=hjP2GgSblleAgp88n/FXlq2IIJg58iX4N95E14USZQU=;
 b=SbQoM9XZG1WvqI841iaaDi7bVckm7JjLL2FIKg6QoDCycc+qaIN1WeMQJrBk8Ahoa6
 nKyxzpzOnmzLGrgfTtdd3UeRMBwWISktetIF5GkwXMoX1UtljdDP9NW6LLZc3cp18SfH
 LC9lJrsBl+sxTedFNcp+1PFCMcoCj2DcJi2PnpWsYQklBGlBSVsmgJEvxMF8jGP+VOuq
 zEAvF2XV5VbaUyRIiaYLfBNQC9VuupDPsPBQfxbSal5/nWx9p2j+ktIrbe5+IIPeFik5
 i3vg5nVbTDXe1Qab1z6ax1u+oQvzKbaZH2zfAoXDgDmSYlGuZ6ORnaSW913pv3VeUNtw
 cVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=hjP2GgSblleAgp88n/FXlq2IIJg58iX4N95E14USZQU=;
 b=M4Hkig4PVxu8zfQoGt3lx4fia8CY3lOur1qpEzk6EARxmqwL0aXkzfFY+PFuUnamAG
 VlFkMSK2n3/duJIEjKaXm4WHhKs+a00odk9TZLisH6V86G3lNwuHJHU/VdgAyunFyo4r
 ulWJHsamdAXj9eeE5jFWX8SvG/PplrbBu5cet5FTQWqrKvbutiUGQQjf2RUVOg+HzX48
 S1Z9u55GzHF4t8jc8pU55h7rkbpHpJdj3WNILbzv0wuC5+jXPqPAFZKQSuL9z54vhf+a
 7ZNsJ1R+mkvHaPfsrqZBkcbd7zHxKqx4WRXudFcZEd/3/SNAU9gM24cEHnGyUGwVAbum
 rPMQ==
X-Gm-Message-State: AOAM532szTd3nVtENvQAhj0Xvy+u4/64800PC0GQWww0RR6hpf+RYdsm
 LQBuL8WVpYqqDTT6ZQ8/YTM=
X-Google-Smtp-Source: ABdhPJwIKNm2vDybB1eaApkJIC8exiL2TQu44XUOYBgaEmyuzIdO8B0DmWXiuMTmywNXoBV5g2ecTg==
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr7685854wrq.111.1622477058688; 
 Mon, 31 May 2021 09:04:18 -0700 (PDT)
Received: from ubuntu-laptop (ip5f5bec5d.dynamic.kabel-deutschland.de.
 [95.91.236.93])
 by smtp.googlemail.com with ESMTPSA id 6sm6766413wmg.17.2021.05.31.09.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 09:04:18 -0700 (PDT)
Message-ID: <6d6d296a84f1e62f65fda4d172a85bb35d9a3684.camel@gmail.com>
Subject: Re: [PATCH v1 2/3] scsi: ufs: Optimize host lock on transfer
 requests send/compl paths
From: Bean Huo <huobean@gmail.com>
To: Can Guo <cang@codeaurora.org>, asutoshd@codeaurora.org, 
 nguyenb@codeaurora.org, hongwus@codeaurora.org, linux-scsi@vger.kernel.org,
 kernel-team@android.com
Cc: Stanley Chu <stanley.chu@mediatek.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bean Huo <beanhuo@micron.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Adrian
 Hunter <adrian.hunter@intel.com>, Kiwoong Kim <kwmad.kim@samsung.com>,
 Satya Tangirala <satyat@google.com>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Date: Mon, 31 May 2021 18:04:17 +0200
In-Reply-To: <1621845419-14194-3-git-send-email-cang@codeaurora.org>
References: <1621845419-14194-1-git-send-email-cang@codeaurora.org>
 <1621845419-14194-3-git-send-email-cang@codeaurora.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_090420_559076_9BE79E84 
X-CRM114-Status: GOOD (  16.73  )
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

On Mon, 2021-05-24 at 01:36 -0700, Can Guo wrote:
> Current UFS IRQ handler is completely wrapped by host lock, and
> because
> 
> ufshcd_send_command() is also protected by host lock, when IRQ
> handler
> 
> fires, not only the CPU running the IRQ handler cannot send new
> requests,
> 
> the rest CPUs can neither. Move the host lock wrapping the IRQ
> handler into
> 
> specific branches, i.e., ufshcd_uic_cmd_compl(),
> ufshcd_check_errors(),
> 
> ufshcd_tmc_handler() and ufshcd_transfer_req_compl(). Meanwhile, to
> further
> 
> reduce occpuation of host lock in ufshcd_transfer_req_compl(), host
> lock is
> 
> no longer required to call __ufshcd_transfer_req_compl(). As per
> test, the
> 
> optimization can bring considerable gain to random read/write
> performance.
> 
> 
> 
> Cc: Stanley Chu <stanley.chu@mediatek.com>
> 
> Co-developed-by: Asutosh Das <asutoshd@codeaurora.org>
> 
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> 
> Signed-off-by: Can Guo <cang@codeaurora.org>

Can,
The patch looks good to me.
I did a UFS queue limitation test before, observed that once the queue
is full, then the active task number in the queue will get down. For
the Nvme, the scenario is the same. You can refer to the slide 23, and
slide 24 in the pdf:
https://elinux.org/images/6/6c/Linux_Storage_System_Bottleneck_Exploration_V0.3.pdf I don't know if your patch can fix this
issue.

Unfortunately, I cannot verify UTRLCNR usage flow since my platform is
v2.1. But at least my test can prove that the patch doesn't impact the
legacy(UFSHCI is less than v3.0) doorbell usage flow.

Reviewed-by: Bean Huo <beanhuo@micron.com>


Bean


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
