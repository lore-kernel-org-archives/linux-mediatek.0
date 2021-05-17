Return-Path: <SRS0=4pGO=KM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C6DC43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 17:34:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B02761285
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 17:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B02761285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zZLXCzR668pYy+ybZ1OZaFBf9vwscG6C3QaYjyupk+I=; b=hM/LKDEv6Enqc+h+Jnfv6jtJTg
	hGRXxwu+xtctZvUvSHz0d0D02R0ZQL70KgQmelvGsAg63EO8CsvMB4bhM12vVpsCp2wA8g6bkI+FJ
	/8lvLmXS0UFQ8w4PKGMLL3Y+uimLedn1mO7GReOd8sO/RlEWMN+wIRNkQIiKmTkjmpRfHKyBiJ2ja
	Col2cPE40CiINWz1hIzHeWQ9YmhyG8A93XhXh7kab4DmaCq/zTOAIZSCNBaVsQ3bj7TpAhmH3/wC4
	eYAEv0B2m8KX9MGTDA4iHsud/KAdspBghz7jhWGUMbqE7DDZahMz5kCXvYkSthY6E3+Ak0bMMw+6B
	eZ5z4AJg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lih7e-00FfBx-3P; Mon, 17 May 2021 17:33:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lih7O-00Ff9r-2b; Mon, 17 May 2021 17:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=YyJT27jROY3Us4aMnHuX9K8cycTBbP5Zslf0mdWBiXw=; b=KvdoVvFgwRgLSKIXDFSodYsllH
 rgi+UIWQbWDTIn/5m4eJ/zZQk7+Yp0M9TO/WTJ1iQYdB/bJsS8JH087XMzqxKX6/q2uWjYnd6/Svh
 7aUeku/+6APon31MAYmjLVRulAGaqZ6N/faECAz4UJr72KdKupEaEcIAgescIFJ5L6waysqryAzv+
 bF17Bej3i4Ogn5sr7UwIUGkqJ5fbiv16evxocZ7jJYV+KzmU9OCRmr29/6NslB+lsdONZA+XvsSJ0
 nHcwRF0/RqQtOw8FRDTB6RQDbjSdlOwcZmU0ep6FMjR2GUv4ak8AJG9JtZ4rb8pwtkHHNmz4dH7lo
 t6FODKuQ==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lih7L-00E1IQ-9R; Mon, 17 May 2021 17:33:24 +0000
Received: by mail-pj1-x1030.google.com with SMTP id ot16so2137269pjb.3;
 Mon, 17 May 2021 10:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YyJT27jROY3Us4aMnHuX9K8cycTBbP5Zslf0mdWBiXw=;
 b=CK62iBCy/RQ2BjPv1yClrCpAUpbt+Ysb53ae8FWiM42bso9RpHF+lBg7+pyc1yQeU1
 rcmaOWJJw9UpilQYrizPKIOcJ2PUdwiP992l5W8ureZM+ZFrz20yQkjcdyC/vZCrwUPA
 UMrG8/WzqWupAwiDxke6qgyLEef8Eaf4Sjgn1+tj3kaDWrghW+cfG2db4BQxpTo4h7D2
 Wdq5Ob+D2hPmAlA+LwfFJ4OhXz8Dhr1X3lpTHWIo1GPkpfmFp1GGtMUVPtI9NJZWX3nf
 IO/Oda3HHi1PM4pyM/K4F5Mf5+4ZnN/oEZDZg82xgt2QYtxmLXuZP1kVp0d6WUwOKkez
 gjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YyJT27jROY3Us4aMnHuX9K8cycTBbP5Zslf0mdWBiXw=;
 b=r1ui2v5j1PotxVIis9BttqILwGU9zMQ5624oMplFVq9ggiFOA/6wEDBfTzaW37039+
 fRIdTodfbhM0hBVlS08QmrXbaGFGn8tyyixZqmKq5ifY2Hafi2SLBZ8i3vLungZpSTBW
 6gcuYGoBU0n9aNS7TWzu7O4wCdmQOprljuM00+lcuxG2DPaEq8B9wipS+RNfPm+O0bi/
 2AFmcWUwh58MaNfW4BWNaaTK0IZ6uI8aTWGtZSeeflo5UvAr6Op/Yhkfr0cIHvtH5XQO
 UhQcvtqnzVA+pkdOsykfbVBtKZdCEKNAxODdU5YsHrI0S0un5+AZJ/GJFp/Gdhqv9GIW
 LBGQ==
X-Gm-Message-State: AOAM533GZhN3/b5f0109ydcVGWvJtWmi3d2Cap390USYItmf0+/ym6ZA
 aJ7+YHCcjSFRoAILHeWPwAU=
X-Google-Smtp-Source: ABdhPJzKiFisdsryRyyPlxTEC5N4xeu4PT4pPr526crQuP/kU94npr7pMnPRBuXFqs5uz4ipGk1dlg==
X-Received: by 2002:a17:90a:fc8f:: with SMTP id
 ci15mr537328pjb.147.1621272801488; 
 Mon, 17 May 2021 10:33:21 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:47e:c24d:6c72:a52:2c8:7df1])
 by smtp.gmail.com with ESMTPSA id
 c12sm10358296pfr.154.2021.05.17.10.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 10:33:21 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, cy_huang@richtek.com
Subject: [PATCH v8 0/10] mfd: mt6360: Merge different sub-devices I2C
 read/write
Date: Tue, 18 May 2021 01:33:04 +0800
Message-Id: <20210517173314.140912-1-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_103323_363229_F2650317 
X-CRM114-Status: UNSURE (   7.68  )
X-CRM114-Notice: Please train this message.
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

This patch series merge different sub-device I2C read/write into one Regmap and
fix coding style for well-organized.

Gene Chen (10)
  mfd: mt6360: Rearrange include file
  mfd: mt6360: Remove redundant brackets around raw numbers
  mfd: mt6360: Indicate sub-dev compatible name by using
  mfd: mt6360: Combine mt6360 pmic/ldo resources into mt6360
  mfd: mt6360: Rename mt6360_pmu_data by mt6360_ddata
  mfd: mt6360: Rename mt6360_pmu by mt6360
  mfd: mt6360: Remove handle_post_irq callback function
  mfd: mt6360: Fix flow which is used to check ic exist
  mfd: mt6360: Merge header file into driver and remove unuse register define
  mfd: mt6360: Merge different sub-devices I2C read/write

 drivers/mfd/Kconfig        |   1 +
 drivers/mfd/mt6360-core.c  | 552 ++++++++++++++++++++++++++++++---------------
 include/linux/mfd/mt6360.h | 240 --------------------
 3 files changed, 376 insertions(+), 417 deletions(-)

changelogs between v2 & v3
- Replace mt6360_data to mt6360_ddata
- Split I2C read/write to regmap driver

changelogs between v3 & v4
- Merge back mt6360 regmap driver to MFD driver

changelogs between v4 & v5
- use devm_regmap_init
- define crc calculation magic number

changelogs between v5 & v6
- Remove unrelated change
- Remove regulator device of_compatible

changelogs between v6 & v7
- Replace OF_MFD_CELL by MFD_CELL_RES

changelogs between v7 & v8
- use MFD_CELL_RES for regulator sub-device and sync codebase to latest



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
