Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9881C4706C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 09:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lC5jqijMwiEU0l3FsEaIRMCUoa7GqMvooRuraRmo8Ic=; b=ljDsdXU3RoCRLJGWC6QHwb13n4
	RsurZkD4Jo3py92oaEO11yRX65Cb1tf2EWTz/dHAce7Y3fj5PQhfotphQB5K5LSiFS3wBMWWyh1eI
	4UAWDSLljJAXAOxCLKHHKyLRpyNlvLYPf+WgtpmPjEVFAjsAFSkR/tyN8lAwaTdamQlP7lFISQId+
	L93ARMZxadwSQGwFRQpXAvokTCwrQNb8/MDdqymwqGQculb4xwE9q6yS18cf5IL94STSwbq46HG6c
	meY6UOHnC4LMyz22cUqmm83xMG+L29g4qP1ScJD56G28BxyJjfOtW/Qfksw97dUFnAVaDEkxLj+Oc
	kTwDAHfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE8S-002NuH-15;
	Fri, 12 Jan 2024 09:47:32 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE7r-002NFO-0M;
	Fri, 12 Jan 2024 09:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705052813;
	bh=tsohDLdjrCpy/Zam0gWBw3px6fB53qKguAcxzszbx7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B5lKJPcBBWHx15S4tRJBrMmNXjZCtc1OdrRodFbI1YI5TvfErCAm/YYm2hWV5uULg
	 Xe47kU69iOPLQBD5Nz5K5PfRixeskqlFRYaoZ7PsQM92m0X873zUH57HaPIo53L99g
	 TGSUktlQUsFPrSLkebQhxI294bF67QIj5tEQs39R01gT5a3AHJSPl8DVNY3ZVcexli
	 BW5LK7/HWYbmK40Qa5ujbUs4Vunhi+GQuujaAEvZezJFd6XJBLgBN9K2S34DGskcNJ
	 Dt9kb/s/SrFN1AaYp5J5HZ8tEGDOV8JZWZA6XnZRZvX5/nt7wnL3K+Y8r4DJ9Zbfdo
	 cIbnwrq3J4mYw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 16570378203A;
	Fri, 12 Jan 2024 09:46:53 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	macpaul.lin@mediatek.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 15/15] arm64: dts: mediatek: radxa-nio-12l: Enable Panfrost for Mali GPU
Date: Fri, 12 Jan 2024 10:46:32 +0100
Message-ID: <20240112094632.66310-16-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
References: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_014655_275778_035F569C 
X-CRM114-Status: UNSURE (   9.26  )
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

Enable the GPU node and add the required power supply to get GPU
support through Panfrost.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index b0d66fa139b5..1e97d2bf7b8b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -153,6 +153,11 @@ rgmii_phy: ethernet-phy@1 {
 	};
 };
 
+&gpu {
+	mali-supply = <&mt6315_7_vbuck1>;
+	status = "okay";
+};
+
 &i2c2 {
 	clock-frequency = <400000>;
 	pinctrl-0 = <&i2c2_pins>;
-- 
2.43.0


