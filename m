Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F14C4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 15:35:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9C13207C4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 15:35:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DFQTVUSQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMwOyfPZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9C13207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=madUI5b91DsCQ0PszIsHvMi+gm/HuBG66vddIude268=; b=DFQTVUSQXq9IiV+gFaKVYqg3QB
	cDHEnhzcnu0x0bzkV7BrNHllaUaLoObgUPGtraIc+RfW5kx6tBgxlbXn9/fYyw5W4HTY0aYyK3Ct3
	8vbZvEf+5VVzYGTW4iwyqmQ0Td3qyku6lSxsUe69kmN9GALkpag6aKAG8NbEz91+mPiTzySPy0IUl
	d21HvJ2MBIEI4XTWdMnyI077/d8LXOduAx/92BsL5M2L2VqAXd0bwagSL/pNYKcmdwQj+KZK7dGyw
	W7asqfAOQkOCJjpHouAxjUrmAx+56s4Hm3ZLrQc05dP/TPoQm6BcpOWzxCsUQ49+sBOuw14yawbLQ
	HBw78W1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLpl3-0000HC-L7; Fri, 25 Sep 2020 15:35:37 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLpl1-0000Gh-KX; Fri, 25 Sep 2020 15:35:36 +0000
Received: by mail-wr1-x42c.google.com with SMTP id w5so4045471wrp.8;
 Fri, 25 Sep 2020 08:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=fR4OUzcp/AbSIqM40lfYJhRkwaH8Odg0wUiH4CipqEc=;
 b=EMwOyfPZeKmGcC9rciOSZe/IFK3jbViP/SUrZvbXmGjyVbvL+S4rJ4HlMjpFi2zFwt
 2PfaT5kDpHZQXAaIYj89WbthkRF1ujlkf6rd1OFEv3SZUHr+4aYWNrolylKAlatpPE5F
 Abntk9KQ9XX8fcqIY4qfRRMLU+cjefw/mlz+5nz/XctkDJhLvEQt9MKlOPJgVSNR8fnP
 1fCniSRZs/O4ewSmmdy+D8oO101WWir/S4dcnuenJ3IR7UjiEpgUPMdj3xw2xE6CqYhw
 EgrYUa9skuVE2bMKZwDsgAmziwylvI8MXxP6+r0Xs9XDIaV5x29qURtu8XPxsEbHGiAx
 ejpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=fR4OUzcp/AbSIqM40lfYJhRkwaH8Odg0wUiH4CipqEc=;
 b=VdWdtFCPyZzUfc2c7hBR04/GS4qkLh1bRqCCus/QT2cS6XjHBmD2l2Fdo5wG31LHAQ
 Mh/01QIm8Nj7B/qmoJtKuPTrD6IXV1KLwlJPgwBlQsBGQdjG5XyXg1Mh+WCUeWr6Gd7u
 acmlMRCDU1G496+7A5s0Tho/RS/VpfDyJ3kNqZ5W45PQOTb2rbidYfELPkXBWgyVoxz+
 T4viMXalWsGBislokpEvD6DytliaY9rHQNN1r0JcAQeryoDPOjSFEwx6rWpJ55pDlF+R
 7DDUtKi8Ko9H78UAM/NMnidQUq4c/gT8JXZtRXcOylGDDJYdghPG8fKZ2/3XLKkR5Fi5
 OVnQ==
X-Gm-Message-State: AOAM532KcXFa9SyJtvqhe8rSRhe3py0NBPL1eVv1G2E73DaWpVCnTlC8
 7IzXr5mZSnX3o42H/7RRYRw=
X-Google-Smtp-Source: ABdhPJxVwdI2pPwKcNS4o4af8NAJ4udNcGDtwVh4x2HvlkUX/MSRLZ3pr1RgvLoyAMsb7MmGNxNCKw==
X-Received: by 2002:adf:ec47:: with SMTP id w7mr5495559wrn.175.1601048134381; 
 Fri, 25 Sep 2020 08:35:34 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id w7sm3248430wrm.92.2020.09.25.08.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2020 08:35:33 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: mediatek: dts64 updates for v5.10
Message-ID: <1580bc76-b05a-ad29-1854-d2aca657c775@gmail.com>
Date: Fri, 25 Sep 2020 17:35:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_113535_674392_B0B1C60D 
X-CRM114-Status: GOOD (  16.13  )
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Crystal Guo <crystal.guo@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Eddie Huang <eddie.huang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Arnd and Olof,

Please have a look at the following updates for the arm64 device tree files.

Thanks,
Matthias

---

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.9-next-dts64

for you to fetch changes up to f866c471542e6dddca2ab971a85ebc54fd3713a4:

   arm64: dts: mt8183: update watchdog device node (2020-09-21 18:57:33 +0200)

----------------------------------------------------------------
mt8173:
- make nor flash work
- fix da9211 regulator modes

mt8183:
- add support for system companion processor

mt8516:
- set reset gpio for gpio expander in pumpkin board

----------------------------------------------------------------
Crystal Guo (1):
       arm64: dts: mt8183: update watchdog device node

Dafna Hirschfeld (1):
       arm64: dts: mt8173-elm: fix supported values for regulator-allowed-modes 
of da9211

Eddie Huang (1):
       arm64: dts: mt8183: add scp node

Hsin-Yi Wang (1):
       arm64: dts: mt8173: elm: Fix nor_flash node property

Krzysztof Kozlowski (1):
       arm64: dts: mediatek: fix tca6416 reset GPIOs in pumpkin

  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi     |  9 +++----
  arch/arm64/boot/dts/mediatek/mt8183-evb.dts      | 11 +++++++++
  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi   | 30 ++++++++++++++++++++++++
  arch/arm64/boot/dts/mediatek/mt8183.dtsi         | 15 ++++++++++--
  arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi |  2 +-
  5 files changed, 60 insertions(+), 7 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
