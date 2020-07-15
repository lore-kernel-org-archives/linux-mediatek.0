Return-Path: <SRS0=kQBs=A2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5028BC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 22:52:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CBCD20656
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 22:52:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xU4j+hYZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oU7d4S/0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CBCD20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HBcbFjL+RnKLTSoHow8Ng4+p0s4lemzkvCDPSzfPr8k=; b=xU4j+hYZHDkNahKiTV5hKuPUah
	Ne1wAtUdLU205BCglOuqmBeLb6dOEvQXJwG5bBMRGUKsceEgROPPBhcnU+cMIJ8YEjbhQ04IDw8jk
	+LCr4D9mSw5AyiB4OUtiTFmMDTJadN9BM9Xcrk9pk+yzUUYIqRPX46MmEtl7tVBCM2Tlu08EVGPDg
	HJqWAbRnChaZZUXalxi8Nnn1KDX+KfhcGyZuSNOsTrP2XehCk9CbLpVWNLWME9rYyO42I2+5hOgxT
	h1R/xRfRm7/Y+6qiigP25cdLycDo2FM43OP8txLSMN5XMbxCtKY4M77aQRhjM4qmyGZn0qtXkY4EM
	xdxOr6xg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvqG4-0004fj-GJ; Wed, 15 Jul 2020 22:52:12 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvqG2-0004fH-K9; Wed, 15 Jul 2020 22:52:11 +0000
Received: by mail-wm1-x341.google.com with SMTP id g10so4315387wmc.1;
 Wed, 15 Jul 2020 15:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=aAu4Wx7Ag8PNBAWqr9lsqUa1KkpnygneMcpuAS8w9NM=;
 b=oU7d4S/09TzweWEbcZzEj8YfkeGEZfYr+MpQqIYOSKcRK6cIAvZoUmWzgaR/Noo+Ae
 1+seeV8XLRdBMr28NU16lSrahN9oVDWVfjP9TXX+uVErZKwYGYUVrrU8uht5MDIgoVoi
 hHmrFb3bEiLeoKd7IKv/1cu+Nmka0BQXR9wUpWey/hL1GxN5lTP2mlTG9daEhDwAyWTU
 95yHEzfNOn6UaHg4RVCt2wehyaTtxeYs8HbdOb2Opyw53Hd2Q4/e9Zr3uRXBEjfjbJC8
 NYoHur3gfKOtul6K4aIdhhj2AukoYH9CYZmSbBFefFdemjf8l2mkbvYSjf9PuDkBKvIu
 7u8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=aAu4Wx7Ag8PNBAWqr9lsqUa1KkpnygneMcpuAS8w9NM=;
 b=XDNO3pZ5zP9WR+3VaoSjDY6UJM6ouedd9oLxExEkX7HyxrH5YLeFf1uDf1A3xNHyuy
 ncart/sEAy0pf5AunpAYuEcetyr3Ue/FDKSxgRKzC1Xq7wRkagricMAx9W3/4zDXa89F
 HI2JfBzzDLNv0QVSvKuekhY5kM186V3GDxqYYjwieSjV43LehQEohCb5KOqRqZ+F1xvD
 PpboAlfBBncib6mOPF2ow2Xz77OqZKkbwg/HyAonaDSZZvwTq3H/RsmhvbpbHNC7pnXf
 FMtcjF/Lz9to0m4IGm9iZrgr3s64eiadllVJ2P+9Kr8bstvP0tJaLoYE9KtDhFT3cP6+
 bIwQ==
X-Gm-Message-State: AOAM530K1TgQsvZAfN0Oh0Efzd+Z/vgNmNWXZTIFWHdD/apSP8WjuaR2
 HbITsGZ8BKjLSRSuj0sWvXg=
X-Google-Smtp-Source: ABdhPJzh1HABGT41Bt6h98y1igth5DhbRsZhL0/EFvjPSmU5eLMo6KBk/Dd4oIsQUeKpiGMljoqU2g==
X-Received: by 2002:a1c:48:: with SMTP id 69mr1806206wma.32.1594853529763;
 Wed, 15 Jul 2020 15:52:09 -0700 (PDT)
Received: from ziggy.stardust ([213.195.120.199])
 by smtp.gmail.com with ESMTPSA id u15sm5506227wrm.64.2020.07.15.15.52.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jul 2020 15:52:09 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: dts: MediaTek updates for v5.9
Message-ID: <0b7109c7-7bd2-7373-6032-e9a452d2ebc9@gmail.com>
Date: Thu, 16 Jul 2020 00:52:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_185210_728045_F45F0F04 
X-CRM114-Status: GOOD (  15.44  )
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Olof and Arnd!

Hope you are fine. Please have a look on the following patches for 64 bit DT.

The biggest news here is the basic support for the new Lenovo IdeaPad Duet 
Chromebook which is based on mt8183 SoC. No graphic so far, but I'm confident 
that we will get that in the next couple of releases.

Regards,
Matthias
---

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

   Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.8-next-dts64

for you to fetch changes up to cd894e274b74b33f417776e3ab6adec237558337:

   arm64: dts: mt8183: Add krane-sku176 board (2020-07-10 15:35:01 +0200)

----------------------------------------------------------------
mt8173:
- update dmips for Cortex A53

mt8183:
- add pericfg
- fix unit names
- add nodes for USB support
- add basic support for Lenovo IdeaPad Duet 10.1" Chromebook

----------------------------------------------------------------
Enric Balletbo i Serra (7):
       dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-krane-sku176
       arm64: dts: mt6358: Add the compatible for the regulators
       arm64: dts: mt8183: Add MediaTek's peripheral configuration controller
       arm64: dts: mt8183: Fix unit name warnings
       arm64: dts: mt8183-evb: Fix unit name warnings
       arm64: dts: mt8183: Add USB3.0 support
       arm64: dts: mt8183: Add krane-sku176 board

Hsin-Yi Wang (1):
       arm64: dts: mt8173: Re-measure capacity-dmips-mhz

  .../devicetree/bindings/arm/mediatek.yaml          |   5 +
  arch/arm64/boot/dts/mediatek/Makefile              |   1 +
  arch/arm64/boot/dts/mediatek/mt6358.dtsi           |   2 +
  arch/arm64/boot/dts/mediatek/mt8173.dtsi           |   4 +-
  arch/arm64/boot/dts/mediatek/mt8183-evb.dts        |   4 +-
  .../dts/mediatek/mt8183-kukui-krane-sku176.dts     |  18 +
  .../boot/dts/mediatek/mt8183-kukui-krane.dtsi      | 343 +++++++++
  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     | 788 +++++++++++++++++++++
  arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  68 +-
  9 files changed, 1227 insertions(+), 6 deletions(-)
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
