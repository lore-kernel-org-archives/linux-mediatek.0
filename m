Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E932CAC5A5
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Sep 2025 16:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SC+qeS2RiX1wyumjn71nF2EMG1bMKj7Kw6SfG0wAps=; b=YXnzK1DmnqBRK+tWWRwVI9gUjx
	EEh+zNvk7+05oU0kl986GfJhoydmbMstt0QlB96KoZiGf5bFODkpJTkWLpU5GR0M/GEHFGOz0TXvN
	1BcJMm0D+Z+ohisvDSXBqZsd8inlRUyV14i4UySHQJ73SQYnWuVIkrqQZu35sQJ30zFQOJfi9h+/b
	6t2CifriGpv3sxzbJdbH/pMB7wUJDbeFNpWNuPO6DvOTJTpx/gTHOsyh0IV84/xOY9SWlRO7tVTo3
	8HzyamgcLeuMiHSa8CeaoviFwTT5hT+pKfvsVkOVEfYzQDjFoS6r0EuXYUjon31L3m2Z/s40xXc+W
	J5C1gszA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00Oz-00000005cFs-48Do;
	Sat, 20 Sep 2025 16:25:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00OP-00000005bgX-0OyG;
	Sat, 20 Sep 2025 16:24:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E255601A9;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36074C4CEF1;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758385493;
	bh=OsZkTOUSdYN93gDiPavU6jI79GYwymxdttqPKE4rtDE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=o/5utOKYdl4onN9Rv7w89chRCnMZtE/EfpcEuu64z76UTj/2qLfSOcEMEpSD8e49+
	 uswww9LOX3QPjxS6rLirwvUjGUkh7c+UCwuOjUGPba3+GJkoJe8ilZYdEs/jyP/KgC
	 KQPfqHCaJxWEly7jDiY7KveHqndcxjBWgZMsvAjwConn7aiIj62VgCRn/xKis6RNAs
	 SfCW9HkZ7H+yCAG+VjB8lgNdrJm7UoSDcNf6TGxPz34qb8k5xB54mlMshvqFdsV4fG
	 1TJgVWPhzsJON6oE8GMKFMjhBGvvOpf7LdpUxXW5tLnTHOFm3mJFMcHnaw0n47CgLY
	 oP1zmQATQE4Uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FE8CAC5A8;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Sat, 20 Sep 2025 20:23:27 +0200
Subject: [PATCH 02/10] ARM: mediatek: add MT6582 smp bring up code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-mt6582-v1-2-b887720f577d@protonmail.com>
References: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
In-Reply-To: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758392693; l=1555;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=6uGXxS/2ULG475fJT7BkyoFxyDRGMUY7v8S8MSscjII=;
 b=0BSKMlESDh0HSgKA66zOwG/vKXy8rumfTbKH0/oBaj0WYfPac5Dr3DPsPO7BXsVTtuPGbzNcu
 6MV2oVqGHcxB08BzovBXSx3YPLnOAlJR9v3yh/Jm2NO5zhidVkE4axn
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
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
Reply-To: cristian_ci@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Add support for booting secondary CPUs on MT6582.

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 arch/arm/mach-mediatek/Kconfig   | 4 ++++
 arch/arm/mach-mediatek/platsmp.c | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/arm/mach-mediatek/Kconfig b/arch/arm/mach-mediatek/Kconfig
index 638eabad2dd37ee56244fc036cb76af135aee416..64ec487c13abd81dd9a866d29b8f47d9ed42490e 100644
--- a/arch/arm/mach-mediatek/Kconfig
+++ b/arch/arm/mach-mediatek/Kconfig
@@ -19,6 +19,10 @@ config MACH_MT6572
 	bool "MediaTek MT6572 SoCs support"
 	default ARCH_MEDIATEK
 
+config MACH_MT6582
+	bool "MediaTek MT6582 SoCs support"
+	default ARCH_MEDIATEK
+
 config MACH_MT6589
 	bool "MediaTek MT6589 SoCs support"
 	default ARCH_MEDIATEK
diff --git a/arch/arm/mach-mediatek/platsmp.c b/arch/arm/mach-mediatek/platsmp.c
index bbd26d423bdef23629ec5ca9d9c61903748988b7..6b0943d95555afa52d134183c61ab6d5c1495ff1 100644
--- a/arch/arm/mach-mediatek/platsmp.c
+++ b/arch/arm/mach-mediatek/platsmp.c
@@ -56,6 +56,7 @@ static const struct of_device_id mtk_tz_smp_boot_infos[] __initconst = {
 
 static const struct of_device_id mtk_smp_boot_infos[] __initconst = {
 	{ .compatible   = "mediatek,mt6572", .data = &mtk_mt6572_boot },
+	{ .compatible   = "mediatek,mt6582", .data = &mtk_mt7623_boot },
 	{ .compatible   = "mediatek,mt6589", .data = &mtk_mt6589_boot },
 	{ .compatible   = "mediatek,mt7623", .data = &mtk_mt7623_boot },
 	{ .compatible   = "mediatek,mt7629", .data = &mtk_mt7623_boot },

-- 
2.49.0



