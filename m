Return-Path: <SRS0=NSCp=EM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511FBC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 09:31:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFA5221707
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 09:31:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MiuxfFJk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oEMybdqm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFA5221707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Ill6vNRKkYWk8JCtfT4in1xUN6LsPDrc/ZSeGtjZBI=; b=MiuxfFJk8kR9JiG2LHwjYLyWG4
	n4k/Jv/tl0sG6jGU/l0bPEEeDb1gBiHzJp8IMYo5ur4eUqXurTpV1TDUvK+72T2dmDfj/j+fU50Ud
	6oNJnlFiTidgM4eeROmupri1+mv3hGQs86IcxExaUFrGrnGv1r5TmuMuDQz+GMNcOgFsP/gldeVR6
	sTsp1UPcQRreC9Sr1ybPeG1xPTUuZfjcdBHBuU73bftsvJxP3pwJrUGHpZPFzesqkNHdIemqX2mlE
	mg4bC9tikrM5506uXTj8LBaqT6VOFCmfdzrdfa9/SU73diTUEIakPTqXxOU6OKMmE/+K3qSKmvhEx
	vsGUnsMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kay5m-0002O9-6w; Fri, 06 Nov 2020 09:31:34 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kay4m-0001lC-L1; Fri, 06 Nov 2020 09:30:33 +0000
Received: by mail-pf1-x442.google.com with SMTP id 13so792695pfy.4;
 Fri, 06 Nov 2020 01:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=9IjLA/xj+DCaqgqGoF9Azl/MuEmkxVdtKRQX7C0Fd1c=;
 b=oEMybdqmr95hrZY/hQwyBKi9MAagPUHqbE2DaSTPVO6nJ3xAap7nnQaSAl13MglVkW
 8dD7Sa0IgcuaELVi3kjGgDYV1GW64m2zF1c5rKbsyHPy9mh8iyUBHWYwxbOK3TI5b1Iq
 JwAfMNWachoFTgNndJsVtagFpY87gK0TypeP/jVbHmu5IOLxO1Sx0XFsPpCkfG89YCpv
 D0M2iikm9dks0ltM5Lc2oL4EkAO53DyGZB0lSwKJQs74UlZMg+47hltxFmaEf1IcqIzq
 1m7WaOdG9avHDRZBeD3DF17VVBg3X+08g7MH7BOFotBoXh7a/lkBOUnBFEYjsI4/IwSs
 nLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=9IjLA/xj+DCaqgqGoF9Azl/MuEmkxVdtKRQX7C0Fd1c=;
 b=K08Z90CeLy26ckRYq1DFtGy2Eih/x3OAuWvVIfZInqVC8mo4bDeBmAArPfjy3WXYv4
 NbDeh3ao10Ec4djgLFyBiqhCnyKEnEcQTiugF6NPzNMd7HSa88wnxNBNgz+0XEqL9RGo
 o0dflCgCdYYs+QKHB8JIi5tSq76WQBpLSECF9+0SRJdoqDnhbZXm7PrryKZ7tgpymNQK
 uSfVVBm6U1PRetwWMpZsy+T2U558uc2GyYRKO905CkkhEZi545Ezvykw1c1ui5JaWnTA
 EvOLVzA6Yx/oOu3XzyAvQEz/jNS0lLCffPuF5LhScuvefPvDtT4BgqqtRX4skAgKcq42
 kFHA==
X-Gm-Message-State: AOAM5301v5+OWfyXWP1bwTSu0ubuiLTOSgxMRvQttvCzVMHk66u0OUpM
 1MSZKKiNMHuAEE2KyPRdag==
X-Google-Smtp-Source: ABdhPJyyHHQHPk/miYMvK3I7A3pJyIqVqCI4XP4bzwu4ZDR+kR8EHkhl1nQyYgOMuhMtvMvAXaeq2w==
X-Received: by 2002:a17:90b:4a4e:: with SMTP id
 lb14mr1495282pjb.23.1604655030124; 
 Fri, 06 Nov 2020 01:30:30 -0800 (PST)
Received: from Sleakybeast ([103.250.163.155])
 by smtp.gmail.com with ESMTPSA id t19sm1030428pgv.37.2020.11.06.01.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 01:30:29 -0800 (PST)
Date: Fri, 6 Nov 2020 15:00:21 +0530
From: Siddhant Gupta <siddhantgupta416@gmail.com>
To: matthias.bgg@gmail.com
Subject: [PATCH] Staging: mt7621-pci: Fix alignment warnings
Message-ID: <20201106093021.GA25237@Sleakybeast>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_043032_825020_6AABDBD7 
X-CRM114-Status: GOOD (  12.07  )
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
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, mamtashukla555@gmail.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 himadrispandya@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix the alignment issue pointed out by checkpatch

Signed-off-by: Siddhant Gupta <siddhantgupta416@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index f961b353c22e..0e95fb33b4e9 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -278,8 +278,8 @@ static void setup_cm_memory_region(struct mt7621_pcie *pcie)
 		write_gcr_reg1_base(mem_resource->start);
 		write_gcr_reg1_mask(mask | CM_GCR_REGn_MASK_CMTGT_IOCU0);
 		dev_info(dev, "PCI coherence region base: 0x%08llx, mask/settings: 0x%08llx\n",
-			(unsigned long long)read_gcr_reg1_base(),
-			(unsigned long long)read_gcr_reg1_mask());
+			 (unsigned long long)read_gcr_reg1_base(),
+			 (unsigned long long)read_gcr_reg1_mask());
 	}
 }
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
