Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167A3606A324
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 04:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JPxoyi7t;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=H2DtWtEP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wOgLDWMrbGue3Y3ijnkKX9LYoTRtoFaZwaUPNmihNOI=; b=JPxoyi7tpltLSp
	JjJDjT4g9TpjPVQzddvVUqj5viO5yEc0qZzxUTcLxG7WAySKRuXVpNcT/bJzEOPedxpJh6a6++qev
	WPOyd3XFte126rYfM/oAPJTULtSWh4sgwiz58Jg/ZeryW98HzASP+wAlk1YePS1RhCiNhkw2mhd5A
	0WVx5WP+Y2J22HrxmO3plVk/lW408v7vPAAXiSxkb5zmCDQxdt9i1RBl287nfsFXhJv53ITd7aBAN
	KHvHLkjEYQ3Y+/oAI8qZIiYeV+8zpqjFaxWL48+gF39QbC5jziR33g9Gt3/Y0hco0LJJSGIbXCXN6
	nMd/yucqHrChtcIUUGLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Hv-0000000149u-3Kje;
	Tue, 03 Nov 2026 04:38:23 +0000
Received: from mail-pj1-f42.google.com ([209.85.216.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Hs-00000001445-15qZ
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 04:38:22 +0000
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so139381a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 20:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680699; x=1794285499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOgLDWMrbGue3Y3ijnkKX9LYoTRtoFaZwaUPNmihNOI=;
        b=H2DtWtEPwfrM9Nf3YO8ZVME2zLsXwVy47fCDdobuHZNkOi5rINBATEV3K7Z7oEPISk
         L9fA4DKjFxJ5akRZa/g/MLiiLin/T0UQMGaujcaYkpHGqAVcYR0JWgtA6nByEDs5DeVB
         OSdVyPDPqbD1AEBkSRUwoDkQV7l4PYdIpSNEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680699; x=1794285499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wOgLDWMrbGue3Y3ijnkKX9LYoTRtoFaZwaUPNmihNOI=;
        b=CFsCF39YwFnRAFypkMMLUqkNLS0Sx+RUyMR8ieCallxuPlyFUYuJe/Qnu4C5p5iQNI
         kCqJS/8oikjDDne3KVOTCKarKeHoYsorjGFp9InuqwiLaTD3hiif3uLd5Kvy02BSWke0
         nMVlnkymiZcsIrkskUar1FmaLcA/UsCwuzKl8z8IU3Y0ZUG7IUIsx2QxgDzBDVQNqL67
         A7lh9OJ+B9tpIO8Ht+n+x3IIrkgY7N29jtCbiDSYkyI1M4SfUTc2Y1RoczNMb0xYm90u
         rNtS8qfG+OfDkv1CSsIP1JEDxNG2Iiqeij50CH6pGZnKOkQXDlwla7oEVpSviBeO/bH3
         aEkQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+VRP1lt0fjXtEuRX0AeO6vqKRblUApD+BSvDfC5SFkD+R2l28QZ8wiaJH+SxovKV/NiwqjZAq1DL20GE7Lw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+zmaySJ1Rj67k6TfaGTaFp1Pri2rPpTzAnxdzxmn2HH6WbCAt0
	b5AGLP8hhwcB24ubpJAY70sf4c7zrTbVvtJhVvIjcZXGtpHfXhWB73ofJLnnq7LrbA==
X-Gm-Gg: AYBFou0A6Xt8UHdbJ2mTFPOAdecyqatHLT40e5jQyY3inXpbi5k+1Wi9kOWERMk7IHS
	fltWkKbrRmcbsVbvWkYW/27OW/FZnckhBQ+rgN2sGbyA+N4Xnh6HZW5U1+sIKTxFOq+RCgM+fy6
	5eBcElP85e3/Zyn9EdwxhXSGjv+x+nGmXEYiol7rvkDQRL8xnV2SZ6eV/cz9qQrjwCd4jKre32U
	4BavBNO4hv9kO1qBl+vu14ssrVH7i/1aIWlREGzfIK3ba2cDqetGNw89F+6cLU+SNeXa03Xdvmo
	eKDv8hbfemDnIu79USZ3m2ESId3MIJfRUOeJ7Mybw4jQ3cv467luLdEFCmKsyf7Flnb8+9YnPMY
	TMJW+jVWiAld2A/AZDBkFVglLxUV9i/OEywBVNZis+zuiPMPmGmsnhgpMSVP12ydt/qmxwXptKt
	s64HKXuVG12jZaZFKFzB7v50vUyjCqhqDW1L8h8W4F9S7mFRH8GOkIgZRreNFwhptBCyyh58sTD
	XJ9sxnwjXyauosesuhQyb/S80i5g61hwom/rx2Q3yxnEjk4rdj/KMihcQuMa7LPpD38LBI2AIXX
	x6Q1HkZtxQAlQ8Nadrbw+gth25Nmu8tR7SxhVfWMlVGpwJBSGWW25jX7stfVuvFUitYw1GtZyIL
	EoT1RVxu/wG3IqG34dOQu/nXE/ucBW8dtIw==
X-Received: by 2002:a17:90b:280c:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3ae8972a6d2mr6631601a91.18.1793680698982;
        Mon, 02 Nov 2026 20:38:18 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:18 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v7 8/8] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Tue,  3 Nov 2026 12:37:32 +0800
Message-ID: <20261103043734.2179858-9-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_203820_303764_F2859475 
X-CRM114-Status: GOOD (  13.61  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Synaptics trackpad, like the Elan trackpad option, is fed from the
system 3.3V power rail. Add it to the trackpad device node.

Also add the correct post-power-on delay, even though in practice it is
not required. The Synaptics trackpad requires 100ms after power-on (or
deasserting the reset, whichever comes later) to fully initialize. The
power is always on and the reset pin is not routed out, so the
implementation could try skipping the delay.

Cc: <stable+noautosel@kernel.org> # Without driver changes only lengthens probe time
Fixes: 925ebc0cd55c ("arm64: dts: mt8192-asurada-spherion: Add Synaptics trackpad support")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
I think this shouldn't be backported, as backporting it without the
driver enhancements just delays the trackpad probing with no real
gains.
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
index 68caf4c58cfe..8adbfc307fca 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
@@ -94,6 +94,8 @@ trackpad@2c {
 		hid-descr-addr = <0x20>;
 		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
 		wakeup-source;
+		vdd-supply = <&pp3300_u>;
+		post-power-on-delay-ms = <100>;
 		status = "fail-needs-probe";
 	};
 };
-- 
2.56.0.385.gac671c819a-goog


