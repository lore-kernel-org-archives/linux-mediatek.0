Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CE3CD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 09:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7qMynowtM6sO6WhIunL19I1lsaUMnQPIdw7sq9xV6Eg=; b=zZjEhj4J50BfCPqVQ9zhBjNOVS
	rNnDSlTOf1AWgEi5tRM1p5zMuQGZ1rT9lNKqwUU42sR1SuMNr5a39CiBsWUrduGaxDUbuX0DSvEE1
	pVsEo3VplmE4vLoBx9ra0T12FlQbY6BxrZW4EuLgfT4WkkLvkFpuIMnYf0oaPKMN1bD4tUMI+nrgF
	6wKrufXHzpos2kaZnB06qBKYFFixk1N9xPiXPHNSSJH0H+zXV0pNyBciWXBJH7Jz0SNvXOE8pNgVP
	EHHlwCCV/ZcAMTElBnEQOGP7kFOb41AfBs7IEO/KVwjNXQnAnMOgsto6C2MvoO6vOn31hbdIset0b
	e5LAq5Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiAi6-00ExvF-2e;
	Mon, 18 Sep 2023 09:38:30 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiAhz-00Exol-16
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 09:38:25 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2bffc55af02so17449781fa.2
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Sep 2023 02:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695029898; x=1695634698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7qMynowtM6sO6WhIunL19I1lsaUMnQPIdw7sq9xV6Eg=;
        b=SSCQduHH/pXQ/+O//pCj7lpWnp5wk8wWDyKRQu5oN//hMQOGJKOjIAEHETJqJAmCOK
         iUvN+ae6/LfOApn9qTD0lnSnUMJ+uJ7C0egVN/jCAi0E46fnc0bDrQCdAxTvI46ke371
         CPC4XYmz5euWTpz2sYBP8N9kjqiGCg1QVFuDMRQ8Qs9Mbbp/N8x5DgSAS+JbxXXc6TEB
         THkA+oDZzFIBI/t0LSFunikdOOHS0y5V0upWP9lsck3OwxHkwuxlxjuDg4IymvFU2FGx
         TUkuVpqsZ9reUym+UnU3b17zsSXDxrpK6sseGswJTavypE+AcCQvvKNcCSAeG1yKRuQX
         IbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695029898; x=1695634698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qMynowtM6sO6WhIunL19I1lsaUMnQPIdw7sq9xV6Eg=;
        b=ZVnZwUJWL/RIjqsFLdQC2okWhc1YSL4j2ue5dbTbJtt+JSj/4QBml9Sg4snYjGmjNB
         NmNmttZ5zGykfyXq66Lk+nxoTWt4OGROS4famTHirEfLepL0AKvEEBsbgTwb6WNdYEAA
         BWFJytmlwEgaT/4Ny12ZCbO9xKdsCXzPkZfPZcNkc5evDmdhAah4NWc2Utrmgbe0pNqn
         7XEMAkoRr+4dHGI557Mk7KWyVB6DIFqTfZf+Lh0xu4CEPW6KkXOl2nJ1YIyINRyt2ew7
         OeRGI1chq6ZFU7E8IH7S5HnLCkptoRYL9ecfZhPWumuFqcp8gc3vepCc4CTGF2PtLYfm
         q3RA==
X-Gm-Message-State: AOJu0Yz4nnDbQZK/v8SpaxnrZao3QZKhU41AdE+gAVK1IDWloNQwgUFb
	MhiqYNlWjY0dormJY3VMzl51Pg==
X-Google-Smtp-Source: AGHT+IGp45ZVIMqUnpyNlGTjOczPJW9+COazaydZ4vg+A0aUFwj9VUvBstOriVWXiS7GXoKBhC6xIQ==
X-Received: by 2002:a2e:a41c:0:b0:2bf:7dc5:884d with SMTP id p28-20020a2ea41c000000b002bf7dc5884dmr6984504ljn.21.1695029897811;
        Mon, 18 Sep 2023 02:38:17 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4091:a246:8222:872:4a5b:b69c:1318])
        by smtp.gmail.com with ESMTPSA id o10-20020a1709061d4a00b0099293cdbc98sm6251164ejh.145.2023.09.18.02.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 02:38:17 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v8 0/8] soc: mediatek: MT8365 power support
Date: Mon, 18 Sep 2023 11:37:44 +0200
Message-Id: <20230918093751.1188668-1-msp@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_023823_388511_663B878C 
X-CRM114-Status: GOOD (  15.81  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

no real changes in this update. Rebase to v6.6-rc2 and according change
of directory.

Thanks for any feedback!

Best,
Markus

Based on v6.6-rc2

Changes in v8:
- Rebased to v6.6-rc2
- Moved changes from drivers/soc to drivers/pmdomain

Changes in v7:
- Rebased to v6.5-rc1
- Fixed a couple of small style issues pointed out by Angelo

Changes in v6:
- Change flags field to be u8 instead of u32
- Use macro concatenation to simplify BUS_PROT macros:
  BUS_PROT_WR(_hwip, ...) etc.
- Use the final bit values for scpsys_bus_prot_flags from the beginning
  of the series.
- Changed scpsys_domain_data->caps to be u16 to accommodate the new flag
  MTK_SCPD_STRICT_BUS_PROTECTION.

Changes in v5:
- Create defines for all registers and bits in mt8365 power domain patch
- Redesign scpsys_bus_prot_data to use flags to store reg_update,
  clr_ack as well as the difference between SMI and INFRACFG. The code
  uses the appropriate regmap depending on the flags.
- The WAY_EN patch now uses two flags, one for inverted operations
  'BUS_PROT_INVERTED' and one to use infracfg-nao for the status flags
  'BUS_PROT_STA_COMPONENT_INFRA_NAO'.

Changes in v4:
- Redesigned WAY_EN patch and split it up in smaller patches.
- Added two documentation patches.
- Added mediatek,infracfg-nao field to the binding.

Changes in v3:
- Mainly redesigned WAY_EN patch to be easier to understand
- Rebased onto v6.0-rc1
- Several other stuff that is described in the individual patches

Changes in v2:
- Updated error handling path for scpsys_power_on()
- Minor updates described in each patch

Previous versions:
v1 - https://lore.kernel.org/linux-mediatek/20220530204214.913251-1-fparent@baylibre.com/
v2 - https://lore.kernel.org/linux-mediatek/20220725081853.1636444-1-msp@baylibre.com/
v3 - https://lore.kernel.org/linux-mediatek/20220822144303.3438467-1-msp@baylibre.com/
v4 - https://lore.kernel.org/linux-arm-kernel/20230105170735.1637416-1-msp@baylibre.com/
v5 - https://lore.kernel.org/linux-arm-kernel/20230619085344.2885311-1-msp@baylibre.com/
v6 - https://lore.kernel.org/linux-arm-kernel/20230627131040.3418538-1-msp@baylibre.com/
v7 - https://lore.kernel.org/linux-arm-kernel/20230713150414.891893-1-msp@baylibre.com

Alexandre Bailon (2):
  soc: mediatek: Add support for WAY_EN operations
  soc: mediatek: Add support for MTK_SCPD_STRICT_BUS_PROTECTION cap

Fabien Parent (2):
  dt-bindings: power: Add MT8365 power domains
  soc: mediatek: pm-domains: Add support for MT8365

Markus Schneider-Pargmann (4):
  soc: mediatek: pm-domains: Move bools to a flags field
  soc: mediatek: pm-domains: Split bus_prot_mask
  soc: mediatek: pm-domains: Create bus protection operation functions
  soc: mediatek: pm-domains: Unify configuration for infracfg and smi

 .../power/mediatek,power-controller.yaml      |   6 +
 drivers/pmdomain/mediatek/mt6795-pm-domains.h |  16 +-
 drivers/pmdomain/mediatek/mt8167-pm-domains.h |  20 +-
 drivers/pmdomain/mediatek/mt8173-pm-domains.h |  16 +-
 drivers/pmdomain/mediatek/mt8183-pm-domains.h | 125 ++++++----
 drivers/pmdomain/mediatek/mt8186-pm-domains.h | 236 ++++++++++--------
 drivers/pmdomain/mediatek/mt8188-pm-domains.h | 223 +++++++++++------
 drivers/pmdomain/mediatek/mt8192-pm-domains.h | 112 ++++++---
 drivers/pmdomain/mediatek/mt8195-pm-domains.h | 199 +++++++++------
 drivers/pmdomain/mediatek/mt8365-pm-domains.h | 197 +++++++++++++++
 drivers/pmdomain/mediatek/mtk-pm-domains.c    | 157 ++++++++----
 drivers/pmdomain/mediatek/mtk-pm-domains.h    |  51 ++--
 .../dt-bindings/power/mediatek,mt8365-power.h |  19 ++
 include/linux/soc/mediatek/infracfg.h         |  41 +++
 14 files changed, 972 insertions(+), 446 deletions(-)
 create mode 100644 drivers/pmdomain/mediatek/mt8365-pm-domains.h
 create mode 100644 include/dt-bindings/power/mediatek,mt8365-power.h


base-commit: ce9ecca0238b140b88f43859b211c9fdfd8e5b70
-- 
2.40.1


