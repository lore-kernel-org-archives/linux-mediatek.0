Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07E4C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 05:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g6SYWLAw20sp/UJhhwlBLmg3PHNTsYsva3o1rpUqaQs=; b=LnNWmnqvXpW0Q1
	/DfUqnN2PVIqQAj70fssHHMxq6Am2UZGhVoxKaLeIw20jbqF3PWuyi/yqPEXtJ7d01aYczRtB9OVY
	TOPaUj7ynVllDjw/qelP7UaoQW5yAbvHoGxeI3jqUw/Z7glmj759Fn9SnI7ubND8OVhnoSrY41mzi
	hwjjR/bpVbidZ5mE6sgIt2DxEuiUGzjhGsfFii6oU4pjvcuqjaBbzv/p+Q0dL2W7aEEkvo98WsOUT
	4eMNHJ8J3Q2EE47djufU4vBRm9xM3al1dhy4JI1DKM3USuI7wHoYmxRFW9Enh7eL8QTB8pp9uZ4gT
	GwUyWJ+x1g4Oua+XssbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noIIo-00HaH7-SM; Tue, 10 May 2022 05:20:54 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noIIe-00HaEr-9M
 for linux-mediatek@lists.infradead.org; Tue, 10 May 2022 05:20:45 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 j10-20020a17090a94ca00b001dd2131159aso1151804pjw.0
 for <linux-mediatek@lists.infradead.org>; Mon, 09 May 2022 22:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yiAVlYJ6ztlaDoBnlRQCGr+0qKRwQo5un6vTJF3zwII=;
 b=FwajoCxnVrzvs7zHittmhKbuSW7XGOtckqrhWHEEv6UMPnWBd8LN9/o77ThMfLy4WA
 ynLmWEkXlbZEmCzV0qmPLQZxI2A9oMf0njaIpuQk47v7cAjifFoc0CxmQVsjreMkOUcm
 jQMdHNmpi/JeG7OAMRCHmAxXGRJlq4vLr5OSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yiAVlYJ6ztlaDoBnlRQCGr+0qKRwQo5un6vTJF3zwII=;
 b=1e3IeehsLMlUCnP/ZUWq+GSRD9dX35O1r9MzFTEWsOHO/TEx+vhUMr/hFZfcpoXkGc
 MrC+NcwrGOXyTzof61S9alSGGr/IEZuQ4VQ79W72vbYDzmssVKsd2LKWUFAVr49XR5Ud
 dgFAeF16Wj0QK3nhcYPTy7enN031wBDAaBHzVduIvhvi3tAKehB+DRyoU7sLgj6ERaHL
 9Z3pr3xlOsglOUFPuHtdiP/KCzgzqdvm1MV5ghiTgEJ+btCJs4fRT89hedqCLc1ppGVW
 +egp04tfGGkKf+di81IaqiLuEc23wS645A/XFO6MDq0hafESIt/RsZJsVTQw3+m3ytB6
 KIJQ==
X-Gm-Message-State: AOAM530kCrp/R4M7Sget0Q1ZcXoye+VrA4DYvw+/l+rHuebnqmidhKk7
 Dgbik0w/psV6QTTKOEGSPfZgcw==
X-Google-Smtp-Source: ABdhPJwjxXu3ddCJhjoeoEoaYD7lnb8OWIcUfXchwaz/AQ8XpTwpemaQQMCGOyJ1gvv8Tz/eeC5c3Q==
X-Received: by 2002:a17:90b:33c6:b0:1dc:ba92:41bb with SMTP id
 lk6-20020a17090b33c600b001dcba9241bbmr21041517pjb.26.1652160042077; 
 Mon, 09 May 2022 22:20:42 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:4f4c:708e:ab00:6543])
 by smtp.gmail.com with UTF8SMTPSA id
 bi10-20020a170902bf0a00b0015e8d4eb1fcsm898377plb.70.2022.05.09.22.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 22:20:41 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Eizan Miyamoto <eizan@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mt8173: add aliases for mt8173 mmc device nodes
Date: Tue, 10 May 2022 15:20:30 +1000
Message-Id: <20220510152020.1.I6094f0a935212eabc7d9348d6cb5a2517ccc2514@changeid>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_222044_349662_DA35A679 
X-CRM114-Status: UNSURE (   9.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Doing this makes them get enumerated in a deterministic order so that
the assigned name in /dev that the mmc devices get assigned is
consistent across reboots.

See ead9f7d7ea9 ("arm64: dts: qcom: sc7180: Assign numbers to eMMC and
SD") for similar work.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 6b02cff605fbe..9f3cd54116de9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -55,6 +55,10 @@ aliases {
 		serial1 = &uart1;
 		serial2 = &uart2;
 		serial3 = &uart3;
+		mmc0 = &mmc0;
+		mmc1 = &mmc1;
+		mmc2 = &mmc2;
+		mmc3 = &mmc3;
 	};
 
 	cluster0_opp: opp_table0 {
-- 
2.36.0.512.ge40c2bad7a-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
