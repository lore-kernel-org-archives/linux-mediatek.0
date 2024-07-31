Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A17C3DA64
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 10:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6yqftJYgpsdpuaB39a0qAl3cbMgdLrQIYW98lIkiY1Y=; b=2tHLDHubpM6U4y
	mN0/02tF6eemleQktcYETN42JYYkqcEI95fTH/50GnmdLERgfZDj8zZ27gSXtQimlTLataj6LSUFx
	eoyf+JkHAxxqFXf43dZFugdx2SIZOXo/oBpoC5TP5GCfZEqxHgxINUTGW4oeeyzm/gTOj74sUhxll
	lxqdl5j0h3KetYXDIVkmPWh+FpEQBamaEk8zi0UMWz4RwyztvfuFlS8Vp88+n0X22q9BARHUa0g0m
	Q7qx5x7semyGwZ4ZXSokZDmav2DWUFVJlUTl107dlfP+sy9IqT/PtZr3JkZVXWROD14aAr6TVwtSx
	UhKNWu1WnmrGPzWyELvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ6rl-00000000mPp-3DsP;
	Wed, 31 Jul 2024 10:47:33 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ6ri-00000000mOY-2DrU
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jul 2024 10:47:32 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-81fb419f77bso107329439f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Jul 2024 03:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722422849; x=1723027649; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6yqftJYgpsdpuaB39a0qAl3cbMgdLrQIYW98lIkiY1Y=;
        b=Ala+MGtjqQ3KlmtwCAhVeeMmTm9fI/vkYY+jDP7t+oRreE8grP90p7ZIxXTGKNMMUo
         iUiBKltev9DGhKFOcsWrSeZbETLlOBC7xaxLXbm4GuarsYvBXpZq08nvnbAstJ4vFM4o
         JKxuObXrknphzewcORQFrjBDMMnFvF3rW5DCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722422849; x=1723027649;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6yqftJYgpsdpuaB39a0qAl3cbMgdLrQIYW98lIkiY1Y=;
        b=WukTiN+za51EtUCrhtVoAREck0zkX3brMVjAY/WGOnsIWja0fIXB2/ALPZjKfFOWL4
         JgwFCSaZ2w/Zkk0OLU+EpodBdnQnHHXny5isR8V++3SiY795v18C+K1r9M9zTbc1eKS6
         pEvNK/QSUjMsR9mYagkrsjKcVf7vMsvcPbG75UVlUrMEsJ86LtExdgeFl5Dr43hPg+Kt
         gxkGlONBhEI9hR+BnHSKmAMZJSZt+wZpJAKuOsFFI4vPmm46G0TykIqBZ2sq+MEknCiU
         UXDLuKosl8op+nyMuATqsfz++3XjIR3SPOE39f5XeM6mDVJNhxolDuqk0yAosNhZY1w4
         GFuw==
X-Forwarded-Encrypted: i=1; AJvYcCXPTaFaDvXPUf6N3VFYZSQqGIVyVQETJLfOheSDH8DrWOPeiTP0fYoERjkEvsaTVc2WhL4EHHLboIzOv35ZlnZ6V7E2LWZrL6L/YTiMVQ2yFPHy
X-Gm-Message-State: AOJu0YzvgNgY3Saj1yvbEb8lEvDJpB+Saykr8LBjbSPlSNgkYKoPRUbK
	uNpg4ZOVFyxJIuqXEPwR3XK3n6kPvCAH8VBDsCAByhiLN+oyOprz2OuOO0NqeQ==
X-Google-Smtp-Source: AGHT+IG77YhthMCyuU0rdCq1IohoSnJWamFfjuvhA+obGGesvdGPDyHrZg7NqXHZD1C0uIDW5pvANw==
X-Received: by 2002:a05:6e02:216e:b0:397:70e7:143b with SMTP id e9e14a558f8ab-39aec2eae11mr179360445ab.14.1722422849317;
        Wed, 31 Jul 2024 03:47:29 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (46.165.189.35.bc.googleusercontent.com. [35.189.165.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9fa5a0bcesm8788400a12.89.2024.07.31.03.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 03:47:28 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Subject: [PATCH v3 0/2] Add kukui-jacuzzi-cerise and kukui-jacuzzi-stern DT
 and dt-binding
Date: Wed, 31 Jul 2024 10:47:24 +0000
Message-Id: <20240731-jacuzzi_dt-v3-0-1c4314e8962f@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADwWqmYC/22M0Q6CIBRAf8XxHA0uUKOn/qO1hoB629QGykrnv
 4c+VevxnO2cmUQf0EdyKmYSfMKIfZdB7ApiG9PVnqLLTICBZEcQ9G7sOE14cwNlB+tYWTklAUg
 OHsFX+Nxml2vmBuPQh9f2Tny1fzeJU06F11oaKJUHebZN6Fsc230farKeEnzUgn/VQBmVWishl
 DNGsJ96WZY3CZsmO+UAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-a9570
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_034730_623724_4DA398DA 
X-CRM114-Status: UNSURE (   9.59  )
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

Cerise is known as ASUS Chromebook CZ1.
Stern is known as ASUS Chromebook Flip CZ1.
    
They are almost identical. The only difference is that Cerise is a
clamshell device without touchscreen and Stern is a convertible device.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v3:
- Add explanation about the compatible string of Stern.
- Replace MTK_DRIVE_6mA with 6.
- Link to v2: https://lore.kernel.org/r/20240731-jacuzzi_dt-v2-0-4995335daa30@chromium.org

Changes in v2:
- Add more SKUs.
- Remove unnecessary property.
- Specify classis-type in the dts files.
- Add dt-bindings for these devices.
- Include these dts file in Makefile.
- Link to v1: https://lore.kernel.org/r/20240723-jacuzzi_dt-v1-1-3e994a2b5e24@chromium.org

---
Hsin-Te Yuan (2):
      arm64: dts: mt8183: Add kukui-jacuzzi-cerise series boards
      dt-bindings: arm64: mediatek: Add kukui-jacuzzi-cerise board

 .../devicetree/bindings/arm/mediatek.yaml          | 14 +++++++++++
 arch/arm64/boot/dts/mediatek/Makefile              |  4 +++
 .../mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dts  | 26 +++++++++++++++++++
 .../dts/mediatek/mt8183-kukui-jacuzzi-cerise.dts   | 26 +++++++++++++++++++
 .../dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtsi  | 21 ++++++++++++++++
 .../mediatek/mt8183-kukui-jacuzzi-stern-rev3.dts   | 29 ++++++++++++++++++++++
 .../dts/mediatek/mt8183-kukui-jacuzzi-stern.dts    | 29 ++++++++++++++++++++++
 7 files changed, 149 insertions(+)
---
base-commit: 66ebbdfdeb093e097399b1883390079cd4c3022b
change-id: 20240723-jacuzzi_dt-06cd0bfd5422

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


