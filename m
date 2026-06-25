Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E4BCDB479
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 10:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vd1pAolJ32WGUV5hqmP6vxrovN7AtVmD6Ko3jeyWjvE=; b=nrhNsWsCeZVSS3mL26gOTYI23T
	Udllp0CGdfxPwlpiGY3d6+R4/a2REesMndui3dbHWMMWtSmRBjCFvrmHoVzk7oWWErLwpSH/ubGu1
	KjVTXStwhXmLmFLzQHPSrQhInwYzSjx4dXll8sJXXxiSJzSZ6Tvxrz/G2ekUJjbe2YND15W46CBhE
	OQ4dxDAblCyhk42F7yEmlEGJzhYEW6jcguO00xBKPGLINvaKd6NfvHOU4YqzZlqyjrTJiq5d5Y8/e
	ZAoA1Um0QjJ6mF8dbkkW+wdDyvxkESWTv80N1BOWyx7kewjnKF72oBUi4R2N8oz/YC+pkLJcAs3Lo
	XeMhOIng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchcq-000000091pi-1vTc;
	Thu, 25 Jun 2026 10:48:04 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchco-000000091oX-1Ef5
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jun 2026 10:48:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490ac357c55so18117095e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Jun 2026 03:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782384480; x=1782989280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vd1pAolJ32WGUV5hqmP6vxrovN7AtVmD6Ko3jeyWjvE=;
        b=msgXD4rng4ftz8XElZ8Gf8/b5MkVpfXyjI7rSLY1KKOhZAI0YbqQoeVCngHmuvMPcz
         jB7NkJzrLsCEEwTmssX2oWbvmlY9oIrfRxCCJQmuC7l3Hz+JXykz73LSBJpCvYSn09KA
         As6UYzPpOuZ0ia04ZUG+JZuoUVQW7K4GgRG5xeHGsTOMHPUZxv10ldHyZKulMh22EHVR
         8LjNcy2lXu0ErQ0ctBFPPfE3jeciia7FlyMPBc813FxYS5S/3pDsk3m+yzP//zSMHFx9
         GCspvuNUl1ReggUhiHzjrOSY9x+iEqKcB6Gr6LNZ4ycVtmyS1aRAbrhSQSSONzlX/IVs
         hNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384480; x=1782989280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vd1pAolJ32WGUV5hqmP6vxrovN7AtVmD6Ko3jeyWjvE=;
        b=ml8GQInynWRJ40eQXUDnnfS4OtGTN5FQuAe+30vRYUDv4uRKsXt6kgj8jqhsIwDBhd
         qfJWVMX2ILNh9hPtd8uczJ5LRc8eSLvzx+6pfcI5Bt9p/G2JaPRlStKHIVY0TP4oSBv/
         WqCaHkHbMbkXd93X2UWnHZohbDAcqdVueu6Sgo2XhQ0AzMd2jcQNx0xyl1Zh44V5C/Ei
         ad7xnIpHawBMdkhbzaib8WCMBHnev9JcuF+na0MKmEHB2IZXIilOx9ss09sKYeyihPUQ
         4D7JO8bhLUMHCj2weDMGcm3mAlip2NhaevkSIu9BDJ0WpFj7ifSoJo3yvd/cGZI7WcTz
         V4LA==
X-Gm-Message-State: AOJu0YxH7A3ifeup/qTp+6sAwCRGQxbSe0W/H0gcA5vHBz8kgBLSrGD/
	L6dHQKMiVR+3omQtjmScjxnYChO60VBksBCSIMaGYBQI3SDX3y6Cbr5AZfnPiMNU
X-Gm-Gg: AfdE7ckleKweAkXKWwSuuiENsCJdPQ4FYXX/U5C4A5kg3LdYX+GIK/EYDuKWBCjRrxw
	NuVBemV4zJtnCiX1izkeX3R29ySz7OCMozRdHisbRr6iMlkaz4eUF/csfZKTw7a2IldMlZFmQE2
	Y0Bbie0cI4haQENcvd9C+53M7FpmPrAuvvA6fQN521GccS092WDokFVwKozjRJ1txfilL+0kGqM
	ei0YCwnhbjUGmUZrhD5iJXmArzyNWzTYiV8TlE9HL7uUyzbfEYgmO7GmXU7QE4QcG7hP9pB0R76
	WILVu0H8Qfbkv4azLeSRq6e16l6m9yxliL0JkzcrLasgGC7T3j9UsskXUvM+uVU2ukhA5/2RkZy
	/uZabhGcZ+jQx+QTRcww8l/f46BBVs0K/Nm1H05Nzrj9bKpwBuRaPdiP/4j+50mvXSRIIuiLx/i
	X5FpIjJw==
X-Received: by 2002:a05:600c:b96:b0:492:6447:7a7f with SMTP id 5b1f17b1804b1-4926686b3f3mr25232275e9.6.1782384480165;
        Thu, 25 Jun 2026 03:48:00 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c6csm15254989f8f.14.2026.06.25.03.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:47:59 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 0/3] pinctrl: mediatek: mt8516-mt8167: Convert to Paris driver
Date: Thu, 25 Jun 2026 12:46:29 +0200
Message-ID: <20260625104742.113803-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_034802_348588_678A7ABF 
X-CRM114-Status: GOOD (  16.27  )
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

The pinctrl registers of the mt8516 and mt8167 SoCs follow the layout of
the Paris platform, but their pinctrl driver is currently modeled on
the mt65xx legacy driver. As suggested in [1], it is possible to migrate
them to the Paris driver.

In the process it is also possible to completely drop one of the two
drivers as their register layout is identical, they only differ in some
pin functions (mt8167 is basically mt8516 with added display blocks).

The Paris driver allows specifying two base registers, gpio and eint;
this way it's no longer necessary to have a syscfg node in the device
tree, referenced as a phandle in the pinctrl node. This also fixes the
following long standing dtbs_check errors:

mt8167-pumpkin.dtb: syscfg-pctl@10005000 (syscon): compatible: ['syscon']
  is too short
mt8516-pumpkin.dtb: syscfg-pctl@10005000 (syscon): compatible: ['syscon']
  is too short

The new driver has been checked against the SoC data sheet and adds the
capability to control pin driving strength and R1R0 pullup-pulldown
resistors.

This series is sent as a RFC since the changes could theoretically impact
existing devices. I am pretty sure that no device ever used upstream
drivers though, not even the Pumpkin board that's present in Linux
sources since this board lacks the associated mt6392 PMIC driver that
is required for regulator management. If for compatibility reasons it is
deemed better to keep both drivers in the kernel I would welcome any
suggestion on how to name the new driver, and how to adjust the two
bindings for coexistence.

These changes have been tested on the Xiaomi Mi Smart Clock X04G and on
the Lenovo Smart Clock 2 CD-24502F.

[1] https://lore.kernel.org/linux-mediatek/296b000c-5970-4668-bd42-b99ca78d598f@collabora.com/

Luca Leonardo Scorcia (3):
  dt-bindings: pinctrl: mt8516/mt8167: Move compatibles from mt66xx to
    mt6795
  pinctrl: mediatek: mt8516/mt8167: Migrate driver to pinctrl-paris
    platform
  arm64: dts: mt8516/mt8167: Update pinctrl nodes for the new paris
    driver

 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |   2 -
 .../pinctrl/mediatek,mt6795-pinctrl.yaml      |   5 +-
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      |  15 +-
 arch/arm64/boot/dts/mediatek/mt8516.dtsi      |  12 +-
 drivers/pinctrl/mediatek/Kconfig              |  11 +-
 drivers/pinctrl/mediatek/Makefile             |   1 -
 drivers/pinctrl/mediatek/pinctrl-mt8167.c     | 345 --------
 drivers/pinctrl/mediatek/pinctrl-mt8516.c     | 770 +++++++++++-------
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8167.h | 562 +++++++------
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8516.h | 512 ++++++------
 10 files changed, 1018 insertions(+), 1217 deletions(-)
 delete mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8167.c


base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
-- 
2.43.0


