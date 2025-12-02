Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6119AD12679
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Dec 2025 22:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JSLkiY2zvImHUDZbOwBQtO8/4saKzF7QG8VA5Q/K3ls=; b=izsBIGmtTllDI1
	zTOODrTzBsgEaIKVq7nsFzkUylSHzaGwfg09G7iajG3Lsq23QWY0dpFFiTwSHhayPalFyMkXc3LLT
	ThJclMTy1763lcw/jVi7hPN1JJOsOj0vlTj17EeENMjpdf2z96GbdlJirF5X0V9IOD+uJhlnRf+gL
	SbHb21A3NE4ACevBk2ZDrkEA1N1peMh5K+PT7BJBp77fbdZDXDMdNO0Bj2Ju0uZwnv0jvbh99ljtx
	WRLHUIHlJuoQRy0j50rrWYraR9VKrD3PvXH17Mv997sWccVQPqf4MuShHXeTvMJN2yLVm4S+aD+e8
	GK93021IxBvk3fvt/SLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYYd-00000005skA-4056;
	Tue, 02 Dec 2025 22:09:15 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYYZ-00000005si4-44Fu
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Dec 2025 22:09:14 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47774d3536dso2359085e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Dec 2025 14:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764713350; x=1765318150; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JSLkiY2zvImHUDZbOwBQtO8/4saKzF7QG8VA5Q/K3ls=;
        b=aJhrCOlX3Db67yJxhvpZHj2D0rs5saHiseV2oVl7ruk+fFcOEoFPHJWF9HfAhaewoQ
         CH3odoFxGBNe6iVdG9fa/T+uxg1EqOVURdRnzGZ3DA8mjhc4vDD5DcF2YF0CcUUrHqUQ
         kzakurSX5CEh99vJIfbEGSaNi9tf4kgAU7xtieuoFojCEglwrb1pLwuKkY9GxZMxva7M
         p8H1EXOumva/hIjygY4TdMYbnziadSmqs4ThLx3qQqfCbB6BmVZWJ6V5xDLsrWNHBqtT
         uW36yAecWa+Az1hRHfBzi32k1eiss40/oN0o3+N8EBniWdZpL9rI/T3I2LAY280Ns87T
         uGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764713350; x=1765318150;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSLkiY2zvImHUDZbOwBQtO8/4saKzF7QG8VA5Q/K3ls=;
        b=c17rkh8r6r9V7mjOkrpUUDWHft10jZTOveDPCv6icURV/9AGHrfCJS2zbPfRS2T3OD
         fAPVAC2YwD471vApx7mt9flE2tFd1+nn51giRbnJQKL9zM2Pe3jFqT7AOulT8o/30C4z
         9LG95/YQyCiE/+pP1GqcamjbY23/tsz1sdA5hB2L0/KHzUXWFPrwDww4826oUW876d9m
         Xonr4kpl6c6FWmfZmLsGa3iOeJiL0ApJqvMJnalsbBwtE116CrSugcrc4MwuN0i4IFw4
         NAMi0hAFLyfXrQmpFwPVIklOfr1ym5Jem/XC1ImTSLwb2o8IJdQE8dw1pz2Nwmc5SaLq
         rNBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3P6AmkSCLkRb3G+fhs0fXE2ar579Chr8VZirj8hB6Tpil3zQ0hYOyAD78rNo0wW+zHz1lemBfo4S2WtqhaA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6kdaR/pTkoWEq812ftmw8yRCJUhw2VdiriHHvyQs1fzd9JqmO
	riKUuslsDnMOiAd/rxiU2DmUWnlSOBBUF/u2tKG1ooaOLgaCUbofabsa
X-Gm-Gg: ASbGncsVJVFGXbaovvQAj6EgLSef7zNQ83BGFK1X4iyDJd+f3rAcDV0oHm5WIJhmxYm
	URVvM/aJaSxiO+dPjljsZUSeZc9jEP51QLCpED5CQKum8tWGxaHsEyqQuXS88QBj0uCZN5vuSfE
	bZ5ZeRHe4HJjdBG5mZ5I0p0uWRMyMPJsNILqFcBJR0kOm1SeF9fAy0xO8yBnVvstuT4XrnHPzrt
	HlDPoefOC5IViq6iJV7psar3cKgt3gbQwxBiDx0sEFH1IAG8mUOItsTSk4E7CBiPfSWY2A9vF2y
	AsqCBCfJqZyBSehnJQ/UYKOpmYQZ26FeIWKuSM3of1x2bcvtnovlF0Hskr/Y9qocPWcOfGxbu4f
	R7Jv0ZSNTpx9KU+5sbmOVGQ21yQXrUj5nZjlO9FheY6+/KXigpaAcz81xbvFdsQlcThKfyUj+Tk
	/6f7w8Z2zyPw0rJJPWF7O/qQ+DCt+yqNp16fzf
X-Google-Smtp-Source: AGHT+IFa4GbiRXpXHQJ7qzlsxieJBhAIZGPkTWaihBlWgwkhaDnomrokxbDrSKdw1Li+bI3Q3V3kgg==
X-Received: by 2002:a05:600c:1c25:b0:477:9fa0:7495 with SMTP id 5b1f17b1804b1-4792af4311emr1823995e9.14.1764713349971;
        Tue, 02 Dec 2025 14:09:09 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:d253:f5eb:2f9c:dde7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a79760esm11534795e9.3.2025.12.02.14.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 14:09:09 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Subject: [PATCH v4 0/4] Add support for Ezurio MediaTek platforms
Date: Tue, 02 Dec 2025 23:08:45 +0100
Message-Id: <20251202-review-v4-0-93f5cd2a0d4a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG5jL2kC/22O0Q6CIBhGX6VxHe4HMbSr3qN1QfCjbCkNnOWc7
 x54ZavLs33n7FtIxOAwkvNhIQEnF50fEojjgehODS1SZxITDrxiHBjNI3xRWQFIXsmmaRhJ42d
 A695b6HpLbIPv6dgFVF861IIJKEp5gqqmjN5djH4oWhXmS9sr9yi073Ovc3H0Yd5+TTxXfy5Mn
 AI1mhsrBKKWuCvkC1P5XyuTBtI2yspSMGv22rquHwDX/qQTAQAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764713347; l=2814;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=hmzAGm2KV+/8JNbNSevtwuUcM8ZgD/Dyr/satwDJz+I=;
 b=Xj8Lo8dDuGarkgHqaWbPYbE0zlRP+EF5lB/j8o9yyNKhDUHj9nD4lAruzZtpbZugLaG/Jepvv
 kL6mTPyn7ysAQGJUs/SRBYUe7iKdEnUWAwHQYzR3l6KPJ1N2sFj2+a4
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_140912_779249_A63105E0 
X-CRM114-Status: GOOD (  11.98  )
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

This series adds support for Ezurio MediaTek platforms called
"Tungsten". It includes support for MT8370-based Tungsten 510 and
MT8390-based Tungsten 700 SOMs.

Changes in v2:
- Use b4 to cc all maintainers properly
- Squashed patches 2/3 together
- Updated dts node names to be generic

Changes in v3:
- Added per-commit changelog
- Added missing Acked-by on 1st patch
- Link to v2: https://lore.kernel.org/r/20251201-review-v2-0-dc2df44eec7e@gmail.com

Changes in v4:
- Fixed remaining DTB warnings
- Link to v3: https://lore.kernel.org/r/20251201-review-v3-0-07f9af7341fd@gmail.com

Regards,

Gary Bisson (4):
  dt-bindings: vendor-prefixes: Add Ezurio LLC
  dt-bindings: arm: mediatek: Add Ezurio Tungsten entries
  arm64: dts: mediatek: add device tree for Tungsten 510 board
  arm64: dts: mediatek: add device tree for Tungsten 700 board

 .../devicetree/bindings/arm/mediatek.yaml     |    2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/mediatek/Makefile         |    2 +
 .../dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
 .../dts/mediatek/mt8390-tungsten-smarc.dts    |   22 +
 .../dts/mediatek/mt83x0-tungsten-smarc.dtsi   | 1481 +++++++++++++++++
 6 files changed, 1523 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt83x0-tungsten-smarc.dtsi

--
2.43.0

---
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

---
Gary Bisson (4):
      dt-bindings: vendor-prefixes: Add Ezurio LLC
      dt-bindings: arm: mediatek: Add Ezurio Tungsten entries
      arm64: dts: mediatek: add device tree for Tungsten 510 board
      arm64: dts: mediatek: add device tree for Tungsten 700 board

 .../devicetree/bindings/arm/mediatek.yaml          |    2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/mediatek/Makefile              |    2 +
 .../boot/dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
 .../boot/dts/mediatek/mt8390-tungsten-smarc.dts    |   22 +
 .../boot/dts/mediatek/mt83x0-tungsten-smarc.dtsi   | 1510 ++++++++++++++++++++
 6 files changed, 1552 insertions(+)
---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251201-review-750072579991

Best regards,
-- 
Gary Bisson <bisson.gary@gmail.com>


