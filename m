Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2809FC619A
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Sep 2024 06:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YA3F8RL5B/IqI+2pfLBP9VWUihTDASIHOdqEg57DLsQ=; b=vRnPwCWH+Oib8IZDVg4pKw3VeT
	B4I55Yyy4u+fhH6X1LCIPfQQudwsVVm647IZQzxfgozcYkNUmcxWrfTBp7jBUMb8b2tTHpl5q21FW
	dvOXY060UBoytAqHCQpkV4yBkjMyKpYnJk0sdSf2ys51PmF1zVWj6cP8P6d3fCEhFxEWAWi+77MSF
	IDictK2emCd3zjLHA3+qs00LY4P4FZH3djR44aKYjJhoq+9tI7vB3iwtj1mv5iPYbIssyKu8vPIUk
	OtJ6vRETK1pDTw2zVq+E7nPByAlgx+cjGR3rizKhAQZaGsaPVu5T2A87RLgIbySGg1sHkrAznPgFR
	95Qajmrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spMJm-00000000DFs-1Fbe;
	Sat, 14 Sep 2024 06:31:38 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spMJi-00000000DFO-00uv
	for linux-mediatek@lists.infradead.org;
	Sat, 14 Sep 2024 06:31:36 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2057835395aso32978395ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Sep 2024 23:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1726295492; x=1726900292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YA3F8RL5B/IqI+2pfLBP9VWUihTDASIHOdqEg57DLsQ=;
        b=jVC/wkTpUoiCTzMhR/HJfMFJ1lu7qDnfME4usXbdRf8vXZU7UCbPgPtIIifnZn8xgq
         fWV8K00kCPXZvTl+GdXB2mfMK6QSAfmVU24MsQlFFloyKd2QOq/l0O14qrLXfQc8sKTd
         7xwi6NGc85fjfEfZMlBkiJM8hN8aEv+Xz+8jSl+JxzzIUvwDfxF8g19ryx55jJjYgJON
         dgOBX2MB08SjLR0eUirhRPLcAScnJ9E9RLUAPtMpMYAoQwQj4UH3n3nPgVRQueT7FUmk
         FVQEMf1r96ZR6KmjGWUFnP5uo60MOoQ8/g91nV88x90JUW7+2WZOAPVpFLlklssVmNAv
         2LrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726295492; x=1726900292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YA3F8RL5B/IqI+2pfLBP9VWUihTDASIHOdqEg57DLsQ=;
        b=dTFcGmRG0TCPkf7r4qMFN1EpDfPn6a33BHTlGVk7ilkWZKyCgNtNBoisk5vudpmf45
         ZE6TC9q/hVj2n/cat2sn8q/mK7yth3dlfl6CGNAG4QLY4tFjkf+15hGcwv12H5ikzFH+
         fZgHKNuHDRHrbfxIIvHDBmWlNlZhT+Ao+kNJ2CcRZKjdNi3/+8dUu/GKYkZmc+ix55k3
         H/wj/GYTIi+RjloW/Vez+8037hsGBCuaHMAK7bgkJXXioc8QJ25mJqZqbJavni2Jz57f
         7+Mo6xuWRT77Sh2sy/nsl8SGJltAzfzd1YOXghWZWqtcKfZOfEWvgTjssswMVmNH07v/
         v5vg==
X-Forwarded-Encrypted: i=1; AJvYcCVEERZBjcDVmoqJOckv+uVQmZgLuIubirzRVLVP0JTn/b4sWwhcSb76O6PIgYfNMA29ufqVWANiR9rRh/HVsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFMdnH+JfwnJJoQhq5dHxW66FlQMMXBGaEJmxG0r52L0yUYB92
	WYmEQyXrdeSovsqR17qQyGVWA0vnHHOnXOBtYlFjkJmEQkbydDYJdc/CO/OtM7o=
X-Google-Smtp-Source: AGHT+IGtfxxOGIugbIiDlOc5Jtw9CTrvz5uv5il2P9BcO9JycK8o2ZIE40DV90rpSTLnoassY7JfoA==
X-Received: by 2002:a17:902:da8d:b0:205:3525:81bd with SMTP id d9443c01a7336-2076e36a660mr150026835ad.29.1726295491870;
        Fri, 13 Sep 2024 23:31:31 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db4990cebbsm599216a12.37.2024.09.13.23.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 23:31:31 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	knoxchiou@google.com,
	hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v8 0/2] arm64: dts: mediatek: Add MT8186 Ponyta
Date: Sat, 14 Sep 2024 14:31:20 +0800
Message-Id: <20240914063122.1622196-1-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_233134_267413_F5BDF813 
X-CRM114-Status: UNSURE (   8.85  )
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

This is v8 of the MT8186 Chromebook device tree series.
---
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

 .../devicetree/bindings/arm/mediatek.yaml     | 10 +++++
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 18 ++++++++
 .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 22 ++++++++++
 .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 44 +++++++++++++++++++
 5 files changed, 96 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi

-- 
2.34.1


