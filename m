Return-Path: <SRS0=M313=EX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E62C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 10:57:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A31F920781
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 10:57:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Co//OqtJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m16pyCmz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A31F920781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xQ0G/eCwQv5NMZ7Fgy1L0wTFvyezXy0fJ6sd/Brm+SI=; b=Co//OqtJ09EyNN2gsJGUKFf5tQ
	9HWwXJli/p1Iu5ZP0aYD4WG/G0dgSMmxaXFQkhqY6RGjYC/uAhqEAVSH2MNh5paEqdWJWcKfD6Na+
	O7rmNbzIJeqeMUSBBbSuai5bpwEeaEBeLwZnQVsL+JW83ON5RPJTcf+mBRNtHmqN15UZUI4OBDNep
	WfzlKBd5BNcIcojSeCCTeDSnm1RZWfkaEuGwvgz3c5rWZPtbLyuDzE/gQn4ODLyoayVtEFbCT9wBf
	AD6CDhIxlcBi/09IO/mvd3X1Nb0OnIq9ll6hS01VkPwvW1w9ugrjTMUpzGaFcgf3L7pPsyLdPeZQ4
	kQlsxlpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keyfP-0005WV-E8; Tue, 17 Nov 2020 10:56:55 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keyer-0005I6-12; Tue, 17 Nov 2020 10:56:22 +0000
Received: by mail-pl1-x644.google.com with SMTP id x15so10046886pll.2;
 Tue, 17 Nov 2020 02:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=NLioOEcjfW/MmxTk00oamg+ivAVVHPp1FiA+wpjNbWQ=;
 b=m16pyCmzxROuHGcdnv2Xv4oL6krzQq0Gt2whfw3SxwIGX6hcYcu9GDcMI+kZfnOlfk
 JwynXS8svraxDwOQL3//C8AK+vnlfskp4OstdzkF7aFMPq+YqWNlGyxVp6zcQfV8vnuN
 PzcyaR8upFUAwpppzQDFaiLB91QxvCk4cDbczEqh8PHlS9rlBXdWyUoZkECp63RijA7f
 EDqgMuWJsBOvjyFZJ/rmui1rv+e9d9AEt8YCO7ebt6V/Rm9Srto8iN01GghqLq6x6MSW
 QJg5zleOp+e2usSrbOkRlcw62xxT/aqw0U0dRKwvplQhqd/9qlUvCVgeBZR9oQC+6unj
 kT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=NLioOEcjfW/MmxTk00oamg+ivAVVHPp1FiA+wpjNbWQ=;
 b=KtU2LmuieHG3Tnr5pQrcyvMgDIsQPikLzQhCKqWhlgWMY7mPfmYAADpabEo83j1s8e
 wyvn73P1A2yG8OOwz7qqQeEnBQM8iuXsXGF0eAu2uSHdXect9muxYzF3gdekJ1JjTbl4
 qFUOhDVQMRf94ps47wq1FWV7gd/x6ewKjubUiZ1l2lLSK5QSu8TheelI5J0ujrvxW9GO
 mMdgwj2mi6wNq8SlOlLhpqqVa0iBHM7lMxa2Le8QYiUMvP03aGPTL2lOM5lUwOWymQ1u
 YiiLuCQbX8C/OArTsKDyQHRaTnDjyfhMu+R3eg7M4gAdhfiiJ9PQYNHxh/wFPYrNnxCI
 eK0w==
X-Gm-Message-State: AOAM530+kZSR5HRdr1Eg+8qMfN7JGUvKnMBEQlz7gMDk1py7wjMY3kvP
 zHBWE+76JT7B49fyYNa0dmk=
X-Google-Smtp-Source: ABdhPJzOnlyq5JZKywoPCUL0ozBIsDw0gn8Ce0wd4hCMagPJR9P7t/9xKX9Pruuso/Sx+MXfdcBbOA==
X-Received: by 2002:a17:90b:208:: with SMTP id
 fy8mr1101286pjb.204.1605610577432; 
 Tue, 17 Nov 2020 02:56:17 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:462:32e6:3119:2966:5eda:751d])
 by smtp.gmail.com with ESMTPSA id j11sm17708214pgp.82.2020.11.17.02.56.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Nov 2020 02:56:16 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v6 0/2] leds: mt6360: Add LED driver for MT6360
Date: Tue, 17 Nov 2020 18:55:35 +0800
Message-Id: <1605610537-18085-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_055621_157710_EF1D3A01 
X-CRM114-Status: GOOD (  10.68  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, dmurphy@ti.com, linux-leds@vger.kernel.org,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series add MT6360 LED support contains driver and binding document

Gene Chen (2)
 dt-bindings: leds: Add bindings for MT6360 LED
 leds: mt6360: Add LED driver for MT6360

 Documentation/devicetree/bindings/leds/leds-mt6360.yaml |   95 +
 drivers/leds/Kconfig                                    |   12 
 drivers/leds/Makefile                                   |    1 
 drivers/leds/leds-mt6360.c                              |  783 ++++++++++++++++
 4 files changed, 891 insertions(+)

changelogs between v1 & v2
 - add led driver with mfd

changelogs between v2 & v3
 - independent add led driver
 - add dt-binding document
 - refactor macros definition for easy to debug
 - parse device tree by fwnode
 - use devm*ext to register led class device

changelogs between v3 & v4
 - fix binding document description
 - use GENMASK and add unit postfix to definition
 - isink register led class device

changelogs between v4 & v5
 - change rgb isink to multicolor control
 - add binding reference to mfd yaml

changelogs between v5 & v6
 - Use DT to decide RGB LED is multicolor device or indicator device only


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
