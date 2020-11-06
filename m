Return-Path: <SRS0=NSCp=EM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC295C55178
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 11:10:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AC9A20735
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 11:10:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k80zy37Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boAnYnnl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AC9A20735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kn9o84kBQaYEOQV1zG6kZUwvZ3f48NEfcVMEwJSiJ/4=; b=k80zy37ZA1deVvROWrE91mfDCT
	NhJRRJf+LI9bmab4nNULWQ1mxaawZ2yUcFT7alZI18EwoIdBx0AfMS7RPnml9WTq5GxE5/9oQ4/fq
	e4t5wkgB5pHxR7tn5CRK3tuyEQBwvzI8fm2Dxab462mQOfBfIL5ZOr5mlaSkmaa8JLJFCKL7EhSFC
	iigx4euzZ/neLTLFv28XwG/b6SpkjHi0EsWF6ATYhOo1dDBJKl2YhrJGs3rqck1j1glzOYCJwsDXT
	ZshHRz57tWDX2MuGe/im7ESukP0cxX7ZUPfLZNvMFNMgus5xjnJxSHDKwKtaYF0yxOaF28qyFUUMF
	866fbvYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaywM-0000LV-Lx; Fri, 06 Nov 2020 10:25:54 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaywH-0000EA-Au; Fri, 06 Nov 2020 10:25:50 +0000
Received: by mail-pf1-x444.google.com with SMTP id 13so918774pfy.4;
 Fri, 06 Nov 2020 02:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=FLfHJOXQm1uej3hFUFpWXlA26tRNkCfwwdzbi5ScsSQ=;
 b=boAnYnnlhauGDB9+l9QIEa/OGeuCUKGw0IVSxJN9gJdIC6hpZjnMNyZCqrt7ZNMHQH
 JNLfY5fx2T/HPrDCz7hd+ifKm7zIUt7eLpf1GeGmHdQCmvp7eBQuMHrPlqoki1NVuCsu
 lT0WnCkWIf5pvZ9cMAKm5dfsThtHn3sU0jxdWx8Hvkfd02p8fPuDhZZIK3O5pw+Q4nig
 a6NqUtyUFW8iEL0JyBqyZzoVC/Eh8EpvDNTrbsCTv1yP5enjlX2tjuTndCnznUfvhuv+
 Uic8zjjG78/Bka3OyV1IXZxlKLcO6E9PDLXdOWJGPfdm2XnenJjENK5yOKW/lAK3Bjhd
 etSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FLfHJOXQm1uej3hFUFpWXlA26tRNkCfwwdzbi5ScsSQ=;
 b=kvrVmHxRFGz6Lma7Pi0rGtyuGjMr2bqmqKjDJKCauTFhWUVbqVmzVZdv1Zq8H80HUy
 8Ljqn3E1eTfNJMLq+c1mlb8UQFvkMOffeXdNfK+iYYlAiLyj8RIHx123FErWybvRXkQ7
 yukgEtTTBastCJo9aCajVVqm5OYgiLrItq84qJ1B8t0SVZSNi22GsyUGD1CjzEkO2+di
 V2KzqIc3yeUSWOzmB0KnBavlyBxhfDofXv5GfGr1npqbppo8ivbRriP64pBUGBkkFzx3
 rd2S9kRiGmubCh6lbNUxFCft4Pm9GtJq6T1o3B89hOARScd5V3qLWUrLBesTNVzLOaxo
 8jTQ==
X-Gm-Message-State: AOAM531LVTpS3ssJKyjkPK3KyINlWjd4gZ/zgU0h4UJx879QK3YCrtPB
 pcWLv1lQuRJnnrQecPkG6E8=
X-Google-Smtp-Source: ABdhPJyLnNz9MpjtBAmV2AxZf7EJzZAtleTlmjqsR3z/9TVuGk5DSmdR9uWoBTFar7lvtqlLVgMuNQ==
X-Received: by 2002:aa7:8287:0:b029:142:2501:39ec with SMTP id
 s7-20020aa782870000b0290142250139ecmr1228237pfm.59.1604658345723; 
 Fri, 06 Nov 2020 02:25:45 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:57a:6823:8ab3:4b5d:4c53:f39b])
 by smtp.gmail.com with ESMTPSA id g3sm1260633pgl.55.2020.11.06.02.25.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Nov 2020 02:25:45 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v6 0/11] mfd: mt6360: Merge different sub-devices I2C
 read/write
Date: Fri,  6 Nov 2020 17:53:41 +0800
Message-Id: <1604656432-10215-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_052549_421367_5E359182 
X-CRM114-Status: UNSURE (   9.71  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series merge different sub-device I2C read/write into one Regmap and
fix coding style for well-organized.

Gene Chen (11)
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
  mfd: mt6360: Remove MT6360 regulator of_compatible

 b/drivers/mfd/Kconfig       |    1 
 b/drivers/mfd/mt6360-core.c |  555 +++++++++++++++++++++++++++++---------------
 include/linux/mfd/mt6360.h  |  240 -------------------
 3 files changed, 377 insertions(+), 419 deletions(-)

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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
