Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CD6C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 13:01:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B052206D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 13:01:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yocPJuIY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Xes36BsZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B052206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gWPy7jJH9jfpSgqCerwHJoQin9wYjNn3R3w17Alo7ew=; b=yocPJuIYG/b39dU1OXOKkFDDAy
	u8lKTXvIeJFmagEza7PncFsfPu+dvyIMTfqg93hkVfk0DDFT1Xt5hUSPWEXO7q0GMnfZon/arWgd/
	IOjNpPb+bPJR+RlL4Dqa3Od4YlMGrsxJ7WP4rfyctOBRIzU0UshxhgBbXa/J+sNfxdJW3oKwcwzgm
	mvJSgFADainA+850rUnswgQ5aZUi9PbPx80qSHKEGna2XR/HZWPt5GsbGZglwVVDNwnX5qcjIyZB8
	8w+ZHIXg3HtsLT2G3lWVYb5BLg4Pkg9lOXWvgkrsE0XIalRwRcfupDsihbXqyp28sot/KSR6nBEXE
	1p6IynAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGMCs-0000g3-Tx; Thu, 10 Sep 2020 13:01:42 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGMCp-0000dN-OH
 for linux-mediatek@lists.infradead.org; Thu, 10 Sep 2020 13:01:41 +0000
Received: by mail-wr1-x441.google.com with SMTP id t10so6631177wrv.1
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2020 06:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZJ2vHaYqoVGimQqIW+dGq81Ddb4etTQVEuSJ6N8/hV4=;
 b=Xes36BsZfAJFtqugTewRnG8S2F4SvtKI3ao41dtEndBZ6+tMSuxg2QYTyWuc2rLsv2
 dOk8MBtBz6erlo84rPylqikZUL3dr7mKIs4oRostt0NTudrbX3JzMzoH5PWdpmAIgOOL
 P9svCMAyrJaFMjzvfAtZ/O1Ob2HskNoICrLWNoSR3QDsHWfC80vnXy+F9RD11BpTEZJH
 J0SyhjkPnjODgRtc7CLZqHm8fG6KIcdOX1nJ7uV2CuKxEpunYhM+OsitUxa3e2UJnWs6
 lL6jtrqQAa477lPUpx+VmiChJcvPAh80Jnxc5+IibbSGDYBFtm2NxdOsd6oEqlDfAGaI
 fJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZJ2vHaYqoVGimQqIW+dGq81Ddb4etTQVEuSJ6N8/hV4=;
 b=UBpq9K1sUVkFiHqPhkYWxxCCi3nBccku3wyjraVWvrB6mOQ7yltLklsFo4ogv3I0le
 fPILGY9mUrKsFKSiFUZ9/O14+ji22U2zEahS/9/OLJBfAxfsM5XzHzUVNWX8Df6E80uh
 ma1r3JFjY47Yg/Qd85T9OmHDHrhIqkoYGxl4UJhunzm4Um1e2OI8ZSRocexlWnaB1uFM
 4LC2o0aS1bv/nwDZybLIWOOQ09yl++v2pupUund1Dz2zHIVUaNwTJ8hmnF9h/9Q3v8IS
 +Kmi0PHspWew/kqIkmOEd/Fyz2V7Kcb1tFkGofUj4D3Kqo7vJVBDbRDJ5XX7VNl7OBiI
 VIKA==
X-Gm-Message-State: AOAM531bowHEmUncux64QVzJh8qGx2f/JGPCKKgdadNXrE7ydhHJ04HK
 E6bQuZvB1rojLXtDA255mKjq6A==
X-Google-Smtp-Source: ABdhPJwTMfl8B7RyFT52ujmfWEzGY2zJt6LYENlU0R1nqA53iSiN5gy6cYDGYtwKp1dHNpKPfW+fFg==
X-Received: by 2002:a5d:444e:: with SMTP id x14mr8524324wrr.235.1599742897157; 
 Thu, 10 Sep 2020 06:01:37 -0700 (PDT)
Received: from alex-xps13.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y1sm9488269wru.87.2020.09.10.06.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 06:01:36 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, mathieu.poirier@linaro.org
Subject: [PATCH v2 0/4] Add support of mt8183 APU
Date: Thu, 10 Sep 2020 15:01:44 +0200
Message-Id: <20200910130148.8734-1-abailon@baylibre.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_090139_899255_F605483E 
X-CRM114-Status: GOOD (  15.47  )
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
Cc: devicetree@vger.kernel.org, stephane.leprovost@mediatek.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 gpain@baylibre.com, linux-mediatek@lists.infradead.org,
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

Changes in v2:
- Drop the workarounds needed to load bad firmwares
- There are many name for the APU (most common one is VPU).
  Rename many functions and dts nodes to be more consistent.
- Use the bulk clock API, and enable / disable clock at a better place
- add few comments explaining how to start the APU
- update the way to use pinctl for JTAG
- fix some minors issues
- fix device tree bindings

Alexandre Bailon (4):
  dt bindings: remoteproc: Add bindings for MT8183 APU
  remoteproc: Add a remoteproc driver for the MT8183's APU
  remoteproc: mtk_vpu_rproc: Add support of JTAG
  ARM64: mt8183: Add support of APU to mt8183

 .../bindings/remoteproc/mtk,apu.yaml          | 107 +++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  39 ++
 drivers/remoteproc/Kconfig                    |  19 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/mtk_apu.c                  | 437 ++++++++++++++++++
 5 files changed, 603 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
 create mode 100644 drivers/remoteproc/mtk_apu.c

-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
