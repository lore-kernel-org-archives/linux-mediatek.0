Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5CAD2FFF8
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 12:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CDJu6fBQb2bDc0BqYl/x7X5JBsqu58Z2M+kmfTvKKyw=; b=Twz8amtZPElVdN
	FpGOxjjig849khbi20ub/A8PjxcvwzBIyB1+1phu4zv3VWNH3h25uYTiLVyDQZXoFbmFAnbuL5xoT
	2e44VObqFaaEBaBgPH/MRDRasfdCreh2yn2zUXqamYTEE3S82YgA5vlGB6hDEFo1Dw6YZJ05kY8Tk
	rbmuovCGznEHg0HcQfF+ETKMTwfsV+p6wvHf2IcoD0QVqZRcXbZcXBYjSXuuwQ8xz7tlwDUAGNo/5
	WLc1ZqnGJMQ2OrFTOyN3EqY5Mb/ItMyF/ol3U4zlLpPnW8j2WFeUm6S0m8VdKfh1sE77sCn+jgN4n
	ydv97eD4r5ukVAb7dBLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1lil-00000000hwK-3bjc;
	Fri, 18 Oct 2024 12:04:43 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1lhH-00000000hdK-3P4Q
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Oct 2024 12:03:13 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-71e585ef0b3so1639534b3a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Oct 2024 05:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729252990; x=1729857790; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CDJu6fBQb2bDc0BqYl/x7X5JBsqu58Z2M+kmfTvKKyw=;
        b=Gk7+N69mdfiOC4mnAZyAO4wZ3v4JYmYRseAe3z0DtIavl8lfjWZYsoohQYrvEobddQ
         C0xiiRBA+0G88Vh+ZOWiFfAtPzaUBU+2kfdZWe9rm+9ov+SZ+tbxGbY7J2l8NYxjs0Hu
         bwHX8hLeOnmKXnq3LunNuUz+46nO2Nrs6WBIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729252990; x=1729857790;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDJu6fBQb2bDc0BqYl/x7X5JBsqu58Z2M+kmfTvKKyw=;
        b=CsRJzQyUPW136oZDTgFPsI46Et54nef3OoKPcuKpsh5EoV0aEGT77Nyq2QRjhyPrR0
         l086WnWWdK9hi09Q0m503IhDy8U9zGmaaCh6QcWMWRzobT4gO0BsRol8dm5Sa6qrdutT
         GpSYol3uxKGYU8sKLGp8PceKxE4roM/U9qVEt6wOPdhZnKeKl8dMNshw++D4k0Vsuvz5
         uvzqqv2VWYLnfnGYrYHT+DbsUZ96xaw5N5kSA7ULmkom/mB+Gn9PID7U5ZFbBLxVrGWM
         F83x7AElIeIYiLYO3XzTTU2jCgiVuUuES5pKWbI8btz6LBteI7nxiXA2sHfatm+xpQ/H
         RCVw==
X-Forwarded-Encrypted: i=1; AJvYcCWlkeQAk3dGcX/EzvAvVwLI0LaLRxEF+wIDiGlMR/D9TywaF5n+YzXPx8IQh43BwPgUiHxikh1g+0ItXrUBjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJY7LqMaqVOyAyQfuYLraxomp04lPHPwhlMp0hNzyXeypfJrqi
	T+ESXx2hj++lbZh7IrTXhVr1fQ3qXCPq8SXVqYbXhdHsW+LfeIvFQGxegwwE+Q==
X-Google-Smtp-Source: AGHT+IFKICDT9+F2pT3sRCMfvCwNLuczhwS1bTZfHyCZaslXhQZFrv1ZJCb8b0gWYMEy9tdZtcu1bg==
X-Received: by 2002:a05:6a00:1ad2:b0:71e:693c:107c with SMTP id d2e1a72fcca58-71ea31ae9a9mr2758478b3a.11.1729252990124;
        Fri, 18 Oct 2024 05:03:10 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea34ae672sm1274014b3a.204.2024.10.18.05.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 05:03:09 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Subject: [PATCH 0/2] Using i2c-hid-of-elan driver instead of i2c-hid-of
 driver
Date: Fri, 18 Oct 2024 12:03:03 +0000
Message-Id: <20241018-post-reset-v1-0-5aadb7550037@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHhOEmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDA0ML3YL84hLdotTi1BLdxGQzsyQDY1NDM0NjJaCGgqLUtMwKsGHRsbW
 1AKoyNcNcAAAA
X-Change-ID: 20241018-post-reset-ac66b0351613
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_050311_913754_70996624 
X-CRM114-Status: UNSURE (   9.07  )
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

After commit 2be404486c05 ("HID: i2c-hid-of: Add reset GPIO support to
i2c-hid-of"), i2c-hid-of driver resets the touchscreen without having
proper post-reset delay on OF platform.  From the commit message of that
commit, not to decribe poset-reset delay in device tree is intended.
Instead, describing the delay in platform data and changing to use
specialized driver is more preferable solution.

Also workaround the race condition of pinctrl used by touchscreen and
trackpad in this series to avoid merge conflict.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Hsin-Te Yuan (2):
      arm64: dts: mediatek: mt8183: Fix race condition of pinctrl
      arm64: dts: mediatek: mt8183: Switch to Elan touchscreen driver

 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts |  2 --
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts  |  3 ---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts   | 12 +++---------
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts   | 11 ++---------
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts   | 11 ++---------
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts   | 11 ++---------
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi |  3 ---
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi      |  3 ---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dts   |  3 ---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts  |  3 ---
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi |  3 ---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi       | 10 +++-------
 12 files changed, 12 insertions(+), 63 deletions(-)
---
base-commit: eca631b8fe808748d7585059c4307005ca5c5820
change-id: 20241018-post-reset-ac66b0351613

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


