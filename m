Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87000C3DA64
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 06:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bqhIkk3YfCSp6KaZ4R+MmsXcqdQVHrJDoQsTmhCdvZs=; b=3Q261wlvSQ7kZD
	E0lFaoqYSHgzvMrN7DWU+motnKaoSPYUiqQ/OEZ+TPloJlmuWzsVxy6TWCesvaEZOgyazoXE8krL1
	hA6JXlObtjpRDdaB8U5m/Y8jIwFCtwLYL6L0t0pRv+T30c2cJ7DA7Iqutr75PfTx0/ebVCTrIOV6O
	suTLmiife1A+C1LY8aM5cP8IkkSZom0Om3mdbxHaWZ5M7o4UDZPrYmSVvet98lhSY4EDLQV7lBQXC
	BuSSycIXOXpgQppaX9+wkCjOatchg/Aq8ROoLsS7NI9EHjRfHmDHW1NLc6zS7pf8O3aPYpVUepDOA
	W7hDwHVVY9JXiLvRJ0bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ2nq-0000000HXHb-3R6O;
	Wed, 31 Jul 2024 06:27:14 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ2nK-0000000HX3M-0x2s
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jul 2024 06:26:44 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-70d333d5890so5087541b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jul 2024 23:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722407201; x=1723012001; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bqhIkk3YfCSp6KaZ4R+MmsXcqdQVHrJDoQsTmhCdvZs=;
        b=GSg6spHQWsL3EygUM/bxwQ3Ptg/ntgiEoW+OI21PGu55oMGNLCiMzX1x+WQETZ2HQy
         9Qtb3aAiaRvFnuuDE++6Y2jw2ERbz0NmJSX482ymsKeoZznQc0KfCygA76LkzvrpVBt9
         5c7f3s59aWYxVxEyD6QTjZ4yPlRL78QTQ42JQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722407201; x=1723012001;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bqhIkk3YfCSp6KaZ4R+MmsXcqdQVHrJDoQsTmhCdvZs=;
        b=UtDFhIkgm72tPyrmoc9+cLapgOblxwg2aCCNsGBLUbgPEOpD+Y3pVdu7ZgxvMNptt0
         kG68vWIbl6QbI/9ZybLC0c/UfjEtP12eMGX7WtfiEfZ4WM65mtJ94TOL6JC6J+8c0zWe
         BKfwFtP0dKGfKY5VjX6NtNoFpXl0axrWJ1NMBps6CM0YOMnBSpvrpJ3MhyYNUudBujFa
         3jr58SzQZMXKgcAKmdnAaVD3pyQv1nkY9f20x4ROvPWXaSZNYorKVk2lkQvdBAaWUPQB
         Qbf1s8IRClpg6J6W8rc/SX7G+cS1/TRlSHFLGElamlAtllh/JCa3dKtyiy2+xzOpjW0j
         mUyA==
X-Forwarded-Encrypted: i=1; AJvYcCU611QyLbs3leSLxYGnR1uh03ZrdpIToDZsYDxR029TQeEp06RERwzfaHY6FrbbHiZxebPMzu3C0CA3qFdJYsBrfTIibnxiAovg5vPkSwYE/FXw
X-Gm-Message-State: AOJu0YyQ4V7Eq/ZWkpImYM2tP2NSTinrUT7EbEpxm1W8UcoRKFChy/FZ
	4efTC45LRY5W54UBEPGQ2tnnBXVfjVmU5VT3i1vwxlT2m4Tncwpt7SCB47XpDQ==
X-Google-Smtp-Source: AGHT+IEiQW+a8M7q5lz39PWzZTOdWXj45ufGNGatcB448aoDc9BWYb8bX/VGTeoj1YB0vyVoO4r7SA==
X-Received: by 2002:a05:6a00:14c1:b0:704:2563:5079 with SMTP id d2e1a72fcca58-70ecedbce2cmr17889294b3a.27.1722407200632;
        Tue, 30 Jul 2024 23:26:40 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (46.165.189.35.bc.googleusercontent.com. [35.189.165.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead6e1084sm9322308b3a.25.2024.07.30.23.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 23:26:40 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Subject: [PATCH v2 0/2] Add kukui-jacuzzi-cerise and kukui-jacuzzi-stern DT
 and dt-binding
Date: Wed, 31 Jul 2024 06:26:34 +0000
Message-Id: <20240731-jacuzzi_dt-v2-0-4995335daa30@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABrZqWYC/23MQQ6CMBCF4auQWVvTDkWDK+9hiIF2oGMCJS0Qh
 XB3K2uX/0vet0GkwBThlm0QaOHIfkiBpwyMq4eOBNvUgBK1vGIuXrWZ15WfdhLyYqxsWltoREi
 HMVDL7wN7VKkdx8mHz2Ev6rf+ZRYllMipLHWNTUGo78YF3/Pcn33ooNr3/QudoUFFpwAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_232642_333580_51A82E63 
X-CRM114-Status: UNSURE (   9.80  )
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


