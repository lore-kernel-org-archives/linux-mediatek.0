Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B663C54EFC
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2026 09:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AETGy+ANMs/4mEVJOXJB8nyO+6HDkmoHxo4KA1OMiIw=; b=Q3c2gOtElTPbQdNNoazJUBNe1A
	VzquCKGc4tihB2UZ/gHwsk6fymBr4tfbZcFYiZJHCLepC6b8HHN6LEuZ5ZOU7Xa3JjMF4mw6wN3Ip
	0QQ5C543OlqqOf/jVOMxVC5I59a/dae1jdw8gWSpxgxrHnLj5+yGixaydBVgOQcFzXzBAGbk9MECi
	p48LYwh+flGYBuwvvgOzj4knJzg5vNOU7byMNreIWqkrre9MVBuyEogNmBrEBcYU7VCNdNW8SVj24
	Vo35G55/NjJ4+HzzTV2o1QJxmy/bhAsAstc61OLm8IfTzwCNJvF+Kzyb1u3AsdO9AhJ0xd2ZxgZr6
	HBr72PAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodxe-00000004nIR-1QKm;
	Tue, 28 Jul 2026 09:18:54 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodxP-00000004n6E-3uNT
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Jul 2026 09:18:41 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ced3386430so37277165ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 02:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785230319; x=1785835119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AETGy+ANMs/4mEVJOXJB8nyO+6HDkmoHxo4KA1OMiIw=;
        b=ROKJjCdnI/Eh1Zb8Idm+k0r37vObiY/JlqzhQO6voekpXyaS/Z7fHpUekjit8/JPbm
         pRDPhfRDj9btAzwH1UHKwpOd8ek6UZNx0pPG54IiJz9MPXO5jj/5d2alQmQfOWM5R580
         dAUWVZyWpuKzx1gwcKn1nmd/ZkwAt4WccRyfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230319; x=1785835119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AETGy+ANMs/4mEVJOXJB8nyO+6HDkmoHxo4KA1OMiIw=;
        b=F61dAP5GuJjM8daCw12S6u0bAVX4dhssJK8rI6mmtBZrcd2iLaf+Bd9oJ2pYlfARzL
         8YOwc/JHfMyHjMYtyUYVJvUKQVC4+OBkdSNByDQpCFm6XETyWMDZLObjuKqeBbBCnYj4
         tFJ2ATfg0YyT9W781TxVMiFYRK8oBcsLgYGUkpdWjNJEzfdlthJFzld+72/b3gn7cUvh
         6W745le/UfaMbCvngXWYR1Wog43e9JnpmYUi+0ehiwTn05bCauKJyh+At4uo7W4hsRRy
         qlKkt42UgMh/vcOeqCQSPTSpVibNgHc9rbDwJsImxvIvkS5F3JC8CpyqDrl7MCjCVN6e
         O50Q==
X-Forwarded-Encrypted: i=1; AHgh+RpjrHJ3FQ0hm776keh7xglP74mxgbhxaQMxoVUTg8Dwkgo24XppTY8Zx75KV0YrA/do6b+zP2A5xwTGo4kw7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCrQx7tjOQD9rX0AsXAZAzlvcmTyrMzVD1Uhi9BrQcR8sP9iSB
	KciMRcgGUcqhmn45U4MeVVUUI4ZtaYQEPEMhloqdwppaS+n7wlvVV0lrmomjDRnl6Q==
X-Gm-Gg: AR+sD120seAng+l22u1JvLJ6fr8EVq2SSCHAHzu+hTh7+99kiRIo+rVvMbhl8Go+MkK
	eMp7bHnyAkcQy77rAHaVnubqNcrp2QGyZ3RuYYdf1TIVrmoOdHjKguwFob0T0lbQSk/RwvUblkn
	umKDpxSACCrFN0AzNBUlXxj7srHHEhpH0EE8PqhS+L/6V5z0niYCz98PEiEAd9/0zZFut1I4Dex
	YnSi116dmXq4XA58C8hOFDUdWvLxQmg/Mx1hP/IA8fFagAfff8pH4ztBhoK0xaldWITAZXKj3Vl
	pjsOYwyNjfZvJqFxf5W8vxeZ857WNgIvLs/DFJo8Q5d2jYG/3NRL0q2+GukidZiz8glOIExYSxI
	+efcbBFPGRRsgdZ+x4UC1AxYVTxyuMfLE26Zm/BFFr9VIlvgnD9ulKCL9gS2qaHXJIdKSmkEDAu
	cJX+57injDDJXPhtSykEDWbGqt88Ed7kIAMW7R+EUgAzX2nb0MqNe1qu7tQlYEHIjQtIwelQ==
X-Received: by 2002:a17:903:19f0:b0:2c9:fc14:588f with SMTP id d9443c01a7336-2d015f024b4mr18169045ad.29.1785230319419;
        Tue, 28 Jul 2026 02:18:39 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:c85f:b2bb:a077:d544])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81dcc1sm48616965ad.84.2026.07.28.02.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:18:38 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: [PATCH v4 5/5] arm64: dts: mediatek: mt8173: Add GPU device nodes
Date: Tue, 28 Jul 2026 17:18:03 +0800
Message-ID: <20260728091804.382753-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260728091804.382753-1-wenst@chromium.org>
References: <20260728091804.382753-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_021839_969027_8C1DAF9F 
X-CRM114-Status: GOOD (  13.58  )
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

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is part
of the Series6XT, another variation of the Rogue family of GPUs.

On top of the GPU is a glue layer that handles some clock and power
signals.

Add device nodes for both. While there is supposed to be two different
power domains to the GPU, MediaTek does not have any information on how
this is integrated internally. Assign the same GPU power domain to both.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 556e806b7787..169ba4fd183e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1002,6 +1002,37 @@ u2port1: usb-phy@11291000 {
 			};
 		};
 
+		gpu: gpu@13000000 {
+			compatible = "mediatek,mt8173-gpu", "img,img-gx6250",
+				     "img,img-rogue";
+			reg = <0 0x13000000 0 0x10000>;
+			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&mfgtop CLK_MFG_G3D>,
+				 <&mfgtop CLK_MFG_MEM>,
+				 <&mfgtop CLK_MFG_AXI>;
+			clock-names = "core", "mem", "sys";
+			/*
+			 * Binding and GPU core HW have two power domain
+			 * inputs, but MediaTek does not have information
+			 * on how this is done internally.
+			 */
+			power-domains = <&mfgtop>, <&mfgtop>;
+			power-domain-names = "a", "b";
+		};
+
+		mfgtop: clock-controller@13fff000 {
+			compatible = "mediatek,mt8173-mfgtop";
+			reg = <0 0x13fff000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_MEM_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_MFG_SEL>,
+				 <&clk26m>;
+			clock-names = "sys", "mem", "core", "clk26m";
+			power-domains = <&spm MT8173_POWER_DOMAIN_MFG>;
+			#clock-cells = <1>;
+			#power-domain-cells = <0>;
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8173-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
-- 
2.55.0.229.g6434b31f56-goog


