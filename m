Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 722F1C11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 09:08:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C11961CFC
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 09:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C11961CFC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A1HFjTPACed06IqftPEHL4QPv2x8jIK5mD6GFTtoTXY=; b=wksXR+WUmQX2L4
	11Dcx80xjqlzQgHXM7p7uIZFd58oa/Ogelj4Z7ZqN9HPrDQe5swRGVHjHoS1Z9BAd9GMpidjGO6Gc
	ZhJUCN+G9kZ+LoQtxeopQCMNtA92gy3gx4VxCybZWoGtCybfU7nlVoWx08xgtm9NEop9ClBA6yFtb
	o46Kdak/W7RDZHkYw2RTXDKHJ58aRSDKnI+5pkSMXphLLYrHjIxx+3+o0ip3mEkXjJyJg105i+TNi
	BxNTRa8VP7r8S0Ua7iaTXDfvxTmomrDkITuTp2HbMrVKgYo9BiffxVI1GORn1aPKHWZibyr/HIteg
	ai4N1InKhneEWH6FS5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyWCT-00DQVk-2h; Wed, 30 Jun 2021 09:08:05 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyWC8-00DQQ8-U7
 for linux-mediatek@lists.infradead.org; Wed, 30 Jun 2021 09:07:46 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 mn20-20020a17090b1894b02901707fc074e8so3494599pjb.0
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Jun 2021 02:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8EunOHRF208NjwWFsRkZviCh5B7g+6zWrlmDRgMb1Q4=;
 b=ZQB3E9S6hmK9/GgfjKj9UFvOaFVFfbm7rL4iHToD4A8Q2J0ixPZw+maAkbB3K9m3/B
 mYM8NaoGUBEBSOUuecPXzDNP7JkF5nL1157O15TL3aaDujkhMWt1zbKDbF6mjXtilvBY
 cQ1PrD0AKhtuEWL6Mow1RUGK3ihTFjKUaxq+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8EunOHRF208NjwWFsRkZviCh5B7g+6zWrlmDRgMb1Q4=;
 b=Y6kRWMZrD0mjenj/xf+l2EwhTo3W2GmgU/uC/mT0GN8zD7uP40Bir142wqCFiLHHIm
 dSQVozUn2cRR5yDvctoaJ5LOwSCY4CROTx32k71pH9isJCLRRTQvIj3zWOAlvcHWeDET
 NoS2b4t0ByXdem/tuCwW5NpLVzmeHPXqgXEiu3k2HTUixm+oxGuD2vDXsw+E5CHC5qbr
 NpHVgPAEx1P1mM1C1wsnFQ58c66KQsR97UWawlhDzcN/W4UpW3sWWyjf8S/NrvpEt3ih
 V5gxUvfNVplodo6MbpSvXj+rzrs0gZuzsCfHJg/CpWQ8x5YkPKMZYnXFjy9XmSR9yBw7
 Eidg==
X-Gm-Message-State: AOAM532DxlPQq6Nw8Eae5c2n0+R6NK7Yx1bHIAFNsKB1fjIWvvAs51r2
 tc3iLK0iq1eKCS/wPYGvlTn+OA==
X-Google-Smtp-Source: ABdhPJwe5ressv6mI3pXKPXhPGqwlZTuAVhYAEKlP5foJIHcRuI9yUKHuKbiVGpA7ebHw0HeRReGtw==
X-Received: by 2002:a17:90b:230a:: with SMTP id
 mt10mr3399134pjb.236.1625044063075; 
 Wed, 30 Jun 2021 02:07:43 -0700 (PDT)
Received: from kansho.tok.corp.google.com
 ([2401:fa00:8f:203:fc06:b3f6:f016:8299])
 by smtp.gmail.com with ESMTPSA id 73sm20822239pfy.83.2021.06.30.02.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 02:07:42 -0700 (PDT)
From: Kansho Nishida <kansho@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Shunli Wang <shunli.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org,
 Eddie Huang <eddie.huang@mediatek.com>,
 Kansho Nishida <kansho@chromium.org>
Subject: [PATCH 0/2] arm64: dts: mt8183: Add kukui platform audio node to the
 device tree
Date: Wed, 30 Jun 2021 18:07:08 +0900
Message-Id: <20210630090710.1873559-1-kansho@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_020745_016419_C13B2B62 
X-CRM114-Status: GOOD (  10.36  )
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


Hi Matthias,

The patch set adds audio node to kukui(mt8183) device tree.
By this change, the soundcards for each boards will be probed.

Thanks
Kansho



Kansho Nishida (2):
  arm64: dts: mt8183: add audio node
  arm64: dts: mt8183: add kukui platform audio node

 arch/arm64/boot/dts/mediatek/mt6358.dtsi      |  1 +
 .../mt8183-kukui-audio-da7219-max98357a.dtsi  | 13 +++
 .../mt8183-kukui-audio-da7219-rt1015p.dtsi    | 13 +++
 .../mediatek/mt8183-kukui-audio-da7219.dtsi   | 54 +++++++++++
 .../mt8183-kukui-audio-max98357a.dtsi         | 13 +++
 .../mediatek/mt8183-kukui-audio-rt1015p.dtsi  | 13 +++
 ...mt8183-kukui-audio-ts3a227e-max98357a.dtsi | 13 +++
 .../mt8183-kukui-audio-ts3a227e-rt1015p.dtsi  | 13 +++
 .../mediatek/mt8183-kukui-audio-ts3a227e.dtsi | 32 +++++++
 .../mediatek/mt8183-kukui-jacuzzi-burnet.dts  |  1 +
 .../mediatek/mt8183-kukui-jacuzzi-damu.dts    |  1 +
 .../mediatek/mt8183-kukui-jacuzzi-fennel.dtsi |  1 +
 .../mt8183-kukui-jacuzzi-juniper-sku16.dts    |  1 +
 .../mediatek/mt8183-kukui-jacuzzi-kappa.dts   |  1 +
 .../mediatek/mt8183-kukui-jacuzzi-kenzo.dts   |  1 +
 .../mt8183-kukui-jacuzzi-willow-sku0.dts      |  1 +
 .../mt8183-kukui-jacuzzi-willow-sku1.dts      |  1 +
 .../boot/dts/mediatek/mt8183-kukui-kakadu.dts |  1 +
 .../dts/mediatek/mt8183-kukui-kodama.dtsi     |  1 +
 .../boot/dts/mediatek/mt8183-kukui-krane.dtsi |  5 +
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 67 ++++++++++++-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 94 ++++++++++++++++++-
 22 files changed, 336 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219-max98357a.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219-rt1015p.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-max98357a.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-rt1015p.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e-max98357a.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e-rt1015p.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi

-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
