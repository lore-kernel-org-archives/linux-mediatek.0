Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B886D10DBD
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 08:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZ+V8gAQS0krBkG0WVrb6zVz1qUQ2D1EuHAFBRDqmVc=; b=pqWF9RlVYzsb/CJZePiRnsq4iP
	EjO1VFV4lpkLQlaqYnn5MiA7GjjdJmxrVWrGPk2iTu/USC83ZeyDwWGEjmqAKjwkcNHwmpzcxcZCd
	yJDmL23D+/kd1Y2CB0c1n7Sr4m/++RbPtwqtAi205r+I1CGu+CHaSFrOLF/njtBo/t2BSKjhfi0a+
	P8mP8zHjoiW4Qq/babi4WAJbQZu0zGF3jMiv8VUeCU1aoYQR1PEfL9u0164viaWeUoFT3Ws+FGPMQ
	2XIDbR78pC2OJ6xqWK4BzAEt+lgxvFBOs/64sNgNJyQyE1gyJRSQfdlfCtjX9WGEYtyvW5Z49slFP
	uQqPUaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI1bg-00000005Oj0-0t8J;
	Mon, 02 Dec 2024 08:16:36 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI1be-00000005Ohv-1MPk
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 08:16:35 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7252b7326f4so3231124b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Dec 2024 00:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733127393; x=1733732193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZ+V8gAQS0krBkG0WVrb6zVz1qUQ2D1EuHAFBRDqmVc=;
        b=lLWFKIRmm8sLQO1X6GwuozcUEwryQJMtdLaVacQh3rVvAsh4hiVfWWUbkJw2VN2rgF
         sCx6/feKPid7okWekVt/ARv3MHB4GPHdavgl6p0uNCuAMXgrt+4soAp1j3G/fxYqyfuM
         y6+Janwx+uMO1pstAHtAOrYyWW4/OUE/6/3ZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733127393; x=1733732193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZ+V8gAQS0krBkG0WVrb6zVz1qUQ2D1EuHAFBRDqmVc=;
        b=fvsC5z/HLosr9HHLmetdjeqbJI3r3uSMPfXjYLVRpK8w85kdfmeBzdSGgfccRw8ejl
         9e/BKGi5eKpu2a0KIwTJbElVTBg62lYP7QHdCGa42I+h48cSW4pLrtFm4IVb0HjuEtJq
         tGDm8Ny9YhSxC4VVs/Qff8a+AdGA7bNAtf1SZCcc3rufPwPLRHPvLuvX1F22G/QOZcyy
         VXdlGqoGpaKft8en78VJr9Vbp7rQsyqrtnrfHQs698QBmYl0BaOn2+NB4H3KjHrkQ14O
         eE7LN/oBB42Gnrbsr5dp9E6d1Zj0gS9L+724t7FClPF8V/VSFmyFyjy4qn8GguimTKcV
         u89w==
X-Forwarded-Encrypted: i=1; AJvYcCVVAmIyhwCQj79RAQWu7KgWMPYh0CfI2KKho91a5fWFUiisC/hfr7RFcDGBhkkmU0i+HFmjTqJ/DKHAL56GVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiecDlyJZznAvcHA0C1kUnyL8jtFUawpKmGrba9WhIA4gjX072
	+bgn2MJKcEz9oBzosFVNog3eQx4ZE1wOCD95bXgP8MZHqFZLk2gQYnWILybOb9JFGAeM99R4S18
	=
X-Gm-Gg: ASbGncvZBOYkj22G92yL7S+ReNXbeQgrt1Rz7V9jgG8P3rQ8H6K06oBRxWq3QW7Rrq4
	GNdSAMt8q3ZYeGhgjRWarWxB3L9kMIG3k4gkQ/gw777L1Q8Aoy0ec1HnVgoyD3gxr6SYsvC55Ep
	QMYRg5fwjM24g1ZNrpiUQHFjepvQYe5QSbWKDy2b81LlwYPAvPO3vivBMWAl5GLIY9XocDCkisV
	B3lvYQP8Fl59XaG8/NYyaNJ6iwTwhycHe6K5tyv6bHCihGIk34dfbikRcTs874dSqKL
X-Google-Smtp-Source: AGHT+IGt9cTgxCtovdz1WM+2VFqEZhhh4JaKNavNwPJgr8fK5Ri/wVS1DDwHKI8QEXh5bTEbIZqezg==
X-Received: by 2002:a17:90b:3c4b:b0:2ee:bbd8:2b7e with SMTP id 98e67ed59e1d1-2eebbd82e62mr6847321a91.12.1733127393173;
        Mon, 02 Dec 2024 00:16:33 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:94c8:21f5:4a03:8964])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee488af41dsm6312844a91.28.2024.12.02.00.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 00:16:32 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Koichiro Den <koichiro.den@canonical.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH 6.1 2/2] arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled
Date: Mon,  2 Dec 2024 16:16:22 +0800
Message-ID: <20241202081624.156285-2-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241202081624.156285-1-wenst@chromium.org>
References: <20241202081624.156285-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_001634_359480_96714CA9 
X-CRM114-Status: UNSURE (   9.55  )
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

[ Upstream commit 09d385679487c58f0859c1ad4f404ba3df2f8830 ]

USB 3.0 on xhci1 is not used, as the controller shares the same PHY as
pcie1. The latter is enabled to support the M.2 PCIe WLAN card on this
design.

Mark USB 3.0 as disabled on this controller using the
"mediatek,u3p-dis-msk" property.

Reported-by: Nícolas F. R. A. Prado <nfraprado@collabora.com> #KernelCI
Closes: https://lore.kernel.org/all/9fce9838-ef87-4d1b-b3df-63e1ddb0ec51@notapiano/
Fixes: b6267a396e1c ("arm64: dts: mediatek: cherry: Enable T-PHYs and USB XHCI controllers")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20240731034411.371178-2-wenst@chromium.org
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 9180a73db066..0243da99d9c6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -906,6 +906,7 @@ &xhci1 {
 
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&usb_vbus>;
+	mediatek,u3p-dis-msk = <1>;
 };
 
 &xhci2 {
-- 
2.47.0.338.g60cca15819-goog


