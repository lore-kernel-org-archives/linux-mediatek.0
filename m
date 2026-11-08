Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB99606A326
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 12:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ST63Vk+k;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZvR0Ff5V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QUocQK84XuKehbT6QRvrwNg6WeMz5D75e4/9O566HHs=; b=ST63Vk+k3dnhue
	tAePvqyteSjYARa6SuxJMjtvn72bPtYQLtujS1Xz3ne7BLLNmVJNlZzFKcCM5sQF3gOQ6i7gaEvNh
	jtsUJSezNMkSZKwsBvRsm1aLOHwg/101tJOlTcWU4HOaOTVrKpAbxDemTNzglBFPyWiKwOTQgDgwN
	+lNfGsgM4OzmrxJFkU0s+giJClKaLuMOsOn95i0/yrR3f89Z2KdUElLcCVTcS7c2rwL/pBVLdZPQH
	vhrKypiWS/V0NCfH8Ts1elV4fVzpfNUmIq6ZHbpcAcrGhx0DmVfntVKpCZU8xhzRa+ICzfckCMq6j
	2X7ud4VHlfLD0ZaMh/nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1qc-0000000G8ll-2ryz;
	Sun, 08 Nov 2026 12:18:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1qb-0000000G8jr-17hW;
	Sun, 08 Nov 2026 12:18:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F24BF43F64;
	Sun,  8 Nov 2026 12:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF1BC1F008A1;
	Sun,  8 Nov 2026 12:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794140288;
	bh=QUocQK84XuKehbT6QRvrwNg6WeMz5D75e4/9O566HHs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZvR0Ff5VhH/w0Tk4IPX7qLBDUpl/JP50R9TNox8GVZKMZVqozRI0KmgNZdVAU43Jm
	 GapdX/YPafgiQUnWdZHPa5PiDrvh2Ty7DqZR9Uq0KHxMOSyRr8pRIvOJe5r4Lo/uIG
	 J+yYyY+JCPwFed9Zy4/4DW1+t/Awqu/R0bVlzvEHhAmeXj4P2jOnF56lKxpWbL3Z8u
	 gnafwPa8WVaVzLoxi9vPJzqmLlEExlXxjOKvOrYoxeam5cmsvT+qAGg5OTu7GfeNzB
	 XkKbOMC/P7wZx//BTfTZWKmEsnkwl0tsbJgKbnwItt+l2p+sE1uB2uxEHQe/IymHLW
	 3RFQ956pkH2YQ==
From: Joshua Crofts <crofts@kernel.org>
Date: Sun, 08 Nov 2026 13:16:57 +0100
Subject: [PATCH 10/11] spi: rtk-nor: remove redundant
 pm_runtime_dont_use_autosuspend() calls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-spi-dont-use-autosuspend-v1-10-3587b0183cbe@kernel.org>
References: <20261108-spi-dont-use-autosuspend-v1-0-3587b0183cbe@kernel.org>
In-Reply-To: <20261108-spi-dont-use-autosuspend-v1-0-3587b0183cbe@kernel.org>
To: Vladimir Moravcevic <vmoravcevic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Mark Brown <broonie@kernel.org>, 
 Karthikeyan Mitran <kmitran@axiado.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Jyan Chou <jyanchou@realtek.com>, 
 Yu-Chun Lin <eleanor.lin@realtek.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, Joshua Crofts <crofts@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794140215; l=1130;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=yxPOrISayM8bL3DLnc5ik5mB53YTY7CgHkogAOII6dM=;
 b=1QQe9sRmxV5WjW2Sa2dbmrIQXv9rVY2P0fLeIkby9HrB1PfQ6/R/HIh9nOl8LKwkUT4xuryHg
 4tdT/mR9K7UAk/VGyuolOwD96AaLprIf+HArgu4eAPZW8uqIye9ROIY
X-Developer-Key: i=crofts@kernel.org; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=
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

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/spi/spi-rtk-nor.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-rtk-nor.c b/drivers/spi/spi-rtk-nor.c
index 75856c31d2e6..202f9df8739e 100644
--- a/drivers/spi/spi-rtk-nor.c
+++ b/drivers/spi/spi-rtk-nor.c
@@ -539,7 +539,6 @@ static int rtk_spi_probe(struct platform_device *pdev)
 	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
 	pm_runtime_set_suspended(dev);
-	pm_runtime_dont_use_autosuspend(dev);
 	reset_control_assert(host->rstc);
 	clk_disable_unprepare(host->clk);
 
@@ -560,7 +559,6 @@ static void rtk_spi_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
 	pm_runtime_set_suspended(dev);
-	pm_runtime_dont_use_autosuspend(dev);
 	reset_control_assert(host->rstc);
 	clk_disable_unprepare(host->clk);
 }

-- 
2.56.0


