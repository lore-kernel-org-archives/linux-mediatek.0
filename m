Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE7DD16804
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jan 2026 10:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kCeTL5DyL4OpVceWW2dtJZK2fvnfNct2KD6UucHZ0lo=; b=LTSI9HfT5LmLrW11wzm2Dq2gFD
	VdRH1CL/53qC7crYQKaOyzaIHiWOcKjRJt5wt0EI3vWOeTNJxUfb41C1WfHler2L/GV+Iq7UHxh//
	MRBpMAMn1mJQFndfELBRpxpEGzl221sMZtYCQxX5QsaWwFBJEgIso3cPiLUdvkvHhdHJCRBwGNL9B
	jUF/LlwEJ3efL0dP2ofgVFC/Rv1QxnlbWUtvNYhh7CZ+9d7I5gxsfvH05RsmyM5EDvGQ7qemz7tOe
	R0Pr6qUn9WU+FErXQckrIrtq7xQI6Cdg5lSM1tcvSgp5PHCMuZhWuATG+vIrpbuguDOoP0+VYdWZl
	DrH9AboQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9oo-000000028nH-2Eom;
	Fri, 09 Jan 2026 10:34:10 +0000
Received: from mail-ot1-x364.google.com ([2607:f8b0:4864:20::364])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9om-000000028mP-0G0g
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Jan 2026 10:34:09 +0000
Received: by mail-ot1-x364.google.com with SMTP id 46e09a7af769-7c76f65feb5so3270778a34.0
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Jan 2026 02:34:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767954846; x=1768559646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCeTL5DyL4OpVceWW2dtJZK2fvnfNct2KD6UucHZ0lo=;
        b=jmwCksvLU9Z1wy0vyBUwFWy4KG5pp7NuAU3FYcZMO26L1tiwCTdkEZ48/piFkA1LDG
         ELX0zI3udn6QZzO5EyzUDHoaujkfL0BoPm3X/rzLR1Qc3cXqxATMTV/4W0CwBaZOzRsB
         C3hvZZBOlqDXfDrvShlY4GAcelvttdh5fh9Pb1I8qQ89UBFThqPG8KiMMmVlogr6YOzU
         +1aLJYMNOXUuvbIYTaV+KB1VI54nmV6NPUQ3Qpw5mXdZpg9c+8/W2kPOmegYFShQ5sVw
         qxpAX6gM1eVCnF74lzo9aKhx7Pvz1+WKwcE/5SCjiaSm8XyF2uVXsNoq8Z34h4QrUsQm
         Pj1A==
X-Forwarded-Encrypted: i=1; AJvYcCWOR9v/g84PJDYh0LlTaE0iiUCSoTLN5+c4ZsGm4m9P8FViElCMzkDm7FY0uo8z2uxsdjIdKcL/6wpzs+EKPw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2G/MFNC5ycPfamFTSXWjapfQKC9dQ/FZDctFou+uD7TMDsCOo
	LNu+HKTQxI02JOw42x3EMyBrjUHX4PmUX8meerIMwMr1xzXr3bW3AVOWak53MEORj8UJ8HSuIMQ
	3LIep2v6tV2ZeVt7MT7Q4CPztdWISOVb96QCFw9AZ+bSbm/HEGcAsZcU+BpZBCMZU4G35cJ2FtW
	VQLYyPcNC/mHbdkWMgayyrH2JlN9u6OBlAl8hrKXOlHc4QHEx9P9FxEmm2EeSEtycMujUcuPhsv
	+jlwYdmM7aNcQdZXMVV8Oyd4k9JU00/aA==
X-Gm-Gg: AY/fxX7itcuVC7pnmqQiNL5BppB7+jK4+qc6wCmyZXLDa103nz7P4D+pymBCD+Bq0vE
	4SrbdemyumgP4Rp0Ll4KzcDXTsJ+YwH7elttyKcCMu5aKz4q0dqyRNSHk+qJ6h/wsTNryveLydy
	TbA6hRTRUZ4N01RDaOEqV4wMqVizio06YmzgFZ1+oOsOTFHG86vVZFi2HINgHBhCWUtmsdDPJK+
	/xiWFfboUqFQRijfqah+sQ+nzNW8MGsFnnhWWuLwKSihKvTL8TWuCyL6aHK8NVUFOs1uye4nVoD
	q7SXR9FGS5sby4zacux0Fv08vR39p7DkgbwmcsrkIqFJ253lVjpM1g5u0W9Umci00sS82Zhvf9G
	Y9hZBcPLRXs2hRWpKDd1iH87q5zYWAHJLdh6PbvmRJV9g0FTOa4TWtyIthifnfckAMdHNyy3cx/
	WO9tsAWMDJbxV1FNwVy45uwQpCxSRETcvDEag6V38T4IZ9KclJYd0=
X-Google-Smtp-Source: AGHT+IFB7P6M3MiwMlwDIqFdmOAlvUH++nAwsn/7g5po5JZ6GL9GoiqddpXfwE6P2lBe3Lh4n6AhRYiqmBnL
X-Received: by 2002:a05:6830:718c:b0:7c7:2cd3:5baa with SMTP id 46e09a7af769-7ce50a706bamr6102675a34.34.1767954846337;
        Fri, 09 Jan 2026 02:34:06 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7ce4789e847sm1742665a34.6.2026.01.09.02.34.05
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Jan 2026 02:34:06 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b259f0da04so1025983485a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Jan 2026 02:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1767954845; x=1768559645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kCeTL5DyL4OpVceWW2dtJZK2fvnfNct2KD6UucHZ0lo=;
        b=YtO8jBOv1bA34u1WS+9DVeEngZp36uKwFRG2tF1iz1kPXFWV1/jag0qhli1KnexEln
         4F6afXtA5amBQTjFOySVfmD/wED6oNFmUmKYWvxr3cyVY13qcQsIFc8/62+uY4FEDki8
         KeIZjeN/4XidPKsTF60fsN7UY9MoRtH9Dtd9M=
X-Forwarded-Encrypted: i=1; AJvYcCUgIMBpIjo2SUfx9cYDFhUXY7CZr3ssAGXo90sJobBd7qsLRBrzYik62hp2m85Fs+JdbKR+Vt9SMHH0TX9Ipg==@lists.infradead.org
X-Received: by 2002:a05:620a:7088:b0:8c3:87eb:f with SMTP id af79cd13be357-8c3893ef6d0mr1155257985a.53.1767954845216;
        Fri, 09 Jan 2026 02:34:05 -0800 (PST)
X-Received: by 2002:a05:620a:7088:b0:8c3:87eb:f with SMTP id af79cd13be357-8c3893ef6d0mr1155254585a.53.1767954844715;
        Fri, 09 Jan 2026 02:34:04 -0800 (PST)
Received: from shivania.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc73dsm73691156d6.7.2026.01.09.02.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 02:34:04 -0800 (PST)
From: Shivani Agarwal <shivani.agarwal@broadcom.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sthumma@codeaurora.org,
	JBottomley@Parallels.com,
	santoshsy@gmail.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Sanjeev Yadav <sanjeev.y@mediatek.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Peter Wang <peter.wang@mediatek.com>,
	Sasha Levin <sashal@kernel.org>,
	Shivani Agarwal <shivani.agarwal@broadcom.com>
Subject: [PATCH v5.10] scsi: core: ufs: Fix a hang in the error handler
Date: Fri,  9 Jan 2026 02:13:02 -0800
Message-Id: <20260109101302.676694-1-shivani.agarwal@broadcom.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_023408_132684_53868F89 
X-CRM114-Status: GOOD (  10.08  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sanjeev Yadav <sanjeev.y@mediatek.com>

[ Upstream commit 8a3514d348de87a9d5e2ac00fbac4faae0b97996 ]

ufshcd_err_handling_prepare() calls ufshcd_rpm_get_sync(). The latter
function can only succeed if UFSHCD_EH_IN_PROGRESS is not set because
resuming involves submitting a SCSI command and ufshcd_queuecommand()
returns SCSI_MLQUEUE_HOST_BUSY if UFSHCD_EH_IN_PROGRESS is set. Fix this
hang by setting UFSHCD_EH_IN_PROGRESS after ufshcd_rpm_get_sync() has
been called instead of before.

Backtrace:
__switch_to+0x174/0x338
__schedule+0x600/0x9e4
schedule+0x7c/0xe8
schedule_timeout+0xa4/0x1c8
io_schedule_timeout+0x48/0x70
wait_for_common_io+0xa8/0x160 //waiting on START_STOP
wait_for_completion_io_timeout+0x10/0x20
blk_execute_rq+0xe4/0x1e4
scsi_execute_cmd+0x108/0x244
ufshcd_set_dev_pwr_mode+0xe8/0x250
__ufshcd_wl_resume+0x94/0x354
ufshcd_wl_runtime_resume+0x3c/0x174
scsi_runtime_resume+0x64/0xa4
rpm_resume+0x15c/0xa1c
__pm_runtime_resume+0x4c/0x90 // Runtime resume ongoing
ufshcd_err_handler+0x1a0/0xd08
process_one_work+0x174/0x808
worker_thread+0x15c/0x490
kthread+0xf4/0x1ec
ret_from_fork+0x10/0x20

Signed-off-by: Sanjeev Yadav <sanjeev.y@mediatek.com>
[ bvanassche: rewrote patch description ]
Fixes: 62694735ca95 ("[SCSI] ufs: Add runtime PM support for UFS host controller driver")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Link: https://lore.kernel.org/r/20250523201409.1676055-1-bvanassche@acm.org
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
[Shivani: Modified to apply on 5.10.y]
Signed-off-by: Shivani Agarwal <shivani.agarwal@broadcom.com>
---
 drivers/scsi/ufs/ufshcd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 54e7d96bf..c1f232472 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -5766,10 +5766,12 @@ static void ufshcd_err_handler(struct work_struct *work)
 		spin_unlock_irqrestore(hba->host->host_lock, flags);
 		return;
 	}
-	ufshcd_set_eh_in_progress(hba);
 	spin_unlock_irqrestore(hba->host->host_lock, flags);
+
 	ufshcd_err_handling_prepare(hba);
+
 	spin_lock_irqsave(hba->host->host_lock, flags);
+	ufshcd_set_eh_in_progress(hba);
 	ufshcd_scsi_block_requests(hba);
 	/*
 	 * A full reset and restore might have happened after preparation
-- 
2.40.4


