Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A9DCD4851
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2026 08:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hRuibsHH1d7GyXfjAXknzKcztEOx8udVevL3jmrUcbo=; b=j2AXKQR3hNob7Tt8X2SkM8FrNL
	MnBqxDZDb/rLpZnQZhWwafKy566xZ+krfyxZZwdAwpW26Asb6VaqdTIIjn+yULHFpd3Y4B9BqvCTr
	w9xthQB7xykEqQSMGC+O0AS/HB+cgKYPW7RDdWuFVbGX3QDIXiJ8kYQlAPLWNgIZLWA7IwQWhbHnc
	FeM37gz4CempLCa1rwMqi/03q6/GYH8Nkd8K8EP8q2x5BCoJtMDYmhaut7lmAaLA0AIQSOIdnLQLK
	EeIRY1TKXXQuopASSMLynru+Urm+Ha7AWsr679pUf9NLEU5ax3458Pq6eUDuasYyreOn6fra+N0n1
	CxweyLmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFzU-00000000hoE-3Y1i;
	Tue, 19 May 2026 08:39:52 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFzS-00000000hnN-0oO8
	for linux-mediatek@lists.infradead.org;
	Tue, 19 May 2026 08:39:51 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-45562c41ec7so1916273f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 19 May 2026 01:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779179988; x=1779784788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hRuibsHH1d7GyXfjAXknzKcztEOx8udVevL3jmrUcbo=;
        b=sOzy1twY29U9JPZBc0Btxr40WUcgohTmbVixFsZtf9EMQeaohYhrd/1ejNH3vroLjL
         J8rjEWc2XnuXE/+Y8PusQZdo+Bnm/2BHNx53+qknR8H7otTOFMu3gem+Wt9+fNoEsJMP
         3jowhYWDf4QvO3hQFEjJMpq//4cc2mEHVgcPvXPYK+4NqTmvBL7VZxHIUyMxNAUcmC1O
         9neCQedYQ5ZY376pTeoK/hNZjLoDLo5QtrDcq+SXJpDU7IYzOs4AGdSrzKqmoFDoBxiz
         c1C+pFCEPNM+tKBRcISZgGHklhFTo8q9280yiJS/amRVxM8tScG1xqurHdK05mgYFsOH
         xGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779179988; x=1779784788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRuibsHH1d7GyXfjAXknzKcztEOx8udVevL3jmrUcbo=;
        b=VBhO7xBU986wyVqxz+AMPFyP4j6Qdcy/CCP9u6TtwGUar3OsoJlj8+AUa8YyNWPSvw
         vESEBfOynsM5mvG7ftzMpsnUmIlW/RNfGZNPazdPqLymQYVWnUJ0UTHc4HzulHXrAqFS
         Ss4A7WTDGUINXZXa60UTDmw1BPSSr8TKgoR3JDIld+yCcpghHaL3bzqZjlq8TcNPsD8r
         cMBv60bcKwWxwfgLkx2ijOFf01ueetP15dVVUGr4cHYgBKojElBxQ7LopzxlA5VmjEPN
         DzcvV81F41GagleMRhwf+Z5Eku5opuCc3vBH323kSR7aY86MZQtDx0rbJDeR5XHG7wrW
         Gi7A==
X-Gm-Message-State: AOJu0YxqCwApmbGfblVJAracqnLYCZMLR11iy7If57Rdpu0qh6qkZHh0
	N5UlRM9RFlKWanRuxllA2EFZuJqp445JKCSILXBiNn+DVa6wzNO2qqFX5vzlZtNc
X-Gm-Gg: Acq92OEUEifPPQVbjpQ+tL54xJPG5CgQqnMM+EXHkuqzHwTLVe8ZYd6q3dFZ0KfUvff
	qI9fLgWievbmO7kxsFabg2Qh/wliXQROZ1lpUXKqBnwdOhyD+C9irq5sCGOMkyXA1AGEu+U01h9
	gD/Fwzcpr613luVuY6gPVaoZqXrhpIKRmXXF1656m2iGBXQyzPtty8SO6AZ4TxCKdyFWsEJ5Rd5
	CF/USEFMC3OgcMLq64Sz/Zd/kni5kM9HNzJUQrnJb+7X9fOVbMAoYa8uyOxXkx5qY4YD82sR5ks
	MPlMNrwFUgJcPvG32KzIxJZN32yq+CNTptRdCwgD4WCv0T8SNzpDrakYfBGjpmWPK2NEsYADZxv
	66xcCVP34BZopxfTmhZdHZpHLBWvKPLDcN4v+50+Pw74qtcANtdc9382FjlqQO5ycG1F6V+dyw+
	YG6mjYVQRjnkuRjxJNde0=
X-Received: by 2002:a05:6000:400f:b0:448:8db5:410b with SMTP id ffacd0b85a97d-45e5c5e3064mr30844672f8f.20.1779179987735;
        Tue, 19 May 2026 01:39:47 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767d0bsm42061177f8f.3.2026.05.19.01.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:39:47 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt8516: remove cpu3 armpll clock-name
Date: Tue, 19 May 2026 09:39:05 +0100
Message-ID: <20260519083921.5023-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_013950_228383_64EEA4B5 
X-CRM114-Status: GOOD (  12.20  )
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

The armpll clock in cpu3 clock-names property comes from MediaTek sources,
but it's unused in the kernel and not populated in the clocks property.
Let's remove it and align the node with other cpu nodes of the same SoC.

Fixes: 5236347bde42 ("arm64: dts: mediatek: add dtsi for MT8516")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index 42712ac2b88d..21882ac4fadb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -99,7 +99,7 @@ cpu3: cpu@3 {
 				<&CPU_SLEEP_0_0 &CPU_SLEEP_0_0 &CPU_SLEEP_0_0>;
 			clocks = <&infracfg CLK_IFR_MUX1_SEL>,
 				 <&topckgen CLK_TOP_MAINPLL_D2>;
-			clock-names = "cpu", "intermediate", "armpll";
+			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 		};
-- 
2.43.0


