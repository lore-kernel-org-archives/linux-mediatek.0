Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BAEEE49BC
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 14:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xR9XIjn3y1OmGn7jK9qX2NGw0TdqrgFrmLU/vrD2/WM=; b=XNJNRSX9zLPjxP
	imd7iUrlk+/r+odHM6fzhKHJRPHOHLkMDpoBIDLYOVfDHFDzfoWxKlxcAP0GSGwzX3/D6q6Ez8Yso
	+yH2/I3EU6EldOfg3c2648lxkrsNkWdiVVYOb2m2M46ezstz5BMoGnyj4nRls085f1M5vPF0qaUrO
	81binqgSpfGRjLiKc1UaWWUVSm5+D50hItMvreRkId6hlfhlmubUfRjHTKnnSmvrozO2/NqyRGnsT
	ew96FVFty35ePA46K67CK5PtOsj5N2EMMPCZ6BrHctRa5H1jwwp6P/z3U/cRm06qY/tDXR8CsRmfO
	4IfhJV+URtSck97dyQ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soOc9-00000009zt5-1il5;
	Wed, 11 Sep 2024 14:46:37 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soOR4-00000009w3I-0DOH
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 14:35:11 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-710da8668b3so807609a34.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 07:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726065309; x=1726670109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xR9XIjn3y1OmGn7jK9qX2NGw0TdqrgFrmLU/vrD2/WM=;
        b=KrVgtgwHFLikhoFZDIHn6qgaWVJMFEf6XMwPHd4VXTQqxc4k8N7OK99qq67IbbGbcw
         eZDu11d+vdHKTI+xr5jKw9BG/akq2Bal1ot/i0r2wNptVloyEfk+/tuV085utbKjtyT8
         W+9Gta1Jw/XtYBNwd84y0UOnhPfj/7pJCl2QY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726065309; x=1726670109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xR9XIjn3y1OmGn7jK9qX2NGw0TdqrgFrmLU/vrD2/WM=;
        b=LvDw/h0a/pqcyYGXEIH6bDaNJuohDXoDuNbDd3ZNxwoK3j2FxgPfP+4Td4fRi0/3RW
         qxzS+r9mDuufjhLFj9TvCPAYGCGAaFeC3kAln9i+tnUd1Uug7jDznxZ2C3l744Yc1NO9
         KcrYTpMy/fAeMtdSdLDcJ/jOKjJyoNxadLk8H0+sIlnv6IUBtdPBHWDOYKWA6dsRodjk
         Bb/QID2qIHsagLM3M3fAAcHOGFuUnroOb7Wq4Yc24R5IMJBBJ7CHgo9ckM4vLIo4KMfK
         gt6m84X10omXxYYleQsUbrr3JBHZMqAZ38pS4vdNwFtkKEHrhRf17OJ3Bq/puo1xrRtX
         A0Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWSnZPlq68YNvE9nvaWh3rNZWRW5EaSjD8SDig0UPPOw6f16sMUCxlXZadFQZ5mrJc/Bx3VbCUVvm4IyH+ZKA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjl5QSQa0sA54/cwmfqjMFM6AV1a1YS8gnLsa9WzgZR6I5PwRq
	6OEENuPlYHWqAFohGg1xt2Wg1Lq0wQJu4BcQQMvkkzO+TsgSykRnGpcdx+TnVA==
X-Google-Smtp-Source: AGHT+IGhvCaoigjEidnBcIxaoN8ZPYvAnGVEtA0q3Dv/8v++g5bmQqxojewOStqK0G2ypMFUcUBfqg==
X-Received: by 2002:a05:6830:7105:b0:709:396c:c465 with SMTP id 46e09a7af769-710fe72f964mr2599321a34.18.1726065308786;
        Wed, 11 Sep 2024 07:35:08 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:102f:d738:6069:fd4b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fbb5901sm46620a12.24.2024.09.11.07.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 07:35:08 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 0/8] Add platform supports to MediaTek MT8188 SoC
Date: Wed, 11 Sep 2024 22:33:53 +0800
Message-ID: <20240911143429.850071-1-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_073510_159491_05198B3A 
X-CRM114-Status: GOOD (  12.19  )
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

This series is a subset of the previous series [v1], focusing on
enabling few platform functionalities on MediaTek MT8188 SoC, including:
- CPU performance controller
- IOMMU / SMI / LARB
- PWM for display backlight
- SPMI for PMIC control
- audio
- socinfo

along with the corresponding binding changes (acked in the previous series).

[v1]: https://lore.kernel.org/all/20240909111535.528624-1-fshao@chromium.org/
[v2]: https://lore.kernel.org/all/20240911105131.4094027-1-fshao@chromium.org/

Regards,
Fei

Changes in v3:
- Remove leading zeros in spmi reg size

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


