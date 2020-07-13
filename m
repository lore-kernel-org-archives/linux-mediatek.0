Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47484C433F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 13:30:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC1CA206F0
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 13:30:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TyPHt25f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eZztk7O7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC1CA206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d4aJIu9HInLTfzrsjAJ/qde7kA6XOLlX003LDCHbG5A=; b=TyPHt25fiAuhcLjWQBd32ed5H6
	vVp+qx2m6iIxaBXcNRqIq96Qbgvadim3p8FIS49aygYDLlqC/sYPGyhSRcNEHWsYCEc3ovEBPBErN
	Z2i7F8MGlro9devdn0UGRPsvDwujZ1xQYAVzB97RkyVMJvU4hF8a3dwCfZ3p7hPIX60eYMMCGSdf/
	i6V7XPjOXR2E1L02BIiO3h+pwZUdQRbmFeM+ecNmMldeDAuMrbAozf+b1EDIAd9F3hGsJpAwWCY0H
	lwgEJizoB/jIaQUNc1BNAzWEyH960eWnRq9TwekEfTdR4AFTlycNrygKJVkVL1vzxv5PWP5MkhDGz
	z/Qqdc6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juyWi-0008Nd-2t; Mon, 13 Jul 2020 13:29:48 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juyWc-0008IP-6I
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 13:29:44 +0000
Received: by mail-wr1-x444.google.com with SMTP id q5so16570283wru.6
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Jul 2020 06:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8M2es7HHouzmCUpyAYFqBmq/VXXAGiCHzbOor1SAZdY=;
 b=eZztk7O7rf+DFBdXysVaFW4Q6svK0fGNMvSOeDFuBZn/YGHCVDHChUbKn5LhBskGZF
 z4kFVrudVva1mgg1mPIwMgG/zOElB0ulSNlJAWaXR4twxVMVl3if3wzh4Jerf2NIhpy9
 ZgYZpN1qdb1PX8A36OK7S2FYxhqRzMqWnhli036pECPg1gVa6H+PclsfMX1+zivylIBh
 EdcoHIsqNvh00CBTbSgfCw04YoJLD5d00c8lG8RVo0q06XZ1R2AfjmaXvoXcZiRPu0I+
 TnQBMfQZVhJf8vwoGnfJyVRgxYMSADJXe6+/E4ouhnfFeOQD3BoMi4SN7/c/DPG7Jt5h
 uUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8M2es7HHouzmCUpyAYFqBmq/VXXAGiCHzbOor1SAZdY=;
 b=Z44d0sXfqtakemHG4Mgf49x/8osVp1JHJAffyWw7mISoETlQsKtkpoD+cz+LlfHmcp
 0IPmDZY8z3jbo6BKJ3UbgnVCNF6SmTOxiLokMPhbLb8cXR5RcMiztU1sQ9eOVvlkK1rN
 JWAt8+4ushsU0I/TvFdl8wzOhsAqmuXHW6JlfUhq23aPOtYc7xb2g0/WPwKnMEPy94Nn
 KIjRG/Q8B/V+f1qsMy0nopyN4fZtAR+2/z8hiVahZQ73Y5pHuv39ZjnbKRRd31qg/A5L
 OKjlpdkAMWhOAchMTXUUL/c5lNrUP9RGaVVQmiaczxMHOZRZUySkICYybdDb+7DVODQI
 hUbA==
X-Gm-Message-State: AOAM531rMePKqVyY6w4qAESLOfUH9ja3IX/cwBn3aAvCvLEkCn3SWk99
 f365LX0c3VYCrNijSmdm7+3/Ng==
X-Google-Smtp-Source: ABdhPJxMEwQ8RYMjAHEW54Z1j94xXKNRmix+I5953GVI4mfW5CH5zrllY5eazKO4pgPCsaIsWRN1NA==
X-Received: by 2002:adf:e40e:: with SMTP id g14mr86432689wrm.271.1594646979741; 
 Mon, 13 Jul 2020 06:29:39 -0700 (PDT)
Received: from linux.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j14sm23896642wrs.75.2020.07.13.06.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:29:38 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH 0/6] Add support of mt8183 APU
Date: Mon, 13 Jul 2020 15:29:21 +0200
Message-Id: <20200713132927.24925-1-abailon@baylibre.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_092942_365402_1AB40A6A 
X-CRM114-Status: GOOD (  14.55  )
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
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Bailon <abailon@baylibre.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some Mediatek's SoC have an Accelerated Processing Unit.
This adds support of the one available in the mt8183
(aswell some derivative SoC).

This series depends on two other series:
- Mediatek MT8183 scpsys support  
- arm64: dts: Add m4u and smi-larbs nodes for mt8183 

Notes:
This series include two workarounds:
- remoteproc: mtk_vpu_rproc: Don't try to load empty PT_LOAD segment
- rproc: mtk_apu: Don't try to use local APU RAM

The first one is required to load malformed firmwares.
This is probably caused by the toolchain we are using (a fork of gcc 4.2).
It would be better to fix the firmwares but I don't know how to fix it.

The second one prevents the CPU to access to the APU local RAM.
If the CPU tries to read or write the APU local RAM, then the CPU will
hang. I'm still looking for a solution, but until, we must prevent
remoteproc to write something (usually, to initialize data section).
Because of that issue, the current driver doesn't map the the local RAM.

Alexandre Bailon (6):
  dt bindings: remoteproc: Add bindings for MT8183 APU
  remoteproc: Add a remoteproc driver for the MT8183's APU
  remoteproc: mtk_vpu_rproc: Add support of JTAG
  remoteproc: mtk_vpu_rproc: Don't try to load empty PT_LOAD segment
  remoteproc: mtk_apu: Don't try to use the APU local RAM
  ARM64: mt8183: Add support of APU to mt8183

 .../bindings/remoteproc/mtk,apu.yaml          | 121 +++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  42 ++
 drivers/remoteproc/Kconfig                    |  19 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/mtk_apu_rproc.c            | 501 ++++++++++++++++++
 5 files changed, 684 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
 create mode 100644 drivers/remoteproc/mtk_apu_rproc.c

-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
