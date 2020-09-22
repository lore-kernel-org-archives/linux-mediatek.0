Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D55C4727D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 10:21:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D38612396D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 10:21:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RGM+mia5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGbfJjYH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D38612396D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G7SmBuN9V4ON0l2EuKRYLc7PYKGzFe8nmJyGd4wXZKU=; b=RGM+mia5Q+6DrtMHNiYnx84IWx
	bRfQV7KvMLzKG7prO1pmBAPndqKTghZsn8R7kjHgAsnd735tsG1tCds5D1NknDsMUTn2wP3tu7vp8
	xEC0j0bjDSwLwD4CF3ibt8ZnxsGkE/9+BEJWUX6niXeyfoyOq3dU92cAAibmEsTDb/OAR76g6bBeF
	n0dWQr9vex2hcDjJ2qgOInuS4rDZfsv8/DL2lJrjHP0P/Pvc8F7q5cFlshd3s/dlddaRvE7Gi3lEU
	RBW64G09nxmlUJlFDYz9je+IKHN9jagXxJu2B0zbK7Ne73Xe/my3VG+7pKlIUjlyioIOgmDwBO1Ig
	pzLxlJAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKfPl-0008Vl-T1; Tue, 22 Sep 2020 10:20:49 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKfPb-0008TX-61; Tue, 22 Sep 2020 10:20:45 +0000
Received: by mail-pf1-x444.google.com with SMTP id l126so12011500pfd.5;
 Tue, 22 Sep 2020 03:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7fQuWBXljb/Nb+nIz5ln0i6rqDkV5C/TaLBysLpJeXc=;
 b=dGbfJjYHGUsX4whdUEtsnGvSZclf8yoiDzGDTnKlaFyBea/9xUU4s1H9xX7nOpYJ1I
 S4rY4+6IEYE9PMLqTT8e3QiADm5LFCkzVhDYfNvt6reB8bjwKH/6LqMuPv2SMNJB3jaO
 MGmMiQIXp7OhAmAuvnds2yAQTGcucHiXhIlv+W1Oebel5ibvrnSbCF0Gr/fnEzhKBdDH
 TotftJ3/oAjjKnbWA0NsGC7D8gc8s+Vyb5PUQL0AcHpTDpJf6U/Y7AVSYTx4nt5SDQuF
 abDQjWlx7h2hS3X1N3h7Kc/LBnGIL5kakrHMiwdgz8XKohpUHtgfyBUgMNMKhWm2uNSo
 SmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7fQuWBXljb/Nb+nIz5ln0i6rqDkV5C/TaLBysLpJeXc=;
 b=uPmFcAzJSLkyQQ3n+PB8MlWpyq9Fc2H2GntAEWDMGrcfRa3LZGNtTZ59HDucmhjt0z
 eZ0tURlR0xhPIWQCCmXtviZQ0Hi+ngxEHFu3ATj6upM2RnOy3chEkeRTZW28+N+rV+k8
 nWWV3FkvychuQeEVyX00Nk1MybovGPPhtuAAeVWsgRIUjY49qAog7oEJzV/ogJZt3I9K
 Q9c/sZ0kKyGqKtGely9+w9PjxHROoTi2wEG4rFnZz78SM/Av2yR+IPanppU0jSdUuKjR
 atoEKUbhS3BHUqzfftNaOP5Y3dePZlI8gjqQbkFJjVrrSK6uHVgaLFLXH+aXTlZeVPfS
 Yi4Q==
X-Gm-Message-State: AOAM5311b9wQTDCO0nRJjd3xkebisNbmFuxV7T5TecvPzLXleLILiCZA
 +BX6nLUqQ9Khl69ZyeMpKzI=
X-Google-Smtp-Source: ABdhPJwYE2X4pOLB8U6Db8OOQsfH9D2Xluj+RFfwZ+28ZZL03wPUAuhWHBB8HhE/mQOOeQbP5GQQCw==
X-Received: by 2002:a05:6a00:15c1:b029:13e:d13d:a07a with SMTP id
 o1-20020a056a0015c1b029013ed13da07amr3390355pfu.17.1600770037261; 
 Tue, 22 Sep 2020 03:20:37 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:489:56d9:501b:f524:c013:2733])
 by smtp.gmail.com with ESMTPSA id a15sm14859037pfi.119.2020.09.22.03.20.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Sep 2020 03:20:36 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v5 0/10] mfd: mt6360: Merge different sub-devices I2C
 read/write
Date: Tue, 22 Sep 2020 18:20:08 +0800
Message-Id: <1600770019-11585-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_062044_330347_38F60240 
X-CRM114-Status: UNSURE (   9.52  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
MIME-Version: 1.0
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

 b/drivers/mfd/Kconfig       |    1 
 b/drivers/mfd/mt6360-core.c |  564 +++++++++++++++++++++++++++++---------------
 include/linux/mfd/mt6360.h  |  240 ------------------
 3 files changed, 380 insertions(+), 425 deletions(-)

changelogs between v2 & v3
- Replace mt6360_data to mt6360_ddata
- Split I2C read/write to regmap driver

changelogs between v3 & v4
- Merge back mt6360 regmap driver to MFD driver

changelogs between v4 & v5
- use devm_regmap_init
- define crc calculation magic number


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
