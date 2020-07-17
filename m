Return-Path: <SRS0=RXgq=A4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A22C433E5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 11:04:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D292120768
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 11:04:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vv8FRnYP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNmyeu4x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D292120768
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QEhBcLmKxUUJzoyb70NEMwtshEJ3i5OD+ZWjRHPEab8=; b=Vv8FRnYPna3E214sRGNW+KpClb
	xIwSUlMpf5a0Nfuyx6EvZcoG45g7+Z9iwT6d2J5LhWCYxd4OwWQHzx6FFZUC/o+ZuNmE83VOkMaEv
	unJ2sNzjGnyqMJwBrkqZXuojZ5vs0pdtRU4dnXB7gs77SFoucYJi/rEQWjudsFa9JO2EtBr7H1fuF
	ld6n/KHoSOCJ5GunZfRR2Ucyf10VqmNzYsPQKbNRJ6vR7xTz6PwdGlZRavZ1ytmaQvYCT7wY7A6TC
	1+bHi6DjnsI5GLJOvVW5pgwjD1TD5LbiC9T4/pw3GMu2Y06XRRTsK6BF2M59D5Xzk5KnindOKwyHr
	xyAssDng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwO9u-0006Dz-GL; Fri, 17 Jul 2020 11:04:06 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwO9p-0006Bo-8v; Fri, 17 Jul 2020 11:04:02 +0000
Received: by mail-pf1-x432.google.com with SMTP id u5so5225345pfn.7;
 Fri, 17 Jul 2020 04:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=oMcGbx2imE1XCRTD2EZEX5mjUc+WOEiUyZtFTlxo4O0=;
 b=FNmyeu4xyTkRfDEyFX4wGUU5+9+PYRiCQaYeErluUVNWUYAFqnSKulZN0Ye3xuum/2
 Mmf9YcoM7OHWgHMt4n0SalCM2DNzqdclxxCQVNnuLRj8tqq6ss/JcprPHVLXJkidvlFB
 9jQSOAhNKX/nyHqjzAM8zkn8iKGtP9KY9K/F++s7Ny8AL+GmzcXGdcKvMU4TrpGDZN07
 2eB4hl3V57YpEBf6l3tg5GNS0LLqJH/VTNanywdis1p5Cze4rfDekjPCtS84gE8Hy+CK
 SSuk2V35BpiBcp597sZmuY7KbDhKK3W30AEhueAvCpFoK2oi4Dhd5u9OlfuEs1bKlyn2
 b5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=oMcGbx2imE1XCRTD2EZEX5mjUc+WOEiUyZtFTlxo4O0=;
 b=nWJF2IS2Y+bn3qndlViC8esb49qhL2JkLELQqHYhKrQex6SjOqQ/3WrxjwsihHuQUb
 Tfq0XtWYcoCQJIC9nh30t9t8ssDYj2RoP6f+uSpHly3RUmyLxaMrs4JnLQGDAdt/mB8Z
 aX0Wyy/vVK7zBWn0WuAucaS66N2nf4xLAlt7mNJo+MBuSuTUiorhJsyKrGR9CfUgW6i8
 ZUwivC6Po6aLNJbFA2lcM1tejJeEsoJyFsXHpvhQ05c9e/TlN9yN6KvigljfCjYPBSkV
 Xp0yBGjt7tBOB5mY3lu6KV5oxfoQlgN5W54dKj7EhDOyY7/ETW7xTHabQRimYY0bk9bC
 RC9Q==
X-Gm-Message-State: AOAM5336sO7o3ZaiYM8TUoo0azg5ogOqHpsgSpdXPBafCdTA2SS5UHnP
 H4Pc9u/WmRYuFlaUlp5tgR4m7n3K
X-Google-Smtp-Source: ABdhPJy4XikVZpT4czM2m+AMaLPvDOKAAcWfZkSjcSKGw8h5dUgGJ2t2TX6qspjn4BTSQ0O8t5TnCg==
X-Received: by 2002:aa7:9303:: with SMTP id 3mr7486112pfj.108.1594983836163;
 Fri, 17 Jul 2020 04:03:56 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:469:ae36:984e:c073:9d0b:7c09])
 by smtp.gmail.com with ESMTPSA id o26sm7619183pfp.219.2020.07.17.04.03.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Jul 2020 04:03:55 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v2 0/9] mfd: mt6360: Merge different sub-devices i2c read/write
Date: Fri, 17 Jul 2020 19:03:22 +0800
Message-Id: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_070401_355091_74CC6EFD 
X-CRM114-Status: UNSURE (   5.18  )
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
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series merge different sub-device i2c read/write into one regmap and
fix coding style for well-organized.

Gene Chen (9)
  mfd: mt6360: Rearrange include file
  mfd: mt6360: Remove redundant brackets around raw numbers
  mfd: mt6360: Indicate sub-dev compatible name by using
  mfd: mt6360: Combine mt6360 pmic/ldo resouces into mt6360
  mfd: mt6360: Rename mt6360_pmu_data by mt6360_data
  mfd: mt6360: Rename mt6360_pmu by mt6360
  mfd: mt6360: Remove handle_post_irq callback function
  mfd: mt6360: Fix flow which is used to check ic exist
  mfd: mt6360: Merge different sub-devices i2c read/write

 b/drivers/mfd/Kconfig       |    1 
 b/drivers/mfd/mt6360-core.c |  532 +++++++++++++++++++++++++++++---------------
 include/linux/mfd/mt6360.h  |  240 -------------------


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
