Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A99C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 16:33:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 930D522BED
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 16:33:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="17t7Toan";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfVX7JRF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 930D522BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nGyQsClqSIDCy3SBeQkm7cnKt9ukfIrhrg/KPYlketo=; b=17t7ToanNAiPTKfp9J9RGH1fJE
	YBjZl9UfTR7hoTZS+4aQznPfeq5P+ORHrARHQ3VHTEVBqadYPsk1RbHdEMK5cpo81e3I+MXC+34FE
	WU0iDVgSrOsuWy4fjmwRyUIBgE29qtygnEGeGYawVSwIQ3jOSnSXiYARN+Rgy8GDcLV+iwHD3z2JD
	rZstmstuT/zvpJYsYZ39XssCiezglvEYAiQZteJ99do/7IDimjsz7Fi5X4WJEUALfy+QPorF5gkeb
	JaJ/8TtIlP8e98rHZb841tm7qNJMsUWEjVLX/iOobJzDril1bsiYgRi2yy628FuDu9mg68dP4TNS+
	c6V5CwfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2zsM-0008Ew-Tz; Tue, 04 Aug 2020 16:33:18 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2zsI-0008CS-2x; Tue, 04 Aug 2020 16:33:14 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d22so2359653pfn.5;
 Tue, 04 Aug 2020 09:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=HB1DkkB09qWrt8yrL+0cExf6RI1ifp17/l8uSNxk2h8=;
 b=GfVX7JRFiyydVuUHwuRkSVoi9Dt0M5wctuGo85UGu0V2/Bj7Iw8ZwXXGeO4G4xDYUp
 np+vuVGQa5uJtQ5C31c4dZJiLgWfpIur8koDCTklGFO8cTy0AblmPIrtFv+x6zbUWlOT
 neQsgY/KR+u4llcwlXhihfz4YjLhQp/XBRiNHkyCviUJh4FS3bKQ85+LznC6fEfIuEQ/
 52IL5umBBsFcVVp+irJlf3fP1BZ6XHeSONtKK0VkFxNYwYw7ZtTT1HgL6z3nGzejUQT0
 unemmPAeku7yf65PcsNx6ewsfJ02kcUyFGBedcDqotM0QDLi8b2Zs/YUuV8LFCSLj/lj
 sKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HB1DkkB09qWrt8yrL+0cExf6RI1ifp17/l8uSNxk2h8=;
 b=jHgFy75tNaYUf4tJ+6jzJy3UxMGisrjYLeKbJXYds4ePfk16SvfsX/Hy1HYYIBOZ01
 k/DvpVwh1NnSrS7t/Kwy1ZAcP8ZXzH6RTAch/ACB9AKMX2ewkAdWOBtr+IGYddrxHaLo
 3Zkmny0bGbu90Ib3h1ehF6/X8UnZfc9W2PCikfTa1cRZ3QYi2XSh38dOsnoPYwYISJyK
 4ZSGx+1VfJgjRbTZd4K2o3ZIWuU806MBmWbPUbJS5Je/JGEIJ4O/bZBieHRUABRLgSIl
 DAL24E0jYsKX8qSwEKRglDf7Zqt4An9jP5Mf3UPxUvTsnD9tYI1rZGe+IEoCM/vjVy3A
 FsHQ==
X-Gm-Message-State: AOAM533aP+JkbcJ9AD84JLxJYrDmmzFx/UAUcTGY4sUTpqo5qRkfWZ1A
 l7/gtGGKuupYtrO/bnp590YjY8tc
X-Google-Smtp-Source: ABdhPJyuQ7eqMONZEolc8ZLYWfB5jUxqOVUQhl5ZrHz4/DSZc3qM9xhnweID1yjp3OR1tkJPH+s7BQ==
X-Received: by 2002:a62:7bc5:: with SMTP id
 w188mr12600475pfc.192.1596558790085; 
 Tue, 04 Aug 2020 09:33:10 -0700 (PDT)
Received: from localhost.localdomain ([123.110.251.138])
 by smtp.gmail.com with ESMTPSA id m16sm657253pjz.47.2020.08.04.09.33.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Aug 2020 09:33:09 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com,
	rafael@kernel.org
Subject: [PATCH v3 0/9] mfd: mt6360: Merge different sub-devices I2C read/write
Date: Wed,  5 Aug 2020 00:32:52 +0800
Message-Id: <1596558782-3415-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_123314_154742_74494F25 
X-CRM114-Status: UNSURE (   7.45  )
X-CRM114-Notice: Please train this message.
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
Cc: gene_chen@richtek.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series merge different sub-device I2C read/write into one Regmap and
fix coding style for well-organized.

Gene Chen (9)
  mfd: mt6360: Rearrange include file
  mfd: mt6360: Remove redundant brackets around raw numbers
  mfd: mt6360: Indicate sub-dev compatible name by using
  mfd: mt6360: Combine mt6360 pmic/ldo resources into mt6360
  mfd: mt6360: Rename mt6360_pmu_data by mt6360_ddata
  mfd: mt6360: Rename mt6360_pmu by mt6360
  mfd: mt6360: Remove handle_post_irq callback function
  mfd: mt6360: Fix flow which is used to check ic exist
  mfd: mt6360: Merge different sub-devices I2C read/write

 drivers/base/regmap/Kconfig         |    3 
 drivers/base/regmap/Makefile        |    1 
 drivers/base/regmap/regmap-mt6360.c |  163 ++++++++++++++
 drivers/mfd/Kconfig                 |    2 
 drivers/mfd/mt6360-core.c           |  394 +++++++++++++++++++-----------------
 include/linux/mfd/mt6360.h          |  225 --------------------

changelogs between v2 & v3
- Replace mt6360_data to mt6360_ddata
- Split I2C read/write to regmap driver


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
