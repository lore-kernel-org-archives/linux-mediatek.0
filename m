Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7E8FF8861
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2026 03:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6LnJZvLH9bwq8rkIs+Lcwlv8aSN2xQ6iGFhBeGaXxuk=; b=NkTlI+rNzy31pkOsfar41NF3jc
	YQQJkudjFcubtPNtgJ+O8v+Gu9Ppw1/VsD9sfyWcq5Rc+/s1JuabKyUQmIrmXfBmGbYFcYHR1Vq1G
	Cqst5KZoEVLdBB/HVvl+k15cfKO7trFAhefvqVPbUnym9JKngGG1CNjft4yBgAz5Xm6gAR0XNHEEd
	w/BriCSqwFg1ub8tsWLbg4US524V7dyK4bTO1S1j49Q9iZTjdt9n2kds/reiT1JF5TiZciQml80/k
	7mUPwsoEz4h+WCiM6TP4wdu4rp8/O4VylmcwL87PqFHfRJU6on/GFNoDP7MbL6DQ9GS5pZ33sTKng
	U7N4+IXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHCtz-0000000G73v-0BtV;
	Mon, 27 Apr 2026 03:44:55 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHCts-0000000G6zz-2RxK
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Apr 2026 03:44:50 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2b2503753efso101132625ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 26 Apr 2026 20:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777261488; x=1777866288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LnJZvLH9bwq8rkIs+Lcwlv8aSN2xQ6iGFhBeGaXxuk=;
        b=h7bfdYjm8YgkGBWEpVDiEckwYxS90bHhEsuuOHV/I/gERxDazbWDSk/m1eDgRbYb50
         nBV5jfTnmOKHMbPncY82Ws6yF918k+KafmBqIl9TiI9HwShr7sQpD6aGQnH4Kks8juNl
         Qx2RbRQ+tN5hHJWmNaMDhFfYARURA56ZE7riPe5WVcVix1XmC1oCRFin5XuWrN9Q6ohc
         0/65Dwi4eJz6eTtrlkASoVRBzabU1h+Qqoycq3Ql/+JotZiW84EUxkk6nyclbI3/Jty1
         fzrIXY5A7cRI7fHIopMaUOOiCR4qFXyDRFdRHmpWJABLBbS7WANY7D/BFAXGtUuSYEC7
         MNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777261488; x=1777866288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6LnJZvLH9bwq8rkIs+Lcwlv8aSN2xQ6iGFhBeGaXxuk=;
        b=qsevnpswrPKrSMFJGZz3ibf8oXI1bnwI4tBWEWDR38EiDhoNWSBpIXnOjiM7IpBT7q
         KTuH3YmKVt0dAEP2p+6j+yYLkfELK/NlfeG7F2RX19aPrdWdo63yi0i1jMxbWkEX47+9
         wVZGD1hbxMhxQFxjec9bUJDYUPiPgzcTQyHgUHpbMJ2gYuqF1MjVTdNmno5nSvjC5CK8
         KEA9MJCxhLgVYfAASbFRP6YlCf2lff7DLqDTkPF6C5LayiabNkS2Od3YB/rTcdJRosWo
         WBjPLiIcXlqJBPvvRQVQ8v0ndx5aP6S7TL5UUiTlsupBXUji/uK04JP+2qGDcKym7nIo
         7bLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3jsvQKj7GHOD6N7JPT1n2lUxAwXupcViAthQLOsw7wgHDx1bphFG/il0eURQtEkwhgqOjx4acWRwBnzfErQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzOpku5QvwN5F+e0eNOAvv8GCFfC3S8lniD0jE85iPc9ut/W5v
	qeJs9bWtBvnKOhhioaUIUvt8Vdi/c3az9FkqGN3rvcSRUyiLI98RJJa+
X-Gm-Gg: AeBDievZmKxevEWKNrOmgIC+T0r+LrZc7PRj67AhHscYceGT4Gg4qzx5UiWLqmpjGEq
	G/pRFZFa8n+XSAWag0bfQzv1dVtNdMdabBcS+RQ7AgXsyRgjzQ6p02CRW0u+qeHq+c6Ah/ftnRA
	auFf+7fHZT+CI/uYI4WG4uTveZne6IztDXsyxrdrIVyMA8AOBvMW08bzcSJKoY6lJt3LU+iIaHM
	E+fezY+34qRJ3goB6zStFPf2Oa2K05Ym2WTFFM3swG2OYBgC5f7mJ++3p8qIdeN9aatV1uyCDqP
	BrPkeqWD24M/NPSPDyA48X5ni4NWPlshSKWL9fahArL4n9lwMbSkUVzgrNK0yBN1JhkEkHZddDq
	KvyCHEQ0PzIitqVxQLaWWWKFNAke38DfqIwGwTFxrBQMXd06Pw04u95HNt0MABaQ/yAEUXCAreF
	Sioz1kug0i5canMG3Ouckg76FbeDW0i7+79Bsq2UFUiz1/yzhH0rzuuPuQbMP4jnkKunWRojmwx
	3Bcwemjy5AUhHc3CeneN+S6tw==
X-Received: by 2002:a17:903:120d:b0:2b2:489a:f46a with SMTP id d9443c01a7336-2b5f9fbc5a1mr463142335ad.36.1777261487655;
        Sun, 26 Apr 2026 20:44:47 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm290610585ad.36.2026.04.26.20.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 20:44:46 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-wireless@vger.kernel.org (open list:MEDIATEK MT76 WIRELESS LAN DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mips@vger.kernel.org (open list:MIPS)
Subject: [PATCH 1/3] MIPS: dts: ralink: gardena_smart_gateway_mt7688: use nvmem for EEPROM
Date: Sun, 26 Apr 2026 20:44:25 -0700
Message-ID: <20260427034427.881389-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427034427.881389-1-rosenp@gmail.com>
References: <20260427034427.881389-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_204448_652687_7426DF97 
X-CRM114-Status: GOOD (  10.52  )
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

mediatek,mtd-eeprom is a deprecated binding for extracting data on MTD
devices which has been replaced by NVMEM.

The latter is already in wide use with mt76. As this is the only user,
transition to NVMEM.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/ralink/gardena_smart_gateway_mt7688.dts | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
index 0bfb1dde9764..a8a8efbaf527 100644
--- a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
+++ b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
@@ -155,10 +155,20 @@ partition@b0000 {
 				reg = <0xb0000 0x10000>;
 			};
 
-			factory: partition@c0000 {
+			partition@c0000 {
 				label = "factory";
 				reg = <0xc0000 0x10000>;
 				read-only;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#nvmem-cell-cells = <1>;
+
+					eeprom_factory_0: eeprom@0 {
+						reg = <0x0 0x400>;
+					};
+				};
 			};
 		};
 	};
@@ -201,5 +211,8 @@ &watchdog {
 
 &wmac {
 	status = "okay";
-	mediatek,mtd-eeprom = <&factory 0x0000>;
+
+	nvmem-cells = <&eeprom_factory_0>;
+	nvmem-cell-names = "eeprom"
+
 };
-- 
2.54.0


