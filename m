Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E1FC6FA8B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 06:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xnw6MILr6W2VKVd3Jp7ZUysLH8fGhtVKg7zkvqQm4t4=; b=sWGlciJbBYRJGaJgpW2heCzdHj
	5eLcgDw4ao+5k5ATY8cnpX1W9sOyW7qr2czFOYoDPKdsEdM24+KkaS56ZLnGCemcX+BBapJvOkwMJ
	Od6G+2PX3QB/qbE3ncOpo8OPItZtMxzkzD51CsYXWr7FiRBEYR39J339CVjIRN/nhiLTuZkXbYiFt
	+Wwx70giwYpnDfdoHbdWmploIHZFmDR0H+L1olrCRyO8Pl8GVE3XdxxqDNpbworhQHg7zWH2+PZdW
	2dT2o93+vU2ArAb3rYqxfZtPt9QttknJyLFbqsBP6nNYXmjfigXmpvCAoaBLqBPnG3GRawzL9Ksij
	h98NBLpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obFkF-00DZLr-Bl; Thu, 22 Sep 2022 06:31:35 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obFk3-00DZH7-D6
	for linux-mediatek@lists.infradead.org; Thu, 22 Sep 2022 06:31:25 +0000
Received: by mail-pj1-x102f.google.com with SMTP id s14-20020a17090a6e4e00b0020057c70943so1207406pjm.1
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Sep 2022 23:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Xnw6MILr6W2VKVd3Jp7ZUysLH8fGhtVKg7zkvqQm4t4=;
        b=WGommxrifMvA/kM4kjqq6uPUQrY6GFkb6wIEGC+PLhIt3eCgBm5hjCKk0059s4Z2sK
         D5Pl1EPJAmS0ifrGpeh3PosyuZzvKuAQE415eZn+umOhMirZKr93F1ZIafVVykH3Xx/f
         4kj0tSeuOlcWpA0qaOxZPYr6eEjdWfMZMkcSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Xnw6MILr6W2VKVd3Jp7ZUysLH8fGhtVKg7zkvqQm4t4=;
        b=caaIelH0zZqjjFxzuEof0AfxU1JxH75feSc1JU0iwdqt3gVSyyv5HXB5nFeNy/xDyb
         1IbxVSbR+4kr5fLI0OC0Nj3f+wwxON9tzi78rhLTbtSn79FDU4vlt+egPWSea/heYL8V
         pa8FIffL0gcXCeKAXSIEHniEilHeRiurCmUNFQ+VOSpvJgiiVBl7ophbik6XJ+ApBldh
         u1VOcpiXFwjfqXlejVzAuI9PVYGEdbYyKmk9AlFWuxKyGU98dY23iLdVnC7lDZrTjdZ+
         +fiC0/eDqBgB5sseALBn/ErWWKu/RY1mTx0KQjjWtz5bv8P5R4yO0OLsxZneqIOitkad
         2TVQ==
X-Gm-Message-State: ACrzQf1XAcaBDX7sAng+MwC8du342y1q4N8dWTgjHEpEZwCC+GhFBc45
	6QKVT9yk9Asjvmm8guIPMvtJDw==
X-Google-Smtp-Source: AMsMyM4Qwx0beP5McoZOdw/lv4HBb6VkvZcrV3PoFo1r+Q3teNXlkgvMfkc+UHseZsEevOssz7sjHg==
X-Received: by 2002:a17:902:850a:b0:178:b276:aab8 with SMTP id bj10-20020a170902850a00b00178b276aab8mr1794489plb.15.1663828281538;
        Wed, 21 Sep 2022 23:31:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:766b:ba78:a17b:7060])
        by smtp.gmail.com with ESMTPSA id l5-20020a17090a660500b002005114fbf5sm2937326pjj.22.2022.09.21.23.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 23:31:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8192: Mark scp_adsp clock as broken
Date: Thu, 22 Sep 2022 14:31:11 +0800
Message-Id: <20220922063111.1672515-1-wenst@chromium.org>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_233123_447085_4803B216 
X-CRM114-Status: GOOD (  10.71  )
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

The scp_adsp clock controller is under the SCP_ADSP power domain. This
power domain is currently not supported nor defined.

Mark the clock controller as broken for now, to avoid the system from
trying to access it, and causing the CPU or bus to stall.

Fixes: 5d2b897bc6f5 ("arm64: dts: mediatek: Add mt8192 clock controllers")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 6b20376191a7..ef91941848ae 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -575,6 +575,8 @@ scp_adsp: clock-controller@10720000 {
 			compatible = "mediatek,mt8192-scp_adsp";
 			reg = <0 0x10720000 0 0x1000>;
 			#clock-cells = <1>;
+			/* power domain dependency not upstreamed */
+			status = "broken";
 		};
 
 		uart0: serial@11002000 {
-- 
2.37.3.968.ga6b4b080e4-goog


