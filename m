Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B64CC3DA64
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 03:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UbdYL0//iy1qTkoAHNN3QDl4lYvN+Ijx1oBz/ie38k=; b=MSSQI5+z4K1t3REfGSCPIGCYbI
	N3VKmJpTAPYJEtuHMSwBW+T8YIEL/QeOqT2oI3xiuwKutFPTwjtEkyum+Ix+g0rR0IF1Dp9xaIQ+W
	a6YEV5RfwyS+gtnIsVVrZL+yDVArelt0sik0exkXphEK1FgmtaIRjGTnX31zc0o14PFQKklf8luq5
	2EsExIfAEm6aann5BjujmafhEWpAz/+mt+dzybA/mbPk9+ksHMmo2jMklRIQI7ABQ9U87XWG+KUOK
	bXZxgWR45uBqWXnL6fx8QHch8qnhy4Q10uR3JzwN3fWDCpOqWgZipwID5Bp9/J1CAEjfSIb+tq0ih
	0sjVhtKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ0Gl-0000000HCKo-3ytd;
	Wed, 31 Jul 2024 03:44:55 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ0GJ-0000000HCBU-1nzr
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jul 2024 03:44:29 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-2610623f445so3640108fac.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jul 2024 20:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722397466; x=1723002266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UbdYL0//iy1qTkoAHNN3QDl4lYvN+Ijx1oBz/ie38k=;
        b=U+w/KDu9++rPlFN4aIRp8BiQbt2I7zEklPWszIQOIyWAGYR4MIHefgde23VE97It7I
         2mmEYQHJqADuzMBkBl/2/kGarOZbzo72kOLwIn7/7IdaGCIQJoj+zW76/U36bVZN4g1o
         kvhQw516AqpQRuvKoiOav+thXo2L++rHxsIK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722397466; x=1723002266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UbdYL0//iy1qTkoAHNN3QDl4lYvN+Ijx1oBz/ie38k=;
        b=J/CEV5GYEJbiBPbC3MG0k365rCr7clFK5YKp3lyJwX80IK2TyqgFlSq0JziIBFpZ3H
         XQlZ3PX/KX+yNaPlu7EpsA2Qnt2OvqLVuDI9SvzgPPUSlnvhLG+xNhBGtxz7pkPGPeUa
         3a0pSpQMN29kg9EC5xlqCRHUEfQDoKPqr/jO9fx32grocd96FUrkxK8uC4TgfBC6OzDW
         zqqLsjREDTmDarOacqcIC7zv20KJnthpY2cigoRt0F5JCWdvVwX/yEVeGJhejQp91H0d
         SLYD+HDYBJ1b1zk42M0xP6f6DrJ2dQuWRtHQBfsOxS8sgYZuzmq9P3T9+ws/XSkwbwQo
         SgdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV71j9t1NkNjWfgUbpyITazNiN84/84V7KDhsmHZDgHyAAcgp822XjemXuNsvD8pZM5KmZoxBxRFvEH55vO1GjzIZbLs8WWNNWvULsuslWG4hK
X-Gm-Message-State: AOJu0YwZr0CWqXcF/6xMW1bNEcNy2Ka6gbparsJlyxtgagLREy0zEaND
	GMd2IJ8hhdaFZ2Vkw8pMSNSIdlSWuWV4jnDBxe2nLQSoIupX+KewhNfkvu1b8w==
X-Google-Smtp-Source: AGHT+IEivlqEbXkttxrz/Rxzu9Cp9uzqYmDsPqNMDSXXzrPkDIW0pOckbHR0f0HuMPjBNI+AfizI8A==
X-Received: by 2002:a05:6870:6120:b0:261:1fdc:4945 with SMTP id 586e51a60fabf-267d4d94a43mr16322317fac.26.1722397466358;
        Tue, 30 Jul 2024 20:44:26 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1cfb:e012:babc:3f68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead81230bsm9093008b3a.120.2024.07.30.20.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 20:44:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled
Date: Wed, 31 Jul 2024 11:44:08 +0800
Message-ID: <20240731034411.371178-2-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
In-Reply-To: <20240731034411.371178-1-wenst@chromium.org>
References: <20240731034411.371178-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_204427_490344_2E28771F 
X-CRM114-Status: GOOD (  10.76  )
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

USB 3.0 on xhci1 is not used, as the controller shares the same PHY as
pcie1. The latter is enabled to support the M.2 PCIe WLAN card on this
design.

Mark USB 3.0 as disabled on this controller using the
"mediatek,u3p-dis-msk" property.

Reported-by: Nícolas F. R. A. Prado <nfraprado@collabora.com> #KernelCI
Closes: https://lore.kernel.org/all/9fce9838-ef87-4d1b-b3df-63e1ddb0ec51@notapiano/
Fixes: b6267a396e1c ("arm64: dts: mediatek: cherry: Enable T-PHYs and USB XHCI controllers")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index fe5400e17b0f..d3a52acbe48a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1404,6 +1404,7 @@ &xhci1 {
 	rx-fifo-depth = <3072>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&usb_vbus>;
+	mediatek,u3p-dis-msk = <1>;
 };
 
 &xhci2 {
-- 
2.46.0.rc1.232.g9752f9e123-goog


