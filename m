Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DBCC27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 10:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cePDmiqrnyQOOTsP205Za3kdwWFNXXfqLZTTM9qGFPs=; b=4PFONk5VVBRlp2q4XHKhxsrVhm
	pq+IPFEWv2VPrC64RpWcY6tfYMjoZngx6I5k35R1KQJWlARLAdFvh1uuyWYLW7AXDv6ceL77rdzuJ
	gBoD6wfsFMJmAIP4vlWjnu1vgeZqtsw+iQWwLul8oYI5rWtCjfuMwsa1kcxWrP/rrwX1xOXmmrWfy
	DYOWDlxDY20Pj27iyWP+6Gg/yIStXwrltvzBgUTNXZ2M84x4Jqsfpr1tBwBZjk1g+4hp9uNKr0nJ8
	nNp112xGTtRtbh2xwBp37FI++9JGt4VdpxR4tSuVFXY8J9r/cY84nHN9qfWVAKzFLT3DU29Fjfj87
	yAmIBjqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEsL-00000004Xqc-34jC;
	Thu, 20 Jun 2024 10:18:41 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEsI-00000004XpD-35k5;
	Thu, 20 Jun 2024 10:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718878717;
	bh=Zg0YfAACgdrWSFtjmdDAqVwctljVdRiqv1hto8U66Js=;
	h=From:To:Cc:Subject:Date:From;
	b=MCcOWFSZtRC/nGssgzuL9+vtEsZO205TCcH/IizeBSI+6a1flCdLrrt5Aq/rAgSDU
	 amAovpdN8LKEmOOosc+1DCkiPxRli4OCmks7JHdrU73bgHaBwnF0Fmvw4yG3oaBqNc
	 vQtOJ+il1GezkNkqAUwfi6laIHgHDEYieeEzOXIcC1k0BJ55tsnIMYTWpFIXTIxVdK
	 nI4Bqh4Z94JqnA9Gq9RC+qZewhia7IgsES7vmgntUYLHR0/EGsB/kTJS5bNlTS+PhP
	 BpBJRcgNTufTF33f0zX10rVHsYlllXUsCqOxYPPVAuQQ0nsCWP3uNcxMFNCQcK4zPK
	 +1LchlOq/szMg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 793E33780698;
	Thu, 20 Jun 2024 10:18:36 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH] arm64: dts: mediatek: Makefile: Generate symbols for DTBO support
Date: Thu, 20 Jun 2024 12:18:30 +0200
Message-ID: <20240620101830.1097548-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_031839_168721_210C7262 
X-CRM114-Status: UNSURE (   6.89  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add DTC_FLAGS '-@' for mt7986a-bananapi-bpi-r3 and -mini to
instruct the devicetree compiler to enable generation of symbols.

This allows proper support for Device Tree Overlay(s) for those
boards; future boards that need DTBO support are expected to add
their own DTC_FLAGS_{dtb-name}.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 56d551da917e..5dbb695d053f 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -84,3 +84,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-genio-700-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-kontron-3-5-sbc-i1200.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
+
+# Device tree overlays support
+DTC_FLAGS_mt7986a-bananapi-bpi-r3 := -@
+DTC_FLAGS_mt7986a-bananapi-bpi-r3-mini := -@
-- 
2.45.2


