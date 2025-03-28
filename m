Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A42C28B20
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Mar 2025 09:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lVf1OxT8PGj4PYemPZVHKfGsO8vE6CKP1+cnxJtI79Q=; b=cV9/0c0r7/92c/UNCakD2qDzBN
	Dg6M8DJGEfIdQoKb5adRd/czH2pgjEm/IBw0RsX0Lun4yJSQsE6j6OaSFIJLKBUnyABPqCUj3dQei
	6ciyKXctQdmuurg4gPDC1YggDsdVkdTAE3o2yOH+VtkNF/bFy3wDqCfMbINfKWZSR1wRxSYnN1yxp
	U1sG3A9AX5+1E3xAQHY5eHVSy9VK9nFlW5LlSHdedQiI1szWelDJIeTpG+5wZzEhxMiLu7VSL3lJg
	iMxToN7DTLHvSlo4Pwy5Zs+htkAK9FIpTF7WfrUCLx6UsMp71RMQJ3WOOdxugf/Uqv7YmIfFscWz5
	HVYfNmbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6Cq-0000000D32Z-2hPG;
	Fri, 28 Mar 2025 09:40:52 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6Cn-0000000D32C-3jZt
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Mar 2025 09:40:51 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2239c066347so45510345ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Mar 2025 02:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1743154849; x=1743759649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lVf1OxT8PGj4PYemPZVHKfGsO8vE6CKP1+cnxJtI79Q=;
        b=cCk+H/ycic6FelRL0ZCI4rbJIbc5nIhowu5ZaiO77ztBmok9Rh0HvvQAV0sxdVtQ6H
         1M+RsQ7i2+BEsAUO2SfntFvaktpAF7xwrnrDmZhrXlX1k+CATp8h2R1hLRdNpAkWH0ym
         qjxbzGqUKWZD96Odf0ReWR9oH6lNVHVvio9UhfFbiZnga2bckbTxGMW5mzN46YpbFIn2
         IH10Wa/RQWa4Xvk+eiK2VviprxikkZ0nd9w3uuhIK1tTJFOFFTYan0FzqA4dKZQSdPdL
         n4w+euiHoPEuatlnMfUYFKqNNm0KaFxl6TTRRbUK3+eVPHCfWYiF/5TlEBZbvfHpa0Gp
         Niog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743154849; x=1743759649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVf1OxT8PGj4PYemPZVHKfGsO8vE6CKP1+cnxJtI79Q=;
        b=dSigcTONKJFrvRTUWV1fV4Ri+uoBCALe/ulF88dbYNf8WJnGWbcIvXJWmgeDrcvJDZ
         hbyJQ/7sayPd+18AFlpx8ukyPIQjOKdy8FDpTLkpxLwaY/mhBc8wQalPeePXkYI86rZO
         4qhFo5Ie/mB/93OTGWEr5oKBhkbGOwqG8aa4cxO9BdyoQmaPwemJnVEzz6mKV7CZmJq3
         mKNA1yEWMBRiaUixmojb/Oh9tC7blOMQZF4umZQ3vgSwJGJbrQddMy8MXXrdQH0rvjam
         6oIq/EvbRX3xaVhjsqqmUaYBnra2McLZZw5lZIjNuRbStZh9SWSQnD7IwdWFbu53Krmi
         +tdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtMmyNewyg11dxFVF6gE65q4ZZ0szFbsKYe/o/nFB/pw//ktsHvv6pMHoUg0iDaupBAKhqbtFaEaXnfSoDNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm+cRh8Rp4jL3txCVatZgKIpESOm2/w9xyp2mKOQsJlPCixZ8Z
	kl9cpf8Xs3nzYuh9YYtaS5S+DcSt5Cc08izc8fEDTciYR5Gngr4UNOVjEaZQB/o=
X-Gm-Gg: ASbGncuWdNRQxXWKkwkPti5IqNO9oJh0HIPhmOD31UzXgvFLz6c/Gpma3+mpaM/0h7s
	3mi/sl1PoeysRWAmsAqHqrolRHE9gVgEkqLlFBaY80uztfrZtMFA66WZCjXEszWJz8tkMrLU2mK
	JuwQvVc8+7MNzdbw2eEsOFr9efj2y95K3G2ftVmkYeFlaPcdD0HGVNWI62AVu2GEnlq/t3WmOlq
	Om+zZUax0rnZ4BD7x8fzK5dChvfhS+pdVCffo7u83k+RTfXPyqEN38IfTOREj07BmVlG0z4ZT/0
	XKVZhXr0DR9WeldO1BGgbSl0NSog8RIaICzf0ny9z6XQSoid3BegrPkjYPOHUgmPN5GuWX5ziLD
	pZCE=
X-Google-Smtp-Source: AGHT+IHlMk3FT8wV80BXMjlruAdNjtASKILfG6spB3x0ZSEswoz0sZWSrejxGN07tV3Fa7SmSJ5ASQ==
X-Received: by 2002:a05:6a00:3392:b0:736:9fa2:bcbb with SMTP id d2e1a72fcca58-739610e3485mr11701752b3a.24.1743154848458;
        Fri, 28 Mar 2025 02:40:48 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7397106c7b7sm1283012b3a.116.2025.03.28.02.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 02:40:48 -0700 (PDT)
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
Subject: [PATCH v9 0/2] arm64: dts: mediatek: Add MT8186 Ponyta
Date: Fri, 28 Mar 2025 17:40:32 +0800
Message-Id: <20250328094034.3400233-1-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_024050_191243_6B0A80D4 
X-CRM114-Status: UNSURE (   8.98  )
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

This is v9 of the MT8186 Chromebook device tree series.
---
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

 .../devicetree/bindings/arm/mediatek.yaml     | 10 ++++
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 18 +++++++
 .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 22 +++++++++
 .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 49 +++++++++++++++++++
 5 files changed, 101 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi

-- 
2.34.1


