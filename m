Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EBDCF2588
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Nov 2025 07:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cHO3B1sEJLSasU2B2qHUUhTLyILqynKrs3iWjmaWkgc=; b=dzGMvBNTn/kfhynzWQcjYH8YiI
	9pmvnLSu8ArOvOM8BlWwSuuCPNPlGbS/lf6J0VHFn4ho+2+z6ZGkAEY3mZK3NXm4ifdwcT2TfOnuS
	JFbOrcUTbLGJZP29FDD2JW+e0H3AMzal84DnkG53TK4e9zXxbhM+e/nuPU8cU6ZYzz1y76q0+KaY1
	Kkj5CAgODRATJw/J3kJrdRQbPSmja7wBma86p2NKGNoCtxtx/pcMshHgzrY2sd7BlgU5DzPJU4qj4
	zNS5T7LcoaYHGB0hAIEWUNcfOxCnX9242Q8qvBQfu3JZrLw3x2kh+rIVuBHy4FsPnq5eA9kD2fgsK
	BrKTx/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcDK-00000002fLT-2Qzk;
	Wed, 19 Nov 2025 07:02:50 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcDH-00000002fKZ-3l7I
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Nov 2025 07:02:49 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-29845b06dd2so73315095ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Nov 2025 23:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763535767; x=1764140567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cHO3B1sEJLSasU2B2qHUUhTLyILqynKrs3iWjmaWkgc=;
        b=O7TVq9FXJZssls5NfBfRrdN8rY1zI7u0Ny2AFT5Zsm/qXfQZx/ZWYgPxMiwYFgiPwD
         61GHNifnOardPuEQLilcZv0x89KevULfUnhXv0GIU+RAzaVuFeGGL3GcNeb9XgLrAsr4
         TIlBATmHQU7nb0/1RzBCozd8IzlNKOIRCMKlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763535767; x=1764140567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHO3B1sEJLSasU2B2qHUUhTLyILqynKrs3iWjmaWkgc=;
        b=o0hMrP/Par/fD6I6LpdXlTIhF1TbXXqoF/HRupLDyzFrrVBkb7vEVhCOlGdCooKC/h
         i1byidLeLPdZIoskREetK/K1aZ+/PvqIfdZdzvwbF2YnuiL7wWp+OWxtApgyZE8pafVH
         6VDlr3QB/7/xMayeGNCFRpbKIMhg0DOnhxtuLKLCaYXFrMJXra/GsrIFIFTbXVPaHwbD
         gZktvPoVBWehWPZzIyGoZpAP1VvHMehpHmRJrIJyBsJMzZsztw5gKG+LE1Cc1zXvtWxA
         Ux6u29Okka28NZsEMAuusn4sBXLMaQw/aDLZ5/Y16MfWmz8Z2AEliGY1RN8G1B5g15EK
         TICg==
X-Forwarded-Encrypted: i=1; AJvYcCVxAEfQc/spOiX/nyfNqHQ9u8Vz50s/l2g4F6GmTIbV0Jw0AFQNx6ZXbC8qlOzvsEncC99H4HO7yF+Uz+3eJA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6W3ZZWfno++GPv5nraS2k/r7LoOQxhn8SxnVE6ClrHYnfqG/v
	C+k403zF2RpM3L3ZWqMcpTVr7yoI3IVMKUyBIvWWsqsMitTGJ/qTt3jVRbgOsFr6OJURUi9BlFU
	KDbw=
X-Gm-Gg: ASbGncvFt4HlbMzHk5Ew17EysY0h688wWHElrNqD4MoYpdY+YB90PohF/l1IFwUqX7a
	p93oqe8kvuNZvhZkpAqe7obQss4yF3Qo14IQnRsrS230+1FPo0DXZ2uoO+DDqgEQ5LC9NoG9UXC
	C5DQzFR0mvZM0pz6tWTDGt2ZjqkiUMRY45UYlugkp9Es9z9ueE8ceEWG+Wd7pA1m3DmU9BmQg7P
	aTh8Gh2kEaKIvRdYKAL2/Zn3f0AnrvWI9wF/voAboRVMnqmQfdH3sMRyu++YzZHwnh/4wTcase7
	FEcBet6/Vb0NyVVrOiVIfE8FEXwZ7Zkocwu2OziKmq3/L2UyhHJc8ynd5mCyBarJrieXpAy11ex
	CAAewZZvJ4xCJCzUFUAoXCbfrluu1cc+nj385ihM1VpX6+mZriyydjgelUm1TlNOqlrHNh12/G5
	ZAmbnVd7abVXXqNx4ZS53FRRPEGG92VtutkXDzxBzD5p1xsrTLsCwRa9c7IBirItSPgTG9
X-Google-Smtp-Source: AGHT+IEHSsONT3fw6JCDF1q8w06ko0cndsjR25Hy6eqz8yH+NAuJ24UBek6Rk04rDVhhz02rEcFHkw==
X-Received: by 2002:a17:903:3503:b0:295:54cb:16ac with SMTP id d9443c01a7336-2986a6be3dbmr253974785ad.18.1763535767083;
        Tue, 18 Nov 2025 23:02:47 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:d42c:6a2b:5251:a121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345bc250312sm1529456a91.12.2025.11.18.23.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:02:43 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8188-geralt: drop firmware-name from first SCP core
Date: Wed, 19 Nov 2025 15:02:29 +0800
Message-ID: <20251119070230.1716418-1-wenst@chromium.org>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_230248_224065_8376B481 
X-CRM114-Status: GOOD (  10.29  )
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

Arnd pointed out that having firmware-name in the device tree is wrong.
Drop it.

Fixes: e36be19823f0 ("arm64: dts: mediatek: mt8188-geralt: Enable first SCP core")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 7fedbacdac44..8e423504ec05 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -1166,7 +1166,6 @@ &scp_cluster {
 &scp_c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&scp_pins>;
-	firmware-name = "mediatek/mt8188/scp.img";
 	memory-region = <&scp_mem_reserved>;
 	status = "okay";
 };
-- 
2.52.0.rc1.455.g30608eb744-goog


