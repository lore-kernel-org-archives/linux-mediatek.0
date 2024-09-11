Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0704FEE4992
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 10:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bntFV8pZ39/vd/ElxPtsnTHwc8+5+H7FcNeX9IYOSIo=; b=3oIAdKtDEaguyG
	Wy16cJYPAAUVZz0GKd2pZt89IrY66AXWwCAkEZ51bOd95yXh1UtS2Mz/DRey0Jb1n7p0/QYGNOazK
	FBtfuXIL1tLVTaeHzUkX/keQihLv8CIIwXXRs/+iCgqC4gS2rBlKLglLTiezCWu7RutMI+3XkqU+b
	SytKA/Y8btzMwsGKUizE60iMN6d8XvxCrA5wOkLUgIGkx6cXr6vgLYgfEvmAV1O4xLbd9jAOFLb3M
	EvjztSdk94OaUftWxpos6tzeN1dK3jDt75ybc6rEG9jzK/2ju8JpaO8lGBG5ZSAXlARMN7+xchRz4
	FqyoQev5Qq3jwcPV6qBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soL4E-00000009Cen-3WfR;
	Wed, 11 Sep 2024 10:59:22 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKx9-00000009AoL-1Bd8
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 10:52:05 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-718f4fd89e5so1708822b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 03:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726051922; x=1726656722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bntFV8pZ39/vd/ElxPtsnTHwc8+5+H7FcNeX9IYOSIo=;
        b=U62QXsRhr5RK8Ji2Ft/7FAs5eeeC9qE1RojAsUvaBLAEAx/9XbfHyc2nm57siGDo9b
         a5UlkonIGGa2l8kJqkNeWi1s9QUPp0GJjkTHyfaVjdv6rgtOFEAvOI1JwolRMhevxQtj
         7/cJDQtohYFOHnVmQexOKqSLzc9Ssxhj1gGa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726051922; x=1726656722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bntFV8pZ39/vd/ElxPtsnTHwc8+5+H7FcNeX9IYOSIo=;
        b=f4YOOEXTDE9dBFP17MG6Xnio0ldyZ0Ttg0E8JpUSlJa/hF8IdM6oG/Rt8qQIZeVaF8
         6t2fzUndtA1+qK2zZcpb0ltudRhPMCNaYWOMQJpoUtKOPpD5cN3/E9OQ5EdSHjryDcux
         3/lGRuEJ4GKXO4+u+0kEOZ0PELYixKiNdDFo/W4uwzJhh/L6p2bHlM5ZXNrW5KUd8SeB
         UtpP3JqDXw3sCPF8PMq13ChPTxhFKG7NIdGK2j03JkVlvEWKiHhv0SjxI/nL+sBiIKNp
         8AMJ51idb/YKApzlWCSfQCJHzXKn/Kz0h6dOcCoPIEKKmUEy7k24L1v8ZtnQVfwUZr0x
         oQig==
X-Forwarded-Encrypted: i=1; AJvYcCUk0RBAqJ62i5eCk5fqUStg/jc38/Yi4osIfVbILWFtWUUrx99UpviwF1eQeX6Wd3hYQq8O+tbqgpAlLURsBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyA7fzTaa5wynGdR7Eex7mvBAuqcitkzAz2/tf7bUvMynm+0NEI
	ATZ9wIFQg8XRqaFQXf5vPLBZf0AHg9F2HLu8uueE/HtsJjFPIFVQNDTTYz15rg==
X-Google-Smtp-Source: AGHT+IF0o/eQIkWaTGkC08fE/boVNtrfPBZgXbaJDeqLRKBeyA2VebJ72Ic2BKlFFjweXCqeEJZ52A==
X-Received: by 2002:a05:6a00:9484:b0:718:d7de:3be2 with SMTP id d2e1a72fcca58-71916df1f89mr3252259b3a.14.1726051922429;
        Wed, 11 Sep 2024 03:52:02 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:102f:d738:6069:fd4b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d8242b3d13sm7147352a12.52.2024.09.11.03.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 03:52:01 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 0/8] Add platform supports to MediaTek MT8188 SoC
Date: Wed, 11 Sep 2024 18:51:05 +0800
Message-ID: <20240911105131.4094027-1-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_035203_360296_A3A6DF12 
X-CRM114-Status: GOOD (  11.91  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>, Stephen Boyd <sboyd@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi all,

This series is a subset of the previous series[1], focusing on enabling few
platform functionalities on MediaTek MT8188 SoC, including:
- CPU performance controller
- IOMMU / SMI / LARB
- PWM for display backlight
- SPMI for PMIC control
- audio
- socinfo

along with the corresponding binding changes (acked in the previous series).

[1]: https://lore.kernel.org/all/20240909111535.528624-1-fshao@chromium.org/

Regards,
Fei

Changes in v2:
- Replace hardcoded AFE reset ID with correct definition
- Added socinfo nodes in v2

Fei Shao (8):
  dt-bindings: spmi: spmi-mtk-pmif: Add compatible for MT8188
  dt-bindings: mailbox: mtk,adsp-mbox: Add compatible for MT8188
  arm64: dts: mediatek: mt8188: Add CPU performance controller for
    CPUFreq
  arm64: dts: mediatek: mt8188: Add SMI/LARB/IOMMU support
  arm64: dts: mediatek: mt8188: Add PWM nodes for display backlight
  arm64: dts: mediatek: mt8188: Add SPMI support for PMIC control
  arm64: dts: mediatek: mt8188: Add audio support
  arm64: dts: mediatek: mt8188: Add socinfo nodes

 .../bindings/mailbox/mtk,adsp-mbox.yaml       |  12 +-
 .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      |   1 +
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 321 ++++++++++++++++++
 3 files changed, 331 insertions(+), 3 deletions(-)

-- 
2.46.0.598.g6f2099f65c-goog


