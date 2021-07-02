Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8C7C11F6A
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 13:43:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA7316142B
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 13:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA7316142B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uN3UZff53n6/yEc0LAQq3MSnYEYkT9IkwrGPHPbQ8To=; b=gyLhfekw7BZjAh
	fEBbdY56uc+An9Rzyr1VQQfi7Yr6H0Sz2pm2rDfx0uflWab0qQKUH7rUeqrGqXQMvtzFdzIdSQ3Fl
	X5O4Noz1Js2+hAKgNrTk2urUjBB32t60De1Hq6rQBZe2BygW7LPTzBw2bGCs7rO1p1pU5ohlzqWL2
	ddfxcmhalxDz+aXEVAlye7X9QbxvKf8TJ32puyhe7PUjSQ6FS2MDs7wquaWJviNdACcJ+alCB8ND5
	8P5mLaWbbVGsA0c5W5w7tDBZWAYFnfdrQMtIl/jeDQTCeeMQZTOx97UPEFNq6/85J8SItPtDV5EZn
	BLzMxecSeYt2Y6V+wJdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzJSF-00398f-N0; Fri, 02 Jul 2021 13:43:39 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzJS1-00392A-BA
 for linux-mediatek@lists.infradead.org; Fri, 02 Jul 2021 13:43:27 +0000
Received: by mail-wr1-x431.google.com with SMTP id v5so12546639wrt.3
 for <linux-mediatek@lists.infradead.org>; Fri, 02 Jul 2021 06:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C5PNOf2fBG33kkTj2T2akXL4UB6vTV7M6Cj6RMxXF9w=;
 b=wRrP5oTN1YQ5BNIwj11/8cQ8IM/n0VL5oAJq3eOB5KcwKKR2jEyg+UJ+pwFGyYVS8R
 i5xLcqReDthulFqtaWuV6Bk1f9a9XMiZ84dglshI2mGWY6w18g/zSX/rD7RAeE+mNb1Y
 vkY0OUR66iYLLzaum3IRtNdFXIZrmd+vur0AtgTZSjP5Bp/ZAU+/C5LmOHtlfGyGsljf
 6pmRnKT4Lf0TDpTJf7f5lsFtSieme6Zs/oz4vYpX6ybDjR8nhwBfN2ZxlL2ed+NZvl+N
 KaVaHvjABY/Ct0vMetzChCCNHStcHe6IENQgiVOtdEbvCT41jcPVi+gZIBmvIp16NqW7
 IWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C5PNOf2fBG33kkTj2T2akXL4UB6vTV7M6Cj6RMxXF9w=;
 b=o0CPHwkVCxss9BWPhx6E1XM5Nkeo/zenEm4bpUj7xMdE+hCkhGV2tbscZfnDHPGH3i
 L7htB0sKJmdY31EYFjmUt6NYS3sKr88Kq5K+u1Nwd3N8LJFAx91FeC7PlQrk6J0Vf7gq
 Jji6sqpopuZfS3272avlo2UKn1h1Kb/1s4S+hp4Ra34YjmBo+XNm280fBeSo5G4T9O0z
 U1pfL8Ucs26OLalpLkvWqY097v70pz5WeG8zlOOrkKCISh1szSHITOpXT7ZTY8A7Syjj
 fharwDIiYS+b7eRHci502/d6YJKDI/aQC2JCe/2/lzhtooJ1JGAIYTURfcWfJ9Dc3zIx
 SaeQ==
X-Gm-Message-State: AOAM5312JPHL/BZImm063w6cnxeJppwOY3iE4pR9WBIhMqUbiK0p4TXJ
 Wp0/VcTlVjR6vFRE2Yn+RY0ERQ==
X-Google-Smtp-Source: ABdhPJw/Yjf+4q1c9i/Cuv+UlNuFg9DhSWnMI7cHOdXk4qMTpxztNFvOYbwAX2D4uqkPydJpaDNbuw==
X-Received: by 2002:adf:eccf:: with SMTP id s15mr5880911wro.176.1625233403059; 
 Fri, 02 Jul 2021 06:43:23 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:c5f3:6ae:eaf:87a2])
 by smtp.gmail.com with ESMTPSA id s1sm12595512wmj.8.2021.07.02.06.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:43:22 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v3 0/4] input: MT6358 PMIC button support
Date: Fri,  2 Jul 2021 15:43:06 +0200
Message-Id: <20210702134310.3451560-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_064325_492762_8C7CE30D 
X-CRM114-Status: GOOD (  12.34  )
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

The MediaTek MT6358 PMIC has support for two buttons: PWR and HOME.

The interrupt logic is a little different than other PMICs from the
same family:
for MT6323 and MT6397, we have one interrupt source per button
* for MT6358, we have two interrupts lines per button: the press and
* release interrupts are distinct sources.

Changes since original v2 at [1]:
* added 4th patch with device tree enable
* cover letter title prefixed with 'input'

This series depends on [2]

[1] https://lore.kernel.org/r/20210512152648.39961-1-mkorpershoek@baylibre.com
[2] https://lore.kernel.org/r/20210506094116.638527-1-mkorpershoek@baylibre.com

This has been tested with evtest on mt8183-pumpkin
using for-mfd-next as base tree.

Mattijs Korpershoek (4):
  Input: mtk-pmic-keys - use get_irq_byname() instead of index
  dt-bindings: input: mtk-pmic-keys: add MT6358 binding definition
  Input: mtk-pmic-keys - add support for MT6358
  arm64: dts: mt6358: add mt6358-keys node

 .../bindings/input/mtk-pmic-keys.txt          |  5 +-
 arch/arm64/boot/dts/mediatek/mt6358.dtsi      | 12 ++++
 drivers/input/keyboard/mtk-pmic-keys.c        | 56 +++++++++++++++++--
 3 files changed, 68 insertions(+), 5 deletions(-)


base-commit: 495fb48dbd9bcbe15859e086edd24519a6bd2961
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
