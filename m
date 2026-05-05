Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0B5CD3436
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 10:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hukAoBkjzE/JQZiJOlkn+RWEhZuaTeJUsZGO9TflGew=; b=lNqEAda/gdUoAQzuipE2+ya43z
	YMbrzRlwC1hoieFKek1j5lOBx59j6WQpJRKrdA3nXD279vQHlg0Y88jvNFSxK76cMny3utPxH4DrC
	Q7iXd0r/ZFj2crFQr2TpI0J2IPKWYsLptt3jlhzVx/SClLTY7+2fgMsUO+tPxzdEIRzQZ3f7fWEWn
	AACiDDlZap+mk6sm+FDO4IobZEGELn9uoj7ZKzpFO6fkIG6IS8J9ptppr5b93/6nevcNhLFvZ4Brn
	KDUB2/uprHeePV+nrRncHo4LqV2CLS5grmKocFyQ1bF31ZvKDupyxPmRdS3ZF8wBPkXWJASwyQKwq
	DANnwvbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCny-0000000FraD-242P;
	Tue, 05 May 2026 10:15:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnw-0000000FrUw-1Hzw
	for linux-mediatek@bombadil.infradead.org;
	Tue, 05 May 2026 10:15:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hukAoBkjzE/JQZiJOlkn+RWEhZuaTeJUsZGO9TflGew=; b=MYOnmbRAX/KbGTSF48O66TqADR
	lm/38RKDKRz5zVsOuN5xNRtUAgn1Tfrf88BVxvXAm0t9UZeqz2KN5BOKopSck0viirt78KAeZQm8O
	OLodYRpk6YUvB9wP9mVOqkF4PmMbG3KykbLtLTmJnDgvHBuQZjMuQpuEAyruDFh1kuGQPU4iQY3jv
	+Rry67K+3Pa1WT9nE/65ZamzSU8xInljj/fYL4fm1mMX//zDdXIUyUXhrD3UHfeGvtgNttBi8AHE7
	XZla6IjU/NrhL9pTOdm9uKUoXzTJuLbJFY3+m++rbxH8CqofNXoE5zcnEx1N+p3C7DjA4BUCte79n
	DXCdEwLA==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCns-0000000D9gl-3EPC
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 10:15:03 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-82418b0178cso2411968b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 03:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976099; x=1778580899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hukAoBkjzE/JQZiJOlkn+RWEhZuaTeJUsZGO9TflGew=;
        b=BRbqDJRpY6tgNRPAZjRPYPiPUQjQqS1sEIKDdxRi0486OOpIfzMBiHy/fOjfEtUs1C
         ivhszcJS8zqcxZrLnOOn5itSVCrv6FGyqjIsSNOAuuCeIzfSNTY65M6kdrJrQyROVqfj
         TkNgb5pNfXP8IQN1ZmPvkz3D/S2pdLS1Ht2aM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976099; x=1778580899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hukAoBkjzE/JQZiJOlkn+RWEhZuaTeJUsZGO9TflGew=;
        b=WsIuJPAAT8AKhsviKeWcrunJJbMZXNVaKgqoGiC+3akR/bGtA+eMaTDWrfcFudU+hf
         5X+dlVarKNN+20Pab5vydmfDmCU5YKPNNa6Wxu70850qH45U/mPn4LJHDykKqWnJdtm7
         1nQ9pgKoG68oicCQxH9keeo/ZYqtJuit7VAlFE/HJ7nfo/oj6hlGPAp7cUgFixiTEN0y
         7OfiLY8yMZA9LbBO4n+B/gs7WeOJNRJQFmaahOXqCPfWL+1FAyTtTc9U2mCXH5FKqnOi
         fMcPcVWtwcQTPUkfwvtqxOK4pEuxxTmKW2gUKqQk4l/QSHvLOpraLLCSsTWF22J9HKx3
         Gh0g==
X-Forwarded-Encrypted: i=1; AFNElJ95PQ0PCOF3ZTU3nJA0ayuuKoFOHeOq+Fr5FZ4VvZhoX4UQaHJHFsgqHiCYVc7XzXKY/DKlv2sUmw8pnbgdZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCImwN5YTufZKIvgxW3YSTa/oFyFUnAZEDSVLWRpDE5KNBprM8
	qLgCV/jxTXWR3AbKquv7KDZCjJnfxq/ijfBQ2fFRgX16qe0/r+eBaMtz4zoQAOXrvg==
X-Gm-Gg: AeBDievmBV7447ZmdF/T0R6H5XOI9iaSu2p1G4pmArgUdNC/lynW2jFdqdUQEOkcmiK
	8xGE7yIX6H9A69dOBM6pYTPzMNKm2G4Mkar8zkVHTfSlrvImfC4vLHb6nTahaNj4yUruRYi9/L6
	7bnUw9t9MkC6/S4D+2p1d8hCzm85/4I5RJeg9wZAZC5oZiYN34IJR4EjS70oD1wIhXpu9o+fCK9
	g+RKWzK1T6ORn7YDXp0T3tQZo6/s36n10c/LRORaMkPNPU64qcByF7fiCLoAFi8/PAq6ttKoZ8O
	psSMFVXq416l2VuLz6Y3NowKFs7QSPGdBjONqQaiddAhD02yKgKfu5El2uGiwpgc2Sblv8iyEo/
	nie/Gcqef2S/9eQ3nzJwwa2CasjUOJ3Rv+6Q1UMQo4EsWnXO//PmbrIDFKd/VCFUkp3M0mUtknD
	yyBWb1hmg6s8ZHpRIf8CZ3EONr0I+2k0BKpICGO4crlzlWKt05zMhVGxdlWeZAE6yhfMGzsuobm
	uxLzSWi+Hebf4eax4ej4HXlCc0+CQ==
X-Received: by 2002:a05:6a00:188e:b0:838:127d:a168 with SMTP id d2e1a72fcca58-838127da456mr6444355b3a.17.1777976098759;
        Tue, 05 May 2026 03:14:58 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:57 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/16] arm64: dts: mediatek: mt8195-cherry: Add vusb33 supplies for XHCI controllers
Date: Tue,  5 May 2026 18:14:04 +0800
Message-ID: <20260505101408.1796563-15-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111500_866008_5BE5E726 
X-CRM114-Status: GOOD (  11.82  )
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

Like the dual-role SSUSB controller block that encompasses the XHCI
controller, the latter also takes a vusb33 supply.

Add the supply for each XHCI controller. Also fix up any property
ordering according to DT styles, i.e. move "status" property to the
end.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- New patch
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 62e2d7616f20..ca2bb367ee68 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1622,21 +1622,23 @@ vdosys1_ep_ext: endpoint@1 {
 };
 
 &xhci0 {
-	status = "okay";
-
 	rx-fifo-depth = <3072>;
 	vbus-supply = <&usb_vbus>;
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	status = "okay";
 };
 
 &xhci2 {
-	status = "okay";
 	vbus-supply = <&usb_vbus>;
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	status = "okay";
 };
 
 &xhci3 {
 	/* MT7921's USB Bluetooth has issues with USB2 LPM */
 	usb2-lpm-disable;
 	vbus-supply = <&pp3300_wlan>;
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	status = "okay";
 };
 
-- 
2.54.0.545.g6539524ca2-goog


