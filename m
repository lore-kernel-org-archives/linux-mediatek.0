Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5A4606A32D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 04:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yI5vZTS6;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MVscMG3x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zgiOgJde8AO2Ant4XAq57iC2YxxS16EtAa2Unl+I3/g=; b=yI5vZTS6VpJSTU
	PIGNodRe319j01QcNY5vVxOuEB/vDkp+92cx26PxaHzchmc36YVjqjzh9oSbsKOCNHME25Zpko3ns
	qYzOUFJYPHekYSF+RrW8OEnaQOd4WjCGOTVc0S3ry8S+inF158zJyCEmAsY0dqVzj8MR6PXP5zJCb
	Fwxu5amk6CNfVZfFiBHzk7+HiLzz57F7mMKW+GPduZCdrUmGdOGsIq+QIu+tMZT1Lo81lTUE+Yyxz
	FDGv8IyioYoffra86Rm4YERAzawccsuAiC5MSo7q1yqyzjXkit4Ff3kwT+nejwjY4uDGIxOZW7ZTi
	gjheIWjF1c2Gj0HsLpmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Hr-00000001436-0lGR;
	Tue, 03 Nov 2026 04:38:19 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Hn-000000013xU-0u01
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 04:38:17 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so2716986a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 20:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680694; x=1794285494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgiOgJde8AO2Ant4XAq57iC2YxxS16EtAa2Unl+I3/g=;
        b=MVscMG3xT9WJE/zw6KSMa0hq5lt5xNUhjF2yaM/l4YUqFWDsmUCurBbnAQ/p2dYYBO
         St76AFStE8CRxH0uZ94nQ4FI0bLph24I48pBudPxx3CL5O7HysN3+d+Wu1VlMYcGoY/9
         xd3wU9PG9FWr+JP9FkJOebvqcVirVsnRLbjTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680694; x=1794285494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgiOgJde8AO2Ant4XAq57iC2YxxS16EtAa2Unl+I3/g=;
        b=vSqoA+ONj9qJUmL7+OIQi/gLf603PLC1AO0QKDKmA3+4bkE6uZgtPX7nI6RRZGfJLZ
         Y2TgirOxURBzdd/Oj9yWC5T7gQJYaMyqGG7BHvn9ITnOiiImKCAUzG8+8HTGlfQKYztC
         P+5JE3eoLRdGIrOU+ndZBa4Hhfrb0gP/+QeKwjt/Jncx2I6bknoQopjdRIVPhtpodJZs
         1CahjorI4IMu0NBAoOq/ON5ygEvRBjKzs4CEzFccqZznb1348bDdo9JyA6GUQMgCgQAt
         mcdbJiE4WtY2sYovAeQJ+s2OiD6SY0qFis7AWCEUAbYzejHFzvDvxm0gjiFiPv5m+YLS
         R0eA==
X-Forwarded-Encrypted: i=1; AKwUvBzYcGm3uCIG+3zrLXJ6+WeRcVUG5MVUkmzupUNCeNZddDIw+Ec8Hl2Se4DAs9vadpUKkZTLWinJDfBlPszqCg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9YN4x//yiKQhnP6OXXJJz2LMtmHmNabNlWbLWM0XpRbtvPO2Px
	UQg9JlXMp81LBMihWZf5ulNGqGUIVE4iIzSh9z+1IrGOaLiwR2ket63evW2mVkIT8Q==
X-Gm-Gg: AYBFou1hdmHsTqkamrl22plJXsvuwr4z+q3kCQDtal1OCGAsjPsjHCkgxmPE+RoLxuP
	Pgl/svvyqFgRck+kGViK+GBcbQEggcqqGces5k6bzPAK670Rk+7XyfQC0UWGq8vn1P39xRnupIQ
	6z6edpxrJ6rcdD+hLCg2dWsnc3AAvpd/JHiE1e318TBGir+uvvppMmAb7zgkRcH5bKGzSORWnlK
	LkCDu+It8Qww33R1XT6FrwUP77oTD93MvBN9pHdROdMvl7eEbJnt81WqlMc1+8BBSXt4He0OHnK
	tN/ubD3J4KH7GyPmeDUpMTw+pXnL1M/3nVsz196wAzJ3/7kAWUcb8rNKJOQv6XquWdnhF4DVsdG
	RpNBXUr+Vcw2qjaSpIR/Ib3lf++s8OOp/o0f5HWRBWUtOL2rJl1T734Gok4HKu2yjTY+TrMnPxf
	QMC/dJ6nDa98kRJE62p32/sNyFupCJQ/YSeXbAJxQjGvfYxLWB1duuFmde5YCfYjwuMZ+9eG+jb
	qIWfXrzOMD3rZF2hHP3+BNOLSZCpTp4Mqx4b6J0EHOTj6JN7lNsgLZg/yLRoBZuGC1q3HPOaloe
	sQzVNdlcyREpfO14ZzhVZbpq9pvxa4/Rf08T2x5O8LY4R0Thu7WQVOQtWrgEbCmU+0HTdgCS/Ae
	Cl6lldh4BanDf
X-Received: by 2002:a17:90b:4b10:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3ae89724b06mr9920661a91.10.1793680694591;
        Mon, 02 Nov 2026 20:38:14 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:14 -0800 (PST)
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
Subject: [PATCH v7 7/8] arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as always-on
Date: Tue,  3 Nov 2026 12:37:31 +0800
Message-ID: <20261103043734.2179858-8-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_203816_386964_561AEE3B 
X-CRM114-Status: GOOD (  16.72  )
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

Up until now, the MT8173 elm/hana device tree has set the dedicated
regulator supplying the trackpad as always-on, simply because the Elan
driver was missing proper delays. As a result the delay for the
Synaptics trackpad was also omitted, as it was not strictly required
under such a model and delayed the availability of the trackpad to the
user.

The Elan driver recently gained proper delays after power up, with
opportunistic skipping of the delay when the regulator was originally
on. The I2C HID driver gained similar opportunistic delay skipping.
So has the I2C OF component prober library.

Now fix the device tree to have the regulator not be always on, and
let the I2C HID device have the correct post-power-on delay time.

Cc: <stable+noautosel@kernel.org> # needs matching driver changes
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Added noautosel tag
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 8 +-------
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi      | 1 -
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index 1004eb8ea52c..b9e311fcd9a0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -62,13 +62,7 @@ trackpad2: trackpad@2c {
 		pinctrl-0 = <&trackpad_irq>;
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
-		/*
-		 * The trackpad needs a post-power-on delay of 100ms,
-		 * but at time of writing, the power supply for it on
-		 * this board is always on. The delay is therefore not
-		 * added to avoid impacting the readiness of the
-		 * trackpad.
-		 */
+		post-power-on-delay-ms = <100>;
 		vdd-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
 		status = "fail-needs-probe";
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 777da2129e77..2c6ec714e117 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1098,7 +1098,6 @@ mt6397_vgp6_reg: ldo_vgp6 {
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-enable-ramp-delay = <218>;
-				regulator-always-on;
 			};
 
 			mt6397_vibr_reg: ldo_vibr {
-- 
2.56.0.385.gac671c819a-goog


