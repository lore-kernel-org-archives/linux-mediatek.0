Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07DBC369D3
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Apr 2025 10:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+QxK+Tc2ZVbe+5BePsqof8LIo5Vk1Mj0GQ50Wfpr8bE=; b=ynqNcg3PFMNNewNqm2ymV32oH1
	/XBtB3tTTjkfvUoqrCUaD65NcTu6VRPzawRaE7F8s9gyqu4q+yKUy/sjYNbSHUscIFqg17FGvT6Rc
	gxyt7CbM/8s13u8zFojgpahAymWErExRKmwdK3a4cZTam8cq/gGuphFHbgweW9ILL/xT+ETyZzwWr
	N6T0rsPm7tLreTLtLenYDHmFQMAngJQo8CbMR0O+UzbEGe2xUI/QZ/RG93W1/ouzSDbOPHqSnSu6s
	Xff7Hl7p4rKeBTXKu+lLxsgbzG+a0ZKVoTM40iz9VWWGTxqR9iklgo8EVRgUiTPuiPE0LZ86CGfYc
	fbSm1bXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XUQ-0000000ACM8-2EAa;
	Wed, 23 Apr 2025 10:38:02 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WXH-00000009zpx-3Nw0
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Apr 2025 09:36:57 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2255003f4c6so69403245ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Apr 2025 02:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1745401014; x=1746005814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+QxK+Tc2ZVbe+5BePsqof8LIo5Vk1Mj0GQ50Wfpr8bE=;
        b=pMoTWA0RBrFyoDDp+xrp8nfahQtKOHGPbT3puG9RQG10AYLBHZa+vQuxtQI111EsQ8
         GjwDmeZInuZJ9uNip0E6J91TMnmPNjtRBGetqlE8J0/bpe7Y7YemwiGNvIrE7CRUWmWd
         zqwWsHLHUgS4yD0QLB8bnjX2nPXGWcisl0qi356Jm3VlW0mUsBZyUD6djFbgDV/UdpNy
         5RdAKrufS22miZ9LkDMOx/kcb600C/zmMmaIhzgp4AVD2uqzaNKtRgUrRV5DQwGyNctm
         G+PQL2ePdhh367XmkeRIM10yRfwHLCxxu1Mk0S/DbSqfvJlyWccQ7jUda3Y6w+H3m+gP
         uFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745401014; x=1746005814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QxK+Tc2ZVbe+5BePsqof8LIo5Vk1Mj0GQ50Wfpr8bE=;
        b=ukyaG1qwXM5Bh3GMcdvSmyUIpzcObU5zi05MbW/tufvIAceRCtxwXFSf2H7nS4+tSj
         rTy+8F4iti+UnTyF5CH0Q7vzv79meBTOZ/NxGk94IASA/kWo9Zh2+W4Eyw9Lgm82oABY
         kfQW+hjYba5vJRC+qshBx8AUaZQp03tJGzmRLXKZSLe6cvqd1/+1j2nBj3JxlH00QJZk
         mYotn1U8//aT/ADjyP9Lr1r419MKJQ0aFi9MENapd0mkd1oUteplhq3+R7amEa20rcgE
         MIJc4vxmDVweDhGFVCD+pHyqg8HZ3RQaSyJUR03L5uOWGf6Cf5/+1T/zUgUVawfxL1zN
         bD0A==
X-Forwarded-Encrypted: i=1; AJvYcCX0uLxoxg0Mw61fSN4wWIN9ctbqVKsWXpBkombmpD5K32ntfE0kAbFLPHokqOTE0A4HtQSYJMQnIh0Yoes8cQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGxELjBpaMSie++7XY4yC1yLsGFFqQgKkkzOJ91udB/LOaiXei
	FPbXbHBZ/mXhOGFNnPxZGalPjD4VarTb9OESHWyCUsEid4fUdr7737Fd9k4m1/c=
X-Gm-Gg: ASbGnctdDeJVcUqZ2xicZMcB3Md5FVAKlxcNtJ377dFkzydW3f8KtNUXB8d4swBv+8c
	/quXclQMzfe76DQ+N5Vjrgpz+HtY94LSnwy3WutpKOpEoPEegrUHoEUJqgWTgLe/01UlXGMYEim
	Jol/yNX9z6hNgNbSKjyBZjr/mdicq3tsMKTn8LZ+gA480yJTc7OFd6VmmC/x/navqkr7p3wcC9e
	eNZvrYW0Gg8Aps4+zeA0AEASugLcid2GsGPtQkQ4EZ6DJNkbSAiCbSuuKYZJshY0lpnLir7/yJi
	iJAATVTKAxToeeBgkgfd+BsmfDKVSjIgr66GYl/fZrxV1kaj7naYnIT12YzTY/wtGBwmjuWqv1Q
	=
X-Google-Smtp-Source: AGHT+IFGuOW6Tpkgou6NY/aO5b7J0ZgNyZb2L7+1Em7PC2gecYR8PaSxzzzBVlry/acNwbDrg5EeYA==
X-Received: by 2002:a17:903:3c43:b0:223:501c:7576 with SMTP id d9443c01a7336-22c53583deamr299094675ad.12.1745401014467;
        Wed, 23 Apr 2025 02:36:54 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ecec54sm99557885ad.168.2025.04.23.02.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 02:36:54 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: sam@ravnborg.org,
	neil.armstrong@linaro.org,
	daniel@ffwll.ch,
	dianders@google.com,
	hsinyi@google.com,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	knoxchiou@google.com
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v10 0/2]
Date: Wed, 23 Apr 2025 17:36:45 +0800
Message-Id: <20250423093647.4074135-1-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_023656_116038_4F4FB05F 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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

This is v10 of the MT8186 Chromebook device tree series.
---
Changes in v10:
- PATCH 1/2: Add enum for ponyta sku.
- Link to v9:https://lore.kernel.org/all/20250328094034.3400233-2-cengjianeng@huaqin.corp-partner.google.com/

Changes in v9:
- PATCH 2/2: Add sound model to fix the warning.
- Link to v8:https://lore.kernel.org/all/20240914063122.1622196-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v8:
- PATCH 1/2: Remove custom label.
- PATCH 2/2: Change the commit about ponyta.
- Link to v7:https://lore.kernel.org/all/20240913031505.372868-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v7:
- PATCH 2/2: Remove prototype sku.
- PATCH 2/2: Disable the other trackpad to enable one of them.
- Link to v5:https://lore.kernel.org/all/20240913015503.4192806-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v6:
- No change.

Changes in v5:
- PATCH 1/2: Remove sku2147483647.
- PATCH 2/2: Remove sku2147483647.
- Link to v4:https://lore.kernel.org/all/20240906085739.1322676-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v4:
- PATCH 1/2: Add more info for Ponyta custom label in commit.
- Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 0/2: Add the modify records.
- PATCH 1/2: Modify lable to label.
- Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 2/2: Modify the dtb name without rev2.
- Link to v1:https://lore.kernel.org/all/20240902125502.1844374-1-cengjianeng@huaqin.corp-partner.google.com/

Jianeng Ceng (2):
  dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
  arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks

 .../devicetree/bindings/arm/mediatek.yaml     | 13 +++++
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 18 +++++++
 .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 22 +++++++++
 .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 49 +++++++++++++++++++
 5 files changed, 104 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi

-- 
2.34.1


