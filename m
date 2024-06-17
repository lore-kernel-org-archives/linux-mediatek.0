Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB62C2BA1A
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 09:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NyP9XShbHHAL/4NU3Mfcaign9e+kGEJMKFWD0UA/5Ic=; b=hI670dRpXQbJ59y2pJPo+xJc+p
	q5GUjBUW3rYNQcfZuL/qi8lFSpJ4dEK54X8II1vnUAQN0ZhFXAjqyqQkfPGTqhZtUg62SRbPgTF04
	J5GMzNohVOfPo3cMj180FNZhSQiNs/mT06QphhJrQlh08U4LEdPfMIOHiawM2NuQGQVNMf+m2Qk6h
	eXoGaUNh6kVY+R5W694mMmSXSPNZD7fPRJJCMILSmiwHdhWny50j1gPO5WNyoWQiDHUEr9JuZfjgN
	36Hgn9lJkRzINy3U4D0nvqxBzUrrD8i2vwXF+eP4SWI0+T9trv8iYOTnNwLKBQi7hDCKairjAvAFw
	q/2TI9UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ8wz-0000000A7WZ-2BIE;
	Mon, 17 Jun 2024 09:46:57 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ8wu-0000000A7UJ-2OlF;
	Mon, 17 Jun 2024 09:46:54 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-57c714a1e24so4615930a12.2;
        Mon, 17 Jun 2024 02:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718617609; x=1719222409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NyP9XShbHHAL/4NU3Mfcaign9e+kGEJMKFWD0UA/5Ic=;
        b=gvBnib6vJc1nsLkjAYzqUVlXqKPI/5q7w98RQ8CDusfwIx4G8TcFk3WGrWpIKqe9Hy
         fJIiNMmyBi1gYd8m2ILwY/zwfHMgBy8wMkemmveTSNN7j9L4N5e5z5kAwz6pSLq6ziiG
         KuBRld3K8H2jjQjHCbNrU8VElk2ypywqEZuwDYops9+Dkl6HT3c+S9FKwVlHuFXlACb8
         p6UIGfnSCcIVyq50AVKzq2jSiVaVi68kMEePgeiq7DnYbyzHBJjOFULnEBw8djFqMZrY
         fMB1KPl/VMbz4XnpNzxXEtQl+5YQN4cnRw+vb7QAGJsOlIRpZlKylqiaAgIH+V0caVt0
         +Q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718617609; x=1719222409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NyP9XShbHHAL/4NU3Mfcaign9e+kGEJMKFWD0UA/5Ic=;
        b=PGjvCaHVLKKcecisauc52KIEH+1WGTRSggEs47CqPbe+4Yk2LSrBna3Fk8Q4UuKSGP
         rizWEgakK9FLjMq/jiAwcu2rCbu+u4sj8CeCAyvSrY4IsQRLGk3Gk3jc8lHPKnRljq6o
         XKwWR5YVpYbzQ12FrFnoyczb8KnKpzKX87mJZ0y729sdRneqZ/mKh3vTd0O75NM6gqBf
         Kc72SMmc1PMUB7EKUt82tDZHEn7+0z+T/vyLgBBU3dJ9n8XQiDAWhx1AoTithtXdEv3p
         +HFTxN++d3jgDPRaAhHwUm18TXhCsyzOPp7txO7yTC8hv3vozXZmFRVQQHHFae6gdar1
         XUpg==
X-Forwarded-Encrypted: i=1; AJvYcCWE22wqVxSBZDzpZzR2iCH0hoLgGy1j2n61R0x7fm01C6CHr2QZRNsIgsKfoELo9mYXuYQpo0BYHFFCygOsvQtNYhn0aW/OlbQoputjb7Wkp3V/O8RBLKwxyDLX72RivinjtcPHIBXPklFh0EnAtcwXCeTwCsQVxb0=
X-Gm-Message-State: AOJu0YwteimJveYsncA8pg27aOV6NsyAShRHAqccbeDekai0QhkaV3DM
	RV8T1aRygMhBpko2PG9KAf/UBg5Ebc9FnEflIVIoC+SyAfxkGlBNN0Yctg==
X-Google-Smtp-Source: AGHT+IHuEqticHK3dZxHG99692oY49qS0FvfDLBUXP4QW2Jls7nMHWex5KYvXNwoKK/dpz50MOgzag==
X-Received: by 2002:a50:d596:0:b0:57c:6bd6:d8e2 with SMTP id 4fb4d7f45d1cf-57cbd4f6b9bmr6374154a12.0.1718617608759;
        Mon, 17 Jun 2024 02:46:48 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72da790sm6141318a12.35.2024.06.17.02.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 02:46:48 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: mediatek: mt7623: fix IR nodename
Date: Mon, 17 Jun 2024 11:46:33 +0200
Message-Id: <20240617094634.23173-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_024652_634944_AB2FA4DB 
X-CRM114-Status: GOOD (  12.01  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Fix following validation error:
arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: cir@10013000: $nodename:0: 'cir@10013000' does not match '^ir(-receiver)?(@[a-f0-9]+)?$'
        from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#

Fixes: 91044f38dae7 ("arm: dts: mt7623: add ir nodes to the mt7623.dtsi file")
Cc: linux-media@vger.kernel.org
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm/boot/dts/mediatek/mt7623.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
index f0b4a09004b3..9c5a52ce9351 100644
--- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
@@ -308,7 +308,7 @@ pwrap: pwrap@1000d000 {
 		clock-names = "spi", "wrap";
 	};
 
-	cir: cir@10013000 {
+	cir: ir-receiver@10013000 {
 		compatible = "mediatek,mt7623-cir";
 		reg = <0 0x10013000 0 0x1000>;
 		interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
-- 
2.35.3


